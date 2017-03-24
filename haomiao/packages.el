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
    )
  "The list of Lisp packages required by the haomiao layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(defun haomiao/init-youdao-dictionary()
  (use-package youdao-dictionary
     :defer t
     :init
     (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
     ))

(defun haomiao/init-cdlatex()
  (use-package cdlatex
    :config
    (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
    )
  )
(defun haomiao/init-openwith()
  :config
  (setq openwith-associations '(
                                ("\\.\\(?:PDF\\|DVI\\|OD[FGPST]\\|DOCX?\\|XLSX?\\|PPTX?\\|pdf\\|djvu\\|dvi\\|od[fgpst]\\|docx?\\|xlsx?\\|pptx?\\)\\'" "okular" (file))
                                ))
  (openwith-mode t))
;;; packages.el ends here
