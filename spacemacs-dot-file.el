;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/Dropbox/emacs/spacemacs/private/jay/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(jay
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
      auto-completion
     ;; better-defaults
     ;; (git :variables
      org
      osx
      xkcd
      smex
      emacs-lisp
   ;;      markdown
git
github
      gnus
      ;;      version-control
 ;;     latex
 ;;     fasd
 ;;     html
         shell
      shell-scripts
   ;;      spotify
   ;;   chrome
      ;; syntax-checking
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'emacs

   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'doge
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(bookmarks recents projects )
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(leuven
                         spacemacs-dark
                         solarized-light 
                         solarized-dark
                         monokai
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) 
(package-initialize)

  (setq vc-follow-symlinks t)
  (setq global-flyspell-mode t)
  (menu-bar-mode 1)
  (setq org-confirm-babel-evaluate nil)

(setq default-frame-alist
      '(
        (width . 160) ; character
        (height . 42) ; lines
        ))

;; (turn-on-olivetti-mode)

(org-babel-load-file "~/Dropbox/emacs/prelude/personal/gnu-emacs-startup.org")
(org-babel-load-file "~/Dropbox/emacs/prelude/personal/shared-functions.org")
(org-babel-load-file "~/Dropbox/emacs/prelude/personal/appearance-jay-custom-functions.org")


(load "/Users/jay/Dropbox/emacs/prelude/modules/prelude-key-chord.el")
(load "/Users/jay/gnulisp/book-functions.el")

  )


