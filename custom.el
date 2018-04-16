(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace t)
 '(LaTeX-math-abbrev-prefix "")
 '(TeX-arg-right-insert-p t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(company-dabbrev-other-buffers t)
 '(company-minimum-prefix-length 0)
 '(company-require-match nil)
 '(doc-view-pdfdraw-program "")
 '(doc-view-pdftotext-program "")
 '(ein:use-auto-complete-superpack t)
 '(electric-pair-pairs (quote ((34 . 34))))
 '(evil-want-Y-yank-to-eol nil)
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(fci-rule-color "#37474f" t)
 '(hl-sexp-background-color "#1c1f26")
 '(org-agenda-files (quote ("~/Dropbox/org/refile-beorg.org")))
 '(org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (gnuplot . t)
     (python . t)
     (latex . t)
     (ipython . t)
     (dot . t)
     (ditaa . t)
     (asymptote . t)
     (plantuml . t)
     (C . t))))
 '(org-format-latex-options
   (quote
    (:foreground default :background "white" :scale 2.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-latex-packages-alist (quote (("" "chemfig" t) ("" "tikz" t))))
 '(package-selected-packages
   (quote
    (yasnippet undo-tree sml-mode nameless f s dash company auctex avy hydra font-lock+ async reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl anaconda-mode pythonic cdlatex youdao-dictionary names chinese-word-at-point yapfify xterm-color ws-butler window-numbering which-key web-mode volatile-highlights uuidgen use-package toc-org tagedit spacemacs-theme spaceline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode material-theme markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint less-css-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-surround evil-snipe evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump diredful dired-icon define-word cython-mode company-web company-statistics company-auctex company-anaconda column-enforce-mode color-identifiers-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(python-shell-extra-pythonpaths (quote ("~/soft/anaconda3/lib/python3.6/site-packages")))
 '(safe-local-variable-values
   (quote
    ((org-image-actual-width . 1000)
     (org-image-actual-width . 500)
     (org-image-actual-width . 400)
     (org-image-actual-width . 250)
     (org-image-actual-width . 350)
     (org-ref-pdf-directory . "pdf")
     (org-ref-bibliography-notes . "markov_notes.org")
     (bibtex-completion-notes-path . ".")
     (org-ref-default-bibliography . "markov.bib")
     (org-ref-pdf-directory . "/home/haomiao/notes/orgfile/paper/MarkovStateModel/pdf/")
     (bibtex-completion-notes-path . "/home/haomiao/notes/orgfile/paper/MarkovStateModel/notes/")
     (org-ref-default-bibliography "/home/haomiao/notes/orgfile/paper/MarkovStateModel/test.bib")
     (org-ref-bibliography-notes . "/home/haomiao/notes/orgfile/paper/MarkovStateModel/notes.org")
     (bibtex-completion-notes-path . "/home/haomiao/notes/orgfile/paper/MarkovStateModel/")
     (org-ref-pdf-directory . "/home/haomiao/notes/orgfile/paper/MarkovStateModel/pdf")
     (org-ref-default-bibliography "/home/haomiao/notes/orgfile/paper/MarkovStateModel/markov.bib")
     (bibtex-completion-notes-path . "/home/haomiao/notes/orgfile/paper/MarkovStateModel/markov_notes")
     (bibtex-completion-notes-path \./home/haomiao/notes/orgfile/paper/MarkovStateModel/markov_notes)
     (org-ref-default-bibliography . "/home/haomiao/notes/orgfile/paper/MarkovStateModel/markov.bib")
     (org-ref-bibliography-notes . "/home/haomiao/notes/orgfile/paper/MarkovStateModel/markov_notes.org")
     (org-ref-default-bibliography . /home/haomiao/notes/orgfile/paper/MarkovStateModel/markov\.bib)
     (org-ref-bibliography-notes . /home/haomiao/notes/orgfile/paper/MarkovStateModel/markov_notes\.org)
     (org-ref-notes-directory . /home/haomiao/notes/orgfile/paper/MarkovStateModel)
     (org-ref-notes-directory . /home/haomiao/notes/orgfile/paper/MarkovStateModel/markov_notes\.org)
     (TeX-command-extra-options . "-shell-escape")
     (org-image-actual-width . 200)
     (org-image-actual-width)
     (org-image-actual-width . 300))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 120 :width normal)))))
