
'''
PUF_out.txt, which contains your analog output matrix, should be in the run directory of this script
'''
import sys

with open(sys.argv[1],'r') as output_file:
    for line in output_file:
        arr_out = []
        arr = line.split(" ")
        for x in arr:
            fx = float(x)
            if fx > 0.70:
                arr_out.append('1')
            elif fx < 0.30:
                arr_out.append('0')
            else:
                arr_out.append('U')
        print "".join(arr_out)
			
