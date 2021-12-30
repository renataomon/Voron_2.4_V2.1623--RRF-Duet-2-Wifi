; assumes we are homed
M98 P"/macros/print_scripts/goto_bucket.g"

G1 Z8

G91 ; relative
G1 Y-5 F20000
G1 X+50
G1 X-50
G1 X+50
G1 X-50
G1 X+50

G1 Y-20 Z10 F3000

G90 ; absolute

;M98 P"/macros/print_scripts/goto_bed_center.g"