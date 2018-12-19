;; -*- mode: Emacs-Lisp -*-


(use-package buffer-move
  :ensure t
  :bind (("C-z <up>" . buf-move-up)
         ("C-z <down>" . buf-move-down)
         ("C-z <left>" . buf-move-left)
         ("C-z <right>" . buf-move-right)))


(use-package dumb-jump
  :ensure t
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'ivy
        dumb-jump-prefer-searcher 'rg)
  :init
  (defhydra hydra-dumb-jump (:color teal :hint nil)
    "
     ^jump^                        ^other^
----------------------------------------------
 [_j_] go                     [_l_] quick look
 [_o_] go other window        [_i_] prompt
 [_e_] external               [_b_] back
 [_x_] external other window
"
    ("j" dumb-jump-go)
    ("o" dumb-jump-go-other-window)
    ("i" dumb-jump-go-prompt)
    ("l" dumb-jump-quick-look)
    ("b" dumb-jump-back :color red)
    ("e" dumb-jump-go-prefer-external)
    ("x" dumb-jump-go-prefer-external-other-window)
    ("q" nil)))


(use-package eyebrowse
  :ensure t
  :config
  (eyebrowse-mode t)

  (defhydra hydra-eyebrowse (:color teal :hint nil :columns 2)
    "eyebrowse"
    ("p"  eyebrowse-prev-window-config       "prev config" :color red)
    ("n"  eyebrowse-next-window-config       "next config" :color red)
    ("e"  eyebrowse-last-window-config       "last config")
    ("s"  eyebrowse-switch-to-window-config  "switch config")
    ("c"  eyebrowse-create-window-config     "create config")
    ("d"  eyebrowse-close-window-config      "delete current config")
    ("m"  eyebrowse-rename-window-config     "rename current config")
    ("0"  eyebrowse-switch-to-window-config-0)
    ("1"  eyebrowse-switch-to-window-config-1)
    ("2"  eyebrowse-switch-to-window-config-2)
    ("3"  eyebrowse-switch-to-window-config-3)
    ("4"  eyebrowse-switch-to-window-config-4)
    ("5"  eyebrowse-switch-to-window-config-5)
    ("6"  eyebrowse-switch-to-window-config-6)
    ("7"  eyebrowse-switch-to-window-config-7)
    ("8"  eyebrowse-switch-to-window-config-8)
    ("9"  eyebrowse-switch-to-window-config-9)
    ("q"  nil :color blue)))


(use-package imenu-anywhere
  :ensure t)


(use-package imenu-list
  :ensure t
  :bind ("C-;" . imenu-list-smart-toggle)
  :hook (imenu-list-after-jump . recenter-top-bottom)
  :config
  (setq imenu-list-size 0.12
        imenu-list-auto-resize t
        imenu-list-focus-after-activation t)
  (evil-set-initial-state 'imenu-list-major-mode 'emacs))


(use-package switch-window
  :ensure t
  :bind
  (("C-x o" . switch-window)
   :map switch-window-extra-map
   ("i" . nil)
   ("k" . 'switch-window-mvborder-up)
   ("j" . 'switch-window-mvborder-down)
   ("h" . 'switch-window-mvborder-left)
   ("l" . 'switch-window-mvborder-right))
  :config
  ;; (setq switch-window-auto-resize-window t
  ;;       switch-window-default-window-size 0.75)
  (setq switch-window-qwerty-shortcuts
        '("s" "d" "i" "o" "u" "w" "v" "n"
          "a" "f" "p" "e" "g" "y"
          "m" "r" "t" "z" "x" "c"
          "q" "h" "j" "k" "l" "b"))
  (setq switch-window-threshold 2
        switch-window-increase 12
        switch-window-shortcut-appearance 'asciiart
        switch-window-minibuffer-shortcut ?x)
  (setq switch-window-shortcut-style 'qwerty))


(use-package transpose-frame
  :ensure t
  :bind ("C-z t" . transpose-frame))


(use-package treemacs
  :ensure t
  :config
  (setq treemacs-project-follow-cleanup t
        treemacs-width 30)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t))

(use-package treemacs-evil
  :ensure t
  :requires treemacs)

(use-package treemacs-projectile
  :ensure t
  :requires treemacs
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header))


(provide 'conf-nav)
