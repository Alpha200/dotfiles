;;; package --- Init file
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; I have nothing substantial to say here.
;;
;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)

(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(show-paren-mode 1)
(electric-pair-mode 1)

;(defadvice show-paren-function (after my-echo-paren-matching-line activate)
;  "If a matching paren is off-screen, echo the matching line."
;  (when (char-equal (char-syntax (char-before (point))) ?\))
;    (let ((matching-text (blink-matching-open)))
;      (when matching-text
;        (message matching-text)))))

(defvar match-paren--idle-timer nil)
(defvar match-paren--delay 0.5)

(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default indent-tabs-mode nil)

(setq backup-by-copying t
      backup-directory-alist '((".*" . "~/.emacs.d/backups")))

(require 'init-utils)
(require 'init-elpa)

(maybe-require-package 'use-package)
(eval-when-compile
  (require 'use-package))

(require 'init-evil)
(require 'init-powerline)
(require 'init-flycheck)
(require 'init-latex)
(require 'init-magit)
(require 'init-global-functions)
(require 'init-maps)
(require 'init-term)
(require 'init-gtags)
(require 'init-org)

(use-package helm
  :ensure t
  :diminish helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "M-x") 'helm-M-x)
  
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  (use-package helm-projectile
    :ensure t
    :config
    (projectile-global-mode)
    (setq projectile-completion-system 'helm)
    (helm-projectile-on)))

(use-package company
  :ensure t
  :defer t
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0.1)
  (setq company-selection-wrap-around t)
  (setq company-minimum-prefix-length 2)
  (define-key company-active-map [tab] 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package swiper
  :ensure t
  :commands swiper
  :bind ("C-s" . swiper))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

(use-package emmet-mode :ensure t)

(use-package highlight-symbol
  :ensure t
  :defer t
  :diminish ""
  :config
  (setq-default highlight-symbol-idle-delay 1.5))

;;; Git Commit Mode (a Magit minor mode):
(add-hook 'git-commit-mode-hook 'evil-insert-state)

(use-package helm-dash
  :ensure t
  :config
  (setq helm-dash-browser-func 'eww))

(use-package guide-key
  :ensure t
  :config
  (setq guide-key/guide-key-sequence '("C-x" "C-c" "C-c C-x"))
  (guide-key-mode 1))

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))

(use-package idea-darkula-theme
  :ensure t
  :config
  (load-theme 'idea-darkula t))

(use-package ansible
  :ensure t)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package z3-mode
  :ensure t)

(use-package ember-mode
  :ensure t)

(use-package ess
  :ensure t)

(use-package rust-mode
  :ensure t)

(maybe-require-package 'paper-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fbcdb6b7890d0ec1708fa21ab08eb0cc16a8b7611bb6517b722eba3891dfc9dd" "8e7ca85479dab486e15e0119f2948ba7ffcaa0ef161b3facb8103fb06f93b428" "6998bd3671091820a6930b52aab30b776faea41449b4246fdce14079b3e7d125" "4ab86c7682db09485a6e046ee0a6c45b5462f514c89844f4ed8b329aa1708067" "fe1682ca8f7a255cf295e76b0361438a21bb657d8846a05d9904872aa2fb86f2" default)))
 '(package-selected-packages
   (quote
    (paper-theme rust-mode ess ember-mode z3-mode editorconfig ansible idea-darkula-theme pdf-tools guide-key helm-dash highlight-symbol emmet-mode yaml-mode swiper company helm-projectile helm bpr gtags evil-magit magit auctex-latexmk use-package powerline-evil fullframe flycheck evil-surround evil-leader evil-indent-textobject)))
 '(safe-local-variable-values (quote ((Tex-engine . luatex)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
