;;; rainbow.el ---

;; Copyright (C) 2012  Ji Luo

;; Author: Ji Luo <weiqiyiji@Martin-MacBook-Air>


(defun load-rainbow-mode ()
  (cabbage-vendor 'rainbow-mode)
  (rainbow-mode))

(add-hook 'css-mode-hook (load-rainbow-mode))
