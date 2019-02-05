(eval-when-compile
  (require 'cl))

(defun mac-os-p ()
  (member window-system '(mac ns)))
(defun linuxp ()
  (eq window-system 'x))

(defadvice kill-sexp (around kill-sexp-and-fixup activate)
  (if (and (not (bolp)) (eolp))
      (progn
        (forward-char)
        (fixup-whitespace)
        (backward-char)
        (kill-line))
      ad-do-it))

(defmacro appendf (list &rest lists)
  `(setq ,list (append ,list ,@lists)))

(setq eval-expression-print-level nil)

(loop for x in (reverse (split-string (substring (shell-command-to-string "echo $PATH") 0 -1) ":"))
  do (add-to-list 'exec-path x))

(defun unkillable-scratch-buffer ()
  (if (string= (buffer-name (current-buffer)) "*scratch*")
      (progn
        (delete-region (point-min) (point-max))
        nil)
      t))
(add-hook 'kill-buffer-query-functions 'unkillable-scratch-buffer)

(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
; (setq initial-major-mode 'emacs-lisp-mode)

(setq-default tab-width 2
              indent-tabs-mode nil)
(setq default-tab-width 2)
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30
                      32 34 36 38 40 42 44 46 48 50 52 54 56 58 60))

(fset 'yes-or-no-p 'y-or-n-p)

(setq use-dialog-box nil)
(defalias 'message-box 'message)

(setq echo-keystrokes 0.1)

(setq x-select-enable-clipboard t)

(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

(setq-default require-final-newline t)
(setq require-final-newline t)

(setq ring-bell-function 'ignore)

(setq make-backup-files nil)
(setq auto-save-default nil)
