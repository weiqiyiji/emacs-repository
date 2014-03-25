;; Ctrl-Z prefix command
(define-prefix-command 'ctrl-z-map)
(global-set-key (kbd "C-z") 'ctrl-z-map)
(global-set-key (kbd "C-z C-m") 'set-mark-command)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Window
(global-set-key (kbd "C-x C-n") 'other-window)
(global-set-key (kbd "C-x C-p") 'other-window-backward)
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

;; Perspective
(global-set-key (kbd "C-x p s") 'persp-switch)
(global-set-key (kbd "C-x p q") 'persp-switch-quick)

;; Imenu
(global-set-key (kbd "<f3>") 'imenu)

;; Rename
(global-set-key (kbd "<f2>") 'rename-file-and-buffer)

;; Elisp
(define-key emacs-lisp-mode-map (kbd "C-]") 'find-function)

(when (functionp 'ns-toggle-fullscreen)
  (global-set-key (kbd "C-x F") 'ns-toggle-fullscreen))

(when (cabbage-bundle-active-p 'power-edit)
  (global-set-key (kbd "C-c SPC") 'ace-jump-mode))

;; Misc
(global-set-key (kbd "M-w") 'kill-ring-save)
(global-set-key (kbd "M-t") 'textmate-goto-file)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

(global-set-key (kbd "<f4>") 'occur)

(provide 'em-key-bindings)
