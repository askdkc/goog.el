;;; goog.el --- Google Search Short Cut package  -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 dkc
;;
;; Author: dkc <askdkc@gmail.com>
;; Maintainer: dkc <askdkc@gmail.com>
;; Created: Nov 3, 2024
;; Modified: Nov 3, 2024
;; Version: 0.0.2
;; Homepage: http://github.com/askdkc/goog.el
;; Package-Requires: ((emacs "28.0"))
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.
;;
;;; Commentary:
;; Google Search Short Cut package for Emacs
;;
;; Inspired by https://www.emacswiki.org/emacs/JorgenSchaefersEmacsConfig

;;; Code:

(defun goog-search-google (keyword)
  "Search Google with the KEYWORD you entered.  Usage: \\[search-google]."
  (interactive "sSearch: ")
  (browse-url (concat "https://www.google.com/search?q=" keyword)))
  
(defun goog--send-selected-or-current-row-to-function (fn)
  "Send the selected region or current row as a string to the function FN."
  (if (use-region-p) ;; Check if user selected any region
    (let ((selected-text (buffer-substring-no-properties
                          (region-beginning)
                          (region-end))))
      (funcall fn selected-text))
    (let ((line (buffer-substring-no-properties
		 (line-beginning-position)
		 (line-end-position))))
      (funcall fn line))))

(defun goog ()
  "Search Google with words or sentences from the current line.
Set up shortcut key like (keymap-global-set \"C-c g\" `google') in your
init.el or something."
  (interactive)
  (goog--send-selected-or-current-row-to-function #'goog-search-google))

(provide 'goog)
;;; goog.el ends here
