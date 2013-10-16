(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/") t)
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Add packages here
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))
(unless (package-installed-p 'magit)
  (package-refresh-contents) (package-install 'magit))

;; ENSIME
(add-to-list 'load-path "~/.emacs.d/ensime/elisp")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; Remove unused UI elements
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-message t)

;; shhht, give me some time to think, don't blink
(blink-cursor-mode 0)

;; show matching parens
(show-paren-mode t)

;; always show column numbers
(column-number-mode t)

;; linum-mode
(linum-mode t)

;; hl-line-mode
(hl-line-mode t)

;; Narrow (C-x n n)
(put 'narrow-to-region 'disabled nil)

;; ido mode
(ido-mode t)
(setq ido-enable-flex-matching t)

;; take the short answer, y/n is yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; theme and font
(add-to-list 'load-path "~/config/tomorrow-theme/GNU Emacs/")
(require 'color-theme-tomorrow)
(color-theme-tomorrow-night)
(set-default-font "Ubuntu Mono 18")

;; system env variables 
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving
(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
