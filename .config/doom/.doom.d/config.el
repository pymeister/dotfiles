;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Pymeister"
      user-mail-address "k.lancemeister@gmail.com")
;;________________________________________________________________
;;    Transparent Emacs
;;________________________________________________________________
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))
;; (set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;; (set-frame-parameter (selected-frame) 'alpha <both>)
(setq delete-by-moving-to-trash t )
(setq trash-directory "~/.Trash")  ;; fallback for `move-file-to-trash'
(when (memq window-system '(mac ns))
(defun system-move-file-to-trash (path)
       (shell-command (concat "trash -vF \"" path "\""
                           "| sed -e 's/^/Trashed: /'")
                   nil ;; Name of output buffer
                   "*Trash Error Buffer*")))

;; Use the following snippet after you’ve set the alpha as above to assign a toggle to “C-c t”:
(defun toggle-transparency ()
  "Crave for transparency!"
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(80 . 50) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

(setq projectile-project-search-path '("~/dev/"))
(setq doom-font (font-spec :family "MesloLGS NF" :size 16 :weight 'light)
      doom-variable-pitch-font (font-spec :family "MesloLGS NF" :size 16))
(setq doom-theme 'doom-dracula)
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/gtd/")
(setq org-agenda-files '("~/gtd/inbox.org"
                         "~/gtd/gtd.org"
                         "~/gtd/journal.org"
                         "~/gtd/tickler.org"))

(setq display-line-numbers-type t)



;; Dashboard Config That didnt work out!!

(use-package dashboard
  :init
 ;; (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
 :config
(progn
  (setq dashboard-banner-logo-title "Pain heals. Glory... lasts forver.")
  (setq dashboard-items '((recents  . 5)
                                (bookmarks . 5)
                                (projects . 5)
                                (agenda . 5)
                                (registers . 5)))
(setq dashboard-startup-banner "/Users/kermitfrog19/Desktop/my_desktop/head3.png")
  (setq dashboard-center-content t )
        (setq dashboard-set-file-icons t)
        (setq dashboard-set-heading-icons t)
        (setq dashboard-set-navigator t)
        ;; Format: "(icon title help action face prefix suffix)"
(setq dashboard-navigator-buttons
      `(;; line1
        ((,(all-the-icons-octicon "mark-github" :height 0.9 :v-adjust 0.0)
         "Github"
         "Browse homepage"
         (lambda (&rest _) (browse-url "https://github.com/pymeister")))
         (,(all-the-icons-faicon "google" :height 0.9 :v-adjust 0.0)
          "Search Console"
          "Overview"
         (lambda (&rest _) (browse-url "https://search.google.com/search-console?utm_source=about-page&resource_id=sc-domain:meisteraffiliateshop.com")))
        (,(all-the-icons-faicon "cogs" :height 0.9 :v-adjust 0.0)
          "Google Colab"
          "Colab"
         (lambda (&rest _) (browse-url "https://colab.research.google.com")))
        (,(all-the-icons-faicon "server" :height 0.8 :v-adjust 0.0)
          "Heroku"
          ""
          (lambda (&rest _) (browse-url "https://id.heroku.com/login"))))

    ;; line 2


         ((,(all-the-icons-faicon "music" :height 0.9 :v-adjust 0.0)
          "Emms"
          ""
          (lambda (&rest _) (emms-browser)))
         (,(all-the-icons-faicon "history" :height 0.9 :v-adjust 0.0)
          "Reload"
          ""
          (lambda (&rest _) (doom/reload)))
         (,(all-the-icons-faicon "sign-out" :height 0.9 :v-adjust 0.0)
          "Quit"
          ""
          (lambda (&rest _) (evil-quit))))



         ))
(setq dashboard-footer-messages '("Your Are The Technology!"))
(setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                   :height 1.1
                                                   :v-adjust -0.05
                                                   :face 'font-lock-keyword-face))
))


(defun my-weebery-is-always-greater ()
  (let* ((banner '(
    " ███████████             ██████   ██████           ███           █████"
    " ░░███░░░░░███           ░░██████ ██████           ░░░           ░░███"
    "  ░███    ░███ █████ ████ ░███░█████░███   ██████  ████   █████  ███████    ██████  ████████"
    "  ░██████████ ░░███ ░███  ░███░░███ ░███  ███░░███░░███  ███░░  ░░░███░    ███░░███░░███░░███"
    "  ░███░░░░░░   ░███ ░███  ░███ ░░░  ░███ ░███████  ░███ ░░█████   ░███    ░███████  ░███ ░░░"
    "  ░███         ░███ ░███  ░███      ░███ ░███░░░   ░███  ░░░░███  ░███ ███░███░░░   ░███"
    "  █████        ░░███████  █████     █████░░██████  █████ ██████   ░░█████ ░░██████  █████"
    " ░░░░░          ░░░░░███ ░░░░░     ░░░░░  ░░░░░░  ░░░░░ ░░░░░░     ░░░░░   ░░░░░░  ░░░░░"
    "               ███ ░███"
    "              ░░██████"
    "              ░░░░░░"

    "                              ⢸⣿⣿⣿⣿⠃⠄⢀⣴⡾⠃⠄⠄⠄⠄⠄⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀⠄"
    "                              ⢸⣿⣿⣿⡟⢀⣴⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⣷"
    "                              ⢸⣿⣿⠟⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄⠄⠄⠄⠄⠄⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿"
    "                              ⢸⣿⢫⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀⠄⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿"
    "                              ⡿⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿"
    "                              ⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿"
    "                              ⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟"
    "                              ⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣"
    "                              ⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾"
    "                              ⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿"
    "                              ⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿"
    "                              ⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿"
    "                              ⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿"
    "                              ⠄⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋⠄⠄⣾⡌⢠⣿⡿⠃"
    "                              ⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉⠄⠄          "

    ))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)

(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "You are the Technology")))
(after! org
        (setq org-capture-templates
              '(("t" "Todo [inbox]" entry
                (file+headline "~/gtd/inbox.org" "Tasks")
                "* TODO %? \n %U \n %a \n" :clock-in t :clock-resume t)
                ("w" "org-protocol" entry (file "~/gtd/inbox.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
                ("r" "respond" entry
                (file+headline "~/gtd/inbox.org" "Respond")
                "* NEXT Respond to %:from on %: subject \n SCHEDULED: %t \n %U \n %a \n" :clock-in t :clock-resume t :immediate-finish t)
                ("j" "Journal" entry
                (file+olp+datetree "~/gtd/journal.org")
                "* %? \n %U \n" :clock-in t :clock-resume t)
                ("n" "note" entry
                (file+headline "~/gtd/inbox.org" "Note")
                "* %? :NOTE: \n %U \n %a \n" :clock-in t :clock-resume t)
                ("m" "Meeting" entry
                (file+headline "~/gtd/inbox.org" "Meeting")
                "* MEETING with %? :MEETING: \n %U" :clock-in t :clock-resume t)
                ("p" "Phone call" entry (file "~/gtd/inbox.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
                ("h" "Habit" entry (file "~/gtd/inbox.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
                ("T" "Tickler" entry
                (file+headline "~/gtd/tickler.org" "Tickler")
                "* %i%? \n %U")
                ("i" "ledger Income US" plain (file "~/gtd/.accounts/USAA_checking_2020.dat")
                "%(format-time-string \"%Y/%m/%d\") * %^{transaction}\n Assets:%^{From Account|Checking|Card|Cash}  -%^{dollar amount}\n Income:%^{category}  %\\3\n" :empty-lines-before 1)
                ("e" "ledger Expenses US" plain (file "~/gtd/.accounts/USAA_checking_2020.dat")
                "%(format-time-string \"%Y/%m/%d\") * %^{transaction}\n Expenses:%^{From Auto|Home|Personal|Lucy|Food}  -%^{dollar amount}\n Assets:%^{category}  %\\3\n" :empty-lines-before 1)
                ("I" "Ledger Income DE" plain (file "~/gtd/.accounts/Sprarkasse_checking_2020.dat")
                "%(format-time-string \"%Y/%m/%d\") * %^{transaction}\n Assets:%^{From Account|Checking|Card|Cash}  -%^{euro amount}\n Income:%^{category}  %\\3\n" :empty-lines-before 1)
                ("E" "Ledger Expesnses DE" plain (file "~/gtd/.accounts/Sprarkasse_checking_2020.dat")
                "%(format-time-string \"%Y/%m/%d\") * %^{transaction}\n Expesnses:%^{From Auto|Home|Personal|Lucy|Food}  -%^{euro amount}\n Assets:%^{category}  %\\3\n" :empty-lines-before 1)))




;; Remove empty LOGBOOK drawers on clock out
;; (defun bh/remove-empty-drawer-on-clock-out ()
;;   (interactive)
;;   (save-excursion
;;     (beginning-of-line 0)
;;     (org-remove-empty-drawer-at "LOGBOOK" (point))))

;; (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)



(setq org-refile-targets '(("~/gtd/gtd.org" :maxlevel . 3)
                           ("~/gtd/someday.org" :level . 1)
                           ("~/gtd/tickler.org" :maxlevel . 2)))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Stuck Projects")
                            (org-agenda-skip-function 'bh/skip-non-stuck-projects)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'bh/skip-non-projects)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header (concat "Project Next Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Project Subtasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-project-tasks)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Standalone Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-project-tasks)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING|HOLD/!"
                           ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-tasks)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
                (tags "-REFILE/"
                      ((org-agenda-overriding-header "Tasks to Archive")
                       (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                       (org-tags-match-list-sublevels nil))))
               nil)))))


