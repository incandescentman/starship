;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
;;   dotspacemacs-configuration-layer-path '("/Users/jay/starship/jay/")
dotspacemacs-configuration-layer-path '("~/emacs/spacemacs/private/jay/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(

     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     auto-completion
     ;; better-defaults
       org
     osx
     xkcd
     smex
     emacs-lisp
;;     spacemacs-ivy
     ;;      markdown
;;     git
;;     github
;;     gnus
     ;;      version-control
     ;;     latex
;; fasd
;;     search-engine
     html
     mu4e
     shell
     shell-scripts
;;     spotify

     ;; syntax-checking
     jay
     speed-reading
     typography
     ;;    javascript

;;     floobits
 ;;    deft
     chrome
     themes-megapack
     ibuffer
     syntax-checking
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    ;; vi-tilde-fringe
                                    company
ws-butler
adaptive-wrap
                                    )
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
;;   dotspacemacs-startup-banner 'doge
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(bookmarks recents projects )
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;; spacemacs-dark
                         ;; zenburn
                          leuven
                         ;; spacemacs-light
                         ;; spacemacs-dark
                         ;; solarized-light
                         ;; solarized-dark
                         ;; monokai
                         ;; leuven
                         zenburn
                         )
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
   ;;   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-emacs-leader-key "]"
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
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(require 'mu4e)

;;
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  (require 'package)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize)

  (setq vc-follow-symlinks t)
  (setq global-flyspell-mode t)
  (setq org-confirm-babel-evaluate nil)

  (setq default-frame-alist
        '(
          (width . 160) ; character
          (height . 42) ; lines
          ))

(setq yas-snippet-dirs '("/Users/jay/emacs/interesting-snippets/" "~/emacs/snippets"))


  ;; automatically display any prefix
  (setq guide-key/recursive-key-sequence-flag t)

  ;; enable python
(org-babel-do-load-languages
 'org-babel-load-languages
  '( (perl . t)
     (ruby . t)
     (sh . t)
     (python . t)
     (emacs-lisp . t)
   ))


  (org-babel-load-file "~/emacs/prelude/personal/gnu-emacs-startup.org")
  (org-babel-load-file "~/emacs/prelude/personal/shared-functions.org")
(org-babel-load-file "/Users/jay/emacs/prelude/personal/fonts-and-themes.org")
  (load "/Users/jay/emacs/prelude/core/prelude-core.el")
  (load "/Users/jay/emacs/prelude/personal/skeletons.el")
  (load "/Users/jay/emacs/prelude/modules/prelude-key-chord.el")
  (load "/Users/jay/gnulisp/book-functions.el")
  (load "/Users/jay/gnulisp/reveal-in-finder.el")
(load "/Users/jay/emacs/prelude/personal/jay-osx.el")
(load "/Users/jay/emacs/prelude/personal/poetry_JD.el")
(load "/Users/jay/emacs/prelude/personal/define-word.el")
(load "/Users/jay/emacs/prelude/personal/searchlink/searchlink.el")
;; (load "/Users/jay/emacs/prelude/personal/ivy-smex.el")



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
       (define-key org-mode-map (kbd "<C-return>") 'return-insert-blank-line-before)
       (define-key org-mode-map (kbd "<C-S-return>") 'smart-org-insert-todo-heading-dwim)
       (define-key key-minor-mode-map (kbd "<C-M-right>") 'org-shiftright)
       (define-key key-minor-mode-map (kbd "<C-M-left>") 'org-shiftleft)


       ;; (define-key org-mode-map (kbd "needs a binding") 'org-insert-heading-respect-content)
       ;; formerly bound to C-return
       (find-file "~/nd/disciplined.org")
;;       (imenu-list-minor-mode)
       ))

(autopair-global-mode -1)


  (define-key key-minor-mode-map (kbd "C-c d") 'prelude-duplicate-current-line-or-region)

  (setq helm-echo-input-in-header-line nil)

  (add-hook 'helm-after-initialize-hook
            #'(lambda () (setq helm-echo-input-in-header-line nil)))

  (setq org-agenda-files
        (quote
         ("~/Dropbox/writing/notationaldata/accountability.org" "~/emacs/prelude/personal/gnu-emacs-startup.org")))

  (setq org-bullets-bullet-list '("◉" "◉" "○" "○" "✸" "✸" "✿" "✿")) ; for oddlevelsonly mode
;;  (setq org-bullets-bullet-list '("◉" "○" "✸" "✿")) ; for SHOWSTARS:evenodd

  (load "/Users/jay/emacs/prelude/personal/gnugol.el")
  (require 'gnugol)
  (require 'reveal-in-finder)

  (recenter-top-bottom)
  (setq case-fold-search t)


(setq company-global-modes '(not org-mode))

  (toggle-fullscreen)
  (menu-bar-mode -1)
(org-mode)

(toggle-menu-bar-mode-from-frame)

(setq auto-revert-interval 1)
(setq org-hide-leading-stars nil)

(smartparens-global-mode 1)


 (add-hook 'ido-setup-hook (lambda ()
                              (define-key ido-completion-map (kbd "<left>") 'ido-prev-match)
                              (define-key ido-completion-map (kbd "<right>") 'ido-next-match)
) t)


(eval-after-load "org"
                                (menu-bar-mode -1)
)

(defadvice load-theme (before theme-dont-propagate activate)
 (mapcar #'disable-theme custom-enabled-themes))


;; if Emacs is running in terminal
(if (is-in-terminal)
(iterm-mode)
;; (load-theme 'zenburn)
(org-mode)
)

(iterm-mode)


(setq org-adapt-indentation nil)

(setq global-auto-revert-mode 1)

(leuven)

(setq org-emphasis-alist
   (quote
    (("*" bold)
     ("/" italic)
     ("_" underline)
     ("=" org-code verbatim)
     ("~" flyspell-incorrect)

     ("+"
      (:strike-through t)))))


;; don't show vi-tilde indicators on empty lines
(setq-default indicate-empty-lines nil) 
(setq indicate-empty-lines nil)

(custom-set-faces
 '(bold ((t (:inherit font-lock-warning-face :weight bold :foreground "red"))))

'(org-link ((t (:underline nil)))))



(when (version<= "25" emacs-version)
  (add-hook 'text-mode-hook #'tildify-mode)) 


(horizontal-cursor)

)

