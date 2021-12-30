; Probe the bed at 4 points, 5X for more precision


M558 K0 H7 F1200 ; increase the depth range, gets the gantry mostly level immediately
while iterations <=1                                       	    ; Perform 2 passes.
	G30 K0 P0 X30 Y30 Z-99999								; probe Z left front
	G30 K0 P1 X30 Y270 Z-99999     							; probe Z left rear
	G30 K0 P2 X275 Y270 Z-99999						    ; probe Z right rear
	G30 K0 P3 X275 Y30 Z-99999 S4							; probe Z right front

M558 K0 H4 F600 ; increase the depth range, gets the gantry mostly level immediately
	G30 K0 P0 X30 Y30 Z-99999								; probe Z left front
	G30 K0 P1 X30 Y270 Z-99999     							; probe Z left rear
	G30 K0 P2 X275 Y270 Z-99999						    ; probe Z right rear
	G30 K0 P3 X275 Y30 Z-99999 S4							; probe Z right front

M558 K0 H1 F60   ; reduce depth range, probe slower for better repeatability
	G30 K0 P0 X30 Y30 Z-99999								; probe Z left front
	G30 K0 P1 X30 Y270 Z-99999     							; probe Z left rear
	G30 K0 P2 X275 Y270 Z-99999						    ; probe Z right rear
	G30 K0 P3 X275 Y30 Z-99999 S4							; probe Z right front
