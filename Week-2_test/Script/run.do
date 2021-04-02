vlib work
vlog addSub.v
vlog Compare_fp.v
vlog Controler.v
vlog div.v
vlog mul.v
vlog RGBtoHSV.v
vlog Select_RGB.v
vlog testbench.v
vlog Tier1_HSV.v
vlog Tier2_HSV.v
vsim work.testbench 
add wave -position insertpoint sim:/testbench/*
run -all