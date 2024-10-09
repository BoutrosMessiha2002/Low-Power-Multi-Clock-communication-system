vlib work
vlog *.*v
vsim -voptargs=+acc work.UART_tb
do wave.do
run -all