(use-package shell
  :init
  (progn
    (message "setting up shell")
    (global-set-key (kbd "<f11>") 'ansi-term)
    (setq explicit-shell-file-name "/bin/bash")
    (setq shell-file-name "/bin/bash")
    (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))
