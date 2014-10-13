;;; Martin-MacBook-Pro.el ---

;; Copyright (C) 2013  Ji Luo

;; Author: Ji Luo <jiluo@MartinMacBook-Pro>

(setenv "GOPATH" "~/projects/go")
(setenv "PATH"
        (concat "/usr/local/git/bin" ":"
                (concat (getenv "GOPATH") "/bin") ":"
                (concat (getenv "HOME") "/bin") ":"
                (getenv "PATH")))

(setq exec-path (split-string (getenv "PATH") path-separator))

(eval-after-load 'c-bundle-setup
  '(c-bundle-add-to-include-dirs
    (list
     "."
     "../include"
     "/usr/include/c++/4.2.1"
     "/usr/include/c++/4.2.1/backward"
     "/usr/local/include"
     "/usr/include"
     "/System/Library/Frameworks"
     "/Library/Frameworks")))

;;; Martin-MacBook-Pro.el ends here
