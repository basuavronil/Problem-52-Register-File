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

    // Waveform dump configuration
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, register_file_tb);
    end

    // Automatic signal monitor (prints to console on any signal change)
    initial begin
        $monitor("Time=%0t ns | rst=%b | we=%b | w_addr=%0d w_data=%h | r_addr1=%0d r_data1=%h | r_addr2=%0d r_data2=%h",
                 $time, rst, we, w_addr, w_data, r_addr1, r_data1, r_addr2, r_data2);
    end

    // 100MHz clock generation (Period = 10ns)
    always #5 clk = ~clk;

    initial begin
        // 1. Signal Initialization & Reset Assertion
        clk     = 0;
        rst     = 1;
        we      = 0;
        w_addr  = 0;
        w_data  = 0;
        r_addr1 = 0;
        r_addr2 = 0;

        @(posedge clk);
        #1;
        rst = 0; // Release Reset

        // 2. Write Operations
        @(posedge clk);
        we = 1; w_addr = 2'b00; w_data = 8'hA1; // Write 0xA1 to Reg 0

        @(posedge clk);
        we = 1; w_addr = 2'b01; w_data = 8'hB2; // Write 0xB2 to Reg 1

        @(posedge clk);
        we = 1; w_addr = 2'b10; w_data = 8'hC3; // Write 0xC3 to Reg 2

        // Stop Writes
        @(posedge clk);
        we = 0;

        // 3. Read Operations
        #2;
        r_addr1 = 2'b00; // Read Reg 0 (0xA1)
        r_addr2 = 2'b01; // Read Reg 1 (0xB2)
        #10;

        r_addr1 = 2'b01; // Read Reg 1 (0xB2)
        r_addr2 = 2'b10; // Read Reg 2 (0xC3)
        #10;

        #10;
        $finish;
    end

endmodule
