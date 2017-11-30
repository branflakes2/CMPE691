#include "stdio.h"
#ifdef __cplusplus
extern "C" {
#endif
extern char at_least_one_object_file;
extern void *kernel_scs_file_ht_new(const void *, int);
extern int kernel_scs_file_ht_get(void *, const char *, int *);
extern int  strcmp(const char*, const char*);
  typedef struct {
    char* dFileName;
  } lPkgFileInfoStruct;

  typedef struct {
    char* dFileName;
    char* dRealFileName;
    long dFileOffset;
    unsigned long dFileSize;
    int dFileModTime;
    unsigned int simFlag;
  } lFileInfoStruct;

static int lNumOfScsFiles;
  static lFileInfoStruct lFInfoArr[] = {
  {"synopsys_sim.setup_0", "./synopsys_sim.setup", 3654, 17, 1509606076, 0},
  {"synopsys_sim.setup_1", "/afs/umbc.edu/software/synopsys/software/vcs_mxi/bin/synopsys_sim.setup", 3671, 4844, 1500606232, 0},
  {"./work/64/AES_128_TB.sim", "", 0, 3654, 0, 1},
  {"./work/64/STD_LOGIC_TEXTIO__.sim", "", 8515, 175760, 0, 1},
  {"./work/64/STD_LOGIC_TEXTIO.sim", "", 184275, 29717, 0, 1},
  {"./work/64/STD_LOGIC_SIGNED__.sim", "", 213992, 91033, 0, 1},
  {"./work/64/STD_LOGIC_SIGNED.sim", "", 305025, 42445, 0, 1},
  {"./work/64/STD_LOGIC_UNSIGNED__.sim", "", 347470, 86024, 0, 1},
  {"./work/64/STD_LOGIC_UNSIGNED.sim", "", 433494, 40803, 0, 1},
  {"./work/64/STD_LOGIC_ARITH__.sim", "", 474297, 633122, 0, 1},
  {"./work/64/STD_LOGIC_ARITH.sim", "", 1107419, 165346, 0, 1},
  {"./work/64/AES128PKG.sim", "", 1272765, 13895, 0, 1},
  {"./work/64/DUMMY_MHDL_CFG_AES_128_TB.sim", "", 1286660, 96752, 0, 0},
  {"./work/64/AES_128_TB__BEHAVIORAL.sim", "", 1383412, 45943, 0, 1},
  {"./work/64/NUMERIC_STD__.sim", "", 1429355, 726282, 0, 1},
  {"./work/64/NUMERIC_STD.sim", "", 2155637, 145978, 0, 1},
  {"./work/64/AES_128.sim", "", 2301615, 8247, 0, 1},
  {"./work/64/AES_128__BEHAVIORAL.sim", "", 2309862, 64597, 0, 1},
  {"./work/64/KEYEXPANSION.sim", "", 2374459, 6508, 0, 1},
  {"./work/64/KEYEXPANSION__BEHAVIORAL.sim", "", 2380967, 410947, 0, 1},
  {"./work/64/KEYXOR_128.sim", "", 2791914, 4502, 0, 1},
  {"./work/64/KEYXOR_128__BEHAVIORAL.sim", "", 2796416, 19407, 0, 1},
  {"./work/64/SBOX_128.sim", "", 2815823, 4248, 0, 1},
  {"./work/64/SBOX_128__BEHAVIORAL.sim", "", 2820071, 16175, 0, 1},
  {"./work/64/SHIFTROW_128.sim", "", 2836246, 4260, 0, 1},
  {"./work/64/SHIFTROW_128__BEHAVIORAL.sim", "", 2840506, 16307, 0, 1},
  {"./work/64/MIXCOLUMN_128.sim", "", 2856813, 4279, 0, 1},
  {"./work/64/MIXCOLUMN_128__BEHAVIORAL.sim", "", 2861092, 31207, 0, 1},
  {"./work/64/FAULT_INJECTOR.sim", "", 2892299, 9740, 0, 1},
  {"./work/64/FAULT_INJECTOR__BEHAVIORAL.sim", "", 2902039, 47509, 0, 1},
  {"./work/64/SBOX_CHECK.sim", "", 2949548, 11041, 0, 1},
  {"./work/64/SBOX_CHECK__BEHAVIORAL.sim", "", 2960589, 33370, 0, 1},
  {"./work/64/SR_CHECK.sim", "", 2993959, 4322, 0, 1},
  {"./work/64/SR_CHECK__BEHAVIORAL.sim", "", 2998281, 23445, 0, 1},
  {"./work/64/SC_CHECK.sim", "", 3021726, 4322, 0, 1},
  {"./work/64/SC_CHECK__BEHAVIORAL.sim", "", 3026048, 23445, 0, 1},
  {"./work/64/KEY_CHECK.sim", "", 3049493, 4341, 0, 1},
  {"./work/64/KEY_CHECK__BEHAVIORAL.sim", "", 3053834, 9089, 0, 1},
  {"./work/64/SBOX.sim", "", 3062923, 4196, 0, 1},
  {"./work/64/SBOX__BEHAVIORAL.sim", "", 3067119, 206935, 0, 1},
  {"./work/64/MIXCOLUMN.sim", "", 3274054, 3174, 0, 1},
  {"./work/64/MIXCOLUMN__BEHAVIORAL.sim", "", 3277228, 22234, 0, 1},
  {"./work/64/PARITY_8_4.sim", "", 3299462, 4040, 0, 1},
  {"./work/64/PARITY_8_4__BEHAVIORAL.sim", "", 3303502, 6881, 0, 1},
  {"./work/64/PARITY_8.sim", "", 3310383, 4034, 0, 1},
  {"./work/64/PARITY_8__BEHAVIORAL.sim", "", 3314417, 6725, 0, 1},
  {"./work/64/PARITY_CHECK.sim", "", 3321142, 4418, 0, 1},
  {"./work/64/PARITY_CHECK__BEHAVIORAL.sim", "", 3325560, 18017, 0, 1},

  };
  static lPkgFileInfoStruct lPkgFileInfoArr[] = {
  {"./work/64/STD_LOGIC_TEXTIO__.sim"},
  {"./work/64/STD_LOGIC_SIGNED__.sim"},
  {"./work/64/STD_LOGIC_UNSIGNED__.sim"},
  {"./work/64/STD_LOGIC_ARITH__.sim"},
  {"./work/64/NUMERIC_STD__.sim"},

  };
int gGetFileInfo(char *xFileName, long xTimeStamp, long *xFileOffsetPtr, size_t *xFileSizePtr, int xCheckInPkgSimFiles,  char **xRealFileName)
{
  int j, lNumOfPkgSimFiles;
  static void *ht = 0;
  static int i = 0;
  static int k = 0;
at_least_one_object_file = 1;
  lNumOfScsFiles = 48;
  lNumOfPkgSimFiles = 5;
  if (xCheckInPkgSimFiles)
  {
     for (j = 0; j < lNumOfPkgSimFiles; j++)
     {
       char* lFName;
       lFName = lPkgFileInfoArr[k].dFileName;
       if (strcmp(lFName, xFileName) == 0)
           return 0;
       k = (k + 1) % lNumOfPkgSimFiles;
     }
     return 1;
  }
  if (!ht)
  {
    ht  = kernel_scs_file_ht_new(lFInfoArr, lNumOfScsFiles);
  }
  if (ht && (kernel_scs_file_ht_get(ht, xFileName, &i) == 0))
  { /* found it! The indicator 'i' was set properly. */
    if (xRealFileName)
        *xRealFileName = lFInfoArr[i].dRealFileName;
    *xFileSizePtr = lFInfoArr[i].dFileSize;
    *xFileOffsetPtr = lFInfoArr[i].dFileOffset;
    return 0;
  }
  return 1;
}
int getNextSimFile(char **fn, long *offset)
{
  static int cur;
  for ( ; cur < lNumOfScsFiles; ) {
    if (!lFInfoArr[cur].simFlag) {
      cur++;
      continue;
    }
    *fn = lFInfoArr[cur].dFileName;
    *offset = lFInfoArr[cur].dFileOffset;
    cur++;
    return 1;
  }
  return 0;
}

#ifdef __cplusplus
}
#endif
