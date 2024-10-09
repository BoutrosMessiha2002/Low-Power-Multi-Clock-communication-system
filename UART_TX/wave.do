onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /UART_TX_tb/DUT/P_DATA
add wave -noupdate /UART_TX_tb/DUT/PAR_EN
add wave -noupdate /UART_TX_tb/DUT/Data_Valid
add wave -noupdate /UART_TX_tb/DUT/PAR_TYP
add wave -noupdate /UART_TX_tb/DUT/CLK
add wave -noupdate /UART_TX_tb/DUT/RST
add wave -noupdate /UART_TX_tb/DUT/TX_OUT
add wave -noupdate /UART_TX_tb/DUT/busy
add wave -noupdate /UART_TX_tb/DUT/ser_done
add wave -noupdate /UART_TX_tb/DUT/ser_en
add wave -noupdate /UART_TX_tb/DUT/mux_sel
add wave -noupdate /UART_TX_tb/DUT/ser_data
add wave -noupdate /UART_TX_tb/DUT/par_bit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {393752 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {307414 ps} {507100 ps}
