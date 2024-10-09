onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /UART_RX_tb/DUT/RX_IN
add wave -noupdate /UART_RX_tb/DUT/PAR_EN
add wave -noupdate /UART_RX_tb/DUT/PAR_TYP
add wave -noupdate /UART_RX_tb/DUT/prescale
add wave -noupdate /UART_RX_tb/DUT/CLK
add wave -noupdate /UART_RX_tb/DUT/RST
add wave -noupdate /UART_RX_tb/DUT/data_valid
add wave -noupdate /UART_RX_tb/DUT/P_DATA
add wave -noupdate /UART_RX_tb/DUT/bit_cnt
add wave -noupdate /UART_RX_tb/DUT/par_err
add wave -noupdate /UART_RX_tb/DUT/strt_glitch
add wave -noupdate /UART_RX_tb/DUT/stp_err
add wave -noupdate /UART_RX_tb/DUT/edge_cnt
add wave -noupdate /UART_RX_tb/DUT/enable
add wave -noupdate /UART_RX_tb/DUT/dat_samp_en
add wave -noupdate /UART_RX_tb/DUT/par_chk_en
add wave -noupdate /UART_RX_tb/DUT/strt_chk_en
add wave -noupdate /UART_RX_tb/DUT/stp_chk_en
add wave -noupdate /UART_RX_tb/DUT/sampled_bit
add wave -noupdate /UART_RX_tb/DUT/deser_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {274070762000 ps} 0}
quietly wave cursor active 1
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
configure wave -timelineunits ms
update
WaveRestoreZoom {587452191 ps} {753549585 ps}
