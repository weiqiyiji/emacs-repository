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
;; (defun configure-js-mode-indent ()
;;   (interactive)
;;   (setq js-indent-level 4
;;         javascript-indent-level 4))

(defun configure-js-mode-indent ()
  (interactive)
  (setq js2-basic-offset 2
        js-indent-level 2
        javascript-indent-level 2))

(add-hook 'js2-mode-hook 'configure-js-mode-indent)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
