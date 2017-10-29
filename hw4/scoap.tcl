set_messages -log ./test_gen.log -replace
read_netlist ./lib.v
read_netlist ./s15850.v
run_build_model s15850

add_clocks 0 { CK } -shift -timing { 100 50 80 40 }
add_scan_chains chain1 test_si1 test_so1
add_scan_chains chain2 test_si2 test_so2
add_scan_chains chain3 test_si3 test_so3
add_scan_chains chain4 test_si4 test_so4
add_scan_chains chain5 test_si5 test_so5
add_scan_chains chain6 test_si6 test_so6
add_scan_chains chain7 test_si7 test_so7
add_scan_chains chain8 test_si8 test_so8
add_scan_chains chain9 test_si9 test_so9
add_scan_chains chain10 test_si10 test_so10
add_scan_enables 1 test_se

add_nofaults -module SDFFX1
add_nofaults -module DFFNX2

add_pi_constraint 0 test_si1
add_pi_constraint 0 test_si2
add_pi_constraint 0 test_si3
add_pi_constraint 0 test_si4
add_pi_constraint 0 test_si5
add_pi_constraint 0 test_si6
add_pi_constraint 0 test_si7
add_pi_constraint 0 test_si8
add_pi_constraint 0 test_si9
add_pi_constraint 0 test_si10
add_pi_constraint 0 test_se

run_drc

set_faults -model stuck
remove_faults -all
add_faults -all
run_atpg -ndetects  1

set_pindata -scoap_data
report_primitives -all > out.txt
