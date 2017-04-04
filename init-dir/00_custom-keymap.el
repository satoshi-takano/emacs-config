(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-n" (kbd "C-u 5 C-n"))
(global-set-key "\M-p" (kbd "C-u 5 C-p"))
(global-set-key (kbd "C-t") 'next-multiframe-window)
(global-set-key (kbd "C-M-t") 'previous-multiframe-window)
(global-set-key "\M-c" 'comment-region)

;; highlight-symbol
(global-set-key (kbd "M-m") 'highlight-symbol-at-point)
(global-set-key (kbd "M-u") 'highlight-symbol-prev)
(global-set-key (kbd "M-j") 'highlight-symbol-next)

;; rectangle
(global-set-key (kbd "M-SPC") 'set-rectangular-region-anchor)
(global-set-key (kbd "M-i") 'string-rectangle)
