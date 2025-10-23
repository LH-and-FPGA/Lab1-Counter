#!/bin/sh

rm -rf obj_dir
rm -f counter.vcd
rm -f top.vcd

~/Documents/iac/lab0-devtools/tools/attach_usb.sh
verilator -Wall --cc --trace top.sv --exe top_tb.cpp

make -j -C obj_dir/ -f Vtop.mk Vtop

obj_dir/Vtop