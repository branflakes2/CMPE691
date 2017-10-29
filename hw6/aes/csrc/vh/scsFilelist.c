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
  {"synopsys_sim.setup_0", "./synopsys_sim.setup", 3654, 17, 1509303779, 0},
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
  {"./work/64/DUMMY_MHDL_CFG_AES_128_TB.sim", "", 1286660, 65060, 0, 0},
  {"./work/64/AES_128_TB__BEHAVIORAL.sim", "", 1351720, 44299, 0, 1},
  {"./work/64/NUMERIC_STD__.sim", "", 1396019, 726282, 0, 1},
  {"./work/64/NUMERIC_STD.sim", "", 2122301, 145978, 0, 1},
  {"./work/64/AES_128.sim", "", 2268279, 7999, 0, 1},
  {"./work/64/AES_128__BEHAVIORAL.sim", "", 2276278, 54949, 0, 1},
  {"./work/64/KEYEXPANSION.sim", "", 2331227, 6596, 0, 1},
  {"./work/64/KEYEXPANSION__BEHAVIORAL.sim", "", 2337823, 412667, 0, 1},
  {"./work/64/KEYXOR_128.sim", "", 2750490, 4526, 0, 1},
  {"./work/64/KEYXOR_128__BEHAVIORAL.sim", "", 2755016, 19431, 0, 1},
  {"./work/64/SBOX_128.sim", "", 2774447, 4264, 0, 1},
  {"./work/64/SBOX_128__BEHAVIORAL.sim", "", 2778711, 16231, 0, 1},
  {"./work/64/SHIFTROW_128.sim", "", 2794942, 4276, 0, 1},
  {"./work/64/SHIFTROW_128__BEHAVIORAL.sim", "", 2799218, 16323, 0, 1},
  {"./work/64/MIXCOLUMN_128.sim", "", 2815541, 4295, 0, 1},
  {"./work/64/MIXCOLUMN_128__BEHAVIORAL.sim", "", 2819836, 31247, 0, 1},
  {"./work/64/FAULT_INJECTOR.sim", "", 2851083, 9980, 0, 1},
  {"./work/64/FAULT_INJECTOR__BEHAVIORAL.sim", "", 2861063, 47669, 0, 1},
  {"./work/64/SBOX.sim", "", 2908732, 4228, 0, 1},
  {"./work/64/SBOX__BEHAVIORAL.sim", "", 2912960, 206967, 0, 1},
  {"./work/64/MIXCOLUMN.sim", "", 3119927, 3198, 0, 1},
  {"./work/64/MIXCOLUMN__BEHAVIORAL.sim", "", 3123125, 22418, 0, 1},

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
  lNumOfScsFiles = 34;
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
