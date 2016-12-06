;;; init-term --- term customization
;;; Commentary:
;;; Code:

;; term
(defface term-color-black
  '((t (:foreground "#181818" :background "#1b1b1b")))
  "Unhelpful docstring.")
(defface term-color-red
  '((t (:foreground "#f92671" :background "#1b1b1b")))
  "Unhelpful docstring.")
(defface term-color-green
  '((t (:foreground "#aff32c" :background "#1b1b1b")))
  "Unhelpful docstring.")
(defface term-color-yellow
  '((t (:foreground "#fd971f" :background "#1b1b1b")))
  "Unhelpful docstring.")
(defface term-color-blue
  '((t (:foreground "#34bdef" :background "#1b1b1b")))
  "Unhelpful docstring.")
(defface term-color-magenta
  '((t (:foreground "#9e6ffe" :background "#1b1b1b")))
  "Unhelpful docstring.")
(defface term-color-cyan
  '((t (:foreground "#5e7175" :background "#1b1b1b")))
  "Unhelpful docstring.")
(defface term-color-white
  '((t (:foreground "#cccccc" :background "#1b1b1b")))
  "Unhelpful docstring.")
'(term-default-fg-color ((t (:inherit term-color-white))))
'(term-default-bg-color ((t (:inherit term-color-black))))

;; ansi-term colors
(setq ansi-term-color-vector
  [term term-color-black term-color-red term-color-green term-color-yellow
    term-color-blue term-color-magenta term-color-cyan term-color-white])

;; kill term buffer after exit
;; http://echosa.github.io/blog/2012/06/06/improving-ansi-term/
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)

(provide 'init-term)
;;; init-term.el ends here
