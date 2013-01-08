;;; bundle.el ---

;; Copyright (C) 2013  Ji Luo

;; Author: Ji Luo <weiqiyiji@Martin-MacBook-Air>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

(setq ac-clang-flags
      (list
       "-I/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include"
       "-I/usr/include/c++/4.2.1"
       "-I/usr/include/c++/4.2.1/backward"
       "-I/usr/local/include"
       "-I/Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include"
       "-I/usr/include"
       "-I/System/Library/Frameworks"
       "-I/Library/Frameworks"
       "-I/Users/weiqiyiji/projects/unp/include"))

(defun setup-clang ()
  (cabbage-vendor 'auto-complete-clang)
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(defun setup_c_mode ()
  (setq compile-command "make")
  (define-key c-mode-base-map (kbd "<f7>") 'compile)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (setup-clang))

(add-hook 'c-mode-common-hook 'setup_c_mode)
