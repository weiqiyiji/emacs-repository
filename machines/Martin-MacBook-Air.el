;; This is the machine customization file. It gets only loaded when the
;; hostname (`hostname -s`) matches the filename.

(setq cabbage-completion-framework 'auto-complete
      eclim-executable (expand-file-name "~/eclipse/eclim"))

(setenv "WORKON_HOME" (expand-file-name "~/env"))
