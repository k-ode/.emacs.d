(setq org-directory "~/../../_org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-capture) 
(setq org-use-fast-todo-selection t)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/../../_org/work.org"
                             "~/../../_org/school.org" 
                             "~/../../_org/home.org"))

(defun myorg-update-parent-cookie ()
  (when (equal major-mode 'org-mode)
	(save-excursion
	  (ignore-errors
		(org-back-to-heading)
		(org-update-parent-todo-statistics)))))

(defadvice org-kill-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

(defadvice kill-whole-line (after fix-cookies active)
  (myorg-update-parent-cookie))

(provide 'setup-org)
