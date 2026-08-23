## =============================================================
## Basys3 (xc7a35tcpg236-1) Constraints for LP-TPG Using LP-LFSR
## Clock relaxed to 25 MHz to accommodate Braun array multiplier
## combinational path depth (~22ns through 8x8 multiplier tree)
## =============================================================

set_property PACKAGE_PIN W5  [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
## 25 MHz = 40ns period (safe for 8x8 Braun array multiplier)
create_clock -add -name sys_clk_pin -period 40.000 -waveform {0 20} [get_ports clk]

set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

set_property PACKAGE_PIN U16 [get_ports {product[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[0]}]
set_property PACKAGE_PIN E19 [get_ports {product[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[1]}]
set_property PACKAGE_PIN U19 [get_ports {product[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[2]}]
set_property PACKAGE_PIN V19 [get_ports {product[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[3]}]
set_property PACKAGE_PIN W18 [get_ports {product[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[4]}]
set_property PACKAGE_PIN U15 [get_ports {product[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[5]}]
set_property PACKAGE_PIN U14 [get_ports {product[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[6]}]
set_property PACKAGE_PIN V14 [get_ports {product[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[7]}]
set_property PACKAGE_PIN V13 [get_ports {product[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[8]}]
set_property PACKAGE_PIN V3  [get_ports {product[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[9]}]
set_property PACKAGE_PIN W3  [get_ports {product[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[10]}]
set_property PACKAGE_PIN U3  [get_ports {product[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[11]}]
set_property PACKAGE_PIN P3  [get_ports {product[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[12]}]
set_property PACKAGE_PIN N3  [get_ports {product[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[13]}]
set_property PACKAGE_PIN P1  [get_ports {product[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[14]}]
set_property PACKAGE_PIN L1  [get_ports {product[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {product[15]}]

set_output_delay -clock sys_clk_pin -max 2.0 [get_ports {product[*]}]
set_output_delay -clock sys_clk_pin -min 0.5 [get_ports {product[*]}]

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
