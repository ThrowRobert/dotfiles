(provide 'nbinds-mode)

(defun nbinds-move-toggle ()
  (interactive)
  "toggle nbinds-move-mode"
  (if (bound-and-true-p nbinds-move-mode) (nbinds-move-mode -1) (nbinds-move-mode 1))
  )

(define-minor-mode nbinds-mode
  "northcode keymap"
  :lighter " <nc>"
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map (kbd "C-h") 'backward-char)
	    (define-key map (kbd "C-j") 'next-line)
	    (define-key map (kbd "C-k") 'previous-line)
	    (define-key map (kbd "C-l") 'forward-char)
	    (define-key map (kbd "C-c C-c") 'nbinds-move-toggle)
	    map)
  :global
  )

(define-minor-mode nbinds-move-mode
  "northcode move keymap"
  :lighter " <MOVE>"
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map (kbd "h") 'backward-char)
	    (define-key map (kbd "j") 'next-line)
	    (define-key map (kbd "k") 'previous-line)
	    (define-key map (kbd "l") 'forward-char)
	    (define-key map (kbd "d") 'backward-delete-char-untabify)
	    (define-key map (kbd "D") 'delete-char)
	    (define-key map (kbd "C-c C-c") 'nbinds-move-toggle)
	    map)
  )

