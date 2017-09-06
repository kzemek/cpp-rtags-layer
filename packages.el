;;; packages.el --- c++-rtags layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Konrad Zemek <konrad.zemek@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `c++-rtags-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `c++-rtags/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `c++-rtags/pre-init-PACKAGE' and/or
;;   `c++-rtags/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst c++-rtags-packages
  '(rtags
    cmake-ide
    company
    company-rtags
    flycheck-rtags
    helm-rtags))

(defun c++-rtags/init-rtags ()
  (use-package rtags
    :defer t
    :init
    (setq rtags-autostart-diagnostics t
          rtags-completions-enabled t)
    :config
    (rtags-enable-standard-keybindings)))

(defun c++-rtags/init-helm-rtags ()
  (use-package helm-rtags
    :defer t
    :init
    (setq rtags-display-result-backend 'helm)))

(defun c++-rtags/init-company-rtags ()
  (use-package company-rtags
    :defer t
    :init (spacemacs|add-company-backends
            :backends company-rtags
            :modes c++-mode)))

(defun c++-rtags/post-init-cmake-ide ()
  (cmake-ide-maybe-start-rdm))

(defun c++-rtags/post-init-company ()
  (spacemacs/add-to-hooks 'company-mode c-c++-mode-hooks))

(defun c++-rtags/init-flycheck-rtags ()
  (use-package flycheck-rtags
    :init
    (spacemacs/add-to-hooks 'spacemacs/c++-rtags-takeover-flycheck c-c++-mode-hooks)))

;;; packages.el ends here
