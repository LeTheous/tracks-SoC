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
