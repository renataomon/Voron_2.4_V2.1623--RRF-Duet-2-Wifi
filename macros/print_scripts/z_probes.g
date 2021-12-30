; z Probes
M558 K0 P5 C"zprobe.in" H10 F600 T7000 A2 S0 R0.1     	; set Z probe type to unmodulated and the dive height + speeds
G31 K0 P500 X0 Y25 Z5.55 					; inductive probe offset, not critical, only used for coarse homing
M558 K1 P8 C"zstop" T6000 F120 H10 A3 S0.005 B1 R0.2
G31 K1 P500 X0 Y0 Z2.35             ; Z switch offset (if positive, greater value = lower nozzle. if negative, more negative = higher nozzle)