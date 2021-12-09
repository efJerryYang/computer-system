set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets button_IBUF]
create_clock -period 10.000 -name clk [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports button]

set_property IOSTANDARD LVCMOS33 [get_ports led_en[7]]
set_property IOSTANDARD LVCMOS33 [get_ports led_en[6]]
set_property IOSTANDARD LVCMOS33 [get_ports led_en[5]]
set_property IOSTANDARD LVCMOS33 [get_ports led_en[4]]
set_property IOSTANDARD LVCMOS33 [get_ports led_en[3]]
set_property IOSTANDARD LVCMOS33 [get_ports led_en[2]]
set_property IOSTANDARD LVCMOS33 [get_ports led_en[1]]
set_property IOSTANDARD LVCMOS33 [get_ports led_en[0]]
set_property IOSTANDARD LVCMOS33 [get_ports led_ca]
set_property IOSTANDARD LVCMOS33 [get_ports led_cb]
set_property IOSTANDARD LVCMOS33 [get_ports led_cc]
set_property IOSTANDARD LVCMOS33 [get_ports led_cd]
set_property IOSTANDARD LVCMOS33 [get_ports led_ce]
set_property IOSTANDARD LVCMOS33 [get_ports led_cf]
set_property IOSTANDARD LVCMOS33 [get_ports led_cg]
set_property IOSTANDARD LVCMOS33 [get_ports led_dp]

set_property PACKAGE_PIN Y18 [get_ports clk]
set_property PACKAGE_PIN R1 [get_ports rst]
set_property PACKAGE_PIN P1 [get_ports button]
set_property PACKAGE_PIN C19 [get_ports led_en[0]]
set_property PACKAGE_PIN E19 [get_ports led_en[1]]
set_property PACKAGE_PIN D19 [get_ports led_en[2]]
set_property PACKAGE_PIN F18 [get_ports led_en[3]]
set_property PACKAGE_PIN E18 [get_ports led_en[4]]
set_property PACKAGE_PIN B20 [get_ports led_en[5]]
set_property PACKAGE_PIN A20 [get_ports led_en[6]]
set_property PACKAGE_PIN A18 [get_ports led_en[7]]
set_property PACKAGE_PIN F15 [get_ports led_ca]
set_property PACKAGE_PIN F13 [get_ports led_cb]
set_property PACKAGE_PIN F14 [get_ports led_cc]
set_property PACKAGE_PIN F16 [get_ports led_cd]
set_property PACKAGE_PIN E17 [get_ports led_ce]
set_property PACKAGE_PIN C14 [get_ports led_cf]
set_property PACKAGE_PIN C15 [get_ports led_cg]
set_property PACKAGE_PIN E13 [get_ports led_dp]
