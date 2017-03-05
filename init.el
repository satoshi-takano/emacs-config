(package-initialize)
(add-to-list
  'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-loader)
(init-loader-load "~/.emacs.d/init-dir")

(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (highlight-symbol helm-projectile go-mode swift-mode zenburn-theme yasnippet undo-tree smart-mode-line magit init-loader helm expand-region auto-complete ada-mode ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-added ((t (:background "black" :foreground "#00ff00"))))
 '(magit-diff-added-highlight ((t (:background "#555555" :foreground "#00ff00"))))
 '(magit-diff-removed ((t (:background "black" :foreground "#ff0000"))))
 '(magit-diff-removed-highlight ((t (:background "#555555" :foreground "#ff0000"))))
 '(magit-hash ((t (:foreground "#ff0000")))))
