`timescale 1ns / 1ps

module register_file_tb;

    reg        clk;
    reg        rst;
    reg        we;
    reg  [1:0] r_addr1;
    reg  [1:0] r_addr2;
    reg  [1:0] w_addr;
    reg  [7:0] w_data;
    wire [7:0] r_data1;
    wire [7:0] r_data2;

    // Instantiate Unit Under Test (UUT)
    register_file uut (
        .clk(clk),
        .rst(rst),
        .we(we),
        .r_addr1(r_addr1),
        .r_addr2(r_addr2),
        .w_addr(w_addr),
        .w_data(w_data),
        .r_data1(r_data1),
        .r_data2(r_data2)
    );

    // 100MHz clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk     = 0;
        rst     = 1;
        we      = 0;
        w_addr  = 0;
        w_data  = 0;
        r_addr1 = 0;
        r_addr2 = 0;

        #15 rst = 0; // Release reset

        // 1. Write values into Register 0 (0xA1) and Register 1 (0xB2)
        @(posedge clk);
        we = 1; w_addr = 2'b00; w_data = 8'hA1; // Write to Reg 0

        @(posedge clk);
        we = 1; w_addr = 2'b01; w_data = 8'hB2; // Write to Reg 1

        @(posedge clk);
        we = 1; w_addr = 2'b10; w_data = 8'hC3; // Write to Reg 2

        // Stop writing
        @(posedge clk);
        we = 0;

        // 2. Read simultaneously from Reg 0 and Reg 1
        r_addr1 = 2'b00; // Expected: A1
        r_addr2 = 2'b01; // Expected: B2
        #2;
        $display("Read Port 1 (Reg 0): %h | Read Port 2 (Reg 1): %h", r_data1, r_data2);

        // 3. Read simultaneously from Reg 1 and Reg 2
        r_addr1 = 2'b01; // Expected: B2
        r_addr2 = 2'b10; // Expected: C3
        #2;
        $display("Read Port 1 (Reg 1): %h | Read Port 2 (Reg 2): %h", r_data1, r_data2);

        $finish;
    end

endmodule
