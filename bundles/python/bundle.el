(setq jedi:complete-on-dot t
      jedi:setup-keys t)    ; For jedi <= 0.1.2

(defun detect-eggs-dirs (buffer-name)
  (let ((buffer-dir (file-name-directory buffer-name)))
    (while (and (not (file-exists-p
                      (concat buffer-dir "eggs")))
                buffer-dir)
      (setq buffer-dir
            (if (equal buffer-dir "/")
                nil
              (file-name-directory (directory-file-name buffer-dir)))))
    (if buffer-dir
        (directory-files (concat buffer-dir "eggs") t ".\.egg")
      nil)))

(defun get-virtualenv-path (env-name)
  (let ((virtualenv-root
         (or (getenv "WORKON_HOME") (expand-file-name "~/.virtualenvs"))))
    (concat virtualenv-root "/" env-name)))

(defun setup-jedi-server (&optional env-name)
  (set (make-local-variable 'jedi:server-args) (list))
  (when (boundp 'buildout-root-dir)
    (let ((eggs (concat buildout-root-dir "/eggs/")))
      (dolist (egg (directory-files eggs t "\.egg"))
        (set 'jedi:server-args
             (append jedi:server-args (list "--sys-path" egg))))))
  (let ((env (cond (env-name env-name)
                   ((boundp 'activated-virtualenv) activated-virtualenv))))
    (when env
      (set 'jedi:server-args
           (append jedi:server-args
                   (list "--virtual-env" (get-virtualenv-path env))))))
  (jedi:setup))

(defun activate-virtualenv (env-name)
  (setup-jedi-server env-name))

(add-hook 'python-mode-hook
          (lambda ()
            (add-hook 'hack-local-variables-hook 'setup-jedi-server)))
