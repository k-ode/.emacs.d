(when window-system
  (setq explicit-shell-file-name "C:/Program Files (x86)/Git/bin/sh.exe")
  (setq shell-file-name explicit-shell-file-name)
  (setq shell-file-name "bash")
  (setq explicit-sh.exe-args '("--login" "-i"))
  (setenv "SHELL" shell-file-name)
  (add-to-list 'exec-path "C:/Program Files (x86)/Git/bin")
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m))

(provide 'setup-shell)
