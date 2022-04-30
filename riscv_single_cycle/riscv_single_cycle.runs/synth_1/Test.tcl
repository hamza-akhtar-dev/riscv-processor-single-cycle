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
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.cache/wt [current_project]
set_property parent.project_path C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/DesignCode/ALU.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/new/BranchCondition.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/DesignCode/Controller.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/DesignCode/DataMemory.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/DesignCode/DataPath.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/DesignCode/Decoder.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/DesignCode/InstructionMemory.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/DesignCode/Multiplexers.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/DesignCode/Processor.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/DesignCode/ProgramCounter.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/DesignCode/RegisterFile.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/Downloads/freq_div.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/Downloads/mux_out.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/Downloads/segment_counter.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/Downloads/seven_cathode.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/Downloads/seven_seg.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/imports/Downloads/seven_seg_anode.v
  C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/sources_1/new/Test.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/constrs_1/new/risc_constraints.xdc
set_property used_in_implementation false [get_files C:/Users/Hamza/Desktop/riscv-single-cycle/riscv_single_cycle/riscv_single_cycle.srcs/constrs_1/new/risc_constraints.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Test -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Test.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Test_utilization_synth.rpt -pb Test_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
