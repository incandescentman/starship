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


(setq
;; that's the variable
jay-packages
;; that's the value (it is a list of packages)
'(
magit expand-region gist  helm helm-projectile magit markdown-mode auto-complete dired-details+ paredit projectile rainbow-mode scss-mode solarized-theme volatile-highlights zenburn-theme frame-restore frame-cmds org-fstree buffer-stack auto-capitalize key-chord ido-hacks openwith wc-mode discover engine-mode point-stack palimpsest olivetti smex dired-hacks-utils dired-single sublime-themes cyberpunk-theme popup xml-rpc autopair auto-capitalize openwith wc-mode dired-sort-menu dired-details+ maxframe olivetti palimpsest olivetti org-mac-link writeroom-mode helm-cmd-t w3m multiple-cursors xah-replace-pairs tiny imenu-list stripe-buffer notmuch peg nm zone  project-explorer discover-my-major which-key unfill highlight-thing recentf wrap-region graphviz-dot-mode expand-region god-mode bongo multicolumn rainbow-mode change-inner counsel fuzzy command-log-mode ag scratch ox-twbs caps-lock dired+ cheatsheet scratch-message org-bookmark-heading tabbar selected fastdef dired+))



  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list."

(setq jay-excluded-packages
'(

  ;; "List of packages to exclude." 
adaptive-wrap 
  ))

;; For each package, define a function jay/init-<package-jay>
;;
;; (defun jay/init-my-package ()
;;   "Initialize my package"

(defun jay/init-autopair () (use-package autopair))
(defun jay/init-buffer-stack () (use-package buffer-stack))
(defun jay/init-org-fstree () (use-package org-fstree))
(defun jay/init-auto-capitalize () (use-package auto-capitalize))
;; (defun jay/init-edit-server () (use-package edit-server))
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

(defun jay/init-recentf () (use-package recentf))
(defun jay/init-writeroom-mode () (use-package writeroom-mode))
(defun jay/init-key-chord () (use-package key-chord))

(defun jay/init-helm-cmd-t () (use-package helm-cmd-t))

(defun jay/init-w3m () (use-package w3m))


(defun jay/init-multiple-cursors () (use-package multiple-cursors))

(defun jay/init-xah-replace-pairs () (use-package xah-replace-pairs))

;; (defun jay/init-org-download () (use-package org-download))

(defun jay/init-gist () (use-package gist))

(defun jay/init-tiny () (use-package tiny))
(defun jay/init-imenu-list () (use-package imenu-list))
;; (defun jay/init-fountain-mode () (use-package fountain-mode))

(defun jay/init-stripe-buffer () (use-package stripe-buffer))


(defun jay/init-peg () (use-package peg))
(defun jay/init-nm () (use-package nm))

(defun jay/init-zone () (use-package zone))
;; (defun jay/init-direx () (use-package direx))
(defun jay/init-project-explorer () (use-package project-explorer))
(defun jay/init-discover-my-major () (use-package discover-my-major))

(defun jay/init-direx () (use-package direx))

;; (defun jay/init-org-vcard () (use-package org-vcard))

(defun jay/init-unfill() (use-package unfill))
;; (defun jay/init-swiper() (use-package swiper))

(defun jay/init-highlight-thing() (use-package highlight-thing))

(defun jay/init-wrap-region() (use-package wrap-region))
(defun jay/init-expand-region () (use-package expand-region))
;; (defun jay/init-graphviz-dot-mode () (use-package graphviz-dot-mode))


(defun jay/init-god-mode () (use-package god-mode))

(defun jay/init-multicolumn () (use-package multicolumn))


(defun jay/init-rainbow-mode () (use-package rainbow-mode))

(defun jay/init-change-inner () (use-package change-inner))

(defun jay/init-counsel () (use-package counsel))

(defun jay/init-fuzzy () (use-package fuzzy))
(defun jay/init-command-log-mode () (use-package command-log-mode))
(defun jay/init-ag () (use-package ag))

(defun jay/init-scratch () (use-package scratch))
(defun jay/init-ox-twbs () (use-package ox-twbs))
(defun jay/init-caps-lock () (use-package caps-lock))
(defun jay/init-dired+ () (use-package dired+))
;;(defun jay/init-org-pomodoro () (use-package org-pomodoro))


(defun jay/init-cheatsheet () (use-package cheatsheet))



(defun jay/init-scratch-message () (use-package scratch-message))
(defun jay/init-org-bookmark-heading () (use-package org-bookmark-heading))



(defun jay/init-tabbar () (use-package tabbar))

(defun jay/init-selected () (use-package selected))

(defun jay/init-fastdef () (use-package fastdef))
(defun jay/init-dired+ () (use-package dired+))



;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
