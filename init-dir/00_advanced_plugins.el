;; expand-region
(global-set-key (kbd "M-]") 'er/expand-region)
;;(global-set-key (kbd "M-[") 'er/contract-region)

;; magit
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-diff-add "dark green")
     (set-face-background 'magit-diff-del "dark red")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))
(global-set-key (kbd "C-x g") 'magit-status)
