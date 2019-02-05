(show-paren-mode t)

(require-or-install 'whitespace)
(setq whitespace-style '(face empty spaces space-mark tabs tab-mark trailing))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(setq whitespace-display-mappings '((space-mark 160 [164] [95])
                                    (space-mark 2208 [2212] [95])
                                    (space-mark 2336 [2340] [95])
                                    (space-mark 3616 [3620] [95])
                                    (space-mark 3872 [3876] [95])
                                    (space-mark ?\x3000 [?\□])
                                    (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(global-whitespace-mode 1)

(setq-default show-trailing-whitespace t)

(column-number-mode t)

(setq eol-mnemonic-dos "(CRLF)"
      eol-mnemonic-mac "(CR)"
      eol-mnemonic-unix "(LF)")

(setq-default line-spacing 0.1)

(when window-system
  (server-start)
  (set-frame-parameter nil 'alpha 85)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (toggle-scroll-bar nil))

(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t)
  (setq font-lock-support-mode 'jit-lock-mode))

(when window-system
  (set-face-attribute 'default nil :family "Hack" :height 110)
  (set-fontset-font "fontset-default"
    'japanese-jisx0208 (font-spec :family "IPAGothic") nil 'append)
  (set-fontset-font "fontset-default"
    'japanese-jisx0212 (font-spec :family "IPAGothic") nil 'append)
  (set-fontset-font "fontset-default"
    'katakana-jisx0201 (font-spec :family "IPAGothic") nil 'append)
  (set-fontset-font "fontset-default"
    'mule-unicode-0100-24ff (font-spec :family "IPAGothic") nil 'append)
  (set-fontset-font "fontset-default"
    'mule-unicode-2500-33ff (font-spec :family "IPAGothic") nil 'append)
  (global-set-key (kbd "s-+")
    (lambda () (interactive) (text-scale-increase 1)))
  (global-set-key (kbd "s--")
    (lambda () (interactive) (text-scale-decrease 1)))
  (global-set-key (kbd "s-0")
    (lambda () (interactive) (text-scale-increase 0))))

(deftheme molokai "Molokai color theme")

(custom-theme-set-faces
  'molokai
  '(cursor ((t (:background "#FF0000"))))
  '(default ((t (:background "#020814"
                 :foreground "#FFFFFF"))))
  '(region ((t (:background "#222288"))))
  '(mode-line ((t (:foreground "#F8F8F2"
                   :background "#000000"
                   :box (:line-width 1
                         :color "#000000"
                         :style released-button)))))
  '(mode-line-buffer-id ((t (:foreground nil
                             :background nil))))
  '(mode-line-inactive ((t (:foreground "#BCBCBC"
                            :background "#333333"
                            :box (:line-width 1
                                  :color "#333333")))))
  '(highlight ((t (:foreground "#000000"
                   :background "#C4BE89"))))
  '(hl-line ((t (:background "#293739"))))
  '(font-lock-function-name-face ((t (:foreground "#FFFFFF"))))
  '(font-lock-variable-name-face ((t (:foreground "#FFFFFF"))))
  '(font-lock-string-face ((t (:foreground "#E6DB74"))))
  '(font-lock-keyword-face ((t (:foreground "#F92672"))))
  '(font-lock-constant-face((t (:foreground "#AE81BC"))))
  '(show-paren-match-face ((t (:foreground "#1B1D1E"
                               :background "#FD971F"))))
  '(paren-face ((t (:foreground "#A6E22A"
                    :background nil))))
  '(font-lock-comment-face ((t (:foreground "#74715D"))))
  '(css-selector ((t (:foreground "#66D9EF"))))
  '(css-property ((t (:foreground "#FD971F"))))
  '(nxml-element-local-name ((t (:foreground "#F92672"))))
  '(nxml-attribute-local-name ((t (:foreground "#66D9EF"))))
  '(nxml-tag-delimiter ((t (:foreground "#A6E22A"))))
  '(nxml-markup-declaration-delimiter ((t (:foreground "#74715D"))))
  '(dired-directory ((t (:foreground "#A6E22A"))))
  '(dired-symlink ((t (:foreground "#66D9EF"))))
  '(mmm-default-submode-face ((t (:foreground nil
                                  :background "#000000")))))

(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'molokai)

(load-theme 'molokai t)
(enable-theme 'molokai)
