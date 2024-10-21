
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set verilogout_no_tri true
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################
set REF_CLK_NAME REF_CLK
set REF_CLK_PER 20
set REF_CLK_SETUP_SKEW 0.2
set REF_CLK_HOLD_SKEW 0.1
set REF_CLK_LAT 0
set REF_CLK_RISE 0.05
set REF_CLK_FALL 0.05

set UART_CLK_NAME UART_CLK
set UART_CLK_PER 271.267
set UART_CLK_SETUP_SKEW 0.2
set UART_CLK_HOLD_SKEW 0.1
set UART_CLK_LAT 0
set UART_CLK_RISE 0.1
set UART_CLK_FALL 0.1

set DFT_CLK_NAME DFT_CLK
set DFT_CLK_PER 200
set DFT_CLK_SETUP_SKEW 0.2
set DFT_CLK_HOLD_SKEW 0.1
set DFT_CLK_LAT 0
set DFT_CLK_RISE 0.1
set DFT_CLK_FALL 0.1

set UART_TX_CLK_PER [expr $UART_CLK_PER * 32]
set UART_RX_CLK_PER $UART_CLK_PER 

####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################
create_clock -name $REF_CLK_NAME -period $REF_CLK_PER -waveform "0 [expr $REF_CLK_PER/2]" [get_ports REF_CLK]
set_clock_uncertainty -setup $REF_CLK_SETUP_SKEW [get_clocks $REF_CLK_NAME]
set_clock_uncertainty -hold $REF_CLK_HOLD_SKEW  [get_clocks $REF_CLK_NAME]
set_clock_transition -rise $REF_CLK_RISE  [get_clocks $REF_CLK_NAME]
set_clock_transition -fall $REF_CLK_FALL  [get_clocks $REF_CLK_NAME]
set_clock_latency $REF_CLK_LAT [get_clocks $REF_CLK_NAME]
create_generated_clock -master_clock $REF_CLK_NAME -source [get_ports REF_CLK] \
                       -name "ALU_CLK" [get_port U0_CLK_GATE/GATED_CLK] \
                       -divide_by 1

set_clock_uncertainty -setup $REF_CLK_SETUP_SKEW [get_clocks ALU_CLK]
set_clock_uncertainty -hold $REF_CLK_HOLD_SKEW  [get_clocks ALU_CLK]
set_clock_transition -rise $REF_CLK_RISE  [get_clocks ALU_CLK]
set_clock_transition -fall $REF_CLK_FALL  [get_clocks ALU_CLK]
set_clock_latency $REF_CLK_LAT [get_clocks ALU_CLK]

create_clock -name $UART_CLK_NAME -period $UART_CLK_PER -waveform "0 [expr $UART_CLK_PER/2]" [get_ports UART_CLK]
set_clock_uncertainty -setup $UART_CLK_SETUP_SKEW [get_clocks $UART_CLK_NAME]
set_clock_uncertainty -hold $UART_CLK_HOLD_SKEW  [get_clocks $UART_CLK_NAME]
set_clock_transition -rise $UART_CLK_RISE  [get_clocks $UART_CLK_NAME]
set_clock_transition -fall $UART_CLK_FALL  [get_clocks $UART_CLK_NAME]
set_clock_latency $UART_CLK_LAT [get_clocks $UART_CLK_NAME]

create_generated_clock -master_clock $UART_CLK_NAME -source [get_ports UART_CLK] \
                       -name "UART_TX_CLK" [get_port U0_TX/CLK] \
                       -divide_by 32

set_clock_uncertainty -setup $UART_CLK_SETUP_SKEW [get_clocks UART_TX_CLK]
set_clock_uncertainty -hold $UART_CLK_HOLD_SKEW  [get_clocks UART_TX_CLK]
set_clock_transition -rise $UART_CLK_RISE  [get_clocks UART_TX_CLK]
set_clock_transition -fall $UART_CLK_FALL  [get_clocks UART_TX_CLK]
set_clock_latency $UART_CLK_LAT [get_clocks UART_TX_CLK]

