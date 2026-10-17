# Tracks SoC \[WIP\]

This fork contains the adaptations of the files associated with
[this blog post](https://rhye.org/post/fpgas-3-softcores/) by Ross Schlaikjer,
which covers:

- Customizing and generating a VexRiscv CPU core
- Creating custom wishbone peripherals and attaching them to the CPU
- Linking and bringup of a bare-metal RISC-V firmware image
- Memory mapped IO
- RISC-V interrupt handling

This adaptation adds gpio support, as well as changes some of the VexRiscV cpu's specification, and aims at being synthesized and flashed to the Cyclone V gx starter kit FPGA.

This implementation is currently work in progress (and sadly not functional at the moment...).

for now : synthesize with
bash```
yosys -l log.txt -p "read_verilog rtl/top.v; read_verilog rtl/fifo.v; read_verilog rtl/timer_wb.v; read_verilog rtl/gpio_wb.v; read_verilog rtl/uart_rx.v; read_verilog rtl/uart_tx.v; read_verilog rtl/uart_wb.v; read_verilog rtl/wb_ram.v; read_verilog rtl/gen/wb_intercon.v; read_verilog vendor/wb_intercon/rtl/verilog/wb_arbiter.v; read_verilog vendor/wb_intercon/rtl/verilog/wb_mux.v; read_verilog vendor/verilog-arbiter/src/arbiter.v; read_verilog vendor/vexriscv/VexRiscv.v; synth_intel_alm -top top; write_json netlist.json"
```

and to place and route :

bash```
nextpnr-mistral --device 5CGXFC5C6F27C7 --json netlist.json --qsf vrv.qsf --freq 50 -f --rbf out.rbf
```