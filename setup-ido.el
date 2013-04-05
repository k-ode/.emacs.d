;; Interactively do things
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10)

(set-default 'imenu-auto-rescan t)

;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Switch current ido mode
(defun switch-ido-mode ()
  (interactive)
  (if (and (eq ido-mode nil)
			 (eq ido-ubiquitous-mode nil))
	  (progn (setq ido-ubiquitous-mode t)
			 (ido-mode)
			 (setq confirm-nonexistent-file-or-buffer nil)
			 (message "Ubiquitos and ido mode enabled"))
	(if (and (eq ido-mode 'both)
			 (eq ido-ubiquitous-mode t))
		(progn (setq ido-ubiquitous-mode nil)
			   (ido-mode)
			   (setq confirm-nonexistent-file-or-buffer t)
			   (message "Ubiquitos and ido mode disabled"))
	  (if (eq ido-mode 'both)
		  (progn (setq ido-ubiquitous t)
				 (message "Enabled ubiquitos mode"))))))

;; Fix ido-ubiquitous for newer packages
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))

(provide 'setup-ido)
