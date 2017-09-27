FLAGS=--ieee=synopsys
CLEAN=*.o *.cf *.vcd *.swo encoder_test key_test
all: encoder_test.o key_test.o
	ghdl -e ${FLAGS} encoder_test
	ghdl -e ${FLAGS} key_test
vigenere_test.o:
	ghdl -a ${FLAGS} vigenere_test.vhd
vigenere_cipher.o: vigenere_encoder.o key_register.o input_register.o vigenere_cipher.vhd
	ghdl -a ${FLAGS} vigenere_cipher.vhd
encoder_test.o: vigenere_encoder.o encoder_test.vhd
	ghdl -a ${FLAGS} encoder_test.vhd
key_test.o: key_register.o key_test.vhd
	ghdl -a ${FLAGS} key_test.vhd
input_register.o: input_register.vhd
	ghdl -a ${FLAGS} input_register.vhd
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
