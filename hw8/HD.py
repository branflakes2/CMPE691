import sys

def readfile(filename):
    ar = []
    f = open(filename, 'r')
    for line in f:
        ar.append(line.split('\n')[0])
    return ar

def HD(str1, str2):
    dis = 0
    for i in range(len(str1)):
        if str1[i] != str2[i]:
            dis = dis + 1
    return float(dis)/len(str1)

def intraHD(pufMat):
    s = 0
    for i in range(0, len(pufMat) - 1):
        s = s + HD(pufMat[i], pufMat[i + 1]) 
    return s/(len(pufMat) - 1)    

def interHD(pufMat1, pufMat2):
    challenges = []
    for i in range(0, len(pufMat1)):
        challenges.append(HD(pufMat1[i], pufMat2[i]))        
    return challenges

def Uniformity(pufMat):
    ones = 0
    total = 0
    for line in pufMat:
        for c in line:
            if c == '1':
                ones += 1
            total += 1
    return float(ones)/total

def aliasing(pufmats):
    challenge_bit = []
    for c in range(0, len(pufmats[0])):
        challenge = []
        ones = 0
        total = 0
        for bit in range(0, len(pufmats[0][0])):
            for j in pufmats:
                if j[c][bit] == '1':
                    ones = ones + 1
                total = total + 1
            challenge.append(float(ones)/total)
        challenge_bit.append(challenge)
    return challenge_bit            

def main():
    pufmats = []

    for i in range(1, len(sys.argv)):
        pufmats.append(readfile(sys.argv[i]))

    num = 0
    s = 0
    challenges = []
    for i in pufmats[0]:
        challenges.append(0)
    for i in range(0, len(pufmats)):
        print("PUF" + str(i) + " IntraHD: " + str(intraHD(pufmats[i])))
        for j in range(0, len(pufmats)):
            if i < j:
                challenges_temp = interHD(pufmats[i], pufmats[j])
                num += 1
                for k in range(0, len(challenges_temp)):
                    challenges[k] = challenges[k] + challenges_temp[k]
    for i in range(0, len(challenges)):
        print("Challenge " + str(i) + " HD: " + str(float(challenges[i])/num))
    for i in range(0, len(pufmats)):
        print("Uniformity of PUF " + str(i) + ": " + str(Uniformity(pufmats[i])))            
    alias = aliasing(pufmats)
    for i in range(0, len(alias)):
        print("Bit-Flip per bit of challenge " + str(i) + ": " + str(alias[i]))
    

main()
