(cabbage-vendor 'go-mode)
(cabbage-vendor 'go-autocomplete)

(defun go-mode--setup ()
  (setup-skeleton-pairs)
  (local-set-key [(return)] 'newline-and-indent)
  (local-set-key (kbd "C-M-\\") 'gofmt)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-c i") 'go-goto-imports)
  (local-set-key (kbd "C-]") 'godef-jump)
  (local-set-key (kbd "C-[") 'pop-tag-mark)

  (set (make-local-variable 'tab-width) 4)
  (set (make-local-variable 'whitespace-style) '(face trailing lines-tail)))

(add-hook 'go-mode-hook 'go-mode--setup)
