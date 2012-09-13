(require 'autoinsert)

(defvar auto-insert-template-dir (concat user-emacs-directory "auto-insert-templates"))
(setq auto-insert-directory auto-insert-template-dir)
(setq auto-insert-query nil)

(define-auto-insert "\.py" "python.tpl")
(define-auto-insert "\.sh" "shell.tpl")

(add-hook 'find-file-hooks 'auto-insert)
