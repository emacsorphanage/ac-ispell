;;; ac-ispell.el --- ispell completion source for auto-complete

;; Copyright (C) 2013 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/syohex/emacs-ac-ispell
;; Version: 0.01
;; Package-Requires: ((auto-complete "1.4"))

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

;;; Code:

(require 'auto-complete)
(require 'ispell)

(defgroup ac-ispell nil
  "Auto completion with ispell"
  :group 'auto-complete)

(defcustom ac-ispell-requires 3
  "Minimum input for starting completion"
  :type 'integer
  :group 'ac-ispell)

(defun ac-ispell--candidates ()
  (let ((input (downcase (substring ac-prefix 0 ac-ispell-requires))))
    (when (string-match-p "\\`[a-z]+\\'" input)
      (lookup-words (concat input "*") ispell-complete-word-dict))))

;;;###autoload
(defun ac-ispell-setup ()
  (interactive)

  (ac-define-source ispell
    `((candidates . ac-ispell--candidates)
      (requires . ,ac-ispell-requires)
      (symbol . "s"))))

(provide 'ac-ispell)

;;; ac-ispell.el ends here
