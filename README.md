# RISC-V_ALU_processor
This processsor utilized RISC architecture.

## ALU unit
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/5ad433bd-a6dc-4523-863e-202af229ee03)

## Types of instruction

### R-Type(Register) instructions:
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/633ead17-5e6f-40c8-89ce-4a599ff7c3cb)
### I-Type(Immediate) instruction:
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/dbd62333-0d29-49ba-9032-e37674e6fe08)
### S-Type(Store) instruction:
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/1644b80e-4aa5-4119-acc2-07af9b2214ba)
### B-Type(Branch) instruction:
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/5f8a1c50-57b0-464c-a39c-b9fba5ff28dd)
## Block diagram
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/e1127915-6b2e-4b0a-a661-5fe13fdfe123)
### Main decoder
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/060c096e-3d18-47c0-aacf-fa46652a5b6f)
### ALU decoder
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/899a716b-581d-4718-8a3d-3f26464467ec)

![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/968055bb-dc79-4ec0-8319-4c32f4ba66ed)

## ALU Test
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/24ce73c5-9871-43d1-95c1-b5464ce1f8f6)

## Design steps
There are 4 state elements program counter, instruction memory, register file and data memory

![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/956928dd-d6cc-4bf1-8ef0-34cf50dd7b7c)
**Program counter** : It is 32 bit register. This points the address of the current instruction and PCnext holds address of next instruction.
**Instruction memory**: It takes 32 bit instruction address input, A and read the 32 bit data from that address onto the read data output, RD.
**Register file**: The 32-element × 32-bit register file has two read ports and one write port.
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/968055bb-dc79-4ec0-8319-4c32f4ba66ed)
**Data memory** has a single read/write port. If the write enable, WE, is 1, it writes data
WD into address A on the rising edge of the clock. If the write enable is 0, it reads address A
onto RD.
## Tests:


### Test-1: LW

* A3(Register_file)->Source register -> x6
* A1(Register_file)->Base address -> [x9] = 24
* Offset value -> -4
* Effective address -> 24-4=20
* Data_Memory[20] = 15

```
            dut.Instruction_Memory.mem[0] = 32'hFFC4A303;            //lw x6 -4(x9)
            dut.Data_Memory.mem[20] = 15;
            dut.Register_File.Register[9] = 24;
```

![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/84662f07-4278-4d4f-b098-6e40f71aa091)

![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/db2e31db-155a-40c9-9ea2-5f1567d54784)

In this data from data memory write back to WD3.
### Test-2: SW
* A3(Register_file)->Source register -> x4
* A1(Register_file)->Base address -> [x5] = 7
* Offset value -> 8
* Effective address -> 7+8=15
* Data_Memory[15] = 5
```
            sw x4, 0x8(x5)
```

```         dut.Instruction_Memory.mem[1] = 32'h0042A423;
            dut.Data_Memory.mem[15] = 7;
            dut.Register_File.Register[4] = 5;
```
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/432f7acb-8223-4d62-a389-6dedb37616ba)

### Test-3: ADDI
* Immediate data = 5
* immediate data is stored in x5 register through this instruction

  ```
              dut.Instruction_Memory.mem[0] = 32'h00500293;    //addi x5 x0 5
  ```
  
  ![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/57035984-6edb-4952-9da3-09253908daa7)

  ### Test-4: Addition using immediate
  * [x5] <- 5
  * [x6] <- [x5] + 6
    
    ```
            dut.Instruction_Memory.mem[0] = 32'h00500293;    //addi x5 x0 5
            dut.Instruction_Memory.mem[4] = 32'h00628313;    //addi x6 x5 6
    ```
    ![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/c70d52cd-4e54-4c4c-becf-a81a53443869)

    ### Test-5: Immediate and register
    * [x1] <- 10
    * [x2] <- 9
    * [x3] <- [x1] & [x2]
    * [x4] <- [x1] | [x2]
 
   ```
            dut.Instruction_Memory.mem[0] = 32'h00A00093;      //addi x1 x0 10
            dut.Instruction_Memory.mem[4] = 32'h00900113;      //addi x2 x0 9
            dut.Instruction_Memory.mem[8] = 32'h0020F1B3;      //and x3 x1 x2
            dut.Instruction_Memory.mem[12] = 32'h0020E233;     //or x4 x1 x2
   ```    
    ![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/f662451e-5fd4-41e9-8c9e-687047319ebe)

  
