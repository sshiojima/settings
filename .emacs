;
; Global
;
(setq load-path
      (append
       (list
       (expand-file-name "~/.emacs.d/elisp/")
       )
       load-path))

;;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
;(auto-install-update-emacswiki-package-name t)
;(auto-install-compatibility-setup)
(setq auto-save-list-file-prefix nil)

;;; Base
(setq initial-major-mode 'fundamental-mode)
(setq default-major-mode 'fundamental-mode)
(setq-default tab-width 4 indent-tabs-mode nil)
(when (fboundp 'global-font-lock-mode)
 (global-font-lock-mode t))
(setq-default transient-mark-mode t)
(setq require-final-newline t)
(column-number-mode t)
(line-number-mode t)
;(display-time)

;;; text-mode
;(setq-default fill-column 69)
;(setq text-mode-hook 'turn-on-auto-fill)


;;; Key-bind
(global-set-key "\eh" 'help)
(global-set-key "\C-h" 'backward-delete-char)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)
(define-key global-map "\C-c;" 'comment-region)
(define-key global-map "\C-c:" 'uncomment-region)
(define-key global-map "\C-z" 'undo)

;;; Comment
(set-face-foreground 'font-lock-comment-face "red")
(set-face-foreground 'font-lock-comment-delimiter-face "red")

;;; タブ、空白、改行に色を付ける
;(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)


;
; Japanese
;
;(set-language-environment "Japanese")                                                                                                                                                                                               (\
set-terminal-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;(require 'un-define)
