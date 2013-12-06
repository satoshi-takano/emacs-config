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

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 2)
(setq-default case-fold-search nil)

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

(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-n" (kbd "C-u 5 C-n"))
(global-set-key "\M-p" (kbd "C-u 5 C-p"))
(global-set-key "\M-c" 'comment-region)
(global-set-key (kbd "C-t") 'next-multiframe-window)
(global-set-key (kbd "C-M-n") 'next-multiframe-window)
(global-set-key (kbd "C-M-p") 'previous-multiframe-window)
(global-set-key (kbd "C-M-p") 'previous-multiframe-window)
 (defun revert-buffer-no-confirm ()
   (interactive) (revert-buffer t t))
(global-set-key (kbd "C-r") 'revert-buffer-no-confirm)

;; coladfor
(custom-set-variables
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass))))

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; dropdown-list
(require 'dropdown-list)

;; nav
(require 'nav)
(setq nav-split-window-direction 'vertical)
(global-set-key "\C-x\C-d" 'nav-toggle)

;; wb-line-number
(require 'wb-line-number)
(global-set-key "\C-l" 'wb-line-number-toggle)

;;kill-ring
(global-set-key "\M-y" 'anything-show-kill-ring)
 
;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode 1)

;; anything
(require 'anything)
(require 'anything-startup)

;; yasnippet
(require 'yasnippet)
(yas--initialize);
(yas-global-mode 1)

;; js-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))


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


;; magit
(require 'magit)

;; autopair
(require 'autopair)
(autopair-global-mode)

(require 'smartchr)
(add-hook 'perl-mode-hook
          (lambda ()
            (define-key perl-mode-map (kbd ".") (smartchr '("." "->" "=>")))
            (define-key perl-mode-map (kbd "m") (smartchr '("m" "my $`!!' = ;" "my @`!!' = ;" "my %`!!' = ;")))
            (define-key perl-mode-map (kbd "r") (smartchr '("r" "return `!!'")))            
          ))
