(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/notes/tasks.org" "Tasks")
         "* TODO %?\n  %i\n %U")
        ("n" "Notes" entry (file+datetree "~/notes/notes.org")
         "* %?\nEntered on %U\n  %i\n")
        ("l" "links" entry (file+headline "~/notes/tasks.org" "Links")
         "* TODO [#C] %?\n  %i\n %a \n %U")
        ))
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[11pt]{ctexart}
                                        [NO-DEFAULT-PACKAGES]
                                        \\usepackage[utf8]{inputenc}
                                        \\usepackage[T1]{fontenc}
                                        \\usepackage{fixltx2e}
                                        \\usepackage{graphicx}
                                        \\usepackage{longtable}
                                        \\usepackage{wrapfig}
                                        \\usepackage{rotating}
                                        \\usepackage[normalem]{ulem}
                                        \\usepackage{amsmath}
                                        \\usepackage{textcomp}
                                        \\usepackage{marvosym}
                                        \\usepackage{wasysym}
                                        \\usepackage{amssymb}
                                        \\usepackage{booktabs}
                                        \\usepackage[colorlinks]{hyperref}
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
 ;;        "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f %f"
         "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
         "bibtex %b.aux"
         "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
         "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
         "rm -fr %b.out %b.log %b.tex auto"))

(setq org-startup-truncated nil)

(setq enable-dir-local-variables :safe)


(setq org-ref-default-bibliography '("/media/haomiao/1edf095c-5c59-4b59-9a50-7d30fe062c61/haomiao/Documents/references.bib")
      org-ref-pdf-directory "/media/haomiao/1edf095c-5c59-4b59-9a50-7d30fe062c61/haomiao/Documents/pdf/")
;;      org-ref-bibliography-notes "~/Papers/notes.org"

(setq org-confirm-babel-evaluate nil)

(add-hook 'org-mode-hook
          '(lambda ()
             (setq org-file-apps
                   (append '(("\\.pdf::\\([0-9]+\\)\\'" . "okular \"%s\" -p %1")
                             ) org-file-apps))))


(setq org-plantuml-jar-path "~/Documents/plantuml.jar")
(setq org-ditaa-jar-path "~/Documents/ditaa0_9.jar")
(setq ein:use-auto-complete t)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
