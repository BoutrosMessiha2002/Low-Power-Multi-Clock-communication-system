vlib work
vlog *.*v
vsim -voptargs=+acc work.FIFO_tb
do wave.do
run -all