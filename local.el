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

(setq cabbage-theme 'color-theme-github
      cabbage-completion-trigger 2
      eclim-print-debug-messages nil
      eclim-accepted-file-regexps '("\\.java" "\\.xml")
      eclim-auto-save nil
      ido-enable-flex-matching nil)

;; Highlight current line
(global-hl-line-mode)
(set-face-background 'hl-line "#330")

;; Auto-complete
(setq ac-auto-start nil
      ac-delay 0.4
      ac-ignore-case 'smart)

(add-to-list 'cabbage-bundle-dirs
             (concat user-emacs-directory "bundles/")
             t)

(add-to-list 'cabbage-vendor-dirs
             (expand-file-name
              (concat user-emacs-directory "vendor/")))

(require 'em-defun)
(require 'em-package)
(require 'em-automode)

(when (functionp 'ns-toggle-fullscreen)
  (add-hook 'after-init-hook 'ns-toggle-fullscreen))

(add-hook 'cabbage-initialized-hook
          (lambda ()
            (require 'em-key-bindings)
            (ac-set-trigger-key "TAB")

            (if (font-exists-p "Monaco")
                (set-default-font "Monaco 13"))))
