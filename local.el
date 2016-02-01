;; This config file is the last config file loaded. It is useful for local settings
;; such as passwords, which you do not want to share with your emacs installations
;; on other machines.

;; Disable theme-roller in cabbage.el first when clone cabbage

(add-to-list 'load-path (concat user-emacs-directory "em-framework"))

(defalias 'auto-tail-revert-mode 'tail-mode)
(defalias 'qrr 'query-replace-regexp)

(desktop-save-mode t)
(delete-selection-mode t)
(global-linum-mode t)
(global-auto-revert-mode t)
(show-paren-mode t)

(setq cabbage-completion-trigger 2
      cabbage-completion-framework 'auto-complete
      ido-enable-flex-matching nil
      debug-on-error t
      split-height-threshold nil
      split-width-threshold 0)

;; open buffer using vertical splitting, see http://stackoverflow.com/questions/2081577/setting-emacs-split-to-horizontal
;; (setq split-height-threshold nil
;;       split-width-threshold 0)

;; Highlight current line
(global-hl-line-mode)
(set-face-background 'hl-line "#330")

;; Auto-complete
(setq ac-auto-start 2
      ac-delay 0.4
      ac-ignore-case 'smart)

(defvar activated-virtualenv nil)

(add-to-list 'cabbage-bundle-dirs
             (concat user-emacs-directory "bundles/")
             t)

(add-to-list 'cabbage-vendor-dirs
             (expand-file-name
              (concat user-emacs-directory "vendor/")))

(require 'em-defun)
(require 'em-package)
(require 'em-automode)

(load-theme 'solarized-dark t)

(defun cabbage-initialized-hook-callback ()
  (require 'em-key-bindings)
  (ac-set-trigger-key "<C-tab>")
  (cond
   ((font-exists-p "Hack") (set-default-font "Hack 15"))
   ((font-exists-p "Anonymous Pro") (progn
                                      (set-default-font "Anonymous Pro 14")
                                      (setq-default line-spacing 0.4)))
   ((font-exists-p "Source_Code_Pro") (set-default-font "Source_Code_Pro 14"))
   ((font-exists-p "Monaco") (set-default-font "Monaco 13"))))

(add-hook 'cabbage-initialized-hook 'cabbage-initialized-hook-callback)
