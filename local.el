;; This config file is the last config file loaded. It is useful for local settings
;; such as passwords, which you do not want to share with your emacs installations
;; on other machines.

(setq local-bundle-repository (concat user-emacs-directory "bundles/"))
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path local-bundle-repository)

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'auto-tail-revert-mode 'tail-mode)
(defalias 'qrr 'query-replace-regexp)

(desktop-save-mode t)
(delete-selection-mode t)
(global-linum-mode t)
(global-auto-revert-mode t)
(show-paren-mode t)

;; Ido
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 5)

(setq cabbage-completion-trigger 2
      eclim-print-debug-messages nil
      eclim-accepted-file-regexps '("\\.java\\'" "\\.xml" "\\.properties"))

(add-to-list 'cabbage-bundle-repositories local-bundle-repository)

(define-key emacs-lisp-mode-map (kbd "C-c C-f") 'find-function)

(setq virtualenv-root "~/env")

(load "em-defun")
(load "em-global-key-bindings")
(load "em-bundle")

;; Temp solution
(load "em-java")
