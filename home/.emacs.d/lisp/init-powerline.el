(defface my-pl-segment1-active
  '((t (:foreground "#dddddd" :background "#3A3A3A")))
  "Powerline first segment active face.")
(defface my-pl-segment1-inactive
  '((t (:foreground "#CEBFF3" :background "#333333")))
  "Powerline first segment inactive face.")
(defface my-pl-segment2-active
  '((t (:foreground "#dddddd" :background "#444444")))
  "Powerline second segment active face.")
(defface my-pl-segment2-inactive
  '((t (:foreground "#CEBFF3" :background "#333333")))
  "Powerline second segment inactive face.")
(defface my-pl-segment3-active
  '((t (:foreground "#ffffff" :background "#555555")))
  "Powerline third segment active face.")
(defface my-pl-segment3-inactive
  '((t (:foreground "#CEBFF3" :background "#333333")))
  "Powerline third segment inactive face.")

(defun air--powerline-default-theme ()
  "Set up my custom Powerline with Evil indicators."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (seg1 (if active 'my-pl-segment1-active 'my-pl-segment1-inactive))
                          (seg2 (if active 'my-pl-segment2-active 'my-pl-segment2-inactive))
                          (seg3 (if active 'my-pl-segment3-active 'my-pl-segment3-inactive))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (let ((evil-face (powerline-evil-face)))
                                       (if evil-mode
                                           (powerline-raw (powerline-evil-tag) evil-face)
                                         ))
                                     (if evil-mode
                                         (funcall separator-left (powerline-evil-face) seg1))
                                     ;;(when powerline-display-buffer-size
                                     ;;  (powerline-buffer-size nil 'l))
                                     ;;(when powerline-display-mule-info
                                     ;;  (powerline-raw mode-line-mule-info nil 'l))
                                     (powerline-buffer-id seg1 'l)
                                     (powerline-raw "[%*]" seg1 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format seg1 'l))
                                     (powerline-raw " " seg1)
                                     (funcall separator-left seg1 seg2)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object seg2 'l))
                                     (powerline-major-mode seg2 'l)
                                     (powerline-process seg2)
                                     (powerline-minor-modes seg2 'l)
                                     (powerline-narrow seg2 'l)
                                     (powerline-raw " " seg2)
                                     (funcall separator-left seg2 seg3)
                                     (powerline-vc seg3 'r)
                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) seg3 'l))))
                          (rhs (list (powerline-raw global-mode-string seg3 'r)
                                     (funcall separator-right seg3 seg2)
                                     (unless window-system
                                       (powerline-raw (char-to-string #xe0a1) seg2 'l))
                                     (powerline-raw "%4l" seg2 'l)
                                     (powerline-raw ":" seg2 'l)
                                     (powerline-raw "%3c" seg2 'r)
                                     (funcall separator-right seg2 seg1)
                                     (powerline-raw " " seg1)
                                     (powerline-raw "%6p" seg1 'r)
                                     (when powerline-display-hud
                                       (powerline-hud seg1 seg3)))))
                     (concat (powerline-render lhs)
                             (powerline-fill seg3 (powerline-width rhs))
                             (powerline-render rhs)))))))
  
(use-package powerline
  :ensure t
  :config
  (setq powerline-default-separator (if (display-graphic-p) 'arrow
                                      nil))
  (air--powerline-default-theme))


(defface powerline-evil-base-face
  '((t (:foreground "#303030" :inherit mode-line)))
  "Base face for powerline evil faces."
  :group 'powerline)

(defface powerline-evil-normal-face
  '((t (:background "#AFD787" :inherit powerline-evil-base-face)))
  "Powerline face for evil NORMAL state."
  :group 'powerline)

(defface powerline-evil-insert-face
  '((t (:background "#87AFD7" :inherit powerline-evil-base-face)))
  "Powerline face for evil INSERT state."
  :group 'powerline)

(defface powerline-evil-visual-face
  '((t (:background "#D7AFD7" :inherit powerline-evil-base-face)))
  "Powerline face for evil VISUAL state."
  :group 'powerline)

(defface powerline-evil-operator-face
  '((t (:background "#AFD7D7" :inherit powerline-evil-operator-face)))
  "Powerline face for evil OPERATOR state."
  :group 'powerline)

(defface powerline-evil-replace-face
  '((t (:background "#D78787" :inherit powerline-evil-base-face)))
  "Powerline face for evil REPLACE state."
  :group 'powerline)

(defface powerline-evil-motion-face
  '((t (:background "#d787d2" :inherit powerline-evil-base-face)))
  "Powerline face for evil MOTION state."
  :group 'powerline)

(defface powerline-evil-emacs-face
  '((t (:background "#d7afd7" :inherit powerline-evil-base-face)))
  "Powerline face for evil EMacs state."
  :group 'powerline)


(use-package powerline-evil
  :ensure t
  :config
  (setq powerline-evil-tag-style 'verbose))

(provide 'init-powerline)
;;; init-powerline.el ends here
