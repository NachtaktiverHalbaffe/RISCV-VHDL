# RISCV
A VHDL implementation of a simple RISC-V modell processor. This was done in a lab course of Institute of Communication Networks and Computer Engineering (University of Stuttgart). Used software tools:
- Develpoment: HDL Designer for entity descriptions and structual architectures and VS Code for behaviroural architectures
- Simulation: modelssim was used
- Synthesized with  and tested on a Cyclone V GX Starter Kit Dev Board.

Screenshot of architecture: ![](https://github.com/NachtaktiverHalbaffe/RISCV-VHDL/blob/master/doc/Pipeline_io.png)

## Pin Assignment for Cyclone V GX Starter Kit
| Pin | FPGA_Pin |
|        --          |       --       | 
|clk                |      PIN_R20         |
| res_n           |         PIN_AB24    |
| hex_disp0[6] |   PIN_Y18 |
| hex_disp0[5] |    PIN_Y19|
| hex_disp0[4] |   PIN_Y20 |
| hex_disp0[3] |    PIN_W18|
| hex_disp0[2] |    PIN_V17|
| hex_disp0[1] |    PIN_V18|
| hex_disp0[0] |   PIN_V19 |
| hex_disp1[6] |    PIN_AF24|
| hex_disp1[5] |    PIN_AC19|
| hex_disp1[4] |    PIN_AE25|
| hex_disp1[3] |    PIN_AE26|
| hex_disp1[2] |   PIN_AB19 |
| hex_disp1[1] |    PIN_AD26|
| hex_disp1[0] |    PIN_AA18|
| hex_disp2[6] |  PIN_W20  |
| hex_disp2[5] |   PIN_W21 |
| hex_disp2[4] |   PIN_V20 |
| hex_disp2[3] |    PIN_V22|
| hex_disp2[2] |    PIN_U20|
| hex_disp2[1] |    PIN_AD6|
| hex_disp2[0] |    PIN_AD7|
| hex_disp3[6] |    PIN_AC22|
| hex_disp3[5] |    PIN_AC23|
| hex_disp3[4] |    PIN_AC24|
| hex_disp3[3] |    PIN_AA22|
| hex_disp3[2] |    PIN_AA23|
| hex_disp3[1] |    PIN_Y23|
| hex_disp3[0] |    PIN_Y24|

# License
Copyright 2023 Felix Brugger

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
