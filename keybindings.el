(define-key c-mode-base-map (kbd "<C-tab>") 'company-complete)

(dolist (mode c-c++-modes)
  (evil-leader/set-key-for-mode mode
    "g g" 'rtags-find-symbol-at-point
    "g f" 'rtags-fix-fixit-at-point))
