#!/bin/python

import sys
import csv
import math

def main():
    filename = sys.argv[1]
    print("asdfasdfasdf")
    print(filename)
    f = open(filename, 'r')
    l = []
    chars = set('()-')
    gate = ""
    for line in f:
        if line.find('(') != -1 and line.find(')') != -1 and line.find('-') != -1 and line.find("scan_behavior") == -1 and len(line.split()) == 5:
            if line.find("---") == -1:
                spl = line.split()
                net = spl[4]
                idx = find(l, net, 0)
                if idx == -1:
                    CC0 = spl[2][1:].split('-')[0]
                    CC1 = spl[2][1:].split('-')[1]
                    CO = spl[2][1:].split('-')[2]
                    CC0_int = 0
                    CC1_int = 0
                    if CC0 == '*':
                        CC0_int = 255
                    else:
                        CC0_int = int(CC0)
                    if CC1 == '*':
                        CC1_int = 255
                    else:
                        CC1_int = int(CC1)
                    if CO == '*':
                        CO = 255
                    else:
                        CO = int(CO)
                    CC = (CC0_int**2 + CC1_int**2)**(0.5)
                    l.append([net, CC1_int, CC0_int, CO, CC, gate + ':' + spl[1]])
                else:
                    l[idx].append(gate + ':' + spl[1])
        else:
            line = ' '.join(line.split())
            if line.find("...") == -1 and line.find("scan_behavior") == -1 and line.find("(TIE_0)") == -1 and line.find("scanout") == -1 and line.find(' ') != -1 and line.find("(TIE_1)") == -1:
                gate = line

    l = sorted(l, key=lambda l:l[3])
    suspicious_gates = []
    for i in l:
        print(i)
        #for j in i[4:]:
        #    index = find(suspicious_gates, j[:(len(j)-2)], 0)
        #    if index == -1:
        #        if(j[len(j) - 1] == 'O'):
        #            suspicious_gates.append([j[:(len(j) - 2)], i[3], 0, 1])
        #        else:
        #            suspicious_gates.append([j[:len(j) - 2], i[3], 1, 0])
        #    else:
        #        if(j[len(j) - 1] == 'O'):
        #            suspicious_gates[index][3] += 1
        #        else:
        #            suspicious_gates[index][2] += 1
        #        suspicious_gates[index][1] += i[3]

    suspicious_gates = sorted(suspicious_gates, key=lambda l:l[1])
    for i in suspicious_gates[(len(suspicious_gates) - 41):]:
        #print(i)
        h = 0
        

#finds index of value
def find(list2d, value, idx):
    for i in range(0, len(list2d) - 1):
        if list2d[i][idx] == value:
            return i
    return -1
main()
