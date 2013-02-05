(setq python-libs-install-dir (cabbage-vendor-library-dir 'python-libs))

(defun setup-ropemacs ()
  (if (and (getenv "PYTHONPATH")
           (not (string= (getenv "PYTHONPATH") "")))
      ;; append at the end with separator
      (setenv "PYTHONPATH"
              (concat
               (getenv "PYTHONPATH") path-separator
               python-libs-install-dir))
    ;; else set it without separator
    (setenv "PYTHONPATH" python-libs-install-dir))

  (cabbage-vendor 'pymacs)
  (ac-ropemacs-require)

  (define-key python-mode-map "\C-ci" 'rope-auto-import)
  (define-key python-mode-map "\C-c\C-d" 'rope-show-calltip)

  ;; Stops from erroring if there's a syntax err
  (setq ropemacs-codeassist-maxfixes 3)

  ;; Configurations
  (setq ropemacs-guess-project t)
  (setq ropemacs-enable-autoimport t)
  (setq ropemacs-autoimport-modules '("os" "sys"))
  (setq ropemacs-enable-shortcuts nil))

;; ropemacs Integration with auto-completion
(defun ac-ropemacs-candidates ()
  (mapcar (lambda (completion)
      (concat ac-prefix completion))
    (rope-completions)))

(ac-define-source nropemacs
  '((candidates . ac-ropemacs-candidates)
    (symbol     . "p")))

(ac-define-source nropemacs-dot
  '((candidates . ac-ropemacs-candidates)
    (symbol     . "p")
    (prefix     . c-dot)
    (requires   . 0)))

(defun ac-nropemacs-setup ()
  (setq ac-sources (append '(ac-source-nropemacs
                             ac-source-nropemacs-dot) ac-sources)))

;; (add-hook 'python-mode-hook 'ac-nropemacs-setup)

(eval-after-load 'python
  '(progn
     (setup-ropemacs)))
