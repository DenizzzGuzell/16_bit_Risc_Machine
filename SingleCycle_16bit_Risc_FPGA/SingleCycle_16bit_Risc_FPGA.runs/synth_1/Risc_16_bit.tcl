# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/denzz/Desktop/DERS/CORG/Project II/CorgProjectFPGA/SingleCycle_16bit_Risc_FPGA/SingleCycle_16bit_Risc_FPGA.cache/wt} [current_project]
set_property parent.project_path {C:/Users/denzz/Desktop/DERS/CORG/Project II/CorgProjectFPGA/SingleCycle_16bit_Risc_FPGA/SingleCycle_16bit_Risc_FPGA.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
read_verilog -library xil_defaultlib {{C:/Users/denzz/Desktop/DERS/CORG/Project II/CorgProjectFPGA/SingleCycle_16bit_Risc_FPGA/SingleCycle_16bit_Risc_FPGA.srcs/sources_1/new/Risc_16_bit.v}}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/denzz/Desktop/DERS/CORG/Project II/CorgProjectFPGA/SingleCycle_16bit_Risc_FPGA/SingleCycle_16bit_Risc_FPGA.srcs/constrs_1/imports/digilent-xdc-master/Nexys-4-DDR-Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/denzz/Desktop/DERS/CORG/Project II/CorgProjectFPGA/SingleCycle_16bit_Risc_FPGA/SingleCycle_16bit_Risc_FPGA.srcs/constrs_1/imports/digilent-xdc-master/Nexys-4-DDR-Master.xdc}}]


synth_design -top Risc_16_bit -part xc7a100tcsg324-1


write_checkpoint -force -noxdef Risc_16_bit.dcp

catch { report_utilization -file Risc_16_bit_utilization_synth.rpt -pb Risc_16_bit_utilization_synth.pb }
