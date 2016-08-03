onerror {quit -f}
vlib work
vlog -work work Group_16.vo
vlog -work work UART_Design.vt
vsim -novopt -c -t 1ps -L max7000ae_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Group_16_vlg_vec_tst
vcd file -direction UART_Design.msim.vcd
vcd add -internal Group_16_vlg_vec_tst/*
vcd add -internal Group_16_vlg_vec_tst/i1/*
add wave /*
run -all
