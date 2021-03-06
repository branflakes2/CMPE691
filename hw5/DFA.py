#File: DFA.py
#Author: Brian Weber
#Description: Implementation for finding a key from fault injected AES.

import sys

Sbox = (
            0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
            0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
            0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
            0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
            0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
            0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
            0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
            0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
            0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
            0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
            0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
            0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
            0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
            0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
            0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
            0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
            )

ISbox = (
            0x52, 0x09, 0x6A, 0xD5, 0x30, 0x36, 0xA5, 0x38, 0xBF, 0x40, 0xA3, 0x9E, 0x81, 0xF3, 0xD7, 0xFB,
            0x7C, 0xE3, 0x39, 0x82, 0x9B, 0x2F, 0xFF, 0x87, 0x34, 0x8E, 0x43, 0x44, 0xC4, 0xDE, 0xE9, 0xCB,
            0x54, 0x7B, 0x94, 0x32, 0xA6, 0xC2, 0x23, 0x3D, 0xEE, 0x4C, 0x95, 0x0B, 0x42, 0xFA, 0xC3, 0x4E,
            0x08, 0x2E, 0xA1, 0x66, 0x28, 0xD9, 0x24, 0xB2, 0x76, 0x5B, 0xA2, 0x49, 0x6D, 0x8B, 0xD1, 0x25,
            0x72, 0xF8, 0xF6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xD4, 0xA4, 0x5C, 0xCC, 0x5D, 0x65, 0xB6, 0x92,
            0x6C, 0x70, 0x48, 0x50, 0xFD, 0xED, 0xB9, 0xDA, 0x5E, 0x15, 0x46, 0x57, 0xA7, 0x8D, 0x9D, 0x84,
            0x90, 0xD8, 0xAB, 0x00, 0x8C, 0xBC, 0xD3, 0x0A, 0xF7, 0xE4, 0x58, 0x05, 0xB8, 0xB3, 0x45, 0x06,
            0xD0, 0x2C, 0x1E, 0x8F, 0xCA, 0x3F, 0x0F, 0x02, 0xC1, 0xAF, 0xBD, 0x03, 0x01, 0x13, 0x8A, 0x6B,
            0x3A, 0x91, 0x11, 0x41, 0x4F, 0x67, 0xDC, 0xEA, 0x97, 0xF2, 0xCF, 0xCE, 0xF0, 0xB4, 0xE6, 0x73,
            0x96, 0xAC, 0x74, 0x22, 0xE7, 0xAD, 0x35, 0x85, 0xE2, 0xF9, 0x37, 0xE8, 0x1C, 0x75, 0xDF, 0x6E,
            0x47, 0xF1, 0x1A, 0x71, 0x1D, 0x29, 0xC5, 0x89, 0x6F, 0xB7, 0x62, 0x0E, 0xAA, 0x18, 0xBE, 0x1B,
            0xFC, 0x56, 0x3E, 0x4B, 0xC6, 0xD2, 0x79, 0x20, 0x9A, 0xDB, 0xC0, 0xFE, 0x78, 0xCD, 0x5A, 0xF4,
            0x1F, 0xDD, 0xA8, 0x33, 0x88, 0x07, 0xC7, 0x31, 0xB1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xEC, 0x5F,
            0x60, 0x51, 0x7F, 0xA9, 0x19, 0xB5, 0x4A, 0x0D, 0x2D, 0xE5, 0x7A, 0x9F, 0x93, 0xC9, 0x9C, 0xEF,
            0xA0, 0xE0, 0x3B, 0x4D, 0xAE, 0x2A, 0xF5, 0xB0, 0xC8, 0xEB, 0xBB, 0x3C, 0x83, 0x53, 0x99, 0x61,
            0x17, 0x2B, 0x04, 0x7E, 0xBA, 0x77, 0xD6, 0x26, 0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D
            )


def main():
    filename = sys.argv[1]
    f = open(filename, 'r')
    C = int(f.readline(), 16)
    Cf1 = int(f.readline(), 16)
    Cf2 = int(f.readline(), 16)
    Cf3 = int(f.readline(), 16)

    #remove key
    xor1 = C ^ Cf1
    xor2 = C ^ Cf2
    xor3 = C ^ Cf3

    bytes1 = []
    bytes2 = []
    bytes3 = []

    #find round 10 key
    for i in range(16):
        byteOptions1 = []
        byteOptions2 = []
        byteOptions3 = []
        for j in range(0, 8):
            for k in range(256):
                if Sbox[k] ^ Sbox[k ^ (1 << j)] == (xor1 >> 8*i) & 255:
                    byteOptions1.append(Sbox[k] ^ ((C >> 8*i)&255))
                if Sbox[k] ^ Sbox[k ^ (1 << j)] == (xor2 >> 8*i) & 255:
                    byteOptions2.append(Sbox[k] ^ ((C >> 8*i)&255))
                if Sbox[k] ^ Sbox[k ^ (1 << j)] == (xor3 >> 8*i) & 255:
                    byteOptions3.append(Sbox[k] ^ ((C >> 8*i)&255))
        bytes1.append(byteOptions1)            
        bytes2.append(byteOptions2)            
        bytes3.append(byteOptions3)            

    round10key = 0
        
    #find intersection of keys
    for i in range(16):
        for j in range(len(bytes1[i])):
            temp = bytes1[i][j]
            for k in range(len(bytes2[i])):
                if temp == bytes2[i][k]:
                    for l in range(len(bytes3[i])):
                        if temp == bytes3[i][l]:
                            round10key ^= temp << 8*i

    keys = inverseKeySched(round10key)
    
    for i in range(11):
        print("Round %02d Key: %032x" % (i, keys[i]))

    f.close()

#helper functions for inverting key schedule
def G(W, RC):
    out = 0
    temp = ((W << 8) & 0xffffff00) ^ (W >> 24)
    out ^= Sbox[temp & 0xff]
    out ^= Sbox[(temp >> 8) & 0xff] << 8
    out ^= Sbox[(temp >> 16) & 0xff] << 16
    out ^= (Sbox[(temp >> 24) & 0xff] ^ RC) << 24
    return out

def _inverseKeySched(K, RC):
    out  = (K & 0x000000000000000000000000ffffffff) ^ ((K >> 32) & 0xffffffff)
    out ^= (K & 0x0000000000000000ffffffff00000000) ^ (((K >> 32) & 0xffffffff00000000))
    out ^= (K & 0x00000000ffffffff0000000000000000) ^ (((K >> 32) & 0xffffffff0000000000000000))
    out ^= (K & 0xffffffff000000000000000000000000) ^ (G(out & 0xffffffff, RC) << 96)
    return out

def inverseKeySched(round10key):
    round9key = _inverseKeySched(round10key, 0b00110110)
    round8key = _inverseKeySched(round9key, 0b00011011)
    round7key = _inverseKeySched(round8key, 0b10000000)
    round6key = _inverseKeySched(round7key, 0b01000000)
    round5key = _inverseKeySched(round6key, 0b00100000)
    round4key = _inverseKeySched(round5key, 0b00010000)
    round3key = _inverseKeySched(round4key, 0b00001000)
    round2key = _inverseKeySched(round3key, 0b00000100)
    round1key = _inverseKeySched(round2key, 0b00000010)
    round0key = _inverseKeySched(round1key, 0b00000001)
    return (round0key, round1key, round2key, round3key, round4key, round5key, round6key, round7key, round8key, round9key, round10key) 


main()
