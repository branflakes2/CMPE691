FLAGS=--ieee=synopsys
CLEAN=*.o *.cf *.vcd *.swo encoder_test key_test
all: encoder_test.o key_test.o
	ghdl -e ${FLAGS} encoder_test
	ghdl -e ${FLAGS} key_test
encoder_test.o: vigenere_encoder.o encoder_test.vhd
	ghdl -a ${FLAGS} encoder_test.vhd
key_test.o: key_register.o key_test.vhd
	ghdl -a ${FLAGS} key_test.vhd
key_register.o: key_register.vhd
	ghdl -a ${FLAGS} key_register.vhd
vigenere_encoder.o: vigenere_encoder.vhd
	ghdl -a ${FLAGS} vigenere_encoder.vhd
run: input.txt
	./encoder_test 
clean:
	rm -rf ${CLEAN}
vcd:
	ghdl -r encoder_test --vcd=out.vcd
