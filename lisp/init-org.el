(use-package org
  :mode (("\\.org$" . org-mode))
  :init
  (progn
    ;; Truncate task
   (setq org-clock-heading-function
         (lambda ()
           (s-left 8 (nth 4 (org-heading-components)))))

   ;; Org-mode is silly
   (setq org-replace-disputed-keys t)

   ;; Fontify org-mode code blocks
   (setq org-src-fontify-natively t)

   (setq org-agenda-files '("C:/Users/kg/Dropbox/org/inbox.org"
                            "C:/Users/kg/Dropbox/org/gtd.org"
                            "C:/Users/kg/Dropbox/org/tickler.org"))

   (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                  (file+headline "C:/Users/kg/Dropbox/org/inbox.org" "Tasks")
                                  "* TODO %i%?")
                                 ("T" "Tickler" entry
                                  (file+headline "C:/Users/kg/Dropbox/org/tickler.org" "Tickler")
                                  "* %i%? \n %U")))

   (setq org-refile-targets '(("C:/Users/kg/Dropbox/org/gtd.org" :maxlevel . 3)
                              ("C:/Users/kg/Dropbox/org/someday.org" :level . 1)
                              ("C:/Users/kg/Dropbox/org/tickler.org" :maxlevel . 2))))
  :config
  (progn
   (set-face-attribute 'org-level-1 nil :height 1.0)))

(provide 'init-org)
