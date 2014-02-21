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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
