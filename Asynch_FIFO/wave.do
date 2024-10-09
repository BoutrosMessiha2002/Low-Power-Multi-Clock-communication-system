onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FIFO_tb/DUT/wdata
add wave -noupdate /FIFO_tb/DUT/winc
add wave -noupdate /FIFO_tb/DUT/wclk
add wave -noupdate /FIFO_tb/DUT/wrst_n
add wave -noupdate /FIFO_tb/DUT/rclk
add wave -noupdate /FIFO_tb/DUT/rrst_n
add wave -noupdate /FIFO_tb/DUT/rinc
add wave -noupdate /FIFO_tb/DUT/rdata
add wave -noupdate /FIFO_tb/DUT/rempty
add wave -noupdate /FIFO_tb/DUT/wfull
add wave -noupdate /FIFO_tb/DUT/wptr
add wave -noupdate /FIFO_tb/DUT/rq2_wptr
add wave -noupdate /FIFO_tb/DUT/waddr
add wave -noupdate /FIFO_tb/DUT/raddr
add wave -noupdate /FIFO_tb/DUT/rptr
add wave -noupdate /FIFO_tb/DUT/wq2_rptr
add wave -noupdate /FIFO_tb/DUT/wclken
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {897859 ps} {900113 ps}
