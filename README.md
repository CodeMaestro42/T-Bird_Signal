# T-Bird_Signal
Implementation of State Machine simulating car blinker signal of Ford Thunderbird car. 

Part of New Jersey Institute Of Technology Department of Electrical and Computer Engineering department. 

ECE 495 Lab 3

Following is taken from lab manual

"In this experiment, we will implement the turn signal control of a Thunderbird (T-bird) car using VHDL and the Altera DE2 Board. The left and right turn signals of the T-bird each contain 3 lights. There are three binary inputs to the control, LEFT, RIGHT, and HAZARD. When LEFT = 1 or RIGHT = 1, the lights flash according to the patterns shown in Figure 3.1. Note that LEFT and RIGHT cannot be 1 at the same time and if the switch from LEFT =1 to RIGHT = 1 or RIGHT = 1 to LEFT = 1 occurs in middle of a flashing sequence, the control should starts the new sequence from the beginning. In addition, the HAZARD takes precedence over LEFT and RIGHT. When HAZARD = 1, all six lights will flash on and off."


