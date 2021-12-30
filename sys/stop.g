; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)

; Turn off Bed, Extruder and Fan
M140 S0
M104 S0
M106 S0

; unload filament
M702

;Turn off chamber fan
M106 P3 S0

; reset
M999