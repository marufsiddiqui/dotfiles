(defun focus-frame (group f)
"Focus frame but do not show-frame-indicator in certain cases."
  (let ((w (frame-window f))
        (last (tile-group-current-frame group))
        (show-indicator nil))
    (setf (tile-group-current-frame group) f)
    (unless (eq f last)
      (setf (tile-group-last-frame group) last)
      (run-hook-with-args *focus-frame-hook* f last)
      (setf show-indicator t))
    (if w (focus-window w) (no-focus group (frame-window last)))
    (if show-indicator (show-frame-outline group))))

(defun shift-windows-forward (frames win)
  (when frames
          (let ((frame (car frames)))
                 (shift-windows-forward (cdr frames)
                                        (frame-window frame))
                 (when win
                         (pull-window win frame)))))
