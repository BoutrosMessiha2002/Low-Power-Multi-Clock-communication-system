onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Data_Sync_tb/DUT/CLK
add wave -noupdate /Data_Sync_tb/DUT/RST
add wave -noupdate /Data_Sync_tb/DUT/unsync_bus
add wave -noupdate /Data_Sync_tb/DUT/bus_enable
add wave -noupdate /Data_Sync_tb/DUT/enable_pulse
add wave -noupdate /Data_Sync_tb/DUT/sync_bus
add wave -noupdate /Data_Sync_tb/DUT/flops
add wave -noupdate /Data_Sync_tb/DUT/enable_flop
add wave -noupdate /Data_Sync_tb/DUT/enable_pulse_c
add wave -noupdate /Data_Sync_tb/DUT/i
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
WaveRestoreZoom {0 ps} {1 ns}
