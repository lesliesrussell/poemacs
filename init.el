;;; init.el --- Plain Old Emacs (POE) -*- lexical-binding: t -*-

;; Copyright (C) 2023 Leslie S. Russell

;; Author: Leslie S. Russell <lesliesrussell@gmail.com>
;; Keywords: 
;; URL: https://github.com/lesliesrussell

;;; Commentary:

;;; Code:

(use-package emacs
  :custom
  (inhibit-startup-screen t)
  (cursor-type 'bar)
  (display-line-numbers-type 'relative)
  (disabled-command-function nil)
  (help-window-select t)
  (tooltip-use-echo-area t)
  (completion-auto-help 'visible)
  (completion-auto-select 'second-tab)
  (completion-styles '(flex basic partial-completion))
  (icomplete-compute-delay 0.0)
  (custom-file null-device)
  :bind (("C-x C-b" . ibuffer))
  :config
  (define-key icomplete-minibuffer-map [remap minibuffer-complete] 'icomplete-force-complete)
  (set-frame-size (selected-frame) 200 50)
  (set-face-attribute 'default nil :height 200)
  (add-to-list 'default-frame-alist '(alpha-background . 50))
  (set-frame-font "Overpass Mono 20" nil t)

  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)

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

