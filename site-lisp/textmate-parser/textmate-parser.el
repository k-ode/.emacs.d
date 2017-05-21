(defconst my-js-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; ' is a string delimiter
    (modify-syntax-entry ?' "\"" table)
    ;; " is a string delimiter too
    (modify-syntax-entry ?\" "\"" table)

    ;; / is punctuation, but // is a comment starter
    (modify-syntax-entry ?/ ". 12" table)
    ;; \n is a comment ender
    (modify-syntax-entry ?\n ">" table)
    table))

(define-derived-mode my-js-mode prog-mode "Simple JS Mode"
  :syntax-table my-js-mode-syntax-table
  (font-lock-fontify-buffer))

(defun parse-xml-file ()
  (let ((dict (with-temp-buffer (insert-file-contents "./Dockerfile.tmLanguage") (buffer-string))))
    (with-temp-buffer
      (insert dict)
      (libxml-parse-xml-region (point-min) (point-max)))))

(defun my-parse-thing ()
  (cddr (car (cddr (parse-xml-file)))))
