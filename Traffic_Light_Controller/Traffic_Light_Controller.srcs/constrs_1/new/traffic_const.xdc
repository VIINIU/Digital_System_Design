#CLK
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {Clk}];
create_clock -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {Clk}];

#BTN
set_property -dict { PACKAGE_PIN H14 IOSTANDARD LVCMOS33 } [get_ports FARMCAR]; # bt0 -> SW0
set_property -dict { PACKAGE_PIN H18 IOSTANDARD LVCMOS33 } [get_ports AMB_IN]; # bt1 -> SW1
set_property -dict { PACKAGE_PIN J16 IOSTANDARD LVCMOS33 } [get_ports RS];

set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports IND_FARMCAR]; # LD2
set_property -dict { PACKAGE_PIN E13 IOSTANDARD LVCMOS33 } [get_ports IND_AMB];     # LD4

 # LD0
set_property IOSTANDARD LVCMOS33 [get_ports {FARMTR[*]}];
set_property PACKAGE_PIN F15 [get_ports {FARMTR[0]}]; # RED
set_property PACKAGE_PIN G17 [get_ports {FARMTR[1]}]; # GREEN
set_property PACKAGE_PIN J15 [get_ports {FARMTR[2]}]; # BLUE

# LD1
set_property IOSTANDARD LVCMOS33 [get_ports {HIGHWAYTR[*]}];
set_property PACKAGE_PIN E14 [get_ports {HIGHWAYTR[0]}]; # RED
set_property PACKAGE_PIN F18 [get_ports {HIGHWAYTR[1]}]; # GREEN
set_property PACKAGE_PIN E15 [get_ports {HIGHWAYTR[2]}]; # BLUE