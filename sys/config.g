; Configuration file for Duet WiFi (firmware version 3.3 or newer)
; executed by the firmware on start-up

; General preferences
M111 S0                 ; Debugging off
G21                     ; Work in millimetres
G90                     ; Send absolute coordinates...
M83                     ; ...but relative extruder moves
M555 P2                 ; Set firmware compatibility to look like Marlin
;M575 P1 B57600 S1       ; Comms parameters for PanelDue
;M564 S1 H1              ; Forbid axis movements when not homed
M564 H0


;M575 P1 B57600 S2
M918 P2 E4 C30 R6 F100000		; Fysetc 12864 display
M150 R100 P255 X4

; General setup
M669 K1                 ; Select CoreXY mode (2.03 and up)

; Network
M550 P"Voron 2.4"	        ; Set machine name
M98 P"/sys/config-wifi.g"       ; contains M587 with AP name and password
M552 S1                 ; Enable network
M586 P0 S1              ; Enable HTTP (for DWC)
M586 P1 S1              ; Enable FTP (for remote backups)
M586 P2 S0              ; Disable Telnet

; --- drive map ---
;          E0
;    _______
;   | YB| YA|
;   | 6 | 7 |
;   | ----- |
;   | 5 | 8 |
;    -------
;     front

; Drive directions
M569 P0 S0 ; A (X (right) motor direction)
M569 P1 S0 ; B (Y (left) motor direction)
M569 P3 S1 ; Extruder #1
M569 P5 S1 ; Z1
M569 P6 S1 ; Z2
M569 P7 S0 ; Z3
M569 P8 S0 ; Z4

; Motor mapping and steps per mm
M584 X0 Y1 Z5:6:7:8 E3
M350 X16 Y16 Z16 E16:16 I1      ; Use 1/16 microstepping with interpolation everywhere
M92 X80 Y80 Z400                ; Set XYZ steps per mm (1.8deg motors)
M92 E418                        ; Set Extruder steps per mm

;M350 Z16 I0 ; disable Z interpolation

; Drive currents
M906 X1300 Y1300 Z900 E800     ; XYZ and E current
M906 I30                        ; Idle current percentage
M84 S120                        ; Idle timeout

; Endstops
M574 X2 S1 P"!xstop"   				   ; X min active low endstop switch
M574 Y2 S1 P"!ystop"   				   ; Y min active low endstop switch
M574 Z0 S1                    ; Z min active low endstop switch

; Axis Limits
;M208 X5 Y0 Z0 S1                                   ; set axis minima
;M208 X300 Y300 Z250 S0                             ; set axis maxima
M208 X1:301 Y2:306 Z-0:250  ; min:max (-z possible with bed level compensation)


; Bed leveling
M671 X-50:-50:350:350 Y5:370:370:5 S20	           ; Z leadscrews positions Left Front - Let Rear - Right Rear - Right Front
M557 X20:280 Y-20:280 P10                            ; define mesh grid

; Accelerations and speed
M98 P"/macros/print_scripts/speed_printing.g"

; Bed heater, dual thermistor setup (one for the heater + one for the bed)
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950         ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                                  ; create bed heater output on bedheat and map it to sensor 0
;M307 H0 B0 S1
M140 H0                                                ; map heated bed to heater 0
;M143 P100 H0 X103 A2 C0 S120                    ; make sure silicone heater stays below 110°C
;M143 P101 H0 X103 A1 C0 S125                    ; make sure silicone heater shuts down at 125°C (there is a fuse at 125°C)
M143 H0 P0 S120 A2                                    ; maximum bed temperature
M570 H0 T10 S130                                ; heater fault timeout

; Hotend #1 heater
M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.06e-8          ;configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                   ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S0.8
M143 H1 P0 S285 A2           ; set temperature limit for heater 1 to 280C                              
;M143 H1 S285									; set temperature limit for heater 1 to 280C
M302 S185 R185                                         ; min extrusion (cold extrusion) temp
M570 H1 T10 S120                                ; heater fault timeout


; Chamber temperature sensor via temperature daughterboard pins on Duex
M308 S2 P"e1temp" Y"thermistor" T100000 B4725 C7.06e-8 A"Chamber"
M950 H2 C"Chamber" T1

; mcu / drivers temperature sensor
M308 S3 Y"drivers" A"DRIVERS"  ; configure sensor 2 as temperature warning and overheat flags on the TMC2660 on Duet
M308 S4 Y"drivers-duex" A"DRIVERS-Duex"  ; configure sensor 2 as temperature warning and overheat flags on the TMC2660 on Duetdrivers-duex
M308 S5 Y"mcu-temp" A"MCU" ; configure sensor 3 as thermistor on pin e1temp for left stepper

; Z probes
M98 P"/macros/print_scripts/z_probes.g"


; Fans Hotend + Part
M950 F0 C"duex.fan4" Q100                                  ; create fan 0 on pin fan0 and set its frequency - Part
M106 P0 S0 H-1 C"PartFan"                              ; set fan 0 value. Thermostatic control is turned off - Part
M950 F1 C"duex.fan5" Q250                                  ; create fan 1 on pin fan1 and set its frequency - Hotend
M106 P1 S1 H1 T50 C"HotendFan"                         ; set fan 1 value. Thermostatic control is turned on - Hotend

; Fans Chamber
M950 F3 C"duex.fan3" Q100                             ; create fan 3 on pin duex.fan4 and set its frequency
;M106 P3 S0.7 H1 T200 C"FilterFan"                      ; set fan 3 value. Thermostatic control is turned on

;fan mcu_temp
M950 F2 C"duex.fan6" Q100                      ; create fan 2 on pin duex.fan3 and set its frequency               
M106 S0.5 P2 H3:4:5 L0.2 X1 B0.25 T45:70 H100:101:102 C"ElectronicsFans"              ; set fan 2 value

; Tools
M563 P0 S"E3D V6" D0 H1 F0                             ; define tool 0
G10 P0 X0 Y0 Z0                     ; Set tool 0 axis offsets
G10 P0 R0 S0                        ; Set initial tool 0 active and standby temperatures to 0C

; Setup retraction (see directory for options)
M98 P"/macros/print_scripts/retraction.g"

; Misc
M376 H10                            ; Fade mesh out compensation over 10mm Z
M912 P0 S-7.9						; Calibrating the MCU temperature
M501                                ; load config-override.g
M911 S22 R23 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"     ; set voltage thresholds and actions to run on power loss
T0                                  ; select tool 0
M200 D1.75							; Set filament diameter
M702