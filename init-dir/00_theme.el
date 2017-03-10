;; load theme
(load-theme 'tango-dark t)
(setq sml/theme 'dark)
(setq sml/no-confirm-load-theme t)
(sml/setup)

(custom-set-faces
 '(magit-diff-added ((t (:background "black" :foreground "#00ff00"))))
 '(magit-diff-added-highlight ((t (:background "#303030" :foreground "#00ff00"))))
 '(magit-diff-removed ((t (:background "black" :foreground "#ff0000"))))
 '(magit-diff-removed-highlight ((t (:background "#303030" :foreground "#ff0000"))))
 '(magit-hash ((t (:foreground "#ff0000"))))
)
