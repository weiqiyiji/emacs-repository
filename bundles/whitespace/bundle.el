(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 80)

(global-set-key (kbd "C-x C-w") 'delete-trailing-whitespace)