;; use OSX standard keybindings for navigating word-by-word and selecting whole words at a time
;; I've been wanting to do this for so long. :-)
;; this works correctly!!
(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "<M-S-left>") nil)
     (define-key org-mode-map (kbd "<M-S-right>") nil)
     (define-key org-mode-map (kbd "<M-S-up>") nil)
     (define-key org-mode-map (kbd "<M-S-down>") nil)
     (define-key org-mode-map (kbd "<M-left>") nil)
     (define-key org-mode-map (kbd "<M-right>") nil)
     (define-key org-mode-map (kbd "<M-right>") nil)
     (define-key org-mode-map [C-S-right] 'org-shiftmetaright)
     (define-key org-mode-map [C-S-left] 'org-shiftmetaleft)
     (define-key org-mode-map [C-right] 'org-metaright)
     (define-key org-mode-map [C-left] 'org-metaleft)
     (define-key org-mode-map [C-up] 'org-metaup)
     (define-key org-mode-map [C-down] 'org-metadown)
     (define-key org-mode-map [C-S-return] 'org-insert-todo-heading)
     ))

(add-hook 'ido-setup-hook (lambda () (define-key ido-completion-map (kbd "<left>") 'ido-prev-match)
                            (define-key ido-completion-map (kbd "<right>") 'ido-next-match)
                            )) 

;; Maybe you need to do (add-hook ... t) to ensure that your function is inserted into the hook after spacemacs//ido-setup (otherwise it will undo your work when it is run). 

(setq helm-echo-input-in-header-line nil) 

(add-hook 'helm-after-initialize-hook
          #'(lambda () (setq helm-echo-input-in-header-line nil))) 

(recenter-top-bottom)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(abbrev-all-caps nil)
 '(ac-auto-show-menu 2.0)
 '(ac-auto-start 4)
 '(ac-candidate-menu-min 3)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(blink-cursor-mode nil)
 '(buffer-stack-show-position nil)
 '(buffer-stack-untracked
   (quote
    ("KILL" "*Compile-Log*" "*Compile-Log-Show*" "*Group*" "*Completions*" "*Messages*" "*Help*" "*Archive*" "*Agenda*" "*fontification*" "*Warnings*" "*prolific*" "*750words*" "Calendar")))
 '(calendar-latitude 40.7)
 '(case-fold-search t)
 '(ccm-recenter-at-end-of-file t)
 '(clean-buffer-list-delay-general 1)
 '(column-number-mode nil)
 '(completion-ignored-extensions
   (quote
    (".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".fasl" ".ufsl" ".fsl" ".dxl" ".pfsl" ".dfsl" ".p64fsl" ".d64fsl" ".dx64fsl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".tex" ".mm" "Icon" ".html" ".zip")))
 '(compose-mail-user-agent-warnings nil)
 '(cua-highlight-region-shift-only t)
 '(cua-mode nil nil (cua-base))
 '(cursor-type (quote box))
 '(debug-on-error t)
 '(deft-directory "~/Dropbox/writing/notationaldata/")
 '(delete-window-preserve-buffer
   (quote
    ("*scratch*" "current-book-research.txt" "accountability.txt")))
 '(dired-clean-up-buffers-too nil)
 '(dired-details-hidden-string "")
 '(dired-kept-versions 8)
 '(display-time-mode t)
 '(edit-server-default-major-mode (quote org-mode))
 '(edit-server-new-frame t)
 '(eshell-load-hook (quote ((lambda nil (abbrev-mode -1)))))
 '(flyspell-abbrev-p t)
 '(flyspell-use-global-abbrev-table-p t)
 '(global-flyspell-mode t t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "devonthink")))
 '(grep-find-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.pfsl" "*.dfsl" "*.p64fsl" "*.d64fsl" "*.dx64fsl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "*.pdf" "*.tex" "*.html" "*.mm" "*.js" "*.doc" "*.docx" "*.xls" "*.jpg" "*.png" "*.xlsx" "*devonthink*" "*.gif" "Icon*" "*fontification*" "*helm*" "*750words*")))
 '(grep-highlight-matches (quote always))
 '(ido-ignore-files
   (quote
    ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "pdf" "tex" "html" ".mm" "Icon*")))
 '(ido-save-directory-list-file "~/Dropbox/emacs/prelude/personal/.savefile/ido.hist")
 '(ido-use-faces t)
 '(ido-use-url-at-point t)
 '(initial-buffer-choice "~/Dropbox/writing/notationaldata/playful.org")
 '(initial-major-mode (quote org-mode))
 '(mail-default-directory
   "~/Dropbox/writing/notationaldata/emacs-mail-message-mode-messages")
 '(mail-kill-buffer-on-exit t t)
 '(make-backup-files t)
 '(message-draft-headers (quote (From References Date)))
 '(message-kill-buffer-on-exit t)
 '(message-required-headers (quote (From (optional . References))))
 '(message-send-mail-function (quote message-send-mail-with-sendmail))
 '(mml-default-directory
   "~/Dropbox/writing/notationaldata/emacs-mail-message-mode-messages")
 '(openwith-associations
   (quote
    (("\\.pdf\\'" "open"
      (file))
     ("\\.mp3\\'" "xmms"
      (file))
     ("\\.\\(?:mpe?g\\|avi\\|wmv\\)\\'" "mplayer"
      ("-idx" file))
     ("\\.\\(?:jp?g\\|png\\)\\'" "display"
      (file)))))
 '(org-M-RET-may-split-line (quote ((item . t))))
 '(org-activate-links (quote (bracket plain radio tag date footnote)))
 '(org-agenda-jump-prefer-future t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-timegrid-use-ampm t)
 '(org-archive-location "archive/%s_archive::")
 '(org-ascii-headline-spacing (quote (1 . 1)))
 '(org-ascii-table-use-ascii-art t)
 '(org-bullets-bullet-list (quote (" ")))
 '(org-bullets-face-name (quote \"Courier\"))
 '(org-catch-invisible-edits (quote error))
 '(org-clock-auto-clock-resolution t)
 '(org-clock-idle-time 5)
 '(org-clock-in-resume t)
 '(org-clock-persist-query-resume nil)
 '(org-clock-report-include-clocking-task t)
 '(org-clocktable-defaults
   (quote
    (:maxlevel 3 :lang "en" :scope file :block nil :wstart 1 :mstart 1 :tstart nil :tend nil :step nil :stepskip0 nil :fileskip0 nil :tags nil :emphasize nil :link nil :narrow 40! :indent t :formula nil :timestamp nil :level nil :tcolumns nil :formatter nil)))
 '(org-closed-string "COMPLETED:")
 '(org-ctrl-k-protect-subtree t)
 '(org-custom-properties (quote (">")))
 '(org-default-notes-file "~/Dropbox/writing/notationaldata/notes.txt")
 '(org-display-custom-times nil)
 '(org-drawers (quote ("PROPERTIES" "CLOCK" "LOGBOOK" "RESULTS" "SOURCE")))
 '(org-edit-src-content-indentation 4)
 '(org-ellipsis (quote org-warning))
 '(org-enable-fixed-width-editor nil)
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-allow-bind-keywords t)
 '(org-export-blocks-witheld (quote (hidden)))
 '(org-export-date-timestamp-format "%Y%m%d %I:%M%p")
 '(org-export-html-inline-image-extensions (quote ("png" "jpeg" "jpg" "gif" "svg" "tif" "gif")))
 '(org-export-html-style-include-default t)
 '(org-export-latex-date-format "%d %B %Y.")
 '(org-export-latex-emphasis-alist
   (quote
    (("*" "\\emph{%s}" nil)
     ("/" "\\textit{%s}" nil)
     ("_" "\\underline{%s}" nil)
     ("+" "\\st{%s}" nil)
     ("=" "\\verb" t)
     ("~" "\\verb" t))))
 '(org-export-latex-image-default-option "width=20.5cm")
 '(org-export-latex-verbatim-wrap (quote ("\\begin{quote}" . "\\end{quote}")))
 '(org-export-preserve-breaks t)
 '(org-export-time-stamp-file nil)
 '(org-export-with-clocks t)
 '(org-export-with-drawers t)
 '(org-export-with-section-numbers nil)
 '(org-export-with-toc nil)
 '(org-extend-today-until 8)
 '(org-fontify-done-headline t)
 '(org-fontify-emphasized-text t)
 '(org-footnote-define-inline t)
 '(org-footnote-section "Footnotes")
 '(org-footnote-tag-for-non-org-mode-files "Footnotes:")
 '(org-headline-done ((t (:strike-through t))))
 '(org-hidden-keywords (quote (author title)) nil nil "#+BEGIN_QUOTE")
 '(org-hide-block-startup nil)
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-html-container-element "div")
 '(org-html-footnotes-section
   "<div id=\"footnotes\">
