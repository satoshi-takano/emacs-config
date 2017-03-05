;; golang
(eval-after-load "go-mode"
  '(progn
     (go-eldoc-setup)
     (add-hook 'before-save-hook 'gofmt-before-save)
     (require 'go-autocomplete)))
(add-hook 'go-mode-hook 'flycheck-mode)
