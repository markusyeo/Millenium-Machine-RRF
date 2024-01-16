
; Probe TOOL TCP
; List of Variables 
; PROBE LOCATION XY = X0 Y150  	; specify the z probe location based on global machine coordinate system in millimeters 
; TOOL # = 1	; Specify your desired tool " Tool 1 is Milo's active tool number"
; K# = 0 	; Specify the probe you want to used, this is configured in your Config.g file
; G30 is used to probe for tool TCP 

;SETUP 
T1	P0	                                        ; Select tool 1 to turn it on but don't execute tool change scripts
M5 												; STOP SPINDLE
;G4 S1			          						; pause 1 second
G21				                    			; make sure we’re in mm
G90   											; Absolute Mode	
G53 G1 Z80 F3000 								; Raise Head
;M42 P2 S0.0           							; turn off Output # 2 (Air Blaster) (RANGE : 0 to 255 or 0.0 to 1.0) 

;Tool  Probe Z
G53 G1 X0 Y150 F3000     						; Use machine coordinates Move to Z Probe Location
M203 X300 Y300 Z300                             ; Limit Feedrate
G30 s-1 k0 	               				        ; Probe in the Z direction and update tool z offset

;MOVE UP TOOL AND PERFORM A SECOND PROBE 
G91                                             ; Relative Coordinates
G1 Z3 F800                                      ; Raise z 3mm after probing
G90                                             ; Absolute Coordinates
M203 X25 Y25 Z100                               ; Limit Feedrate
G30 s-1 k0      	               				; Probe in the Z direction and update tool z offset
G10 L20 P0 X0 Y0 Z44                          ; Set WCS1 Coordinates assumptions are Sexbolt is 40mm above bed, wasteboard 3mm thick, 1mm of wasteboard penetration
M203 X3000 Y3000 Z800                           ; Reset Feedrate
G53 G1 Z80 F3000 								; Raise Head
G90                                             ; Absolute Coordinates

M291 P"Probing complete. Tool Offset Updated." R"Success" S1    ; screen message

;Turn Air Blaster Back On
;M42 P2 S1.0           ; turn off fan# 2 (Air Blaster) (RANGE : 0 to 255 or 0.0 to 1.0) 