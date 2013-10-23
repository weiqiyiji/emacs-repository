(setq jedi:complete-on-dot t
      jedi:setup-keys t)    ; For jedi <= 0.1.2
(add-hook 'python-mode-hook 'jedi:setup)
