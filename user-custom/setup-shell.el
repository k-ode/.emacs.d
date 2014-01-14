(when window-system
  (setq explicit-shell-file-name "C:/dev/utils/MinGw/msys/1.0/bin/sh.exe")
  (setq shell-file-name explicit-shell-file-name)
  (setq shell-file-name "bash")
  (setq explicit-sh.exe-args '("--login" "-i"))
  (setenv "SHELL" shell-file-name)
  (add-to-list 'exec-path "C:/dev/utils/MinGw/msys/1.0/bin")
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m))
 
(provide 'setup-shell)
