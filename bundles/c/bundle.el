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

(cabbage-vendor 'google-c-style)

(defvar user-include-dirs (list)
  "Include dirs, depend on operation system")

(setq ac-clang-flags (list))

(defun c-bundle-add-to-include-dirs (include-dirs)
  (dolist (include-dir include-dirs)
    (progn
      (add-to-list 'user-include-dirs include-dir t)
      (add-to-list 'ac-clang-flags (concat "-I" include-dir) t))))

(defun c-bundle--setup-clang ()
  (cabbage-vendor 'auto-complete-clang)
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(defun c-bundle-setup ()
  (google-set-c-style)
  (setq compile-command "make")
  (define-key c-mode-base-map (kbd "<f7>") 'compile)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (setup-skeleton-pairs)
  (c-bundle--setup-clang))

(add-hook 'c-mode-common-hook 'c-bundle-setup)

(provide 'c-bundle-setup)
