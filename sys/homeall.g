; homeall.g
; called to home all axes
;
; generated by RepRapFirmware Configuration Tool v3.4.0-LPC-STM32+7 on Fri May 26 2023 21:02:04 GMT+0800 (Singapore Standard Time)
G91                   ; relative positioning
G1 H1 Z130 F3000        ; lift Z relative to current position
G1 H1 X-345 Y225 F3000 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X5 Y-5 F6000    ; go back a few mm
G1 H1 X-345 Y225 F500  ; move slowly to X and Y axis endstops once more (second pass)
G1 H1 Z130 F360       ; move Z up stopping at the endstop
G90                   ; absolute positioning
G92 Z125              ; set Z position to axis maximum (you may want to adjust this)

; Uncomment the following lines to lift Z after probing
;G91                  ; relative positioning
;G1 Z5 F50            ; lift Z relative to current position
;G90                  ; absolute positioning


