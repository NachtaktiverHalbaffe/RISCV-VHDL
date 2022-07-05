#!/bin/sh
cd "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/qis/riscv_struct"
"/ext/eda/quartus/19.1/quartus/bin/quartus_sh" -t invoker.tcl
"/ext/eda/quartus/19.1/quartus/bin/quartus_map" riscv -f map.args "--family=cyclone v" --part=5cgxfc5c6f27c7
