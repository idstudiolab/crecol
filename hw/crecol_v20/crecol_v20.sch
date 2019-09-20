EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:DIN-7 J?
U 1 1 5CFD50EC
P 2200 3500
F 0 "J?" H 2200 3133 50  0000 C CNN
F 1 "DIN-7" H 2200 3224 50  0000 C CNN
F 2 "" H 2200 3500 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 2200 3500 50  0001 C CNN
	1    2200 3500
	-1   0    0    1   
$EndComp
Text GLabel 2600 3500 2    50   Input ~ 0
RXD
Text GLabel 2600 3400 2    50   Input ~ 0
TXD
Text GLabel 2600 3600 2    50   Input ~ 0
HS4
Text GLabel 1800 3500 0    50   Input ~ 0
HS1
Text GLabel 1800 3600 0    50   Input ~ 0
HS2
Text GLabel 2200 3900 3    50   Input ~ 0
HS3
Text GLabel 1800 3400 0    50   Input ~ 0
5V
Text Notes 2550 3250 0    50   ~ 0
HSX: Parallel handswitch input lines.  \nMight be used for up/down??\n
Wire Wire Line
	2500 3400 2600 3400
Wire Wire Line
	2500 3500 2600 3500
Wire Wire Line
	2500 3600 2600 3600
Wire Wire Line
	2200 3800 2200 3900
Wire Wire Line
	1900 3600 1800 3600
Wire Wire Line
	1800 3500 1900 3500
Wire Wire Line
	1900 3400 1800 3400
$Comp
L Connector:DIN-7 J?
U 1 1 5CFD5BEF
P 2200 2300
F 0 "J?" H 2200 1933 50  0000 C CNN
F 1 "DIN-7" H 2200 2024 50  0000 C CNN
F 2 "" H 2200 2300 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 2200 2300 50  0001 C CNN
	1    2200 2300
	-1   0    0    1   
$EndComp
Text GLabel 2600 2300 2    50   Input ~ 0
RXD
Text GLabel 2600 2200 2    50   Input ~ 0
TXD
Text GLabel 2600 2400 2    50   Input ~ 0
HS4
Text GLabel 1800 2300 0    50   Input ~ 0
HS1
Text GLabel 1800 2400 0    50   Input ~ 0
HS2
Text GLabel 2200 2700 3    50   Input ~ 0
HS3
Text GLabel 1800 2200 0    50   Input ~ 0
5V
Wire Wire Line
	2500 2200 2600 2200
Wire Wire Line
	2500 2300 2600 2300
Wire Wire Line
	2500 2400 2600 2400
Wire Wire Line
	2200 2600 2200 2700
Wire Wire Line
	1900 2400 1800 2400
Wire Wire Line
	1800 2300 1900 2300
Wire Wire Line
	1900 2200 1800 2200
$Comp
L _arduino_shieldsNCL:ARDUINO_SHIELD SHIELD?
U 1 1 5CE7B58A
P 4350 5750
F 0 "SHIELD?" H 4350 6937 60  0000 C CNN
F 1 "ARDUINO_SHIELD" H 4350 6831 60  0000 C CNN
F 2 "" H 4350 5650 50  0001 C CNN
F 3 "" H 4350 5650 50  0001 C CNN
	1    4350 5750
	1    0    0    -1  
$EndComp
Text GLabel 6350 6650 2    50   Input ~ 0
RXD
Text GLabel 5400 6450 2    50   Input ~ 0
HS1
Text GLabel 5400 6350 2    50   Input ~ 0
HS2
Text GLabel 5400 6250 2    50   Input ~ 0
HS3
Text GLabel 5400 6150 2    50   Input ~ 0
HS4
Wire Wire Line
	5300 6150 5400 6150
Wire Wire Line
	5300 6250 5400 6250
Wire Wire Line
	5300 6350 5400 6350
Wire Wire Line
	5400 6450 5300 6450
Text GLabel 6350 6550 2    50   Input ~ 0
RXD
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5CE7FB9D
P 6050 6550
F 0 "JP?" H 6050 6755 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 6050 6664 50  0000 C CNN
F 2 "" H 6050 6550 50  0001 C CNN
F 3 "~" H 6050 6550 50  0001 C CNN
	1    6050 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 6550 5900 6550
Wire Wire Line
	6200 6550 6350 6550
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 5CE80B24
P 6050 6650
F 0 "JP?" H 6050 6500 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 6050 6400 50  0000 C CNN
F 2 "" H 6050 6650 50  0001 C CNN
F 3 "~" H 6050 6650 50  0001 C CNN
	1    6050 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 6650 6350 6650
Wire Wire Line
	5300 6650 5900 6650
Text GLabel 2900 5650 0    50   Input ~ 0
5V
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5CE81B74
P 3150 5650
F 0 "JP?" H 2550 5850 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 2900 5750 50  0000 C CNN
F 2 "" H 3150 5650 50  0001 C CNN
F 3 "~" H 3150 5650 50  0001 C CNN
	1    3150 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 5650 3000 5650
Wire Wire Line
	3300 5650 3400 5650
$Comp
L power:GND #PWR?
U 1 1 5CE8272F
P 3150 5900
F 0 "#PWR?" H 3150 5650 50  0001 C CNN
F 1 "GND" H 3155 5727 50  0000 C CNN
F 2 "" H 3150 5900 50  0001 C CNN
F 3 "" H 3150 5900 50  0001 C CNN
	1    3150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5750 3150 5750
Wire Wire Line
	3150 5750 3150 5850
Wire Wire Line
	3400 5850 3150 5850
Connection ~ 3150 5850
Wire Wire Line
	3150 5850 3150 5900
$EndSCHEMATC
