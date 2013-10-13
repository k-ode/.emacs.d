;; Interactively do things
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
       ido-enable-flex-matching t
       ido-create-new-buffer 'always
       ido-max-prospects 10
       ido-auto-merge-work-directories-length -1
       ido-case-fold nil
       ido-create-new-buffer 'always)
       ;;ido-use-virtual-buffers t)
      
(set-default 'imenu-auto-rescan t)

(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

;; Ido at point
(require 'ido-at-point)
(ido-at-point-mode)

(require 'ido-vertical-mode)
(ido-vertical-mode)

(defun sd/ido-define-keys ()
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))

;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (if (and ido-use-virtual-buffers (fboundp 'ido-toggle-virtual-buffers))
      (ido-switch-buffer)
    (find-file (ido-completing-read "Recent file: " recentf-list nil t))))

;; Fix ido-ubiquitous for newer packages
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))

(provide 'setup-ido)
