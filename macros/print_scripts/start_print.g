M83  ; set extruder to relative mode
G21  ; set units to mm

T0  ; select tool 0

G92 E0.0  ; reset extruder position
M220 S100 ; reset speed multiplier

; reset firmware retraction
;M207 S5.0 F5000 T3200 Z0.4

; level the gantry while everything is hot
G32
G1 E-1 F320
M98 P"/macros/print_scripts/goto_bucket.g"
M98 P"/macros/print_scripts/do_nozzle_wipe.g"



; Final Z height adjust
M98 P"/macros/print_scripts/goto_z_switch.g"
G30 K1 Z-99999

; Load previously probed bed mesh (optional, use only if you know your bed is warped)
;G29 S1

M98 P"/macros/print_scripts/goto_bed_center.g"

G4 S30			; wait 10s

G0 X5 Y5 F5000 ; linear move to the X30 Y5
G1 Z0.4 f300 ;move Z 0.4mm
G1 E1 F320
G92 E0 ;Set the current position
G1 X100 E30 F500 ;move to X100
G1 E-0.1 F320
G10
G1 Z2
G92 E0


; start bay cooling fan
M106 P3 S.7