<h2 class=\"footnotes\">%s </h2>
<div id=\"footnote\">
%s
</div>
</div>")
 '(org-html-head-include-default-style nil)
 '(org-html-head-include-scripts nil)
 '(org-html-html5-fancy t)
 '(org-html-postamble nil)
 '(org-html-text-markup-alist
   (quote
    ((bold . "<strong>%s</strong>")
     (code . "<blockquote>%s</blockquote>")
     (italic . "<em>%s</em>")
     (strike-through . "<del>%s</del>")
     (underline . "<span class=\"underline\">%s</span>")
     (verbatim . "<code>%s</code>"))))
 '(org-html-toplevel-hlevel 2)
 '(org-indent-indentation-per-level 2)
 '(org-indent-mode-turns-off-org-adapt-indentation nil)
 '(org-indent-mode-turns-on-hiding-stars nil)
 '(org-insert-mode-line-in-empty-file t)
 '(org-latex-text-markup-alist
   (quote
    ((bold . "\\textbf{%s}")
     (code . verb)
     (italic . "\\textit{%s}")
     (strike-through . "\\sout{%s}")
     (underline . "\\uline{%s}"))))
 '(org-latex-toc-command "\\tableofcontents
\\newpage
")
 '(org-list-allow-alphabetical t)
 '(org-list-indent-offset 3)
 '(org-log-done nil)
 '(org-log-note-clock-out nil)
 '(org-log-refile nil)
 '(org-mac-Skim-highlight-selection-p t)
 '(org-mac-grab-Firefox+Vimperator-p nil)
 '(org-mac-grab-Firefox-app-p nil)
 '(org-mac-grab-Mail-app-p nil)
 '(org-mac-grab-Safari-app-p nil)
 '(org-mac-grab-Together-app-p nil)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-gnus org-info org-annotate-file org-bullets org-invoice org-mac-iCal org-mac-link org-panel org-secretary org-velocity org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-choose org-collector org-invoice)))
 '(org-n-level-faces 9)
 '(org-odd-levels-only nil)
 '(org-pomodoro-format "Pomodoro: %s")
 '(org-pomodoro-killed-sound "~/sounds/autodestructsequencearmed_ep.mp3")
 '(org-pomodoro-length 50)
 '(org-pomodoro-long-break-format "Long Break: %s")
 '(org-pomodoro-long-break-sound "~/sounds/tng-computer-programcomplete.mp3")
 '(org-pomodoro-play-ticking-sounds nil)
 '(org-pomodoro-short-break-format "Short Break: %s")
 '(org-pomodoro-short-break-sound "~/sounds/tng-picard-engage.mp3")
 '(org-pomodoro-sound "~/sounds/large-applause.mp3")
 '(org-pomodoro-ticking-sound
   "~/Music/iTunes/iTunes Media/Music/Unknown Artist/Unknown Album/com.taptanium.thunderstorm.DreamQuest_preview.m4a")
 '(org-priority-faces nil)
 '(org-provide-checkbox-statistics t)
 '(org-replace-disputed-keys nil)
 '(org-return-follows-link t)
 '(org-special-ctrl-a/e t)
 '(org-src-preserve-indentation t)
 '(org-startup-align-all-tables t)
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(org-support-shift-select (quote always))
 '(org-time-clocksum-use-effort-durations t)
 '(org-time-stamp-custom-formats (quote ("<%a %b %d>" . "<%m/%d %a %I:%M%p>")))
 '(org-use-speed-commands t)
 '(org-yank-adjusted-subtrees t)
 '(org2blog/wp-confirm-post nil)
 '(org2blog/wp-default-categories (quote ("inspiration" "personal growth" "miscellany")))
 '(org2blog/wp-keep-new-lines t)
 '(org2blog/wp-show-post-in-browser t)
 '(org2blog/wp-use-tags-as-categories t)
 '(osx-browse-prefer-background nil)
 '(osx-browse-prefer-browser "com.google.Chrome")
 '(osx-browse-prefer-new-window t)
 '(pomodoro-break-time 10)
 '(pomodoro-work-time 50)
 '(reb-re-syntax (quote string))
 '(recentf-exclude
   (quote
    (".html" ".tex" "*message*" "org-clock-save.el" "\\recent-addresses\\'" "\\ido.last\\'" "\\ido.hist\\'" "elpa" ".bmk" ".jabber" "helm")))
 '(recentf-max-menu-items 100)
 '(recentf-max-saved-items 999)
 '(recentf-save-file "~/Dropbox/emacs/.savefile/recentf")
 '(ring-bell-function (quote ignore) t)
 '(safe-local-variable-values
   (quote
    ((org-hide-emphasis-markers)
     (eval when
           (fboundp
            (quote rainbow-mode))
           (rainbow-mode 1)))))
 '(send-mail-function (quote sendmail-send-it))
 '(smex-prompt-string "I love you. ")
 '(standard-indent 3)
 '(tooltip-mode nil)
 '(tramp-default-method "ssh")
 '(undo-limit 800000)
 '(user-full-name "Jay Dixit")
 '(user-mail-address "dixit@aya.yale.edu")
 '(visual-line-mode nil t)
 '(web-mode-load-hook (quote ((lambda nil (abbrev-mode -1))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(org-headline-done ((t (:strike-through t))))
 '(org-link ((t (:inherit link :underline nil)))))
