;; set up elpa
(setq relative-config-dir "~/.emacs.d/")
(setq setup-files-dir "config/")

(load-file (concat relative-config-dir "elpa.el"))

;; use use-package :)
(require 'use-package)
;; massage list of file-names
(setq dot-files 
      (mapcar (lambda (item) (concat relative-config-dir setup-files-dir item))
           (list "setup-evil.el"        ;vimim (vi much improved)
                 "setup-path.el"        ;path
                 "setup-font.el"        ;font
                 "setup-general.el"     ;general
                 "setup-shell.el"       ;shell
                 "setup-mu.el"          ;mail
                 "setup-keychain.el"    ;keychain
                 )))

(dolist (file dot-files) (load-file file))
