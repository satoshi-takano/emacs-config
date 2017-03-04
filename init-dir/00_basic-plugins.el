;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case t)
(setq ac-delay 0.05)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; wb-line-number
(require 'wb-line-number)
(global-set-key "\C-l" 'wb-line-number-toggle)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode 1)

;; helm
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x l") 'helm-ls-git-ls)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)


