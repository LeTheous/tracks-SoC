`default_nettype none

`define CLOCK_HZ 50_000_000

module top(
    // External oscillator
    input wire wb_clk,
    input wire wb_rst,

    // Debug LED
    output wire [11:0] gpio,

    // Uart bridge to MCU
    input wire MCU_UART_TX,
    output wire MCU_UART_RX
);

`include "gen/wb_intercon.vh"


// CPU RAM
wb_ram #(
    .SIZE(512) // in 32-bit words, so 2KiB
) cpu0_ram (
    .i_clk(wb_clk),
    .i_reset(wb_rst),
    .i_wb_adr(wb_m2s_cpu0_ram_adr),
    .i_wb_dat(wb_m2s_cpu0_ram_dat),
    .i_wb_sel(wb_m2s_cpu0_ram_sel),
    .i_wb_we (wb_m2s_cpu0_ram_we),
    .i_wb_cyc(wb_m2s_cpu0_ram_cyc),
    .i_wb_stb(wb_m2s_cpu0_ram_stb),
    .o_wb_dat(wb_s2m_cpu0_ram_dat),
    .o_wb_ack(wb_s2m_cpu0_ram_ack)
);

// CPU ROM.
// We initialize this directly from the hex file with our firmware in it
wb_ram #(
    .SIZE(1024), // 4KiB
    // .INITIAL_HEX("")
) cpu0_rom (
    .i_clk(wb_clk),
    .i_reset(wb_rst),
    .i_wb_adr(wb_m2s_cpu0_rom_adr),
    .i_wb_dat(wb_m2s_cpu0_rom_dat),
    .i_wb_sel(wb_m2s_cpu0_rom_sel),
    .i_wb_we (wb_m2s_cpu0_rom_we),
    .i_wb_cyc(wb_m2s_cpu0_rom_cyc),
    .i_wb_stb(wb_m2s_cpu0_rom_stb),
    .o_wb_dat(wb_s2m_cpu0_rom_dat),
    .o_wb_ack(wb_s2m_cpu0_rom_ack)
);

// Timer for generating the timer interrupt
wire timer_interrupt;
timer_wb #(
    .DEFAULT_PRESCALER(`CLOCK_HZ / 1000 - 1)
) timer0 (
    .i_clk(wb_clk),
    .i_reset(wb_rst),
    .o_timer_trigger(timer_interrupt),
    .i_wb_adr(wb_m2s_timer0_adr),
    .i_wb_dat(wb_m2s_timer0_dat),
    .i_wb_sel(wb_m2s_timer0_sel),
    .i_wb_we (wb_m2s_timer0_we),
    .i_wb_cyc(wb_m2s_timer0_cyc),
    .i_wb_stb(wb_m2s_timer0_stb),
    .o_wb_dat(wb_s2m_timer0_dat),
    .o_wb_ack(wb_s2m_timer0_ack)
);

// Uart for console logging
uart_wb #(
    .TX_BUFSIZE(1024),
    .RX_BUFSIZE(16),
    .DATA_WIDTH(8)
) uart0 (
    .i_clk(wb_clk),
    .i_reset(wb_rst),
    .i_uart_rx(MCU_UART_TX),
    .o_uart_tx(MCU_UART_RX),
    .i_wb_adr(wb_m2s_uart0_adr),
    .i_wb_dat(wb_m2s_uart0_dat),
    .i_wb_sel(wb_m2s_uart0_sel),
    .i_wb_we (wb_m2s_uart0_we),
    .i_wb_cyc(wb_m2s_uart0_cyc),
    .i_wb_stb(wb_m2s_uart0_stb),
    .o_wb_dat(wb_s2m_uart0_dat),
    .o_wb_ack(wb_s2m_uart0_ack)
);

// GPIO

gpio_wb gpio0 (
    .i_clk(wb_clk),
    .i_reset(wb_rst),
    .o_gpio_val(gpio),
    .i_wb_adr(wb_m2s_gpio0_adr),
    .i_wb_dat(wb_m2s_gpio0_dat),
    .i_wb_sel(wb_m2s_gpio0_sel),
    .i_wb_we (wb_m2s_gpio0_we),
    .i_wb_cyc(wb_m2s_gpio0_cyc),
    .i_wb_stb(wb_m2s_gpio0_stb),
    .o_wb_dat(wb_s2m_gpio0_dat),
    .o_wb_ack(wb_s2m_gpio0_ack)
);


// CPU
VexRiscv cpu0 (
    // RCC
    .clk(wb_clk),
    .reset(wb_rst),

    // PC value after reset
    // Here hardcoded to our ROM address base
    .externalResetVector(32'h2000_0000),

    // Interrupt sources
    .timerInterrupt(timer_interrupt),
    .externalInterrupt(1'b0),
    .softwareInterrupt(1'b0),

    // Instruction bus
    .iBusWishbone_CYC(wb_m2s_cpu0_ibus_cyc),
    .iBusWishbone_STB(wb_m2s_cpu0_ibus_stb),
    .iBusWishbone_ACK(wb_s2m_cpu0_ibus_ack),
    .iBusWishbone_WE(wb_m2s_cpu0_ibus_we),
    .iBusWishbone_ADR(wb_m2s_cpu0_ibus_adr[31:2]), // Low 2 bits are always zero
    .iBusWishbone_DAT_MISO(wb_s2m_cpu0_ibus_dat),
    .iBusWishbone_DAT_MOSI(wb_m2s_cpu0_ibus_dat),
    .iBusWishbone_SEL(wb_m2s_cpu0_ibus_sel),
    .iBusWishbone_ERR(wb_s2m_cpu0_ibus_err),
    .iBusWishbone_BTE(wb_m2s_cpu0_ibus_bte),
    .iBusWishbone_CTI(wb_m2s_cpu0_ibus_cti),

    // Data bus
    .dBusWishbone_CYC(wb_m2s_cpu0_dbus_cyc),
    .dBusWishbone_STB(wb_m2s_cpu0_dbus_stb),
    .dBusWishbone_ACK(wb_s2m_cpu0_dbus_ack),
    .dBusWishbone_WE(wb_m2s_cpu0_dbus_we),
    .dBusWishbone_ADR(wb_m2s_cpu0_dbus_adr[31:2]),
    .dBusWishbone_DAT_MISO(wb_s2m_cpu0_dbus_dat),
    .dBusWishbone_DAT_MOSI(wb_m2s_cpu0_dbus_dat),
    .dBusWishbone_SEL(wb_m2s_cpu0_dbus_sel),
    .dBusWishbone_ERR(wb_s2m_cpu0_dbus_err),
    .dBusWishbone_BTE(wb_m2s_cpu0_dbus_bte),
    .dBusWishbone_CTI(wb_m2s_cpu0_dbus_cti)
);

endmodule
