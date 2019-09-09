;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(defun my/serve-and-open (dir)
  (interactive "DServe directory: \n")
  (httpd-serve-directory dir)
  (browse-url (format "http://localhost:%s" httpd-port)))


(defhydra hydra:browse (:color teal :hint nil :columns 6)
  "visit website"
  ("g" (browse-url "https://github.com") "GitHub")
  ("r" (browse-url "https://www.reddit.com") "Reddit")
  ("s" (browse-url "https://bbs.saraba1st.com/2b/forum-75-1.html") "Stage1st")
  ("t" (browse-url "https://club.tgfcer.com/forum-25-1.html") "TGFC")
  ("x" (browse-url "https://xueqiu.com") "xueqiu")
  ("z" (browse-url "https://zhihu.com") "zhihu")

  ("w" my/serve-and-open "web server")
  ("j" browse-url "browser current")
  ("f" (lambda (file)
         (interactive "fFile: ")
         (browse-url file))
   "open with")
  ("d" (lambda (dir)
         (interactive "DDirectory: ")
         (browse-url dir))
   "open folder")

  ("." google-this "google this")

  ("q" nil :color blue))


(defhydra hydra:captain (:color teal :exit t :hint nil :idle .2 :columns 5)
  "⊞      --- Hydra Captain ---    "
  ("RET" hydra:toggle/body "toggle modes...")
  ("SPC" lsp-ui-imenu "lsp imenu")
  ("TAB" beginning-of-defun "beginning of defun")
  ("DEL" (lambda (arg)
           (interactive "p")
           (forward-line)
           (end-of-defun arg)
           (backward-char))
   "end of defun")
  ("\\" re-builder "re-builder")

  ("f" hydra:adjust/body "adjust...")

  ("c" calendar "calendar")
  ("C" quick-calc "quick calc")
  ("s" eshell "eshell")
  ("e" eval-last-sexp "eval sexp")
  ("E" eval-buffer "eval buffer")
  ("R" revert-buffer "revert buffer")
  ("v" ido-find-alternate-file "reload")
  ("x" smex "smex")
  ("z" fzf-directory "fzf-directory")

  ("d" deft "deft")
  ("g" deadgrep "deadgrep")
  ("k" hydra:kurecolor/body "kurecolor..." :color teal)
  ("t" google-translate-smooth-translate "google translate")
  ("G" google-this "google this")

  ("j" hydra:browse/body "visit website")

  ("<escape>" nil :color blue)
  ("q" nil :color blue))


(provide 'hydra-captain)
