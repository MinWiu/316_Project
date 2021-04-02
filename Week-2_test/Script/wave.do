onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/HSV
add wave -noupdate /testbench/H
add wave -noupdate /testbench/S
add wave -noupdate /testbench/V
add wave -noupdate /testbench/State
add wave -noupdate /testbench/Done
add wave -noupdate /testbench/R
add wave -noupdate /testbench/G
add wave -noupdate /testbench/B
add wave -noupdate /testbench/Start
add wave -noupdate /testbench/Clk
add wave -noupdate /testbench/nreset
add wave -noupdate /testbench/addr
add wave -noupdate /testbench/i
add wave -noupdate /testbench/j
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {1199410 ps} {1200410 ps}
