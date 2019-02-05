(require-or-install 'auto-complete)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-use-menu-map t)
(setq ac-menu-height 5)
(setq ac-expand-on-auto-complete t)
