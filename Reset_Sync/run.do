vlib work
vlog *.*v
vsim -voptargs=+acc work.Reset_sync_tb
do wave.do
run -all