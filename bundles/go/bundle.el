(cabbage-vendor 'go-mode)
(cabbage-vendor 'go-autocomplete)

(defun go-mode--setup ()
  (setup-skeleton-pairs)
  (local-set-key [(return)] 'newline-and-indent)
  (local-set-key (kbd "C-M-\\") 'gofmt)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-c i") 'go-goto-imports)
  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'go-mode--setup)