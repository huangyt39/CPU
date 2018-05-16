# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7vx485tffg1157-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/.Xilinx/Single_CPU/Single_CPU.cache/wt [current_project]
set_property parent.project_path E:/.Xilinx/Single_CPU/Single_CPU.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo e:/.Xilinx/Single_CPU/Single_CPU.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/signExtend.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/RegisterFile.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/PCAddImmediate.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/PCAddFour.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/PC.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/Mux_5.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/Mux_32_PCSrc.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/Mux_32_ALUSrcA.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/Mux_32_ALUM2Reg.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/Mux_32ALUSrcB.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/InstructionsMemory.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/ImmediateExtend.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/DataMemory.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/ControlUnit.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/ALU.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/main_CPU.v
  E:/.Xilinx/Single_CPU/Single_CPU.srcs/sources_1/new/test.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top test -part xc7vx485tffg1157-1


write_checkpoint -force -noxdef test.dcp

catch { report_utilization -file test_utilization_synth.rpt -pb test_utilization_synth.pb }
