onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /clock_divider_tb/DUT/i_ref_clk
add wave -noupdate -color Red /clock_divider_tb/DUT/o_div_clk
add wave -noupdate /clock_divider_tb/DUT/i_div_ratio
add wave -noupdate /clock_divider_tb/DUT/i_rst_n
add wave -noupdate /clock_divider_tb/DUT/i_clk_en
add wave -noupdate /clock_divider_tb/DUT/odd
add wave -noupdate /clock_divider_tb/DUT/half_period
add wave -noupdate /clock_divider_tb/DUT/counter
add wave -noupdate /clock_divider_tb/DUT/flag
add wave -noupdate /clock_divider_tb/DUT/clock_check
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
configure wave -timelineunits ps
update
WaveRestoreZoom {3650 ps} {4650 ps}
