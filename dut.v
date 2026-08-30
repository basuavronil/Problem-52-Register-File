module register_file (
    input  wire       clk,
    input  wire       rst,
    input  wire       we,       // Write Enable
    input  wire [1:0] r_addr1,  // Read Port 1 Address
    input  wire [1:0] r_addr2,  // Read Port 2 Address
    input  wire [1:0] w_addr,   // Write Port Address
    input  wire [7:0] w_data,   // Write Data
    output wire [7:0] r_data1,  // Read Port 1 Data
    output wire [7:0] r_data2   // Read Port 2 Data
);

    // 4 registers, each 8 bits wide
    reg [7:0] reg_file [0:3];

    integer i;

    // Synchronous Write Operation with Reset
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 4; i = i + 1) begin
                reg_file[i] <= 8'h00;
            end
        end else if (we) begin
            reg_file[w_addr] <= w_data;
        end
    end

    // Asynchronous Read Operations (Combinational)
    assign r_data1 = reg_file[r_addr1];
    assign r_data2 = reg_file[r_addr2];

endmodule
