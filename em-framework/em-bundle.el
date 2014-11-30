(setq em-local-bundles
      '(
        whitespace
        ))

(defun load-local-bundles ()
  (let (cabbage-bundle-dir local-bundle-repository)
    (dolist (bundle em-local-bundles)
      (cabbage-load-bundle bundle))))

(add-hook 'cabbage-initialized-hook 'load-local-bundles)
