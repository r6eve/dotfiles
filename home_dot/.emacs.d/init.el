(defvar *emacs-config-directory* (file-name-directory load-file-name))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defun package-install-with-refresh (package)
  (unless (assq package package-alist)
    (package-refresh-contents))
  (unless (package-installed-p package)
    (package-install package)))

(defun require-or-install (package)
  (or (require package nil t)
      (progn
        (package-install-with-refresh package)
        (require package))))

(require-or-install 'init-loader)

(setq init-loader-show-log-after-init nil)

(init-loader-load
  (expand-file-name "inits/" *emacs-config-directory*))

;; el-get
(defvar *el-get-directory*
  (expand-file-name "el-get/el-get" *emacs-config-directory*))

(add-to-list 'load-path *el-get-directory*)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(require 'el-get)

; (setq el-get-recipe-path
;       (list (expand-file-name "recipes" *el-get-directory*)
;             (expand-file-name "el-get/user/recipes" *emacs-config-directory*)))
;
; (setq el-get-user-package-directory
;       (expand-file-name "el-get/user/init-files" *emacs-config-directory*))

(el-get 'sync)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-save-buffers-enhanced web-mode markdown-mode coffee-mode js2-mode scss-mode recentf-ext popwin auto-complete anzu init-loader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
