; https://duet3d.dozuki.com/Wiki/Pressure_advance
; https://www.reddit.com/r/voroncorexy/comments/5415kb/retract_speeds/

; Retraction

;M207 S2.9         ;Distance retract
;M207 F1800	      ;Retract Velocity
;M207 R-0.1        ;Prime Amount
;M207 Z0.0         ;Z-HOP

;M207 S2.9 F1800 R-0.1 Z0.0
M207 S1.2 F1800 R-0.1 Z0.2
M207

; Pressure Advance
;M572 D0 S0.6      ;PA
M572 D0 S0.06      ;PA
M572