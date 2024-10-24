
############################  Search PATH ################################

lappend search_path /home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys
lappend search_path /home/IC/Projects/System/RTL/ALU
lappend search_path /home/IC/Projects/System/RTL/ASYNC_FIFO
lappend search_path /home/IC/Projects/System/RTL/CLKDIV_MUX
lappend search_path /home/IC/Projects/System/RTL/Clock_Divider
lappend search_path /home/IC/Projects/System/RTL/Clock_Gating
lappend search_path /home/IC/Projects/System/RTL/DATA_SYNC
lappend search_path /home/IC/Projects/System/RTL/RegFile
lappend search_path /home/IC/Projects/System/RTL/PULSE_GEN
lappend search_path /home/IC/Projects/System/RTL/RST_SYNC
lappend search_path /home/IC/Projects/System/RTL/SYS_CTRL
lappend search_path /home/IC/Projects/System/RTL/UART/UART_RX
lappend search_path /home/IC/Projects/System/RTL/UART/UART_TX
lappend search_path /home/IC/Projects/System/RTL/UART/UART_TOP
lappend search_path /home/IC/Projects/System/RTL/TOP

########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "../dft/$top_module.svf"

####################### Read Reference tech libs ########################
 

set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

###################  Read Reference Design Files ######################## 
read_verilog -container Ref "ALU.v"
read_verilog -container Ref "FIFO_DF_SYNC.v"
read_verilog -container Ref "FIFO_MEM_CTRL.v"
read_verilog -container Ref "FIFO_RD.v"
read_verilog -container Ref "FIFO_WR.v"
read_verilog -container Ref "B2G_encoder.v"
read_verilog -container Ref "ASYNC_FIFO_TOP.v"
read_verilog -container Ref "CLK_DIV_MUX.v"
read_verilog -container Ref "CLK_DIVIDER.v"
read_verilog -container Ref "CLK_GATING.v"
read_verilog -container Ref "DATA_SYNC.v"
read_verilog -container Ref "RegFile.v"
read_verilog -container Ref "PULSE_GEN.v"
read_verilog -container Ref "RST_SYNC.v"
read_verilog -container Ref "SYS_CTRL.v"
read_verilog -container Ref "RX_DATA_SAMPLING.v"
read_verilog -container Ref "RX_DESERIALIZER.v"
read_verilog -container Ref "RX_EDGE_BIT_COUNTER.v"
read_verilog -container Ref "RX_PARITY_CHECK.v"
read_verilog -container Ref "RX_STOP_CHECK.v"
read_verilog -container Ref "RX_START_CHECK.v"
read_verilog -container Ref "UART_RX_TOP.v"
read_verilog -container Ref "RX_FSM.v"
read_verilog -container Ref "TX_MUX.v"
read_verilog -container Ref "mux2X1.v"
read_verilog -container Ref "TX_PARITY_CALC.v"
read_verilog -container Ref "TX_SERIALIZER.v"
read_verilog -container Ref "TX_FSM.v"
read_verilog -container Ref "UART_TX_TOP.v"
read_verilog -container Ref "SYSTEM_TOP.v"

######################## set the top Reference Design ######################## 

set_reference_design SYS_TOP
set_top SYS_TOP

####################### Read Implementation tech libs ######################## 

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

#################### Read Implementation Design Files ######################## 

read_verilog -container Imp -netlist "/home/IC/Projects/System/dft/netlists/SYS_TOP.v"

####################  set the top Implementation Design ######################

set_implementation_design SYS_TOP
set_top SYS_TOP
# do not verify scan in & scan out ports as a compare point as it is existed only after synthesis and not existed in the RTL

#scan_out
set_dont_verify_points -type port Ref:/WORK/*/SO*
set_dont_verify_points -type port Imp:/WORK/*/SO*

############################### contants #####################################

# all atpg enable(test_mode, scan_enable) are zero during formal compare

#test_mode
set_constant Ref:/WORK/*/test_mode 0
set_constant Imp:/WORK/*/test_mode 0

#scan_enable
set_constant Ref:/WORK/*/SE 0
set_constant Imp:/WORK/*/SE 0

## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
