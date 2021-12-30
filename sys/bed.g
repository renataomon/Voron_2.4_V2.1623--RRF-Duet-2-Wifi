; bed.g
; called to perform automatic bed compensation via G32

; Clear any bed transform
M561

; Turn off noisy Extruder motor
M84 E0

; Home all axes
G28

; Lower currents, speed & accel
M98 P"/macros/print_scripts/speed_probing.g"
M98 P"/macros/print_scripts/z_current_low.g"
M98 P"/macros/print_scripts/xy_current_low.g"

; Probe the bed at 4 points
M98 P"/sys/bed_probe_points.g"

; Restore high currents, speed & accel
M98 P"/macros/print_scripts/speed_printing.g"
M98 P"/macros/print_scripts/xy_current_high.g"
M98 P"/macros/print_scripts/z_current_high.g"