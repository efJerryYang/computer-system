# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tfgg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.cache/wt [current_project]
set_property parent.project_path C:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.srcs/sources_1/new/memory_w_r.v
  {C:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.srcs/sources_1/imports/实验3 利用IP设计电路/memory_top.v}
}
read_ip -quiet C:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.srcs/sources_1/ip/clk_div/clk_div.xci
set_property used_in_implementation false [get_files -all c:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.srcs/sources_1/ip/clk_div/clk_div_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.srcs/sources_1/ip/clk_div/clk_div.xdc]
set_property used_in_implementation false [get_files -all c:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.srcs/sources_1/ip/clk_div/clk_div_ooc.xdc]

read_ip -quiet C:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.srcs/sources_1/ip/led_mem/led_mem.xci
set_property used_in_implementation false [get_files -all c:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.srcs/sources_1/ip/led_mem/led_mem_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.srcs/constrs_1/imports/Exp4/lab_general.xdc
set_property used_in_implementation false [get_files C:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.srcs/constrs_1/imports/Exp4/lab_general.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top memory_top -part xc7a100tfgg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef memory_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file memory_top_utilization_synth.rpt -pb memory_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
