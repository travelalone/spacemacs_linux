;;; packages.el --- haomiao layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: 张浩淼 <haomiao@haomiao.local>
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
;; added to `haomiao-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `haomiao/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `haomiao/pre-init-PACKAGE' and/or
;;   `haomiao/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst haomiao-packages
  '(youdao-dictionary
    cdlatex
    openwith
    org-edit-latex
    ))

(defun haomiao/init-youdao-dictionary()
  (use-package youdao-dictionary
     :defer t
     :init
     (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
     ))

(defun haomiao/init-cdlatex()
  (use-package cdlatex
    :config
    (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
    (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
    )
  )

(defun haomiao/init-org-edit-latex()
  (use-package init-org-edit-latex
    :defer t))


(defun haomiao/init-openwith()
  :config
  (setq openwith-associations '(
                                ("\\.\\(?:PDF\\|DVI\\|OD[FGPST]\\|DOCX?\\|XLSX?\\|PPTX?\\|pdf\\|djvu\\|dvi\\|od[fgpst]\\|docx?\\|xlsx?\\|pptx?\\)\\'" "okular" (file))
                                ))
  (openwith-mode t))
;;; packages.el ends here
