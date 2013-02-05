;; This is the machine customization file. It gets only loaded when the
;; hostname (`hostname -s`) matches the filename.

(setq cabbage-completion-framework 'auto-complete
      eclim-executable (expand-file-name "~/eclipse/eclim"))

(setenv "WORKON_HOME" (expand-file-name "~/env"))
(setenv "PATH" (concat "/usr/local/git/bin" ":"
                       "/usr/local/homebrew/bin" ":"
                       "/usr/local/homebrew/sbin" ":"
                       "$HOME/bin" ":"
                       (getenv "PATH")))

;; (setenv "MITSCHEME_LIBRARY_PATH"
;;         "/Applications/mit-scheme.app/Contents/Resources")
;; (setq scheme-program-name
;;       "/Applications/mit-scheme.app/Contents/Resources/mit-scheme")

(setq exec-path (split-string (getenv "PATH") path-separator))

(eval-after-load 'c-bundle-setup
  '(c-bundle-add-to-include-dirs
    (list
     "."
     "../include"
     "/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include"
     "/usr/include/c++/4.2.1"
     "/usr/include/c++/4.2.1/backward"
     "/usr/local/include"
     "/Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include"
     "/usr/include"
     "/System/Library/Frameworks"
     "/Library/Frameworks")))
