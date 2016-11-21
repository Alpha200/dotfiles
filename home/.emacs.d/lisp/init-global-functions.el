;;; init-global-functions.el --- Global functions
;;; Commentary:
;;; Code:

(defun load-only-theme (theme)
  "Disable all themes and then load THEME interactively."
  (interactive
   (list
    (completing-read "Load custom theme: "
                             (mapcar 'symbol-name
                                     (custom-available-themes)))))
  (mapcar #'disable-theme custom-enabled-themes)
  (load-theme (intern theme) nil nil)
  (when (fboundp 'powerline-reset)
    (powerline-reset)))

(defun cycle-powerline-separators (&optional reverse)
  "Set Powerline separators in turn.  If REVERSE is not nil, go backwards."
  (interactive)
  (let* ((fn (if reverse 'reverse 'identity))
         (separators (funcall fn '("arrow" "arrow-fade" "slant"
                                   "chamfer" "wave" "brace" "roundstub" "zigzag"
                                   "butt" "rounded" "contour" "curve")))
         (found nil))
    (while (not found)
      (progn (setq separators (append (cdr separators) (list (car separators))))
             (when (string= (car separators) powerline-default-separator)
               (progn (setq powerline-default-separator (cadr separators))
                      (setq found t)
                      (redraw-display)))))))

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(provide 'init-global-functions)
;;; init-global-functions.el ends here
