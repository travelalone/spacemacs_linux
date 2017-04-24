(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) charset
                    (font-spec :family "KaiTi" :size 20)))

(electric-pair-mode t)
(setq-default TeX-engine 'luatex)
(setq-default TeX-PDF-mode t)
(global-linum-mode t)

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[11pt]{ctexart}
                                        [NO-DEFAULT-PACKAGES]
                                        \\usepackage[utf8]{inputenc}
                                        \\usepackage[T1]{fontenc}
                                        \\usepackage{fixltx2e}
                                        \\usepackage{graphicx}
                                        \\usepackage{longtable}
                                        \\usepackage{float}
                                        \\usepackage{wrapfig}
                                        \\usepackage{rotating}
                                        \\usepackage[normalem]{ulem}
                                        \\usepackage{amsmath}
                                        \\usepackage{textcomp}
                                        \\usepackage{marvosym}
                                        \\usepackage{wasysym}
                                        \\usepackage{amssymb}
                                        \\usepackage{booktabs}
                                        \\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref}
                                        \\usepackage[all]{hypcap}
                                        \\tolerance=1000
                                        \\usepackage[margin=1in]{geometry}
                                        \\usepackage{listings}
                                        \\usepackage{xcolor}
                                        \\numberwithin{equation}{subsection}
                                        \\lstset{
                                        %行号
                                        numbers=left,
                                        %背景框
                                        framexleftmargin=10mm,
                                        frame=none,
                                        %背景色
                                        %backgroundcolor=\\color[rgb]{1,1,0.76},
                                        backgroundcolor=\\color[RGB]{245,245,244},
                                        %样式
                                        keywordstyle=\\bf\\color{blue},
                                        identifierstyle=\\bf,
                                        numberstyle=\\color[RGB]{0,192,192},
                                        commentstyle=\\it\\color[RGB]{0,96,96},
                                        stringstyle=\\rmfamily\\slshape\\color[RGB]{128,0,0},
                                        %显示空格
                                        showstringspaces=false
                                        }
                                        "
                                        ("\\section{%s}" . "\\section*{%s}")
                                        ("\\subsection{%s}" . "\\subsection*{%s}")
                                        ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                        ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                        ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
               '("beamer"
                 "\\documentclass[11pt,professionalfonts]{beamer}
                   \\mode
\\usetheme{{{{Warsaw}}}}
%\\usecolortheme{{{{beamercolortheme}}}}

\\beamertemplateballitem
\\setbeameroption{show notes}
\\usepackage{graphicx}
\\usepackage{tikz}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{amsmath}
\\usepackage{lmodern}
\\usepackage{fontspec,xunicode,xltxtra}
\\usepackage{polyglossia}
\\setmainfont{Times New Roman}
\\setCJKmainfont{DejaVu Sans YuanTi}
\\setCJKmonofont{DejaVu Sans YuanTi Mono}
\\usepackage{verbatim}
\\usepackage{listings}
\\institute{{{{beamerinstitute}}}}
\\subject{{{{beamersubject}}}}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"))))
(setq org-latex-default-class "ctexart")
(setq org-latex-pdf-process
      '(
        "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f  %f"
        "rm -fr %b.out %b.log %b.tex auto"))

(setq org-startup-truncated nil)

(setq enable-dir-local-variables :safe)


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/notes/tasks.org" "Tasks")
         "* TODO %?\n  %i\n %U")
        ("n" "Notes" entry (file+datetree "~/notes/notes.org")
         "* %?\nEntered on %U\n  %i\n")
        ("l" "links" entry (file+headline "~/notes/tasks.org" "Links")
         "* TODO [#C] %?\n  %i\n %a \n %U")
        ))

(setq org-ref-default-bibliography '("~/Papers/references.bib")
      org-ref-pdf-directory "~/Papers/pdf/"
      org-ref-bibliography-notes "~/Papers/notes.org")

(setq org-confirm-babel-evaluate nil)
