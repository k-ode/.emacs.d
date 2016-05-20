(use-package flycheck                   ; On-the-fly syntax checking
  :ensure t
  :bind (("C-c e l" . list-flycheck-errors)
         ("C-c e n" . flycheck-next-error)
         ("C-c e p" . flycheck-previous-error)
         ("C-c e c" . flycheck-buffer)
         ("C-c e C" . flycheck-clear)
         ("C-c e f" . flycheck-first-error)
         ("C-c e w" . flycheck-copy-errors-as-kill)
         ("C-c t f" . flycheck-mode))
  :init (progn
          (global-flycheck-mode)
          (setq flycheck-global-modes '(js2-mode html-mode less-css-mode)))
  :config
  ;; Only check buffer syntax when saving file or enabling mode
  (progn (setq flycheck-check-syntax-automatically '(mode-enabled save))

         (setq-default flycheck-disabled-checkers
                       (append flycheck-disabled-checkers
                               '(javascript-jshint)))

;;          (defun lunaryorn-discard-undesired-html-tidy-error (err)
;;            "Discard ERR if it is undesired.
;; Tidy is very verbose, so we prevent Flycheck from highlighting
;; most errors from HTML Tidy."
;;            ;; A non-nil result means to inhibit further processing (i.e. highlighting)
;;            ;; of the error
;;            (and (eq (flycheck-error-checker err) 'html-tidy)
;;                 ;; Only allow warnings about missing tags, or unexpected end tags being
;;                 ;; discarded
;;                 (not (string-match-p (rx (or "missing </" "discarding"))
;;                                      (flycheck-error-message err)))))

;;          (add-hook 'flycheck-process-error-functions
;;                    #'lunaryorn-discard-undesired-html-tidy-error)

         ;; (defun flycheck-start-command-checker (checker callback)
         ;;   "Start a command CHECKER with CALLBACK."
         ;;   (let (process)
         ;;     (condition-case err
         ;;         (let* ((program (flycheck-find-checker-executable checker))
         ;;                (args (flycheck-checker-substituted-arguments checker))
         ;;                (command (funcall flycheck-command-wrapper-function
         ;;                                  (cons program args)))
         ;;                ;; Use pipes to receive output from the syntax checker.  They are
         ;;                ;; more efficient and more robust than PTYs, which Emacs uses by
         ;;                ;; default, and since we don't need any job control features, we
         ;;                ;; can easily use pipes.
         ;;                (process-connection-type nil))
         ;;           ;; We pass do not associate the process with any buffer, by
         ;;           ;; passing nil for the BUFFER argument of `start-process'.
         ;;           ;; Instead, we just remember the buffer being checked in a
         ;;           ;; process property (see below).  This neatly avoids all
         ;;           ;; side-effects implied by attached a process to a buffer, which
         ;;           ;; may cause conflicts with other packages.
         ;;           ;;
         ;;           ;; See https://github.com/flycheck/flycheck/issues/298 for an
         ;;           ;; example for such a conflict.
         ;;           (setq process (apply 'start-process (format "flycheck-%s" checker)
         ;;                                nil command))
         ;;           (setf (process-sentinel process) #'flycheck-handle-signal)
         ;;           (setf (process-filter process) #'flycheck-receive-checker-output)
         ;;           (set-process-query-on-exit-flag process nil)
         ;;           ;; Remember the syntax checker, the buffer and the callback
         ;;           (process-put process 'flycheck-checker checker)
         ;;           (process-put process 'flycheck-callback callback)
         ;;           (process-put process 'flycheck-buffer (current-buffer))
         ;;           ;; Track the temporaries created by argument substitution in the
         ;;           ;; process itself, to get rid of the global state ASAP.
         ;;           (process-put process 'flycheck-temporaries flycheck-temporaries)
         ;;           (setq flycheck-temporaries nil)
         ;;           ;; Send the buffer to the process on standard input, if enabled
         ;;           (when (flycheck-checker-get checker 'standard-input)
         ;;             (save-excursion
         ;;               (save-restriction
         ;;                 (widen)
         ;;                 (goto-char (point-min))
         ;;                 (while (not (eobp))
         ;;                   (let ((from (point)))
         ;;                     (forward-char (min 50 (- (point-max) (point))))
         ;;                     (process-send-region process from (point))))
         ;;                 (process-send-eof process))))
         ;;           ;; Return the process
         ;;           process)
         ;;       (error
         ;;        ;; In case of error, clean up our resources, and report the error back to
         ;;        ;; Flycheck
         ;;        (flycheck-safe-delete-temporaries)
         ;;        (when process
         ;;          ;; No need to explicitly delete the temporary files of the process,
         ;;          ;; because deleting runs the sentinel, which will delete them anyway.
         ;;          (delete-process process))
         ;;        (signal (car err) (cdr err)))))))
         )
  
  :diminish (flycheck-mode . " Ⓢ"))

(provide 'init-flycheck)
