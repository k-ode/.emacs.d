(when (maybe-require-package 'tern)
  (setq tern-command (list "node" (expand-file-name "tern/bin/tern" user-emacs-directory))))

(after-load 'tern
  (require-package 'company-tern)
  (add-to-list 'company-backends 'company-tern))

(defun my-tern-project-dir ()
  (and (not (buffer-file-name)) "")
  (let ((project-dir (file-name-directory (buffer-file-name))))
    (loop for cur = project-dir then (let ((shorter (file-name-directory (substring cur 0 (1- (length cur))))))
                                       (and (< (length shorter) (length cur)) shorter))
          while cur do
          (when (file-exists-p (expand-file-name ".tern-project" cur))
            (return (setf project-dir cur))))
    project-dir))

(defun delete-tern-port-file ()
  (interactive)
  (delete-file (expand-file-name ".tern-port" (my-tern-project-dir))))

(provide 'init-tern)
