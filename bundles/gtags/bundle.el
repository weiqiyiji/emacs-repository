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
(defun gtags-root-dir ()
  "Returns GTAGS root directory or nil if doesn't exist."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))

(defun gtags-update ()
  "Make GTAGS incremental update"
  (call-process "global" nil nil nil "-u"))

(defun gtags-update-single(filename)
  "Update Gtags database for changes in a single file"
  (interactive)
  (start-process "update-gtags"
                 "update-gtags"
                 "bash" "-c"
                 (concat "cd " (gtags-root-dir)
                         " ; gtags --single-update " filename)))

(defun gtags-update-current-file ()
  (interactive)
  (defvar filename)
  (setq filename (replace-regexp-in-string (gtags-root-dir)
                                           "."
                                           (buffer-file-name (current-buffer))))
  (gtags-update-single filename)
  (message "Gtags updated for %s" filename))

(defun gtags-update-hook ()
  "Update GTAGS file incrementally upon saving a file"
  (when gtags-mode
    (when (gtags-root-dir)
      (gtags-update-current-file))))

(defun setup-c-common-env ()
  (interactive)
  (setq gtags-suggested-key-mapping t)
  (cabbage-vendor 'gtags)
  (gtags-mode 1))

(add-hook 'after-save-hook 'gtags-update-hook)
(add-hook 'c-mode-common-hook 'setup-c-common-env)
