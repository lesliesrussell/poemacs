;;; init.el --- Plain Old Emacs -*- lexical-binding: t -*-

;; Copyright (C) 2023 Leslie S. Russell

;; Author: Leslie S. Russell <lesliesrussell@gmail.com>
;; Keywords: 
;; URL: https://github.com/lesliesrussell  
(setq package-enable-at-startup nil)

(setq gc-cons-threshold most-positive-fixnum
      load-prefer-newer t
      read-process-output-max (* 1024 1024))

(add-hook 'after-init-hook #'(lambda ()
			       ;; restore after startup
			       (setq gc-cons-threshold 800000)))

(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))

;; Silence stupid startup message
(setq inhibit-startup-echo-area-message (user-login-name))

;; Default frame configuration: full screen, good-looking title bar on macOS
(setq frame-resize-pixelwise t)
(tool-bar-mode -1)                      ; All these tools are in the menu-bar anyway
(setq default-frame-alist '((tool-bar-lines . 0)
			    (menu-bar-lines . 0)
			    (fullscreen . maximized)
			    (vertical-scroll-bars . nil)
			    (horizontal-scroll-bars . nil)
			    (ns-appearance . dark)
			    (ns-transparent-titlebar . t)
			    (mouse-color . "blue")
			    (left-fringe . 8)
			    (right-fringe . 13)
			    (alpha-background . 50)))
