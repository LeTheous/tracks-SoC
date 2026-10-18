module gpio_wb(
    // RCC
    input wire i_clk,
    input wire i_reset,
    // 8 LEDs + 3 buttons
    output reg [15:0] o_gpio_val,
    input wire [15:0] i_gpio_val,
    // Wishbone
    input  wire [31:0] i_wb_adr,
    input  wire [31:0] i_wb_dat,
    input  wire  [3:0] i_wb_sel,
    input  wire        i_wb_we,
    input  wire        i_wb_cyc,
    input  wire        i_wb_stb,
    output reg  [31:0] o_wb_dat,
    output reg         o_wb_ack
);

localparam
    wb_r_GPIO_IN_VAL = 1'b0,
    wb_r_GPIO_OUT_VAL = 1'b1,
    wb_r_GPIO_MAX = 1'b1;

// 1-bit register per gpio pin
reg [15:0]gpio_val_o;
reg [15:0]gpio_val_i;

// Each data entry is 32 bits wide, so right shift the input address
localparam reg_sel_bits = $clog2(wb_r_GPIO_MAX + 1);
wire [reg_sel_bits-1:0] register_index = i_wb_adr[reg_sel_bits+1:2];

always @(posedge i_clk) begin
    o_gpio_val <= gpio_val_o;
    gpio_val_i <= i_gpio_val;
end

always @(posedge i_clk) begin
    if (i_reset) begin
        o_wb_ack <= 0;
        gpio_val_o <= 0;
    end else begin
        // Wishbone interface logic
        o_wb_ack <= 1'b0;
        if (i_wb_cyc && i_wb_stb && !o_wb_ack) begin
            o_wb_ack <= 1'b1;

           // Register read
            case (register_index)
                wb_r_GPIO_IN_VAL: o_wb_dat <= gpio_val_i;
                wb_r_GPIO_OUT_VAL: o_wb_dat <= gpio_val_o;
            endcase

            // Register write
            if (i_wb_we) begin
                if (register_index)begin
                    gpio_val_o <= i_wb_dat;
                end
            end
        end
    end
end

endmodule