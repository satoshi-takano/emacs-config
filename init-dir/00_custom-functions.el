(defun revert-buffer-no-confirm ()
   (interactive) (revert-buffer t t))
(global-set-key (kbd "C-r") 'revert-buffer-no-confirm)
