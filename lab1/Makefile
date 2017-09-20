FLAGS=--ieee=synopsys
all: encoder_test.o vigenere_encoder.o
	ghdl -e ${FLAGS} encoder_test
encoder_test.o: vigenere_encoder.o encoder_test.vhd
	ghdl -a ${FLAGS} encoder_test.vhd
vigenere_encoder.o: vigenere_encoder.vhd
	ghdl -a ${FLAGS} vigenere_encoder.vhd
run: input.txt
	./encoder_test 
clean:
	rm -rf *.o *.cf *.vcd encoder_test
vcd:
	ghdl -r encoder_test --vcd=out.vcd
