
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

############################# Formality Setup File ##########################
                                                   
set_svf $top_module.svf

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries          #"
puts "###########################################"

#Add the path of the libraries and RTL files to the search_path variable

set PROJECT_PATH /home/IC/Projects/System/
set LIB_PATH     /home/IC/tsmc_fb_cl013g_sc/aci/sc-m

lappend search_path $LIB_PATH/synopsys
lappend search_path $PROJECT_PATH/RTL/ALU
lappend search_path $PROJECT_PATH/RTL/ASYNC_FIFO
lappend search_path $PROJECT_PATH/RTL/Clock_Divider
lappend search_path $PROJECT_PATH/RTL/Clock_Gating
lappend search_path $PROJECT_PATH/RTL/DATA_SYNC
lappend search_path $PROJECT_PATH/RTL/RegFile
lappend search_path $PROJECT_PATH/RTL/PULSE_GEN
lappend search_path $PROJECT_PATH/RTL/RST_SYNC
lappend search_path $PROJECT_PATH/RTL/SYS_CTRL
lappend search_path $PROJECT_PATH/RTL/CLKDIV_MUX
lappend search_path $PROJECT_PATH/RTL/UART/UART_RX
lappend search_path $PROJECT_PATH/RTL/UART/UART_TX
lappend search_path $PROJECT_PATH/RTL/UART/UART_TOP
lappend search_path $PROJECT_PATH/RTL/TOP

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set file_format verilog

#ALU
analyze -format $file_format ALU.v
#FIFO
analyze -format $file_format FIFO_DF_SYNC.v
analyze -format $file_format B2G_encoder.v
analyze -format $file_format FIFO_MEM_CTRL.v
analyze -format $file_format FIFO_RD.v
analyze -format $file_format FIFO_WR.v
analyze -format $file_format ASYNC_FIFO_TOP.v
#CLK_DIVIDER MUX
analyze -format $file_format CLK_DIV_MUX.v
analyze -format $file_format mux2X1.v
#CLK_DIVIDER
analyze -format $file_format CLK_DIVIDER.v
#CLK_GATING
analyze -format $file_format CLK_GATING.v
#DATA_SYNC
analyze -format $file_format DATA_SYNC.v
#REGISTER_FILE
analyze -format $file_format RegFile.v
#PULSE_GENERATOR
analyze -format $file_format PULSE_GEN.v
#RST_SYNC
analyze -format $file_format RST_SYNC.v
#SYS_CONTROLLER
analyze -format $file_format SYS_CTRL.v
#UART_RX
analyze -format $file_format RX_DATA_SAMPLING.v
analyze -format $file_format RX_DESERIALIZER.v
analyze -format $file_format RX_EDGE_BIT_COUNTER.v
analyze -format $file_format RX_PARITY_CHECK.v
analyze -format $file_format RX_START_CHECK.v
analyze -format $file_format RX_STOP_CHECK.v
analyze -format $file_format UART_RX_TOP.v
analyze -format $file_format RX_FSM.v
#UART_TX
analyze -format $file_format TX_MUX.v
analyze -format $file_format TX_PARITY_CALC.v
analyze -format $file_format TX_SERIALIZER.v
analyze -format $file_format UART_TX_TOP.v
analyze -format $file_format TX_FSM.v

#SYS_TOP
analyze -format $file_format SYSTEM_TOP.v

elaborate -lib WORK SYS_TOP

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design >> reports/check_design.rpt

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile 

##################### Close Formality Setup file ###########################

set_svf -off

#############################################################################
# Write out files
#############################################################################

write_file -format verilog -hierarchy -output netlists/$top_module.ddc
write_file -format verilog -hierarchy -output netlists/$top_module.v
write_sdf  sdf/$top_module.sdf
write_sdc  -nosplit sdc/$top_module.sdc

####################### reporting ##########################################

report_area -hierarchy > reports/area.rpt
report_power -hierarchy > reports/power.rpt
report_timing -delay_type min -max_paths 20 > reports/hold.rpt
report_timing -delay_type max -max_paths 20 > reports/setup.rpt
report_clock -attributes > reports/clocks.rpt
report_constraint -all_violators -nosplit > reports/constraints.rpt

############################################################################
# DFT Preparation Section
############################################################################

set flops_per_chain 100

set num_flops [sizeof_collection [all_registers -edge_triggered]]

set num_chains [expr $num_flops / $flops_per_chain + 1 ]

################# starting graphical user interface #######################

#gui_start

#exit