create_generated_clock -master_clock $REF_CLK_NAME -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" [get_port U0_RX/CLK] \
                       -divide_by 1

set_clock_uncertainty -setup $UART_CLK_SETUP_SKEW [get_clocks UART_RX_CLK]
set_clock_uncertainty -hold $UART_CLK_HOLD_SKEW  [get_clocks UART_RX_CLK]
set_clock_transition -rise $UART_CLK_RISE  [get_clocks UART_RX_CLK]
set_clock_transition -fall $UART_CLK_FALL  [get_clocks UART_RX_CLK]
set_clock_latency $UART_CLK_LAT [get_clocks UART_RX_CLK]

create_clock -name $DFT_CLK_NAME -period $DFT_CLK_PER -waveform "0 [expr $DFT_CLK_PER/2]" [get_ports scan_clk]
set_clock_uncertainty -setup $DFT_CLK_SETUP_SKEW [get_clocks $DFT_CLK_NAME]
set_clock_uncertainty -hold $DFT_CLK_HOLD_SKEW  [get_clocks $DFT_CLK_NAME]
set_clock_transition -rise $DFT_CLK_RISE  [get_clocks $DFT_CLK_NAME]
set_clock_transition -fall $DFT_CLK_FALL  [get_clocks $DFT_CLK_NAME]
set_clock_latency $DFT_CLK_LAT [get_clocks $DFT_CLK_NAME]

set_clock_groups -asynchronous \
-group [get_clocks "$REF_CLK_NAME ALU_CLK"] \
-group [get_clocks "$UART_CLK_NAME UART_TX_CLK UART_RX_CLK"]

set_clock_groups -asynchronous -group [get_clocks "$REF_CLK_NAME"]     \
                               -group [get_clocks "$DFT_CLK_NAME"] 

set_clock_groups -asynchronous -group [get_clocks ALU_CLK]     \
                               -group [get_clocks "$DFT_CLK_NAME"] 

set_clock_groups -asynchronous -group [get_clocks "$UART_CLK_NAME"]     \
                               -group [get_clocks "$DFT_CLK_NAME"] 

set_clock_groups -asynchronous -group [get_clocks "UART_TX_CLK"]     \
                               -group [get_clocks "$DFT_CLK_NAME"] 

set_clock_groups -asynchronous -group [get_clocks "UART_RX_CLK"]     \
                               -group [get_clocks "$DFT_CLK_NAME"] 

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################



set in_delay_TX  [expr 0.2*$UART_TX_CLK_PER]
set out_delay_TX [expr 0.2*$UART_TX_CLK_PER]

set in_delay_RX  [expr 0.2*$UART_RX_CLK_PER]
set out_delay_RX [expr 0.2*$UART_RX_CLK_PER]

set in_delay_DFT  [expr 0.2*$DFT_CLK_PER]
set out_delay_DFT [expr 0.2*$DFT_CLK_PER]

set_input_delay $in_delay_RX -clock UART_RX_CLK [get_port UART_RX_IN]

set_output_delay $out_delay_TX -clock UART_TX_CLK [get_port UART_TX_O]
set_output_delay $out_delay_RX -clock UART_RX_CLK [get_port framing_error]
set_output_delay $out_delay_RX -clock UART_RX_CLK [get_port parity_error]

set_input_delay $in_delay_DFT -clock $DFT_CLK_NAME [get_port test_mode]
set_input_delay $in_delay_DFT -clock $DFT_CLK_NAME [get_port SI]
set_input_delay $in_delay_DFT -clock $DFT_CLK_NAME [get_port SE]

set_output_delay $out_delay_DFT -clock $DFT_CLK_NAME [get_port SO]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port UART_RX_IN]

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port test_mode]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SI]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SE]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################
set_load 0.5 [get_port UART_TX_O]
set_load 0.5 [get_port framing_error]
set_load 0.5 [get_port parity_error]

set_load 0.5  [get_port SO]
####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis
set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################
set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

####################################################################################
           #########################################################
                  #### Section 8 : set_case_analysis ####
           #########################################################
####################################################################################
set_case_analysis 1 [get_port test_mode]
####################################################################################


