(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")

(global-set-key [(control x) (?0)] 'delete-other-windows)
(global-set-key [(control x) (?9)] 'sticky-window-keep-window-visible)
(global-set-key  (kbd "s-0") 'delete-window)
(global-set-key  (kbd "s-1") 'delete-other-windows)
(global-set-key  (kbd "s-9") 'sticky-window-keep-window-visible)
(global-set-key  (kbd "s-2") 'split-window-vertically)
(global-set-key  (kbd "s-3") 'split-window-horizontally)

(setq-default abbrev-mode t)
(read-abbrev-file "~/Dropbox/elisp/.abbrev_defs") 
(set (make-local-variable 'abbrev-file-name) (expand-file-name "~/Dropbox/elisp/own-abbrevs.abbrev_defs")) 
(read-abbrev-file "~/Dropbox/elisp/own-abbrevs.abbrev_defs")
(setq save-abbrevs t)
(setq only-global-abbrevs t)

(global-visual-line-mode)

(defun pasteboard-copy()
  "Copy region to OS X system pasteboard."
  (interactive)
  (shell-command-on-region
   (region-beginning) (region-end) "pbcopy"))

;;; old version; remove after testing new one (see below)
;; (defun pasteboard-paste()
;;   "Paste from OS X system pasteboard via `pbpaste' to point."
;;   (interactive)
;; (my/fix-space)
;;   (shell-command-on-region
;;    (point) (if mark-active (mark) (point)) "pbpaste | perl -p -e 's/\r$//' | tr '\r' '\n'" nil t)
;; (my/fix-space)
;; ;; (when (looking-back "^[[:space:]]+") (just-one-space)) ; this didn't work
;; )

;;; new version; not thoroughly tested
(defun pasteboard-paste ()
  "Paste from OS X system pasteboard via `pbpaste' to point."
  (interactive)
  (let ((start (point))
        (end (if mark-active
                 (mark)
               (point))))
    (shell-command-on-region start end
                             "pbpaste | perl -p -e 's/\r$//' | tr '\r' '\n'"
                             nil t)
    (my/fix-space)
    (save-excursion
      (goto-char start)
      (my/fix-space))))

(defun minibuffer-pasteboard-paste ()
  "Paste from OS X system pasteboard via `pbpaste' to point."
  (interactive)
  (let ((start (point))
	(end (if mark-active
		 (mark)
	       (point))))
    (shell-command-on-region start end
			     "pbpaste | perl -p -e 's/\r$//' | tr '\r' '\n'"
			     nil t)

    (save-excursion

      )))

(defun pasteboard-cut()
  "Cut region and put on OS X system pasteboard."
  (interactive)
  (pasteboard-copy)
  (delete-region (region-beginning) (region-end))
(my/fix-space)
)


;; create a custom minor mode to override other keybindings and use mine instead
(defvar key-minor-mode-map (make-keymap) "key-minor-mode keymap.")
(define-minor-mode key-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " key" 'key-minor-mode-map)
(key-minor-mode 1)
(defun my-minibuffer-setup-hook ()
  (key-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)


(define-key key-minor-mode-map (kbd "s-v") 'pasteboard-paste)
(define-key key-minor-mode-map (kbd "s-x") 'pasteboard-cut)
(define-key key-minor-mode-map (kbd "s-c") 'pasteboard-copy)

(define-key minibuffer-local-map (kbd "s-v") 'minibuffer-pasteboard-paste)

(define-key key-minor-mode-map (kbd "s-Z") 'unexpand-abbrev)


;; pop mark
(define-key key-minor-mode-map (kbd "C-x p")'pop-to-mark-command)

;; projectile
(define-key key-minor-mode-map (kbd "s-P") 'projectile-commander)

;; and make it work in the minibuffer too
(define-key minibuffer-local-map (kbd "s-v") 'pasteboard-paste)
(define-key minibuffer-local-map (kbd "s-x") 'pasteboard-cut)
(define-key minibuffer-local-map (kbd "s-c") 'pasteboard-copy)

(define-key key-minor-mode-map (kbd "C-c C-v") 'refile-region)
(define-key key-minor-mode-map (kbd "H-w") 'widen)
(define-key key-minor-mode-map (kbd "C-c e") 'eval-buffer)
(define-key key-minor-mode-map (kbd "C-c r") 'eval-region)
(define-key key-minor-mode-map (kbd "C--") 'goto-last-change) ; super useful when editing
(define-key key-minor-mode-map (kbd "C-d") 'kill-word-correctly-and-capitalize)
(define-key key-minor-mode-map (kbd "C-j") 'prelude-top-join-line)


(define-key key-minor-mode-map (kbd "C-S-l") 'reflash-indentation)
(define-key key-minor-mode-map (kbd "C-l") 'recenter-top-bottom)


(define-key key-minor-mode-map (kbd "=") 'smex) ; call any function with easiest keystroke possible
(define-key key-minor-mode-map (kbd "M-x") 'helm-M-x) ; call helm-M-x instead of regular M-x
(define-key key-minor-mode-map (kbd "\|") 'deft)

(define-key key-minor-mode-map (kbd "M-K") 'kill-clause)

(define-key key-minor-mode-map (kbd "M-8") 'org-toggle-heading)

(define-key key-minor-mode-map (kbd "C-t") 'transpose-words)

(define-key key-minor-mode-map (kbd "M--") 'cycle-hyphenation)

(define-key key-minor-mode-map (kbd "C-c j") 'helm-org-headlines) ; also bound to keychord jj
(define-key key-minor-mode-map (kbd "C-x b") 'helm-mini) ; shows recent files; also bound to ⌘-r 
(define-key key-minor-mode-map (kbd "M-b M-d") 'book-dired) ; show directory of my book folder
(define-key key-minor-mode-map (kbd "M-b r") 'read-a-book) ; show directory of my PDF books 
(define-key key-minor-mode-map (kbd "M-b j") 'read-jd) ; show PDF books I have annotated
(define-key key-minor-mode-map (kbd "M-b M-b") 'work-on-book) ; 

(define-key key-minor-mode-map (kbd "M-b M-w") 'work-on-book) ; 

;; book bindings
(define-key key-minor-mode-map (kbd "M-b M-p") 'book-proposal-directory) ; go to my book folder
(define-key key-minor-mode-map (kbd "M-b M-r") 'book-helm-strict) ; this is a smart function, show recent files in my book folder

;; can't get this to work. for some reason GNU Emacs interprets ⌘-shift-d as s-c
(define-key key-minor-mode-map (kbd "s-D") 'diredp-dired-recent-dirs) 

;; recent directories... but how to populate it?
(define-key key-minor-mode-map (kbd "C-S-d") 'diredp-dired-recent-dirs) 

;; own structure editing
(define-key key-minor-mode-map (kbd "C-c C-`") 'move-region-to-other-window) ; very useful when working with a split frame

;; (define-key key-minor-mode-map (kbd "C-c C-w") 'org-refile) ; very useful when working with a split frame

;; for extracting content from my browser
(define-key key-minor-mode-map (kbd "s-W") 'web-research)
(define-key key-minor-mode-map (kbd "s-I") 'web-research-quotes)
(define-key key-minor-mode-map (kbd "s-V") 'kdm/html2org-clipboard) ; paste HTML content that I've copied from the web, automatically converting to proper org-mode syntax


;; and the keybinding
(define-key org-mode-map (kbd "C-k") 'my/kill-line-dwim)


;; use OSX standard keybindings ⌘-up and ⌘-down to go to top or bottom of buffer
(define-key key-minor-mode-map [s-up] 'beginning-of-buffer)
(define-key key-minor-mode-map [s-down] 'end-of-buffer)

;; use OSX standard keybinding for "Redo"
(define-key key-minor-mode-map (kbd "s-y") 'undo-tree-redo)

;; use OSX standard keybinding to increase or decrease font size 
(define-key key-minor-mode-map (kbd "s-=") 'text-scale-increase)
(define-key key-minor-mode-map (kbd "s--") 'text-scale-decrease)

;; rebind global help command so that I can use C-h for backspace
(define-key key-minor-mode-map (kbd "M-h") 'help-command)

;; very useful when encountering names and other unfamiliar words
(define-key key-minor-mode-map (kbd "M-+") 'add-word-to-personal-dictionary)

;; navigate between buffers, including uninteresting ones that are hidden by default
(define-key key-minor-mode-map (kbd "M-s-<right>") 'switch-to-next-buffer)
(define-key key-minor-mode-map (kbd "M-s-<left>") 'previous-buffer)

;; deleting things
(define-key key-minor-mode-map (kbd "<backspace>") 'my/delete-backward)

;; a keybinding for "delete" in addition to "backspace"
(define-key key-minor-mode-map (kbd "C-<backspace>") 'delete-char)
(define-key key-minor-mode-map (kbd "M-<backspace>") 'backward-kill-word-correctly)
 
;; pomodoro
(define-key key-minor-mode-map (kbd "C-c C-x pi") 'pomodoro-start)
(define-key key-minor-mode-map (kbd "C-c C-x po") 'pomodoro-stop)

;; find files using helm
(define-key key-minor-mode-map (kbd "C-x C-f") 'helm-find-files) 

;; search using helm-swoop
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
(global-set-key (kbd "M-i") 'helm-multi-swoop-all)

;; edit Emacs preferences using standard OSX keybinding for preferences
(define-key key-minor-mode-map (kbd "s-,") 'customize-group)

;; grep, using current folder as default
(define-key key-minor-mode-map (kbd "s-G") 'helm-do-grep)

;; some custom functions
(define-key key-minor-mode-map (kbd "C-c C-m") 'move-region-to-other-window)

(defun kill-sentence-to-period ()
  "Leave the period in there."
  (interactive)
  (kill-sentence)
  (push-mark)
  (insert ".")
  (backward-char)
)

(defun my/forward-to-sentence-end ()
  "Move point to just before the end of the current sentence."
  (forward-sentence)
  (backward-char)
  (unless (looking-back "[[:alnum:]]")
    (backward-char)))

(defun my/beginning-of-sentence-p ()
  "Return  t if point is at the beginning of a sentence."
  (let ((start (point))
        (beg (save-excursion (forward-sentence) (forward-sentence -1))))
    (eq start beg)))

(defun my/kill-sentence-dwim ()
  "Kill the current sentence up to and possibly including the punctuation.
When point is at the beginning of a sentence, kill the entire
sentence. Otherwise kill forward but preserve any punctuation at the sentence end."
  (interactive)
(expand-abbrev)
  (if (my/beginning-of-sentence-p)
      (progn
        (kill-sentence)
        (just-one-space)
        (when (looking-back "^[[:space:]]+") (delete-horizontal-space)))
      (kill-region (point) (progn (my/forward-to-sentence-end) (point)))
      (just-one-space 0))
(when (looking-at ".. ")
(delete-forward-char 1)) 
)

;; and the keybinding
(global-set-key (kbd "M-k") 'my/kill-sentence-dwim)

(defun my/kill-line-dwim ()
  "Kill the current line."
  (interactive)
(expand-abbrev)
(org-kill-line)
(my/fix-space))

(setq browse-url-browser-function 'browse-url-default-macosx-browser)

(add-to-list 'load-path "~/gnulisp/emacs-pastebin-master/")
(require 'neopastebin)
(pastebin-create-login :dev-key "e5ccb53890f16065d90ebd6064a381d0"
                       :username "petersalazar")

;;; new version
(defun my/fix-space ()
  "Delete all spaces and tabs around point, leaving one space except at the beginning of a line and before a punctuation mark."
  (interactive)
  (just-one-space)
  (when (or (looking-back "^[[:space:]]+")
            (looking-back "-[[:space:]]+")
            (looking-at "[[:punct:]]") 
            (looking-back "\" ") 
            (looking-at " \"")
(looking-back"( ")
(looking-at " )") 
            ) 
    (delete-horizontal-space)))

;;; new version
(defun kill-word-correctly ()
  "Kill word."
  (interactive)
  (expand-abbrev)
  (if (re-search-forward "\\=\\W*[[:punct:]]+\\W*\\<" nil t) ; IF there's a sequence of punctuation marks at point
      (kill-region (match-beginning 0) (match-end 0)) ; THEN just kill the punctuation marks
    (kill-word 1))                                    ; ELSE kill word
  (my/fix-space)) ; and finally fix space

(defun kill-word-correctly-and-capitalize ()
  "Check to see if the point is at the beginning of the sentence. If yes, then kill-word-correctly and endless/capitalize to capitalize the first letter of the word that becomes the first word in the sentence. Otherwise simply kill-word-correctly."
  (interactive)
(if (my/beginning-of-sentence-p)
      (progn
(expand-abbrev)
  (if (re-search-forward "\\=\\W*[[:punct:]]+\\W*\\<" nil t) ; IF there's a sequence of punctuation marks at point
      (kill-region (match-beginning 0) (match-end 0)) ; THEN just kill the punctuation marks
    (kill-word 1))                                    ; ELSE kill word
  (my/fix-space)
(capitalize-word 1) 
(left-word)
) 
(progn
(expand-abbrev)
  (if (re-search-forward "\\=\\W*[[:punct:]]+\\W*\\<" nil t) ; IF there's a sequence of punctuation marks at point
      (kill-region (match-beginning 0) (match-end 0)) ; THEN just kill the punctuation marks
    (kill-word 1))                                    ; ELSE kill word
  (my/fix-space)) ; and finally fix space 
) 
)

(defun backward-kill-word-correctly ()
  "Kill word."
  (interactive)
  (if (re-search-backward "\\>\\W*[[:punct:]]+\\W*\\=" nil t)
      (kill-region (match-end 0) (match-beginning 0))
    (backward-kill-word 1))
  (my/fix-space) 

;; I added this ↓↓↓ #######################
(when (and 
(not (looking-back "---")) ; I added this 
(not (looking-back "^"))) ; I added this 
;; I added this ↑↑↑ #######################
 
(jay/insert-space) 
) 
)


(defun my/delete-backward ()
  "When there is an active region, delete it and then fix up the whitespace"
  (interactive)
  (if (use-region-p)
      (delete-region (region-beginning) (region-end))
    (delete-backward-char 1))
  (save-excursion
    (when (or (looking-at "[[:space:]]")
              (looking-back "[[:space:]]"))
      (my/fix-space))))


(defun jay/left-char ()
  "Move point to the left or the beginning of the region.
 Like `backward-char', but moves point to the beginning of the region
provided the (transient) mark is active."
  (interactive)
  (let ((this-command 'left-char)) ;; maintain compatibility
    (let ((left (min (point)
                     ;; `mark' returning nil is ok; we'll only use this
                     ;; if `mark-active'
                     (or (mark t) 0))))
      (if (and transient-mark-mode mark-active)
          (progn
            (goto-char left)
            (setq deactivate-mark t))
        (call-interactively 'left-char)))))


(defun jay/right-char ()
  "Move point to the right or the end of the region.
 Like `right-char', but moves point to the end of the region
provided the (transient) mark is active."
  (interactive)
  (let ((this-command 'right-char)) ;; maintain compatibility
    (let ((right (max (point)
                      ;; `mark' returning nil is ok; we'll only use this
                      ;; if `mark-active'
                      (or (mark t) 0))))
      (if (and transient-mark-mode mark-active)
          (progn (goto-char right)
		 (setq deactivate-mark t))
	(call-interactively 'right-char)))))

(define-key org-mode-map (kbd "<left>") 'jay/left-char)
(define-key org-mode-map (kbd "<right>") 'jay/right-char)

(defun jay/insert-space ()
  "Insert space and then clean up whitespace."
  (interactive)
(expand-abbrev)
(insert "\ ")
  (just-one-space)
)
 
(define-key org-mode-map (kbd"<SPC>") 'jay/insert-space)

(defun reflash-indentation ()
"One sentence summary of what this command do."
  (interactive)
  (org-indent-mode 1)
  ) 



  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t)
(setq flyspell-default-dictionary "en_US")

(setq ispell-dictionary "en_US")
;; (setq ispell-program-name "/usr/local/bin/hunspell") 
(setenv "DICTIONARY" "en_US") 
(if (file-exists-p "/usr/bin/hunspell")
    (progn
      (setq ispell-program-name "hunspell")
      (eval-after-load "ispell"
        '(progn (defun ispell-get-coding-system () 'utf-8))))) 

(executable-find "hunspell")



(defun cycle-hyphenation ()
  (interactive)
  (cond ((re-search-forward "\\=\\W*\\w+\\(-\\)\\w+" nil t)
         (save-excursion (replace-match " " t t nil 1)))
        ((re-search-forward "\\=\\W*\\w+\\( +\\)\\w+" nil t)
         (save-excursion (replace-match "-" t t nil 1)))))

(defun org-clone-subtree ()
  (interactive)
  (org-clone-subtree-with-time-shift 1)
  (save-excursion
    (org-goto-sibling)
    ;; This part was lifted partly and adapted from
    ;; http://orgmode.org/worg/org-hacks.html#orgheadline10.
    ;; There should be a better way to change the contents of an org heading
    ;; though...
    (when (org-at-heading-p)
      (let ((hl-text (nth 4 (org-heading-components)))
            (buffer-undo-list))
        (when hl-text
          (beginning-of-line)
          (search-forward hl-text (point-at-eol))
          (replace-match (format "%s - clone" hl-text) nil t)
          (org-align-tags-here org-tags-column))))))


(defun add-word-to-personal-dictionary ()
  (interactive)
  (let ((current-location (point))
        (word (flyspell-get-word)))
    (when (consp word)
      (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))

(setq sentence-end-double-space nil)



(setq org-indent-mode t)
(setq org-indent-indentation-per-level 2)
(setq org-use-property-inheritance t)
(setq org-ctrl-k-protect-subtree t)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-clock-persist t)
(setq org-export-with-smart-quotes t)
(setq org-fontify-quote-and-verse-blocks t)
;; blank lines before new headings
(setq org-blank-before-new-entry
      '((Heading . auto)
       (plain-list-item . nil))) 


(defadvice org-archive-subtree (around my-org-archive-subtree activate)
  (let ((org-archive-location
	 (if (save-excursion (org-back-to-heading)
			     (> (org-outline-level) 1))
	     (concat (car (split-string org-archive-location "::"))
		     "::* "
		     (car (org-get-outline-path)))
	   org-archive-location)))
    ad-do-it))

(setq org-todo-keywords
      '(
        (sequence "TODO" "|" "DONE! :-)")
        (sequence "DELEGATE" "DELEGATED" "|" "DONE! :-)")
        (sequence "QUESTION" "|" "ANSWERED")
        (sequence "QUESTIONS" "|" "ANSWERS")
        (sequence "SOMEDAY/MAYBE" "|" "DONE! :-)")
        (sequence "MAYBE" "|" "MAYBE NOT" "DONE! :-)")
        (sequence "NEXT" "|" "DONE! :-)")
        (sequence "DID NOT DO :-/" "STARTED" "|" "DONE! :-)") 
        (sequence "STRATEGY" "|")
        (sequence "IF" "THEN" "|")
        (sequence "GOAL" "PLAN" "|" "DONE! :-)")
        ))


(defun new-org-delete-backward-char (N)
  (interactive "p")
  (cond ((region-active-p)
         (delete-region
          (region-beginning)
          (region-end)))
        ((looking-back "[*]+ ")
         (previous-line)
         (end-of-line))
        (t
         (org-delete-backward-char N))))
(add-hook 
 'org-mode-hook
 (lambda ()
   (define-key org-mode-map (kbd "DEL") 
     'new-org-delete-backward-char)))


'(initial-major-mode (quote org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; (add-hook 'org-mode-hook ' turn-on-olivetti-mode)
'(org-replace-disputed-keys t)
'(org-use-extra-keys nil)
'(org-adapt-indentation nil)
'(org-edit-src-content-indentation 4)
'(org-ellipsis (quote org-warning))
'(org-enforce-todo-checkbox-dependencies t)
'(org-enforce-todo-dependencies t)
'(org-html-postamble nil)
'(org-fontify-emphasized-text t)
'(org-src-preserve-indentation t)
'(org-startup-align-all-tables t)
'(org-startup-folded showeverything)
'(org-startup-indented nil)
'(org-hide-leading-stars t)
'(org-indent-mode-turns-off-org-adapt-indentation nil)
'(org-indent-mode-turns-on-hiding-stars nil)
'(org-insert-mode-line-in-empty-file t)
'(org-list-indent-offset 3)
'(org-log-done (quote time))
'(org-log-refile (quote time))
'(org-n-level-faces 9)
'(org-odd-levels-only nil)
'(org-priority-faces nil)
'(org-provide-checkbox-statistics t)
'(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-directory "~/Dropbox/writing/notationaldata/")
(setq org-default-notes-file (concat org-directory "notes.txt"))


(setq org-capture-templates
      (quote
       (
        ("m" "Mail" entry (file+olp org-default-notes-file "Emails") "** Email %T
From: Jay Dixit <dixit@aya.yale.edu>
To: %^{Send mail to}
Subject: %^{Subject}
--text follows this line--
%?")

	("g" "gratitude" entry (file "gratitude.txt")
	 "\n\n\n\n* %U\n\n1. %?\n\n" :prepend t :kill-buffer t)

	("L" "Later" checkitem (file+headline "playful.org" "Later") "\n\n [ ] %?\n\n" :prepend t :kill-buffer t)

	("l" "learnings" entry (file "learnings.org" :prepend t :kill-buffer t)
	 "\n\n* %i%?\n\nEntered on %U %i\n\n" :prepend t :kill-buffer t)

	("n" "note" entry (file org-default-notes-file)
	 "* %? :NOTE:\n%U\n%a\n  %i" :prepend t :kill-buffer t :clock-in t :clock-resume t)

	("b" "book" entry (file "../book/book-capture.txt" :prepend t :kill-buffer t)
	 "\n\n* %i%?\n\n" :prepend t :kill-buffer t)

	("v" "visualness and visual actions" entry (file "visual-actions.txt")
	 "\n\n\n\n*  %? %i\n \n" :prepend t :kill-buffer t)

	("e" "expression" entry (file "expression.txt")
	 "\n\n* %U\n  %i\n %?\nEntered on %U  %i\n" :prepend t :kill-buffer t)

	("h" "historical interest" entry (file "historical-lifestream.txt")
	 "\n\n* %U\n  %i\n %?\nEntered on %U  %i\n" :prepend t :kill-buffer t)

	("p" "pages" entry (file "~/Dropbox/writing/notationaldata/pages.txt")
	 "\n\n\n\n* %U\n\n%?\n\nEntered on %U  %i\n\n" :prepend t :kill-buffer t)

	("s" "storytelling and writing" entry (file "~/Dropbox/writing/notationaldata/writing-teacher/teaching-writing-and-storytelling.txt")
	 "\n\n\n\n* %U\n\n%?\n\nEntered on %U  %i\n\n" :prepend t :kill-buffer t)

	("F" "Funny" entry (file "~/Dropbox/writing/notationaldata/funny.txt")
	 "\n\n\n\n* %U\n\n%?\n" :prepend t :kill-buffer t)

	("V" "Vegas journal" entry (file "vegas-journal-capture.txt")
	 "\n\n\n\n* %U\n\n%?\n\nEntered on %U  %i\n\n" :prepend t :kill-buffer t)

("M" "Memorize" entry
               (file+headline (concat org-directory "org-drill-jays-decks.org")
                              "Vocabulary")
               "* Word :drill:\n%^ \n** Answer \n%^")

;; source: http://stackoverflow.com/questions/14666625/combine-org-mode-capture-and-drill-modules-to-learn-vocabulary
;; http://lists.gnu.org/archive/html/emacs-orgmode/2010-09/msg00924.html

	("f" "flowy" entry (file "flowy.org")
	 "\n\n*  %i\n %?\n" :prepend t :kill-buffer t))))

(global-set-key [(s-right)] 'buffer-stack-down)
(global-set-key [(s-left)] 'buffer-stack-up)


(defvar new-buffer-count 0)
(defun new-buffer ()
  (interactive)
  (setq new-buffer-count (+ new-buffer-count 1))
  (switch-to-buffer (concat "buffer" (int-to-string new-buffer-count)))
  (org-mode))
(global-set-key (kbd "s-T") 'new-buffer)


(defun org-new-scratch-buffer ()
  (interactive)
  (insert "* oh hi there! " (format-time-string "%F %l:%M%P\n\n"))
  (org-tree-to-indirect-buffer 'current-window)
  )
'(cua-enable-cua-keys (quote shift))
'(cua-highlight-region-shift-only t)
'(cua-mode nil nil (cua-base))
'(cursor-type (quote box))
'(send-mail-function (quote sendmail-send-it))
'(shift-select-mode nil)
'(transient-mark-mode t)
'(user-mail-address "dixit@aya.yale.edu")
'(global-flyspell-mode t)
'(message-send-mail-function (quote message-send-mail-with-sendmail))
'(mail-send-mail-function (quote message-send-mail-with-sendmail))
'(setq mail-user-agent 'message-user-agent)
'(global-set-key [(A-W)]  'buffer-stack-bury-and-kill)
'(ns-right-command-modifier (quote meta))
'(ns-tool-bar-display-mode (quote both) t)
'(ns-tool-bar-size-mode nil t)
'(standard-indent 3)
'(ns-function-modifier (quote meta))
(transient-mark-mode t)
(tooltip-mode -1)
(setq ns-function-modifier 'hyper)


(defvar gnuemacs-flag (string-match "GNU" (emacs-version)))
(defvar aquamacs-flag (string-match "Aquamacs" (emacs-version)))

(defun define-hyper-key (key fun)
  (cond
   (aquamacs-flag
    (define-key osx-key-mode-map (kbd (concat "A-" key)) fun))
   (gnuemacs-flag
    (define-key key-minor-mode-map (kbd (concat "s-" key)) fun))))

(define-hyper-key "h" 'replace-string)
(define-hyper-key "i" 'org-mac-chrome-insert-frontmost-url)
(define-hyper-key "\\" 'visit-most-recent-file)
(define-hyper-key "f" 'isearch-forward)
(define-hyper-key "r" 'xsteve-ido-choose-from-recentf)
(define-hyper-key "R" 'helm-projectile-recentf)
(define-hyper-key "r" 'helm-mini)
(define-hyper-key "t" 'new-buffer)
(define-hyper-key "T" 'org-new-scratch-buffer)
(define-hyper-key "g" 'isearch-repeat-forward)
(define-hyper-key "k" 'ido-kill-buffer)
(define-hyper-key "K" 'org-mac-chrome-insert-frontmost-url-with-quotes)
(define-hyper-key "d" 'org-todo)
(define-hyper-key "L" 'org-mac-chrome-insert-frontmost-url)
(define-hyper-key "S" 'org-mac-skim-insert-page)
(define-hyper-key "b" 'org-narrow-to-subtree)
(define-hyper-key "a" 'mark-whole-buffer) ; select all
(define-hyper-key "w" 'delete-window) ; close
(define-hyper-key "`" 'other-window)
;; (define-hyper-key "s" 'jay/save-some-buffers ) ; save all

(define-hyper-key "4" 'clone-indirect-buffer-other-window)
(define-hyper-key "5" 'point-stack-push)
(define-hyper-key "6" 'point-stack-pop)
(define-hyper-key "7" 'point-stack-forward-stack-pop)
(define-hyper-key "8" 'search-open-buffers)
(define-hyper-key "B" 'clone-indirect-buffer-other-window)
(define-hyper-key "o" 'eval-buffer)
(define-hyper-key "F" 'locate)
(define-hyper-key "(" 'org-velocity)
(define-hyper-key "[" 'org-backward-heading-same-level)
(define-hyper-key "]" 'org-forward-heading-same-level)

(define-hyper-key "m a" 'org-agenda) 
(define-hyper-key "m j" 'helm-imenu-anywhere) 
(define-hyper-key ";" 'ido-goto-symbol)
(define-hyper-key "D" 'diredp-dired-recent-dirs)

(define-hyper-key "m cy" 'cyberpunk-jay) 
(define-hyper-key "m cl" 'cyberpunk-large) 
(define-hyper-key "m zb" 'zenburn) 
(define-hyper-key "m lv" 'leuven) 
;; (define-hyper-key "m cl" 'cyberpunk-large) 

(define-hyper-key "m cw" 'cyberpunk-writeroom) 
(define-hyper-key "m wb" 'whiteboard) 
(define-hyper-key "m sl" 'solarized-light)
(define-hyper-key "m sd" 'solarized-dark) 
(define-hyper-key "m ri" 'ritchie) 
(define-hyper-key "m sp" 'spolsky) 
(define-hyper-key "m wr" 'writeroom-mode) 
(define-hyper-key "m wf" 'workflowy-mode) 
(define-hyper-key "m st" 'small-type) 
(define-hyper-key "m mp" 'morning-pages) 
(define-hyper-key "m rf" 'prelude-rename-file-and-buffer) 
(define-hyper-key "m lt" 'large-type) 
(define-hyper-key "m mt" 'medium-type) 
(define-hyper-key "m df" 'delete-file-and-buffer) 
(define-hyper-key "m rf" 'rename-file-and-buffer)

(defun buffer-stack-filter-regexp (buffer)
  "Non-nil if buffer is in buffer-stack-tracked."
  (not (or (string-match "Help\\|minibuf\\|org2blog\\|echo\\|conversion\\|converting\\|agenda\\|server\\|Messages\\|tex\\|Output\\|temp\\|autoload\\|Customize\\|address\\|clock\\|Backtrace\\|Completions\\|grep\\|Calendar\\|archive\\||*Compile-Log*\\|tramp\\|accountability\\|helm\\|Alerts\\|Minibuf\\|Agenda\\|Echo\\|gnugol\\|RNC\\|widget\\|melpa\\|fontification\\|Helm\\|popwin\\|*Warnings*\\|*tags*\\|*gnugol*\\|*guide-key*\\|*scratch*" (buffer-name buffer))
	   (member buffer buffer-stack-untracked))))
(setq buffer-stack-filter 'buffer-stack-filter-regexp)

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
(define-key org-mode-map (kbd "<S-up>") nil)
     (define-key org-mode-map (kbd "<S-down>") nil)

     (define-key org-mode-map [C-S-right] 'org-shiftmetaright)
     (define-key org-mode-map [C-S-left] 'org-shiftmetaleft)
     (define-key org-mode-map [C-right] 'org-metaright)
     (define-key org-mode-map [C-left] 'org-metaleft)
     (define-key org-mode-map [C-up] 'org-metaup)
     (define-key org-mode-map [C-down] 'org-metadown)
     (define-key org-mode-map [C-S-return] 'org-insert-todo-heading)
     ))

'(org-support-shift-select (quote always))

(setq sentence-end-double-space nil)

(global-auto-revert-mode 1)

(delete-selection-mode 1)



(defvar maxframe-maximized-p nil "maxframe is in fullscreen mode")

(defun toggle-maxframe ()
  "Toggle maximized frame"
  (interactive)
  (setq maxframe-maximized-p (not maxframe-maximized-p))
  (cond (maxframe-maximized-p (maximize-frame))
        (t (restore-frame))))

(define-key global-map [(s-return)] 'toggle-maxframe)
;; make it easy to go fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

;; and the keybinding 
(unless (fboundp 'toggle-frame-fullscreen)
  (global-set-key (kbd "<f11>") 'toggle-fullscreen))
(unless (fboundp 'toggle-frame-fullscreen)
  (global-set-key (kbd "<f13>") 'toggle-fullscreen))

  (global-set-key (kbd "<f13>") 'toggle-fullscreen)


(defun visit-most-recent-file ()
  "Visits the most recently open file in `recentf-list' that is not already being visited."
  (interactive)
  (let ((buffer-file-name-list (mapcar 'buffer-file-name (buffer-list)))
	most-recent-filename)
    (dolist (filename recentf-list)
      (unless (memq filename buffer-file-name-list)
	(setq most-recent-filename filename)
	(return)))
    (find-file most-recent-filename)))

(defun path-copy-full-path-to-clipboard ()
  "Copy the full current filename and path to the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
	  (message "A buffer named '%s' already exists!" new-name)
	(progn
	  (rename-file name new-name 1)
	  (rename-buffer new-name)
	  (set-visited-file-name new-name)
	  (set-buffer-modified-p nil))))))

(defun xsteve-ido-choose-from-recentf ()
  "Use ido to select a recently opened file from the 'recentf-list'"
  (interactive)
  (let ((home (expand-file-name (getenv "HOME"))))
    (find-file
     (ido-completing-read ""
			  (mapcar (lambda (path)
				    (replace-regexp-in-string home "~" path))
				  recentf-list)
			  nil t))))
