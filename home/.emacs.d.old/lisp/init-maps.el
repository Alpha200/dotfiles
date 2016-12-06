;;; init-maps.el --- Provide global keymaps

;;; Commentary:
;;; Code:

(define-key global-map (kbd "C-c C-u") 'insert-char)
(define-key global-map (kbd "C-c s") (lambda () (interactive) (ansi-term "zsh")))

(provide 'init-maps)
;;; init-maps.el ends here
