;; This config file is the last config file loaded. It is useful for local settings
;; such as passwords, which you do not want to share with your emacs installations
;; on other machines.

(add-to-list 'load-path user-emacs-directory)

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'auto-tail-revert-mode 'tail-mode)
(defalias 'qrr 'query-replace-regexp)

(desktop-save-mode t)
(delete-selection-mode t)
(global-linum-mode t)
(global-auto-revert-mode t)
(show-paren-mode t)

(setq cabbage-completion-trigger "Alt-/"
      eclim-print-debug-messages nil
      eclim-accepted-file-regexps '("\\.java\\'" "\\.xml" "\\.properties"))

(add-to-list 'cabbage-bundle-repositories
             (concat user-emacs-directory "bundles/")
             t)

(add-to-list 'cabbage-vendor-dirs (expand-file-name
                                   (concat user-emacs-directory "vendor/")))

(require 'em-defun)

(when (functionp 'ns-toggle-fullscreen)
  (add-hook 'after-init-hook 'ns-toggle-fullscreen))

(add-hook 'cabbage-initialized-hook
          (lambda () (require 'em-key-bindings)))
