;; Flymake should always use cursor
(eval-after-load 'flymake '(flymake-cursor-mode 1))

;; Don't save temporary files in same directory, please
(setq temporary-file-directory "~/.emacs.d/tmp/")
(setq flymake-run-in-place nil)

(add-hook 'html-mode-hook
		  (lambda()
			(setq sgml-basic-offset 4)
			(setq indent-tabs-mode t)))

;; EXTRACT THIS
(defun my-csarhp-mode-fn ()
  "function that runs when cshar-mode is initialized."
  (setq c-basic-offset 4)
  (use-local-map nil)
  (c-set-offset 'substatement-open 0))
(add-hook 'csharp-mode-hook 'my-csarhp-mode-fn t)

(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))

(provide 'my-misc)
