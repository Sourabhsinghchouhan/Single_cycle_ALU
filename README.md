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
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/71b3c028-77b8-407b-8836-7e1dafec4cb4)

```
            dut.Instruction_Memory.mem[0] = 32'hFFC4A303;
            dut.Data_Memory.mem[20] = 15;
            dut.Register_File.Register[9] = 24;
```

![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/84662f07-4278-4d4f-b098-6e40f71aa091)

![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/db2e31db-155a-40c9-9ea2-5f1567d54784)


### Test-2: SW

```
            sw x4, 0x8(x5)
```
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/37bfcbdb-8248-4be4-80b0-fe9326bc7358)

```
            dut.Instruction_Memory.mem[1] = 32'h0042A423;
            dut.Data_Memory.mem[32] = 5;
            dut.Register_File.Register[5] = 24;
```
![image](https://github.com/Sourabhsinghchouhan/Single_cycle_ALU/assets/145453605/e1b4e9ac-830f-46bd-b2b4-946d1aef5056)

