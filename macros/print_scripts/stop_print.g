G91				; relative positioning
M83                             ; extruder relative positioning
G1 E-5.00 F1000                 ; retract 5mm of filament
G1 Z1.00 X20.0 Y20.0 F20000     ; short quick move to disengage from print
G1 Z10.00  F20000               ; move Z-Axis 10mm away from part
G90                             ; absolute positioning
G1 X280 Y280 F9000              ; move gantry close to home
G1 E-3.00 F1000
M104 S0                         ; turn off hotend
M140 S0                         ; turn off heatbed
M106 S0                         ; shut off blower
M702 							; unload filament
M84                             ; turn off motors

; stop bay cooling fan
M106 P3 S0

; reset
;M999