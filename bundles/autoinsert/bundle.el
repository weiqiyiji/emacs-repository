(require 'autoinsert)

(defvar auto-insert-template-dir (concat user-emacs-directory "auto-insert-templates"))
(setq auto-insert-directory auto-insert-template-dir)
(setq auto-insert-query nil)

(define-auto-insert "\.py" "python.tpl")
(define-auto-insert "\.sh" "shell.tpl")

(setq current-date-format "%Y-%m-%d")

(define-auto-insert '("\\.java\\'" . "MMs Java skeleton")
  '("Short description: "
    "/**" "\n"
    " * @(#)"
    (buffer-name)
    " " (format-time-string current-date-format (current-time)) ".\n"
    " *\n"
    " * Copyright (c) 2011, Wandou Labs and/or its affiliates. All rights reserved.\n"
    " * WANDOU LABS PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.\n"
    " */" "\n \n \n"
    "/**" "\n"
    " * @author luoji" "\n"
    " */"))

(add-hook 'find-file-hooks 'auto-insert)
