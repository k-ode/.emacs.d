(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffer
        try-expand-dabbrev-from-kill))

(provide 'setup-hippie)
