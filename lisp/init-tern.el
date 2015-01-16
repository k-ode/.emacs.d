(after-load 'tern
  ;;(delete-tern-port-file)
  (setq tern-command (list "node" (expand-file-name "tern/bin/tern" user-emacs-directory) "--strip-crs"))
  (require 'company-tern)
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook 'tern-mode))

(defun my-tern-project-dir ()
  (and (not (buffer-file-name)) "")
  (let ((project-dir (file-name-directory (buffer-file-name))))
    (loop for cur = project-dir then (let ((shorter (file-name-directory (substring cur 0 (1- (length cur))))))
                                       (and (< (length shorter) (length cur)) shorter))
          while cur do
          (when (file-exists-p (expand-file-name ".tern-project" cur))
            (return (setf project-dir cur))))
    project-dir))

(defun get-tern-port-file ()
  (expand-file-name ".tern-port" (my-tern-project-dir)))

(defun delete-tern-port-file ()
  (interactive)
  (delete-file (get-tern-port-file)))

(defun restart-tern ()
  (interactive)
  (tern-mode 0)
  (when (process-status "Tern")
    (kill-process "Tern"))
  (when (file-exists-p (get-tern-port-file))
    (delete-tern-port-file))
  (tern-mode 1))

(provide 'init-tern)
