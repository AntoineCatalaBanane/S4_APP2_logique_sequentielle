transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+design_1  -L xil_defaultlib -L xlconstant_v1_1_9 -L xlconcat_v2_1_6 -L xlslice_v1_0_4 -L unisims_ver -L unimacro_ver -L secureip -O2 xil_defaultlib.design_1 xil_defaultlib.glbl

do {design_1.udo}

run

endsim

quit -force
