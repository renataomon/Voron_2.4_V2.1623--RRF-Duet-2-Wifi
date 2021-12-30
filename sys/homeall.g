; homeall.g
; called to home all axes

; Allow movements before homing
M564 H0

; Relative positioning
G91

; Lift Z
G1 Z15 F2000


; Lower currents, speed & accel
M98 P"/macros/print_scripts/xy_current_low.g"
M98 P"/macros/print_scripts/z_current_low.g"
M98 P"/macros/print_scripts/speed_probing.g"

; Lift Z relative to current position if needed
;if !move.axes[2].homed
;  G1 Z10 F5000 H1
;elif move.axes[2].userPosition < 10
;  G1 Z10 F5000

G1 H1 X310 F6000      ; move quickly to X axis endstops and stop there (first pass)
G1 X-5 F2400          ; go back a few mm
G1 H1 X20 F180        ; move slowly to X axis endstop once more (second pass)

G1 H1 Y310 F6000      ; move quickly to Y axis endstops and stop there (first pass)
G1 Y-5 F2400          ; go back a few mm
G1 H1 Y20 F180        ; move slowly to X axis endstop once more (second pass)

; Absolute positioning
G90

; Home Z Home Z in the center bed
M98 P"/macros/print_scripts/goto_bed_center.g"
G30 K0 Z-9999

; Restore high currents, speed & accel
M98 P"/macros/print_scripts/xy_current_high.g"
M98 P"/macros/print_scripts/z_current_high.g"
M98 P"/macros/print_scripts/speed_printing.g"