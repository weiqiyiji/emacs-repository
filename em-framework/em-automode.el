(add-to-list 'auto-mode-alist '("\\.html?$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.yasnippet?$" . snippet-mode))

;; blade BUILD file map to python-mode
(add-to-list 'auto-mode-alist '("BUILD" . python-mode))
(add-to-list 'auto-mode-alist '("BLADE_ROOT" . python-mode))

(provide 'em-automode)
