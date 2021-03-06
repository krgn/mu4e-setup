(require 'uniquify)
(require 'redo+)
(require 'xclip)
(require 'tramp)
(require 'saveplace)

;; always font-lock plz
(global-font-lock-mode t)
;; default tab-width
(setq-default tab-width 2)
;; always indent with spaces
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 2 60 2))

;; addicted to bling
(blink-cursor-mode t)
;; show matching parenthesis
(show-paren-mode t)
;; next to line number, show # column (character)
(column-number-mode t)
;; when ever a change to a file occurs, reflect it in the buffer
(global-auto-revert-mode t)
;; always highlight current line
(global-hl-line-mode t)
;; disable this for autopair to work as expected with brackets + quotes
(delete-selection-mode -1)

;; utf8 all the way
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; location for all backup files
(setq backup-directory-alist `(("." . ,(expand-file-name  (concat relative-config-dir "bak")))))

;; save last position in file
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; "80 columns" is too little :)
(setq fill-column 120)

;; grep mode!
(setq grep-command "grep -nirH -e ")

;; don't break lines in an awkward way
(set-default 'truncate-lines t)
(setq inhibit-startup-screen t)       ;don't show the startup message
(setq inhibit-splash-screen t)

(setq browse-url-browser-function (quote browse-url-chromium))

(add-hook 'fundamental-mode-hook 'highlight-todo)
(add-hook 'server-switch-hook 'switch-server-hook)

;; set default directory
(setq default-directory "~/")
(setq default-major-mode 'org-mode)     ;default is org-mode
(setq initial-major-mode 'org-mode)     ;scratch buffer as well
(setq initial-scratch-message "# *scratch* buffer for creating quick outlines\n")

;; recentf for cache
(recentf-mode 1)

;; subword mode provides more fine grained movements through, e.g. camel-cased text
(global-subword-mode t)

;; show disambiguated paths to files in reverse order
(setq uniquify-buffer-name-style 'reverse)

;; don't just close emacs
(global-set-key (kbd "C-x C-c") 'ask-before-closing)

;; my compile shortcute (for rspec, mostly)
(global-set-key (kbd "C-c r") 'compile)

;; replace-regexp binding
(global-set-key (kbd "C-x w") 'replace-regexp)

;; don't want this binding at all (lead to 'emacs release news')
(global-set-key (kbd "C-h C-n") nil)

;; global ace jump thing
(global-set-key (kbd "C-x b") 'switch-to-buffer)


;; ask before closing
 (defun ask-before-closing ()
   "Ask whether or not to close, and then close if y was pressed"
   (interactive)
   (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
     (if (< emacs-major-version 22)
       (save-buffers-kill-terminal)
       (save-buffers-kill-emacs))
     (message "Canceled exit")))

;; highlight keywords
(defun highlight-todo ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|NOTE\\|TODO\\|IDEA\\|BUG\\):"
                             1
                             font-lock-warning-face t))))

