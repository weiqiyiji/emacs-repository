;;; bundle.el ---

;; Copyright (C) 2012  Ji Luo

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

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'scheme-mode-hook 'enable-paredit-mode)
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd ")")
       'paredit-close-round-and-newline)
     (define-key paredit-mode-map (kbd "M-)")
       'paredit-close-round)))
