; give one last chance to cancel...
M291 P"This will replace the existing bed mesh. Are you sure?" R"Bed Mesh" S3

; Level the gantry so we can park the carriage in the middle of the bed
;G32
G28
;M98 P"/macros/print_scripts/goto_bed_center.g"

; Heat the bed to 100C
M291 P"Heating up the bed..." R"Probing New Bed Mesh" T5
M190 S110

; Set the hotend to 220C
M291 P"Heating up the hotend..." R"Bed Mesh" T5
G10 P0 S220
M116

; Level the gantry again while everything is hot
G32

; ignore current heightmap
M561


; Establish final Z ref
;M291 P"Final Z ref..." R"Bed Mesh" T5
;M98 P"/macros/print_scripts/goto_z_switch.g"
G28

; Get the reference Z offset
;M98 P"/macros/print_scripts/goto_bed_center.g"
G30 S-3

; Probe a new bed mesh!
M291 P"Probing now!" R"Bed Mesh" T5
G29 S0

; Done, move to center and turn off heat
M98 P"/macros/print_scripts/goto_bed_center.g"
G10 P0 S0
M140 S0

M291 P"Done!" R"Bed Mesh" T5