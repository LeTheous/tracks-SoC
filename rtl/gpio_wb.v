module gpio_wb(
    // RCC
    input wire i_clk,
    input wire i_reset,
    // 8 LEDs + 3 buttons
    output reg [10:0] o_gpio_val,
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

localparam num = 11;

// 1-bit register per gpio pin
reg gpio_val [num];

// Each data entry is 32 bits wide, so right shift the input address
localparam gpio_width = $clog2(num);
wire [gpio_width-1:0] gpio_addr = i_wb_adr[gpio_width+1:2];

always @(posedge i_clk) begin
    gpio_val[8] <= o_gpio_val[8];
    gpio_val[9] <= o_gpio_val[9];
    gpio_val[10] <= o_gpio_val[10];
    o_gpio_val <={
        gpio_val[10],
        gpio_val[9],
        gpio_val[8],
        gpio_val[7],
        gpio_val[6],
        gpio_val[5],
        gpio_val[4],
        gpio_val[3],
        gpio_val[2],
        gpio_val[1],
        gpio_val[0]
    };
end

always @(posedge i_clk) begin
    if (i_reset) begin
        o_wb_ack <= 0;
    end else begin
        // Wishbone interface logic
        o_wb_ack <= 1'b0;
        if (i_wb_cyc && i_wb_stb && !o_wb_ack) begin
            o_wb_ack <= 1'b1;

            o_wb_dat <= {31'b0,gpio_val[gpio_addr]};

            // Register write
            if (i_wb_we) begin
                gpio_val[gpio_addr] <= i_wb_dat[0];
            end
        end
    end
end

endmodule