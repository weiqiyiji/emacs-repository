(setq jedi:complete-on-dot t
      jedi:setup-keys t)    ; For jedi <= 0.1.2

(defun get-virtualenv-path (env-name)
  (let ((virtualenv-root
         (or (getenv "WORKON_HOME") (expand-file-name "~/.virtualenvs"))))
    (concat virtualenv-root "/" env-name)))

(defun setup-jedi-server (&optional env-name)
  (set (make-local-variable 'jedi:server-args) (list))
  (when (boundp 'buildout-root-dir)
    (let ((eggs (concat buildout-root-dir "/eggs/")))
      (set 'jedi:server-args
           (append jedi:server-args
                   (list "--sys-path" buildout-root-dir
                         "--sys-path" (concat buildout-root-dir "/src/"))))
      (dolist (egg (directory-files eggs t "\.egg"))
        (set 'jedi:server-args
             (append jedi:server-args (list "--sys-path" egg))))))
  (let ((env (cond (env-name env-name)
                   ((boundp 'activated-virtualenv) activated-virtualenv))))
    (when env
      (set 'jedi:server-args
           (append jedi:server-args
                   (list "--virtual-env" (get-virtualenv-path env))))))
  (jedi:setup)
  (define-key python-mode-map "\C-[" 'jedi:goto-definition)
  (define-key python-mode-map "\C-]" 'jedi:goto-definition-pop-marker))

(defun activate-virtualenv (env-name)
  (setup-jedi-server env-name))

(add-hook 'python-mode-hook
          (lambda ()
            (add-hook 'hack-local-variables-hook 'setup-jedi-server)))
