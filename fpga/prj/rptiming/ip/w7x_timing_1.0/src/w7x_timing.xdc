create_clock -period 100 -name clk_ext_in   -waveform {0 50} [get_ports clk_ext_in]
create_clock -period   5 -name clk_axi_in -waveform {0  4} [get_ports clk_axi_in]
set_clock_groups -name async -asynchronous -group {clk_ext_in} -group {clk_axi_in}

set_input_delay  -clock [get_clocks clk_axi_in] -min  2 [get_ports s00_axi_* -filter {DIRECTION==IN && NAME!~*clk}]
set_input_delay  -clock [get_clocks clk_axi_in] -max  4 [get_ports s00_axi_* -filter {DIRECTION==IN && NAME!~*clk}]

set_output_delay -clock [get_clocks clk_axi_in] -min  0 [get_ports s00_axi_* -filter {DIRECTION==OUT && NAME!~*clk}]
set_output_delay -clock [get_clocks clk_axi_in] -max  1 [get_ports s00_axi_* -filter {DIRECTION==OUT && NAME!~*clk}]

set_input_delay  -clock [get_clocks clk_ext_in]   -min  2 [get_ports trig_in]
set_input_delay  -clock [get_clocks clk_ext_in]   -max 10 [get_ports trig_in]

set_output_delay -clock [get_clocks clk_ext_in]   -min  1 [get_ports state_out[*]]
set_output_delay -clock [get_clocks clk_ext_in]   -max 10 [get_ports state_out[*]]
