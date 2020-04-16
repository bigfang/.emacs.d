;; -*- mode: Emacs-Lisp; lexical-binding: t; -*-*-


(use-package org
  :ensure t
  :hook ((org-mode . my/org-table-font))
  :config
  (defun my/org-table-font ()
    (interactive)
    (set-face-attribute 'org-table nil :font "PCMyungjo 16"))
  (setq org-startup-folded 'content
        org-startup-indented t)
  (setq org-enforce-todo-dependencies t))


(use-package org-drill
  :disabled
  :ensure org-plus-contrib
  :pin org
  :commands org-drill)


(use-package deft
  :ensure t
  :commands (deft)
  :config
  (setq deft-directory "~/org"
        deft-recursive t
        deft-default-extension "org"
        deft-extensions '("org" "md"))
  (setq deft-use-filename-as-title nil)
  (evil-define-key 'insert deft-mode-map (kbd "C-g") 'deft-filter-clear)
  (evil-define-key 'normal deft-mode-map (kbd "RET") 'deft-complete)
  (evil-define-key 'normal deft-mode-map (kbd "n") 'deft-new-file)
  (evil-define-key 'normal deft-mode-map (kbd "R") 'deft-rename-file)
  (evil-define-key 'normal deft-mode-map (kbd "D") 'deft-delete-file)
  (evil-define-key 'normal deft-mode-map (kbd "gr") 'deft-refresh)
  (evil-define-key 'normal deft-mode-map (kbd "f") 'deft-find-file)
  (evil-define-key 'normal deft-mode-map (kbd "o") 'deft-open-file-other-window)
  (evil-define-key 'normal deft-mode-map (kbd "s") 'deft-toggle-sort-method)
  (evil-define-key 'normal deft-mode-map (kbd "q") 'quit-window))


(use-package org-bullets
    :ensure t
    :commands org-bullets-mode
    :hook (org-mode . (lambda () (org-bullets-mode 1))))


(use-package toc-org
  :ensure t
  :hook (org-mode . toc-org-enable)
  :config
  (setq toc-org-hrefify-default "org"))


(use-package org-page
  :after simple-httpd
  :ensure t
  :config
  (setq op/repository-directory "~/repo/op-blog"
        op/site-domain "http://bigfang.net"
        op/site-main-title "╮(╯3╰)╭"
        op/site-sub-title "虽然不太明白，但是好厉害啊"
        op/personal-disqus-shortname "bigfang"
        op/personal-google-analytics-id "UA-37180058-1"
        op/personal-github-link "https://github.com/bigfang"
        op/hashover-comments t)
  (setq op/theme 'mdo)
  (setq op/category-config-alist
      '(("blog"
         :show-meta t
         :show-comment t
         :uri-generator op/generate-uri
         :uri-template "/blog/%y-%m-%d/%f"
         :sort-by :date
         :category-index t)
        ("wiki"
         :show-meta t
         :show-comment nil
         :uri-generator op/generate-uri
         :uri-template "/wiki/%t"
         :sort-by :mod-date
         :category-index t)
        ("index"
         :show-meta nil
         :show-comment nil
         :uri-generator op/generate-uri
         :uri-template "/"
         :sort-by :date
         :category-index t)
        ("about"
         :show-meta nil
         :show-comment nil
         :uri-generator op/generate-uri
         :uri-template "/about"
         :sort-by :date
         :category-index nil))))


;; === markdown ===
(use-package markdown-mode
  :ensure t
  :defer t)

(use-package markdown-toc
  :ensure t
  :bind ("C-c C-q" . markdown-toc-generate-or-refresh-toc))


(provide 'init-org)
