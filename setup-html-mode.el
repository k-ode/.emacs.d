(defadvice sgml-delete-tag (after reindent activate)
  (indent-region (point-min) (point-max)))

(require 'simplezen)

(defun --setup-simplezen ()
  (set (make-local-variable 'yas/fallback-behavior)
       '(apply simplezen-expand-or-indent-for-tab)))

(add-hook 'sgml-mode-hook '--setup-simplezen)

(add-hook 'html-mode-hook
		  (lambda()
			(setq sgml-basic-offset 4)))

(eval-after-load "sgml-mode"
 '(progn
   (require 'tagedit)
   (define-key html-mode-map (kbd "C-<right>") 'tagedit-forward-slurp-tag)
   (define-key html-mode-map (kbd "C-<left>") 'tagedit-forward-barf-tag)
   (define-key html-mode-map (kbd "M-r") 'tagedit-raise-tag)
   (define-key html-mode-map (kbd "M-s") 'tagedit-splice-tag)
   (define-key html-mode-map (kbd "M-J") 'tagedit-join-tags)
   (define-key html-mode-map (kbd "M-S") 'tagedit-split-tag)
   (define-key html-mode-map (kbd "M-?") 'tagedit-convolute-tags)
   (define-key html-mode-map (kbd "C-k") 'tagedit-kill)
   (define-key html-mode-map (kbd "C-S-k") 'tagedit-kill-attribute)
   (tagedit-add-experimental-features)
   (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))

(provide 'setup-html-mode)
