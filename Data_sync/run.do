vlib work
vlog *.*v
vsim -voptargs=+acc work.Data_Sync_tb
do wave.do
run -all