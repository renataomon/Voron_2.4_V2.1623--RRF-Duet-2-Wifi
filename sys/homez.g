; homez.g
; called to home the Z axis

; Lift Z relatively to current position
G91
G1 Z15 F2000

M98 P"/macros/print_scripts/goto_bed_center.g"
M98 P"/macros/print_scripts/speed_probing.g"      ; Setup low speed & accel
G30 K1 Z-99999                                    ; Probe the Z pin at the back
M98 P"/macros/print_scripts/z_current_high.g"     ; Restore high Z currents
M98 P"/macros/print_scripts/speed_printing.g"     ; Restore normal speed & accel