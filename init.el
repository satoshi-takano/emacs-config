(add-to-list 'load-path "~/.emacs.d")

(package-initialize)
(add-to-list
  'package-archives
   '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list
  'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/"))

(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-auto-save-files t)

(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq sgml-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default case-fold-search nil)
(setq-default read-file-name-completion-ignore-case t) 

(line-number-mode t)
(column-number-mode t)

(setq column-number-mode t)
(show-paren-mode t)
(setq frame-title-format "%f")
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows nil)
(setq default-frame-alist initial-frame-alist)
(setq hl-line-face 'hlline-face)
(setq scss-compile-at-save nil)
(global-hl-line-mode)

(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-n" (kbd "C-u 5 C-n"))
(global-set-key "\M-p" (kbd "C-u 5 C-p"))
(global-set-key "\M-c" 'comment-region)
(global-set-key (kbd "M-SPC") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-t") 'next-multiframe-window)
(global-set-key (kbd "C-M-n") 'next-multiframe-window)
(global-set-key (kbd "C-M-p") 'previous-multiframe-window)
(global-set-key (kbd "C-M-p") 'previous-multiframe-window)
 (defun revert-buffer-no-confirm ()
   (interactive) (revert-buffer t t))
(global-set-key (kbd "C-r") 'revert-buffer-no-confirm)

;; coladfor
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes (quote ("a3d519ee30c0aa4b45a277ae41c4fa1ae80e52f04098a2654979b1ab859ab0bf" default))))

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case nil)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; dropdown-list
(require 'dropdown-list)

;; nav
(require 'nav)
(setq nav-split-window-direction 'vertical)
(global-set-key "\C-x\C-d" 'nav-toggle)

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
(yas--initialize)
(yas-global-mode 1)

;; flymake
(global-set-key "\M-e" 'flymake-goto-next-error)
(global-set-key "\M-E" 'flymake-goto-prev-error)

(defun display-error-message ()
  (message (get-char-property (point) 'help-echo)))
(defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message)
  (display-error-message))
(defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message)
  (display-error-message))
(ad-activate 'flymake-goto-prev-error 'flymake-goto-prev-error-display-message)
(ad-activate 'flymake-goto-next-error 'flymake-goto-next-error-display-message)

;; html-mode
(add-to-list 'auto-mode-alist '("\\.tt$" . html-mode))

;; js-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(setq js-indent-level 2)
(add-hook 'js-mode-hook '(lambda ()
          (require 'flymake-jshint)
          (flymake-jshint-load)))

;; perl
(add-hook 'perl-mode-hook '(lambda () (flymake-mode t)))
(setq auto-mode-alist (cons '("\\.pl$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pm$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.t$" . perl-mode) auto-mode-alist))

(defun perltidy-region ()
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))

(defun perltidy-defun ()
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))

(defun perl-eval (beg end)
  "Run selected region as Perl code"
  (interactive "r")
  (shell-command-on-region beg end "perl")
)

;; ruby
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)

;; expand-region
(global-set-key (kbd "M-]") 'er/expand-region)
(global-set-key (kbd "M-[") 'er/contract-region)

;; highlight-symbol
(global-set-key (kbd "M-m") 'highlight-symbol-at-point)
(global-set-key (kbd "M-u") 'highlight-symbol-prev)
(global-set-key (kbd "M-j") 'highlight-symbol-next)

;; magit
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-diff-add "dark green")
     (set-face-background 'magit-diff-del "dark red")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))
(global-set-key (kbd "C-x g") 'magit-status)

;; org-mode
(add-hook 'org-mode-hook 'turn-on-font-lock) 
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(setq org-todo-keywords '("TODO" "DOING" "DONE")
      org-todo-interpretation 'sequence)
(setq org-directory "~/org/")
(setq org-agenda-files (list org-directory))
(setq org-agenda-custom-commands
    '(("M" agenda "" ((org-agenda-ndays 21)))))


;; company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; helm-company
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-q") 'helm-company)
     (define-key company-active-map (kbd "C-q") 'helm-company)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; load theme
(load-theme 'zenburn t)

(projectile-global-mode)

(setq sml/theme 'dark)
(sml/setup)
