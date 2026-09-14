# 4x8 Register File (Verilog HDL)

```
                  +----------------------------------------------+
                  |                register_file                 |
                  |                                              |
   clk ---------->| input                                        |
   rst ---------->| input    +-----------------------------+     |
    we ---------->| input    | Internal Registers (4 x 8b) |     |
 w_addr [1:0] --->| input    |                             |     |
 w_data [7:0] --->| input --->  reg_file[0] [7:0]          |     |
                  |          |  reg_file[1] [7:0]          |-----> r_data1 [7:0] (output)
r_addr1 [1:0] --->| input --->  reg_file[2] [7:0]          |     |
r_addr2 [1:0] --->| input --->  reg_file[3] [7:0]          |-----> r_data2 [7:0] (output)
                  |          +-----------------------------+     |
                  +----------------------------------------------+
```

# Waveform
