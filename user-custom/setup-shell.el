(defun kimgronqvist-set-bash-shell ()
  (interactive)
  (when window-system
    (setq explicit-shell-file-name "C:/Program Files/Git/bin/sh.exe")
    (setq shell-file-name explicit-shell-file-name)
    (setq explicit-sh.exe-args '("--login" "-i"))
    (setenv "SHELL" shell-file-name)
    (add-to-list 'exec-path "C:/Program Files/Git/bin")
    (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))

(provide 'setup-shell)
