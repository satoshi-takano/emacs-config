(require 'font-lock)
(global-font-lock-mode t)

(set-face-attribute 'default nil
                    :family "Menlo"
                    :height 130)

(set-fontset-font nil 'unicode
                  (font-spec :family "Menlo"))

(set-fontset-font nil 'japanese-jisx0208
                  (font-spec :family "Hiragino Kaku Gothic ProN"))

(set-fontset-font nil 'katakana-jisx0201
                  (font-spec :family "Hiragino Kaku Gothic ProN"))
