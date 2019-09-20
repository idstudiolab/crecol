EESchema Schematic File Version 4
LIBS:crecol_led_pcb_v20-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L _switch:SWITCH_SPST SW0
U 1 1 5D37324A
P 5750 3950
F 0 "SW?" V 5400 3850 60  0000 L CNN
F 1 "SPST" V 5500 3850 60  0000 L CNN
F 2 "_switch:RAFI_MICON5_SMD" H 5750 3950 60  0001 C CNN
F 3 "" H 5750 3950 60  0001 C CNN
	1    5750 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R0
U 1 1 5D37350D
P 5350 3650
F 0 "R?" H 5409 3696 50  0000 L CNN
F 1 "10K" H 5409 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5350 3650 50  0001 C CNN
F 3 "~" H 5350 3650 50  0001 C CNN
	1    5350 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C0
U 1 1 5D3737D1
P 5350 3950
F 0 "C?" H 5442 3996 50  0000 L CNN
F 1 "100nF" H 5442 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5350 3950 50  0001 C CNN
F 3 "~" H 5350 3950 50  0001 C CNN
	1    5350 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J0
U 1 1 5D37394D
P 4750 3800
F 0 "J?" H 4750 4150 50  0000 C CNN
F 1 "Conn_01x03" H 4850 4050 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B3B-PH-K_1x03_P2.00mm_Vertical" H 4750 3800 50  0001 C CNN
F 3 "~" H 4750 3800 50  0001 C CNN
	1    4750 3800
	-1   0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0102
U 1 1 5D373B88
P 5350 3500
F 0 "#PWR0102" H 5350 3350 50  0001 C CNN
F 1 "+3V3" H 5365 3673 50  0000 C CNN
F 2 "" H 5350 3500 50  0001 C CNN
F 3 "" H 5350 3500 50  0001 C CNN
	1    5350 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0103
U 1 1 5D374783
P 5000 3500
F 0 "#PWR0103" H 5000 3350 50  0001 C CNN
F 1 "+3V3" H 5015 3673 50  0000 C CNN
F 2 "" H 5000 3500 50  0001 C CNN
F 3 "" H 5000 3500 50  0001 C CNN
	1    5000 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3700 5000 3700
$Comp
L _switch:SWITCH_SPST SW1
U 1 1 5D374A4C
P 6100 3950
F 0 "SW?" V 5750 3850 60  0000 L CNN
F 1 "SPST" V 5850 3850 60  0000 L CNN
F 2 "_switch:RAFI_MICON5_SMD" H 6100 3950 60  0001 C CNN
F 3 "" H 6100 3950 60  0001 C CNN
	1    6100 3950
	0    1    1    0   
$EndComp
$Comp
L _switch:SWITCH_SPST SW2
U 1 1 5D374A86
P 6450 3950
F 0 "SW?" V 6100 3850 60  0000 L CNN
F 1 "SPST" V 6200 3850 60  0000 L CNN
F 2 "_switch:RAFI_MICON5_SMD" H 6450 3950 60  0001 C CNN
F 3 "" H 6450 3950 60  0001 C CNN
	1    6450 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	6450 3800 6450 3850
Wire Wire Line
	5350 3750 5350 3800
Connection ~ 5350 3800
Wire Wire Line
	5350 3800 5750 3800
Wire Wire Line
	5350 3850 5350 3800
Wire Wire Line
	5350 3550 5350 3500
Wire Wire Line
	5750 3850 5750 3800
Connection ~ 5750 3800
Wire Wire Line
	5750 3800 6100 3800
Wire Wire Line
	6100 3850 6100 3800
Connection ~ 6100 3800
Wire Wire Line
	6100 3800 6450 3800
Wire Wire Line
	5350 4150 5350 4100
Wire Wire Line
	4950 3900 5000 3900
Wire Wire Line
	5350 4100 5750 4100
Wire Wire Line
	5750 4100 5750 4050
Connection ~ 5350 4100
Wire Wire Line
	5350 4100 5350 4050
Wire Wire Line
	5750 4100 6100 4100
Wire Wire Line
	6100 4100 6100 4050
Connection ~ 5750 4100
Wire Wire Line
	6100 4100 6450 4100
Wire Wire Line
	6450 4100 6450 4050
Connection ~ 6100 4100
Wire Wire Line
	5000 3900 5000 4150
Wire Wire Line
	4950 3800 5350 3800
Wire Wire Line
	5000 3500 5000 3700
$Comp
L power:GND #PWR0101
U 1 1 5D39ED79
P 5000 4150
F 0 "#PWR0101" H 5000 3900 50  0001 C CNN
F 1 "GND" H 5005 3977 50  0000 C CNN
F 2 "" H 5000 4150 50  0001 C CNN
F 3 "" H 5000 4150 50  0001 C CNN
	1    5000 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5D39F0DA
P 5350 4150
F 0 "#PWR0104" H 5350 3900 50  0001 C CNN
F 1 "GND" H 5355 3977 50  0000 C CNN
F 2 "" H 5350 4150 50  0001 C CNN
F 3 "" H 5350 4150 50  0001 C CNN
	1    5350 4150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
