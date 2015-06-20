;;; packages.el --- jay Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar jay-packages
  '(
    ;; package jays go here
    magit expand-region gist  helm helm-projectile magit markdown-mode auto-complete dired-details+ paredit projectile rainbow-mode scss-mode solarized-theme volatile-highlights yasnippet zenburn-theme frame-restore frame-cmds org-fstree buffer-stack auto-capitalize org-pomodoro edit-server key-chord ido-hacks openwith wc-mode discover engine-mode point-stack palimpsest olivetti smex dired-hacks-utils dired-single sublime-themes cyberpunk-theme popup yasnippet xml-rpc autopair auto-capitalize edit-server openwith wc-mode dired-sort-menu dired-details+ maxframe palimpsest olivetti org-mac-link
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar jay-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function jay/init-<package-jay>
;;
;; (defun jay/init-my-package ()
;;   "Initialize my package"
(defun jay/init-autopair () (use-package autopair))
(defun jay/init-buffer-stack () (use-package buffer-stack))
(defun jay/init-org-fstree () (use-package org-fstree))
(defun jay/init-auto-capitalize () (use-package auto-capitalize))
(defun jay/init-edit-server () (use-package edit-server))
(defun jay/init-ido-hacks () (use-package ido-hacks))
(defun jay/init-openwith () (use-package openwith))
(defun jay/init-wc-mode () (use-package wc-mode))
(defun jay/init-discover () (use-package discover))
(defun jay/init-engine-mode () (use-package engine-mode))
(defun jay/init-point-stack  () (use-package point-stack))
(defun jay/init-dired-details  () (use-package dired-details))
(defun jay/init-dired-sort-menu  () (use-package dired-sort-menu))
(defun jay/init-dired-details+  () (use-package dired-details+))
(defun jay/init-maxframe () (use-package maxframe))
(defun jay/init-palimpsest () (use-package palimpsest))
(defun jay/init-olivetti () (use-package olivetti))
(defun jay/init-org-mac-link () (use-package org-mac-link))


;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
