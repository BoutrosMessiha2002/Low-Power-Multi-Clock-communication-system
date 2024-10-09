vlib work
vlog *.*v
vsim -voptargs=+acc work.clock_divider_tb
do wave.do
run -all