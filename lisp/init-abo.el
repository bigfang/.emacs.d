;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package hydra
  :ensure t
  :after swiper
  :bind (("C-`" . hydra:leader/body)
         ("C-~" . hydra:captain/body)
         :map evil-motion-state-map
         ("SPC" . hydra:leader/body)
         ("RET" . hydra:captain/body))
  :config
  (use-package hydra-builtin)
  (use-package hydra-dired)
  (use-package hydra-ibuffer)
  (use-package hydra-info)
  (use-package hydra-macro)
  (use-package hydra-rectangle)

  (use-package hydra-org)
  (use-package hydra-projectile)
  (use-package hydra-lsp)
  (use-package hydra-alchemist)
  (use-package hydra-pdf)

  (use-package hydra-abo)
  (use-package hydra-git)
  (use-package hydra-ui)

  (use-package hydra-adapter)

  (use-package hydra-leader)
  (use-package hydra-captain))


(use-package ivy
  :ensure t
  :bind (:map ivy-minibuffer-map
         ("M-j" . pyim-convert-string-at-point)
         ("C-\\" . ivy-yank-word)
         ("M-i" . ivy-restrict-to-matches) ; default "S-SPC"
         ("<escape>" . minibuffer-keyboard-quit)
         ("M-u" . ivy-occur)
         ("C-M-n" . my/ivy-next-line-and-call)
         ("C-M-p" . my/ivy-previous-line-and-call)
         ("s-n" . my/ivy-next-line-and-call)
         ("s-p" . my/ivy-previous-line-and-call)
         ("M-n" . ivy-next-line)
         ("M-p" . ivy-previous-line)
         ("C-n" . ivy-next-history-element)
         ("C-p" . ivy-previous-history-element))
  :hook ((imenu-after-jump . recenter-top-bottom)
         (counsel-grep-post-action . recenter-top-bottom))
  :init
  (defun my/ivy-next-line-and-call (&optional arg)
    (interactive "p")
    (ivy-next-line arg)
    (ivy--exhibit)
    (ivy-call)
    (with-ivy-window (recenter)))
  (defun my/ivy-previous-line-and-call (&optional arg)
    (interactive "p")
    (ivy-previous-line arg)
    (ivy--exhibit)
    (ivy-call)
    (with-ivy-window (recenter)))
  :config
  (setq ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-virtual-abbreviate 'abbreviate
        ivy-height 15)
  (add-to-list 'ivy-more-chars-alist '(counsel-rg . 2))
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-arrow)
  (ivy-mode 1))


(use-package ivy-hydra
  :ensure t
  :after (ivy hydra))


(use-package swiper
  :ensure t
  :bind (:map swiper-map
         ("M-q" . swiper-query-replace)
         ("C-'" . swiper-avy)
         ("M-c" . swiper-mc)))


(use-package counsel
  :ensure t
  :ensure-system-package (rg . ripgrep)
  :bind (("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop))
  :config
  (global-set-key (kbd "<f1> b") 'counsel-descbinds)
  ;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  ;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char))


(use-package avy
  :ensure t
  :bind (("M-g g" . avy-goto-char-2)
         ("M-g w" . avy-goto-word-or-subword-1)
         ("M-g l" . avy-goto-line))
  :init
  (defhydra hydra:avy (:color teal :hint nil)
    "
     ^Chars^            ^word^              ^other^
------------------------------------------------------------
 [_c_]  char         [_v_]  word         [_s_]  symbol
 [_a_]  char-2       [_w_]  [sub]word    [_r_]  resume
 [_t_]  char-timer   [_e_]  subword      [_l_]  line
"
    ("c" avy-goto-char)
    ("a" avy-goto-char-2)
    ("o" avy-goto-char-2)
    ("t" avy-goto-char-timer)
    ("v" avy-goto-word-1)
    ("w" avy-goto-word-or-subword-1)
    ("e" avy-goto-subword-1)
    ("s" avy-goto-symbol-1)
    ("r" avy-resume)
    ("l" avy-goto-line)
    ("q" nil "cancel" :color blue)))


(use-package auto-yasnippet
  :ensure t
  :bind (("s-w" . aya-create)
         ("s-y" . aya-expand)))


(use-package tiny
  :ensure t
  :bind ("C-'" . tiny-expand))


;; ===
(use-package ivy-posframe
  :ensure t
  :requires posframe
  :config
  (setq ivy-posframe-display-functions-alist
        '((swiper          . ivy-posframe-display-at-window-bottom-left)
          (complete-symbol . ivy-posframe-display-at-point)
          (counsel-M-x     . ivy-posframe-display-at-window-bottom-left)
          (t               . ivy-posframe-display)))
  (ivy-posframe-mode 1))

(use-package ivy-rich
  :ensure t
  :after (ivy counsel)
  :config
  (setq ivy-rich-path-style 'abbrev)
  (ivy-rich-mode 1))


(use-package counsel-tramp
  :ensure t)


(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode t))


(use-package smex
  :ensure t
  :bind ("M-X" . smex-major-mode-commands))


(provide 'init-abo)
