;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Change window quickly with S-left and S-right
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(provide 'init-windows)
