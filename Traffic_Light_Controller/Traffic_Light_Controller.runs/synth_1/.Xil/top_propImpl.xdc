set_property SRC_FILE_INFO {cfile:C:/Digital_System_Design/Traffic_Light_Controller/Traffic_Light_Controller.srcs/constrs_1/new/traffic_const.xdc rfile:../../../Traffic_Light_Controller.srcs/constrs_1/new/traffic_const.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {Clk}];
set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H14 IOSTANDARD LVCMOS33 } [get_ports FARMCAR];
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H18 IOSTANDARD LVCMOS33 } [get_ports AMB_IN];
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J16 IOSTANDARD LVCMOS33 } [get_ports RS];
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports IND_FARMCAR]; # LD2
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E13 IOSTANDARD LVCMOS33 } [get_ports IND_AMB];     # LD4
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F15 [get_ports {FARMTR[0]}]; # RED
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN G17 [get_ports {FARMTR[1]}]; # GREEN
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J15 [get_ports {FARMTR[2]}]; # BLUE
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports {HIGHWAYTR[*]}]; [cite: 5702]
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN E14 [get_ports {HIGHWAYTR[0]}]; # RED
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F18 [get_ports {HIGHWAYTR[1]}]; # GREEN
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN E15 [get_ports {HIGHWAYTR[2]}]; # BLUE
