;; -*- mode: Emacs-Lisp -*-

;; Time-stamp: <BigFang 2012-07-01 23:23:55>

(require 'gnushush)
(setq gnushush-fqdn "unknown")

;; (setq gnus-parameters
;;       (nconc
;;        ;; Some charsets are just examples!
;;        '(("\\bcn\\.bbs\\..*" ;; Chinese
;;           (mm-coding-system-priorities
;;            '(iso-8859-1 gbk utf-8))))
;;        gnus-parameters))

(setq gnus-posting-styles
      `((".*"
         (name user-full-name)
         (address user-mail-address)
         (signature "test")
         (organization "test2"))

        ("^cn\\.bbs\\.comp"
         (eval (setq mm-coding-system-priorities
                     '(gb2312 utf-8))))))


(defadvice message-send (around my-confirm-message-send)
  (if (yes-or-no-p "Really send message? ")
      ad-do-it))
(ad-activate 'message-send)

(add-hook 'gnus-article-prepare-hook
          (lambda ()
            (gnus-article-fill-long-lines)
            (gnus-article-date-local)))

;;(add-hook 'gnus-article-prepare-hook 'gnus-article-date-local)

(setq gnus-inhibit-startup-message nil
      gnus-startup-file "~/.emacs.d/.newsrc")

(setq gnus-select-method '(nntp "news.cn99.com"))
(add-to-list 'gnus-secondary-select-methods '(nntp "news.newsfan.net"))
(add-to-list 'gnus-secondary-select-methods '(nntp "news.yaako.com"))
(add-to-list 'gnus-secondary-select-methods '(nntp "news.gmane.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp "freenews.netfront.net"))

(setq gnus-group-name-charset-group-alist
      '(("nnrss.*" . utf-8)
        (".*" . gbk)))

(setq gnus-summary-show-article-charset-alist
      '((1 . gbk)
        (2 . utf-8)
        (3 . big5)))

(setq gnus-posting-styles
      '((".*"
         (name "BigFang")
         (address "bit_air@gmail.com")
         (eval (setq mm-coding-system-priorities
                     '(iso-8859-1 gbk utf-8))))))

(setq gnus-summary-line-format "%O%U%R%z %(%&user-date;  %-30,30f %* %B %-80,80s%)\n"
      gnus-summary-mode-line-format "Gnus: %p [%A / %S:%4z] %Z"
      gnus-user-date-format-alist '((t . "%m.%d")))

(setq gnus-summary-same-subject ""
      gnus-sum-thread-tree-root "+-"
      gnus-sum-thread-tree-false-root nil
      gnus-sum-thread-tree-single-indent "O "
      gnus-sum-thread-tree-vertical "| "
      gnus-sum-thread-tree-indent " "
      gnus-sum-thread-tree-leaf-with-other "|-> "
      gnus-sum-thread-tree-single-leaf "'-> ")

(setq gnus-thread-sort-functions
      '((not gnus-thread-sort-by-number)))

(gnus-topic-mode t)

;;;;;;;;;;;;;;;;

;; (eval-after-load "mm-decode"
;;   '(progn
;;      (add-to-list 'mm-discouraged-alternatives "text/html")
;;      (add-to-list 'mm-discouraged-alternatives "text/richtext")))

;; (setq mail-sources
;;       '((pop :server "pop.qq.com"
;;              :port "pop3"
;;              :user "bit_air"
;;              :password "passwd")))

;; (add-to-list 'gnus-secondary-select-methods '(nnfolder ""))

;; (setq smtpmail-auth-credentials
;;           '(("smtp.qq.com"
;;                  25
;;                  "bit_air"
;;                  "passwd")))
;; (setq smtpmail-default-smtp-server "smtp.qq.com"
;;           smtpmail-smtp-server "smtp.qq.com")
;; (setq message-send-mail-function 'smtpmail-send-it)

(setq gnus-visible-headers
      (mapconcat 'regexp-quote
                 '("From:" "Newsgroups:" "Subject:" "Date:"
                   "Organization:" "To:" "Cc:" "Followup-To" "Gnus-Warnings:"
                   "X-Sent:" "X-URL:" "User-Agent:" "X-Newsreader:"
                   "X-Mailer:" "Reply-To:" "X-Spam:" "X-Spam-Status:" "X-Now-Playing"
                   "X-Attachments" "X-Diagnostic")
                 "\\|"))
