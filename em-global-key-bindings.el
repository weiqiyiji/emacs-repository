(define-prefix-command 'ctrl-z-map)
(global-set-key (kbd "C-z") 'ctrl-z-map)
(global-set-key (kbd "C-z C-m") 'set-mark-command)

(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-x C-n") 'other-window)
(global-set-key (kbd "C-x C-p") 'other-window-backward)

(global-set-key (kbd "C-x C-w") 'delete-trailing-whitespace)

(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

(global-set-key (kbd "M-w") 'kill-ring-save)
(global-set-key (kbd "M-S t") 'textmate-goto-file)

(when (functionp 'ns-toggle-fullscreen)
  (global-set-key (kbd "C-x F") 'ns-toggle-fullscreen))

(provide 'em-global-key-bindings)
