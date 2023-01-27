;;; init.el --- Plain Old Emacs -*- lexical-binding: t -*-

;; Copyright (C) 2023 Leslie S. Russell

;; Author: Leslie S. Russell <lesliesrussell@gmail.com>
;; Keywords: minimal, config, starter
;; URL: https://github.com/lesliesrussell

;;; Commentary:

;;; Code:

(use-package emacs
:custom
(inhibit-startup-screen t)
(initial-scratch-message "")
(delete-by-moving-to-trash t)
(cursor-type 'bar)
(display-line-numbers-type 'relative)
(disabled-command-function nil)
(help-window-select t)
(tooltip-use-echo-area t)
(completion-auto-help 'visible)
(completion-auto-select 'second-tab)
(custom-file null-device)
;; (default-frame-alist '((tool-bar-lines . 0)
;; 		       (menu-bar-lines . 0)
;; 		       (vertical-scroll-bars)
;; 		       (mouse-color . "blue")
;; 		       (left-fringe . 8)
;; 		       (right-fringe . 13)
;; 		       (fullscreen . maximized)))

:bind (("C-x C-b" . ibuffer))
:config
(set-frame-size (selected-frame) 150 50)
(set-face-attribute 'default nil :height 200)
(add-to-list 'default-frame-alist '(alpha-background . 50))
(set-frame-font "Overpass Mono 15" nil t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(hl-line-mode)

(add-hook 'prog-mode-hook (lambda ()
			    (display-line-numbers-mode 1)))

(add-hook 'elisp-mode-hook (lambda ()
			     (display-line-numbers-mode 1)))

(add-hook 'lisp-interaction-mode-hook (lambda ()
					(display-line-numbers-mode 1)))

(defalias 'yes-or-no-p 'y-or-n-p)

(tooltip-mode -1)

(global-visual-line-mode 1)

(electric-pair-mode t)
(electric-indent-mode t)
(icomplete-vertical-mode t)
(fido-mode)
(fido-vertical-mode)

(load-theme 'misterioso t)

;; (setq completion-auto-help 'visible)
;; (setq completion-auto-select 'second-tab)

;; New commands for navigating completions from the minibuffer. #

;;     M-<up> and M-<down> for minibuffer-next-completion and minibuffer-previous-completion
;;     M-RET to choose active candidate
;;     C-u M-RET to insert active candidate without exiting minibuffer
;;     C-x <up> (minibuffer-complete-history) is like minibuffer-complete but completes on the history items instead of the default completion table.
;;     C-x <down> (minibuffer-complete-defaults) is like minibuffer-complete, but completes on the default items instead of the completion table.

;; The first two also work for completion-at-point (in-buffer completion).
;; (global-set-key (kbd "<tab>") #'completion-at-point)

;; Up/down when completing in the minibuffer
(define-key minibuffer-local-map (kbd "C-p") #'minibuffer-previous-completion)
(define-key minibuffer-local-map (kbd "C-n") #'minibuffer-next-completion)

;; Up/down when competing in a normal buffer
(define-key completion-in-region-mode-map (kbd "C-p") #'minibuffer-previous-completion)
(define-key completion-in-region-mode-map (kbd "C-n") #'minibuffer-next-completion))

(defconst poeinit "init.org" "PO Emacs init file")

  (defun poe-find-user-init()
  (interactive)
  (progn
    (find-file (concat user-emacs-directory poeinit))))

(global-set-key (kbd "C-c fi") #'poe-find-user-init)

(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq
 backup-by-copying t                                        ; Avoid symlinks
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 auto-save-list-file-prefix emacs-tmp-dir
 auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))  ; Change autosave dir to tmp
 backup-directory-alist `((".*" . ,emacs-tmp-dir)))

(setq create-lockfiles nil)

(global-visual-line-mode 1)

(display-battery-mode 1)

(when (display-graphic-p)
  (global-unset-key (kbd "C-z")))

(add-hook 'dired-mode-hook #'(lambda ()
			       (define-key dired-mode-map (kbd "-") #'dired-up-directory)))

(setq dired-dwim-target t)
