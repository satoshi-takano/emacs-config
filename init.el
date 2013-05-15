;; general
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/auto-install")

(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-auto-save-files t)

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default case-fold-search nil)

;; hide toolbar when using MacEmacs
(cond 
 ((equal window-system 'ns)
  (dolist (conf (list 
                 "cocoa-frame.el"
                 "cocoa-font.el"))
    (load (concat user-emacs-directory "conf/cocoa/" conf))))
 ((equal window-system nil)
  ;; do something
  ))
(line-number-mode t)
(column-number-mode t)

(setq column-number-mode t)
(show-paren-mode t)
(setq frame-title-format "%f")
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows nil)
(setq initial-frame-alist
      (append (list
        '(width . 188)
        '(height . 46)
        '(alpha .8)
        )
        initial-frame-alist))
(setq default-frame-alist initial-frame-alist)
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)
;;(add-to-list 'default-frame-alist '(alpha . 85))

(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-n" (kbd "C-u 5 C-n"))
(global-set-key "\M-p" (kbd "C-u 5 C-p"))
(global-set-key "\M-c" 'comment-region)
(define-key global-map (kbd "C-t") 'next-multiframe-window)

;; window resizing
(global-set-key [?\C-{] 'shrink-window-horizontally)
(global-set-key [?\C-}] 'enlarge-window-horizontally)
(global-set-key [?\C-\"] 'shrink-window)
(global-set-key [?\C-+] 'enlarge-window)

;;kill-ring
(setq kill-ring-max 20)
;;anything で対象とするkill-ring の要素の長さの最小値.
;;デフォルトは 10.
(setq anything-kill-ring-threshold 5)
(global-set-key "\M-y" 'anything-show-kill-ring)
 
;; wb-line-number
;;(require 'wb-line-number)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; yasnippet
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; anything
(require 'anything-startup)

;; auto-complete-mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; ruby-mode
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
(setq ruby-deep-indent-paren-style nil)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             (require 'ruby-electric)
             (ruby-electric-mode t)
             (define-key ruby-mode-map "\C-m" 'newline-and-indent)
             (define-key ruby-mode-map "\C-c\C-z" 'run-ruby)
             ))

;; rubydb
(autoload 'ruby "rubydb2x"
	  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)


;; less-css-mode
(require 'less-css-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 (autoload 'js2-mode "js2" nil t)
 (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
 (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

 ;; js2-mode
(when (load "js2" t)
  (setq js2-cleanup-whitespace nil
        js2-mirror-mode nil
        js2-bounce-indent-flag nil)

  (defun indent-and-back-to-indentation ()
    (interactive)
    (indent-for-tab-command)
    (let ((point-of-indentation
           (save-excursion
             (back-to-indentation)
             (point))))
      (skip-chars-forward "\s " point-of-indentation)))

  (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
  (define-key js2-mode-map "\C-m" nil))

;; mmm-mode
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 3)
(set-face-background 'mmm-default-submode-face "black")

(mmm-add-classes
 '((embedded-css
    :submode css-mode
    :front "<style[^>]*>"
    :back "</style>")))
(mmm-add-mode-ext-class nil "\\.html?\\'" 'embedded-css)

(mmm-add-classes
 '((html-javascript
    :submode javascript-mode
    :front "<script[^>]*>"
    :back "</script>")))
(mmm-add-mode-ext-class nil "\\.html?\\'" 'html-javascript)

;; nav
(require 'nav)
(setq nav-split-window-direction 'vertical) ;; 分割したフレームを垂直に並べる
(global-set-key "\C-x\C-d" 'nav-toggle)     ;; C-x C-d で nav をトグル