;; (require 'mu4e)
;; (require 'smtpmail)

;; (setq mu4e-context-policy 'pick-first) ;; start with the first (default) context;

;; (setq mu4e-compose-context-policy 'ask) ;; ask for context if no context matches;
;; (setq mu4e-contexts
;;       (list

        ;; (make-mu4e-context

        ;;   :name "icloud"

        ;;   :enter-func

        ;;   (lambda () (mu4e-message "Enter thereal_lance@icloud.com context"))

        ;;   :leave-func

        ;;   (lambda () (mu4e-message "Leave thereal_lance@icloud.com context"))

        ;;   :match-func

        ;;   (lambda (msg)

        ;;     (when msg

        ;;       (mu4e-message-contact-field-matches msg

        ;;                                           :to "thereal_lance@icloud.com")))

        ;;   :vars '((user-mail-address . "thereal_lance@icloud.com" )

        ;;           (user-full-name . "Kelechi Meister")

        ;;           (mu4e-drafts-folder . "/icloud/Drafts")

        ;;           (mu4e-refile-folder . "/icloud/Archive")

        ;;           (mu4e-sent-folder . "/icloud/Sent Messages")

        ;;           (mu4e-trash-folder . "/icloud/Deleted Messages")))



        ;; (make-mu4e-context

        ;;   :name "gmail"

        ;;   :enter-func

        ;;   (lambda () (mu4e-message "Enter k.lancemeister@gmail.com context"))

        ;;   :leave-func

        ;;   (lambda () (mu4e-message "Leave k.lancemeister@gmail.com context"))

        ;;   :match-func

        ;;   (lambda (msg)

        ;;     (when msg

        ;;       (mu4e-message-contact-field-matches msg

        ;;                                           :to "k.lancemeister@gmail.com")))

        ;;   :vars '((user-mail-address . "k.lancemeister@gmail.com")

        ;;           (user-full-name . "Kelechi Meister")

        ;;           (mu4e-drafts-folder . "/k.lancemeister/drafts")

        ;;           (mu4e-refile-folder . "/k.lancemeister/archive")

        ;;           (mu4e-sent-folder . "/k.lancemeister/sent")

        ;;           (mu4e-trash-folder . "/k.lancemeister/trash")))



        ;; ,(make-mu4e-context

        ;;   :name "dev.pymeister"

        ;;   :enter-func

        ;;   (lambda () (mu4e-message "Enter dev.pymeister@gmail.com context"))

        ;;   :leave-func

        ;;   (lambda () (mu4e-message "Leave dev.pymeister@gmail.com context"))

        ;;   :match-func

        ;;   (lambda (msg)

        ;;     (when msg

        ;;       (mu4e-message-contact-field-matches msg

        ;;                                           :to "dev.pymeister@gmail.com")))

        ;;   :vars '((user-mail-address . "dev.pymeister@gmail.com")

        ;;           (user-full-name . "Dummy McDummerson")

        ;;           ;; check your ~/.maildir to see how the subdirectories are called

        ;;           ;; e.g `ls ~/.maildir/example'

        ;;           (mu4e-drafts-folder . "/example/Drafts")

        ;;           (mu4e-refile-folder . "/example/Archive")

        ;;           (mu4e-sent-folder . "/example/Sent")

        ;;           (mu4e-trash-folder . "/example/Trash")))
        ;; ))





;; gpg encryptiom & decryption:

;; this can be left alone

;; (require 'epa-file)


;; (setq epg-pinentry-mode 'loopback)

;; (auth-source-forget-all-cached)



;; ;; don't keep message compose buffers around after sending:

;; (setq message-kill-buffer-on-exit t)



;; ;; send function:

;; (setq send-mail-function 'sendmail-send-it

;;       message-send-mail-function 'sendmail-send-it)



;; ;; send program:

;; ;; this is exeranal. remember we installed it before.

;; (setq sendmail-program (executable-find "msmtp"))



;; ;; select the right sender email from the context.

;; (setq message-sendmail-envelope-from 'header)



;; ;; chose from account before sending

;; ;; this is a custom function that works for me.

;; ;; well I stole it somewhere long ago.

;; ;; I suggest using it to make matters easy

;; ;; of course adjust the email adresses and account descriptions

;; (defun timu/set-msmtp-account ()

;;   (if (message-mail-p)

;;       (save-excursion

;;         (let*

;;             ((from (save-restriction

;;                      (message-narrow-to-headers)

;;                      (message-fetch-field "from")))

;;              (account

;;               (cond

;;                ;; ((string-match "thereal_lance@icloud.com" from) "icloud")

;;                ((string-match "k.lancemeister@gmail.com" from) "gmail")

;;                ;; ((string-match "k.lancemeister@gmail.com" from) "gmail")

;;                )))

;;           (setq message-sendmail-extra-arguments (list '"-a" account))))))



;; (add-hook 'message-send-mail-hook 'timu/set-msmtp-account)
;; (use-package! org-gcal)


;; ;; mu4e cc & bcc

;; ;; this is custom as well

;; (add-hook 'mu4e-compose-mode-hook

;;           (defun timu/add-cc-and-bcc ()

;;             "My Function to automatically add Cc & Bcc: headers.

;;     This is in the mu4e compose mode."

;;             (save-excursion (message-add-header "Cc:\n"))

;;             (save-excursion (message-add-header "Bcc:\n"))))



;; ;; mu4e address completion

;; (add-hook 'mu4e-compose-mode-hook 'company-mode)

;; ;; store link to message if in header view, not to header query:

;; (setq org-mu4e-link-query-in-headers-mode nil)

;; ;; don't have to confirm when quitting:

;; (setq mu4e-confirm-quit nil)

;; ;; number of visible headers in horizontal split view:

;; (setq mu4e-headers-visible-lines 20)

;; ;; don't show threading by default:

;; (setq mu4e-search-threads nil)

;; ;; hide annoying "mu4e Retrieving mail..." msg in mini buffer:

;; (setq mu4e-hide-index-messages t)

;; ;; customize the reply-quote-string:

;; (setq message-citation-line-format "%N @ %Y-%m-%d %H:%M :\n")

;; ;; M-x find-function RET message-citation-line-format for docs:

;; (setq message-citation-line-function 'message-insert-formatted-citation-line)

;; ;; by default do not show related emails:

;; (setq mu4e-headers-include-related nil)

;; ;; by default do not show threads:

;; (setq mu4e-search-threads nil)



;; ;; check your ~/.maildir to see how the subdirectories are called

;; ;; for the generic imap account:

;; ;; e.g `ls ~/.maildir/example'

;;   ;; This is set to 't' to avoid mail syncing issues when using mbsync
;; (setq mu4e-change-filenames-when-moving t)

;; ;; Refresh mail using isync every 10 minutes
;; (setq mu4e-update-interval (* 10 60))
;; (setq mu4e-get-mail-command "mbsync -a")
;; (setq mu4e-root-maildir "User/kermitfrog19/Mail")


;; (setq mu4e-maildir-shortcuts
;;     '((:maildir "/k.lancemeister/Inbox"    :key ?i)
;;       (:maildir "/k.lancemeister/[Gmail]/Sent Mail" :key ?s)
;;       (:maildir "/k.lancemeister/[Gmail]/Trash"     :key ?t)
;;       (:maildir "/k.lancemeister/[Gmail]/Drafts"    :key ?d)
;;       (:maildir "/k.lancemeister/[Gmail]/All Mail"  :key ?a)))

;; (require 'golden-ratio)
;; (use-package! django-mode)
;; (map! :leader
;;       (:prefix ("l" . "applications")
;;        :desc "Pass"
;;         "p" #'pass))

;; (map! :leader
;;       (:prefix ("l" . "applications")
;;        :desc "Golden Ratio"
;;         "g" #'golden-ratio-mode))

;; (map! :leader
;;       (:prefix ("l" . "applications")
;;        :desc "Django Mode"
;;         "d" #'django-mode))


;; (setq mu4e-bookmarks
;;   '((:name "Unread messages" :query "flag:unread AND NOT flag:trashed" :key ?i)
;;     (:name "Today's messages" :query "date:today..now" :key ?t)
;;     (:name "Clients" :query "from:stallman" :key ?s)
;;     (:name "Last 7 days" :query "date:7d..now" :hide-unread t :key ?w)
;;     (:name "Messages with images" :query "mime:image/*" :key ?p)))


(setq exec-path (append exec-path '("/opt/homebrew/bin")))
(add-to-list 'load-path "~/.emacs.d/site-lisp/emms/lisp")
(use-package emms-setup
  :init
  (add-hook 'emms-player-started-hook 'emms-show)
  (setq emms-show-format "Playing: %s")
  :config
  (emms-all)
  (emms-default-players)
(setq emms-source-file-default-directory "/Volumes/meister_m1_ext/mixtapes/"
      emms-playlist-buffer-name "*Music*"
      emms-info-asynchronously t
      emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
(map! :leader
      (:prefix ("t" . "EMMS audio player")
       :desc "Open emms" "e" #'emms-browser
       :desc "Go to emms playlist" "a" #'emms-playlist-mode-go
       :desc "Emms pause track" "x" #'emms-pause
       :desc "Emms stop track" "s" #'emms-stop
       :desc "Emms play previous track" "p" #'emms-previous
       :desc "Emms play next track" "n" #'emms-next))

  )
(require 'emms-setup)
(require 'emms-source-file)
(require 'emms-source-playlist)
(setq emms-player-list '(emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mplayer))
(define-emms-simple-player mplayer '(file url)
      (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
                    ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
                    ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
      "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")


(use-package! python-black
  :demand t
  :after python
  :config
  (add-hook! 'python-mode-hook #'python-black-on-save-mode)
  (map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)
  (map! :leader :desc "Blacken Region" "m b r" #'python-black-region)
  (map! :leader :desc "Blacken Statement" "m b s" #'python-black-statement))
(setq lsp-pylsp-plugins-flake8-max-line-length 88)


(setq auto-save-default t
      make-backup-files t)

(setq confirm-kill-emacs nil)
(use-package! iedit
  :defer
  :config
  (set-face-background 'iedit-occurrence "Magenta")
  :bind
  ("C-;" . iedit-mode))

(setq eww-browse-with-external-browser t)



(with-eval-after-load 'eww

(setq-local endless/display-images t)

(defun endless/toggle-image-display ()
  "Toggle images display on current buffer."
  (interactive)
  (setq endless/display-images
        (null endless/display-images))
  (endless/backup-display-property endless/display-images))

(defun endless/backup-display-property (invert &optional object)
  "Move the 'display property at POS to 'display-backup.
Only applies if display property is an image.
If INVERT is non-nil, move from 'display-backup to 'display
instead.
Optional OBJECT specifies the string or buffer. Nil means current
buffer."
  (let* ((inhibit-read-only t)
         (from (if invert 'display-backup 'display))
         (to (if invert 'display 'display-backup))
         (pos (point-min))
         left prop)
    (while (and pos (/= pos (point-max)))
      (if (get-text-property pos from object)
          (setq left pos)
        (setq left (next-single-property-change pos from object)))
      (if (or (null left) (= left (point-max)))
          (setq pos nil)
        (setq prop (get-text-property left from object))
        (setq pos (or (next-single-property-change left from object)
                      (point-max)))
        (when (eq (car prop) 'image)
          (add-text-properties left pos (list from nil to prop) object))))))


(defun my/eww-toggle-images ()
  "Toggle whether images are loaded and reload the current page fro cache."
  (interactive)
  (setq-local shr-inhibit-images (not shr-inhibit-images))
  (eww-reload t)
  (message "Images are now %s"
           (if shr-inhibit-images "off" "on")))

(define-key eww-mode-map (kbd "I") #'my/eww-toggle-images)
(define-key eww-link-keymap (kbd "I") #'my/eww-toggle-images)

;; minimal rendering by default
(setq-default shr-inhibit-images t)   ; toggle with `I`
(setq-default shr-use-fonts nil)      ; toggle with `F`

);end with eveal after load eww
(defun dt/org-colors-dracula ()
  "Enable Dracula colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#8be9fd" ultra-bold)
         (org-level-2 1.6 "#bd93f9" extra-bold)
         (org-level-3 1.5 "#50fa7b" bold)
         (org-level-4 1.4 "#ff79c6" semi-bold)
         (org-level-5 1.3 "#9aedfe" normal)
         (org-level-6 1.2 "#caa9fa" normal)
         (org-level-7 1.1 "#5af78e" normal)
         (org-level-8 1.0 "#ff92d0" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
(setq minimap-window-location 'right)
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle minimap-mode" "m" #'minimap-mode))
(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file" "d v" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "O") 'dired-do-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "+") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines
  (kbd "% l") 'dired-downcase
  (kbd "% m") 'dired-mark-files-regexp
  (kbd "% u") 'dired-upcase
  (kbd "* %") 'dired-mark-files-regexp
  (kbd "* .") 'dired-mark-extension
  (kbd "* /") 'dired-mark-directories
  (kbd "; d") 'epa-dired-do-decrypt
  (kbd "; e") 'epa-dired-do-encrypt)
;; Get file icons in dired
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files/")
(use-package! calfw)
(use-package! calfw-org)

(setq centaur-tabs-set-bar 'over
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-modified-marker "•")
(map! :leader
      :desc "Toggle tabs globally" "t c" #'centaur-tabs-mode
      :desc "Toggle tabs local display" "t C" #'centaur-tabs-local-mode)
(evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward        ; default Doom binding is 'g t'
                                               (kbd "g <left>")  'centaur-tabs-backward       ; default Doom binding is 'g T'
                                               (kbd "g <down>")  'centaur-tabs-forward-group
                                               (kbd "g <up>")    'centaur-tabs-backward-group)

(map! :leader
      (:prefix ("c h" . "Help info from Clippy")
       :desc "Clippy describes function under point" "f" #'clippy-describe-function
       :desc "Clippy describes variable under point" "v" #'clippy-describe-variable))
(defun calendar-generate (month year)
  "Generate a three-month Gregorian calendar centered around MONTH, YEAR."
  ;; A negative YEAR is interpreted as BC; -1 being 1 BC, and so on.
  ;; Note that while calendars for years BC could be displayed as it
  ;; stands, almost all other calendar functions (eg holidays) would
  ;; at best have unpredictable results for such dates.
  (if (< (+ month (* 12 (1- year))) 2)
      (error "Months before January, 1 AD cannot be displayed"))
  (setq displayed-month month
        displayed-year year)
  (erase-buffer)
  (calendar-increment-month month year -1)
  (dotimes (i 5)
    (calendar-generate-month month year
                             (+ calendar-left-margin
                                (* calendar-month-width i)))
    (calendar-increment-month month year 1)))
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Open EWW" "w" #'eww
       :desc "Dashboard" "d" #'dashboard-refresh-buffer
       ))
(defvar +modeline--old-bar-height nil)
;;;###autoload
(defun +modeline-resize-for-font-h ()
  "Adjust the modeline's height when the font size is changed by
`doom/increase-font-size' or `doom/decrease-font-size'.
Meant for `doom-change-font-size-hook'."
  (unless +modeline--old-bar-height
    (setq +modeline--old-bar-height doom-modeline-height))
  (let ((default-height +modeline--old-bar-height)
        (scale (or (frame-parameter nil 'font-scale) 0)))
    (setq doom-modeline-height
          (if (> scale 0)
              (+ default-height (* scale doom-font-increment))
            default-height))))

;;;###autoload
(defun +modeline-update-env-in-all-windows-h (&rest _)
  "Update version strings in all buffers."
  (dolist (window (window-list))
    (with-selected-window window
      (when (fboundp 'doom-modeline-update-env)
        (doom-modeline-update-env))
      (force-mode-line-update))))

;;;###autoload
(defun +modeline-clear-env-in-all-windows-h (&rest _)
  "Blank out version strings in all buffers."
  (unless (modulep! +light)
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (setq doom-modeline-env--version
              (bound-and-true-p doom-modeline-load-string)))))
  (force-mode-line-update t))

(use-package! doom-modeline
  :hook (after-init . doom-modeline-mode)
  :hook (doom-modeline-mode . size-indication-mode) ; filesize in modeline
  :hook (doom-modeline-mode . column-number-mode)   ; cursor column in modeline
  :init
  (unless after-init-time
    ;; prevent flash of unstyled modeline at startup
    (setq-default mode-line-format nil))
  ;; We display project info in the modeline ourselves
  (setq projectile-dynamic-mode-line nil)
  ;; Set these early so they don't trigger variable watchers
  (setq doom-modeline-bar-width 3
        doom-modeline-github nil
        doom-modeline-mu4e nil
        doom-modeline-persp-name nil
        doom-modeline-minor-modes nil
        doom-modeline-major-mode-icon nil
        doom-modeline-buffer-file-name-style 'relative-from-project
        ;; Only show file encoding if it's non-UTF-8 and different line endings
        ;; than the current OSes preference
        doom-modeline-buffer-encoding 'nondefault
        doom-modeline-default-eol-type
        (cond (IS-MAC 2)
              (IS-WINDOWS 1)
              (0)))

  ;; Fix modeline icons in daemon-spawned graphical frames. We have our own
  ;; mechanism for disabling all-the-icons, so we don't need doom-modeline to do
  ;; it for us. However, this may cause unwanted padding in the modeline in
  ;; daemon-spawned terminal frames. If it bothers you, you may prefer
  ;; `doom-modeline-icon' set to `nil'.
  (when (daemonp)
    (setq doom-modeline-icon t))
  :config
  ;; HACK Fix #4102 due to empty all-the-icons return value (caused by
  ;;      `doom--disable-all-the-icons-in-tty-a' advice) in tty daemon frames.
  (defadvice! +modeline-disable-icon-in-daemon-a (orig-fn &rest args)
    :around #'doom-modeline-propertize-icon
    (when (display-graphic-p)
      (apply orig-fn args)))

  ;; Fix an issue where these two variables aren't defined in TTY Emacs on MacOS
  (defvar mouse-wheel-down-event nil)
  (defvar mouse-wheel-up-event nil)

  (add-hook 'after-setting-font-hook #'+modeline-resize-for-font-h)
  (add-hook 'doom-load-theme-hook #'doom-modeline-refresh-bars)

  ;; (add-hook '+doom-dashboard-mode-hook #'doom-modeline-set-project-modeline)

  (add-hook! 'magit-mode-hook
    (defun +modeline-hide-in-non-status-buffer-h ()
      "Show minimal modeline in magit-status buffer, no modeline elsewhere."
      (if (eq major-mode 'magit-status-mode)
          (doom-modeline-set-vcs-modeline)
        (hide-mode-line-mode))))

  ;; Some functions modify the buffer, causing the modeline to show a false
  ;; modified state, so force them to behave.
  (defadvice! +modeline--inhibit-modification-hooks-a (orig-fn &rest args)
    :around #'ws-butler-after-save
    (with-silent-modifications (apply orig-fn args))))
;; Chess ICS
(defun playchess ()
  (interactive)
  (setq username (read-string "Username: "))
  (if (string= username "guest")
      (chess-ics "freechess.org" 5000 username)
    (setq pass (read-passwd "Password: "))
    (chess-ics "freechess.org" 5000 username pass)
    )
  )
(provide 'playchess)
