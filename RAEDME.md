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

# Output
## Waveform
<img width="934" height="197" alt="image" src="https://github.com/user-attachments/assets/f958990e-b2bf-4bbb-b935-0f2c4b9756bd" />

## Simulation Terminal 
<img width="638" height="272" alt="image" src="https://github.com/user-attachments/assets/7fb4fc7e-93f6-4ffa-975b-e575906ab503" />

