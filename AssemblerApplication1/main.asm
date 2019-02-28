;
; AssemblerApplication1.asm
;
; Created: 2/26/2019 10:16:50 PM
; Author : theethawat
; Thank you : https://www.instructables.com/id/Command-Line-Assembly-Language-Programming-for-Ard/

.INCLUDE "m328Pdef.inc"
.DEF VAR_A = r16
.DEF VAR_B = r17
.DEF VAR_Answer = r18
.DEF Temp = r29

.CSEG ; Code
		; 1 = out 0 = in  F=1111 FF=11111111
		;7 6 5 4 3 2 1 0 is the port of PB
		;i want to use port PB0,PB1,PB2,PB3 as input

		;config input port
.ORG    0x00
		rjmp Start

Start:	clr temp
		ldi VAR_A,0b11111100; PB0
		out DDRB,VAR_A
	
		ldi VAR_B,0b11110011 ; PB1
		out DDRB,VAR_B

		;ldi VAR_Bl,0xfc ; PB2
		;out DDRB,VAR_Bl
	
		;ldi VAR_Bh,0xfb ; PB3
		;out DDRB,VAR_Bh

		;ldi Temp,0b00000011 ;PC0
		;out DDRC,Temp
		;out PortC,Temp
		
	
		in VAR_A,PinB
		in VAR_B,PinB
		;in VAR_Bh,PinB
		;in VAR_Bl,PinB
		lsr VAR_B
		lsr VAR_B
		mov VAR_Answer,VAR_A
		add VAR_Answer,VAR_B
		
		mov temp,VAR_Answer
		out DDRC,temp
		out PortC,temp
		rjmp Start

		

.DSEG ; Data
.ESEG ; EEprom

		

		
		;out DDRC,Output2

		
		;out DDRC,Output3

		;
		;out DDRC,Output4
;DDRB stands for "Data Direction Register B" and 
	;it sets up the "pins" on PortB. On the pinout map for the 328p
	; you can see that there are 8 pins labeled PB0, PB1, ... , PB7.
; when we load the binary number 00100000 into the DDRB register 
	;we are saying that we want PB0, PB1, PB2, PB3, PB4, PB6, and PB7 set as INPUT pins 
	;since they have 0's in them, and PB5 is set as an OUTPUT pin since we put a 1 in that spot.