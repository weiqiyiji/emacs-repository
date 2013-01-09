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

(defvar user-include-dirs nil
  "Include dirs, depend on operation system")

(setq ac-clang-flags
      (mapc (lambda (dir) (concat "-I" dir)) user-include-dirs))

(defun c-bundle-add-to-include-dirs (include-dir)
  (add-to-list 'user-include-dirs include-dir)
  (add-to-list 'ac-clang-flags (concat "-I" include-dir)))

;; (defun setup-semantic ()
;;   (require 'cedet)
;;   (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;                                     global-semanticdb-minor-mode
;;                                     global-semantic-idle-summary-mode
;;                                     global-semantic-mru-bookmark-mode))
;;   (semantic-mode 1))

(defun c-bundle-setup-clang ()
  (cabbage-vendor 'auto-complete-clang)
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(defun c-bundle-setup ()
  (setq compile-command "make")
  (define-key c-mode-base-map (kbd "<f7>") 'compile)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (c-bundle-setup-clang))

(add-hook 'c-mode-common-hook 'c-bundle-setup)

(provide 'c-bundle-setup)
