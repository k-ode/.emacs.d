(use-package company                    ; Graphical (auto-)completion
  :ensure t
  :config
  (progn
    (define-key company-active-map (kbd "<tab>") nil)
    (setq company-minimum-prefix-length 1
          company-idle-delay 0.33 ;; Show when I stop typing
          company-selection-wrap-around t
          company-show-numbers t
          company-tooltip-align-annotations t
          company-require-match nil
          company-dabbrev-downcase nil))
  :diminish company-mode)

;; make help buffer stay
(defun my/company-show-doc-buffer ()
  "Temporarily show the documentation buffer for the selection."
  (interactive)
  (let* ((selected (nth company-selection company-candidates))
         (doc-buffer (or (company-call-backend 'doc-buffer selected)
                         (error "No documentation available"))))
    (with-current-buffer doc-buffer
      (goto-char (point-min)))
    (display-buffer doc-buffer t)))

(define-key company-active-map (kbd "C-<f1>") #'my/company-show-doc-buffer)

(provide 'init-company)
