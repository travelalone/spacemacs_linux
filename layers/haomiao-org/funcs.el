;; from http://kitchingroup.cheme.cmu.edu/blog/2015/03/19/Restarting-org-babel-sessions-in-org-mode-more-effectively/#sec-1
(defun src-block-in-session-p (&optional name)
  "Return if src-block is in a session of NAME.
NAME may be nil for unnamed sessions."
  (let* ((info (org-babel-get-src-block-info))
         (lang (nth 0 info))
         (body (nth 1 info))
         (params (nth 2 info))
         (session (cdr (assoc :session params))))

    (cond
     ;; unnamed session, both name and session are nil
     ((and (null session)
           (null name))
      t)
     ;; Matching name and session
     ((and
       (stringp name)
       (stringp session)
       (string= name session))
      t)
     ;; no match
     (t nil))))

(defun org-babel-restart-session-to-point (&optional arg)
  "Restart session up to the src-block in the current point.
Goes to beginning of buffer and executes each code block with
`org-babel-execute-src-block' that has the same language and
session as the current block. ARG has same meaning as in
`org-babel-execute-src-block'."
  (interactive "P")
  (unless (org-in-src-block-p)
    (error "You must be in a src-block to run this command"))
  (let* ((current-point (point-marker))
         (info (org-babel-get-src-block-info))
         (lang (nth 0 info))
         (params (nth 2 info))
         (session (cdr (assoc :session params))))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward org-babel-src-block-regexp nil t)
        ;; goto start of block
        (goto-char (match-beginning 0))
        (let* ((this-info (org-babel-get-src-block-info))
               (this-lang (nth 0 this-info))
               (this-params (nth 2 this-info))
               (this-session (cdr (assoc :session this-params))))
            (when
                (and
                 (< (point) (marker-position current-point))
                 (string= lang this-lang)
                 (src-block-in-session-p session))
              (org-babel-execute-src-block arg)))
        ;; move forward so we can find the next block
        (forward-line)))))


(defun org-babel-remove-result-buffer ()
  "Remove results from every code block in buffer."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward org-babel-src-block-regexp nil t)
      (org-babel-remove-result))))



(defun update-tag ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((count 1))
      (while (re-search-forward "\\tag{\\([0-9]+\\)}" nil t)
        (replace-match (format "%d" count) nil nil nil 1)
        (setq count (1+ count)))))
  )

(defun update-fig ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((count 1)
          (unique "exjNS0EVjWd6uY6HqioxveNP4gJUr8TL"))
      ;; 临时标签
      (while (re-search-forward "fig\\([0-9]+\\)\\([^0-9]*\\)" nil t)
        (setq match (concat "fig" (match-string 1)))
        (replace-match (format "%d" count) nil nil nil 1)
        (save-excursion
          (while (re-search-forward (concat  "\\(" match "\\)" "\\([^0-9]\\)") nil t)
            (replace-match (format "%s%d" unique count) nil nil nil 1)))
        (setq count (1+ count)))
      ;;替换临时标签
      (goto-char (point-max))
      (while (re-search-backward (concat unique "\\([0-9]+\\)") nil t)
        (replace-match (format "%s%s" "fig" (match-string 1)) nil nil nil nil))
      )))

(defun my-org-screenshot (filename)
;;   "Take a screenshot into a time stamped unique-named file in the
;; same directory as the org-buffer and insert a link to this file."
  (interactive "sScreenshot name:")
  (if (equal filename "")
      (setq filename
            (concat
             (make-temp-name
              (concat (file-name-nondirectory (buffer-file-name))
                      "_imgs/"
                      (format-time-string "%Y%m%d_%H%M%S_")) )
             ".png"))
    (setq filename
            (concat (file-name-nondirectory (buffer-file-name))
                    "_imgs/"
                    filename
                    ".png")))

  (unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
					; take screenshot
  (if (eq system-type 'darwin)
      (progn
	(call-process-shell-command "screencapture" nil nil nil nil " -s " (concat
									    "\"" filename "\"" ))
	(call-process-shell-command "convert" nil nil nil nil (concat "\"" filename "\" -resize  \"100%\"" ) (concat "\"" filename "\"" ))
	))
  (if (eq system-type 'gnu/linux)
      (call-process-shell-command "gnome-screenshot" nil nil nil nil " -a -f " filename))
					; insert into file if correctly taken
  (if (file-exists-p filename)
      (insert (concat "[[file:" filename "]]")))
  (org-display-inline-images)
  )

(global-set-key (kbd "C-c s c") 'my-org-screenshot)


(defun haomiao/org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'file))

(defun haomiao/org-archive-cancel-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/CANCELLED" 'file))

(defun org-link-describe (link desc)
  (if (file-exists-p link)
      desc
    (read-string "Description: " desc)))

(setf org-make-link-description-function #'org-link-describe)
