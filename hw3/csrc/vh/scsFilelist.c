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
  {"synopsys_sim.setup_0", "./synopsys_sim.setup", 2678, 17, 1507168885, 0},
  {"synopsys_sim.setup_1", "/afs/umbc.edu/software/synopsys/software/vcs_mxi/bin/synopsys_sim.setup", 2695, 4844, 1500606232, 0},
  {"./work/64/AES_TEST.sim", "", 0, 2678, 0, 1},
  {"./work/64/STD_LOGIC_TEXTIO__.sim", "", 7539, 175760, 0, 1},
  {"./work/64/STD_LOGIC_TEXTIO.sim", "", 183299, 29717, 0, 1},
  {"./work/64/DUMMY_MHDL_CFG_AES_TEST.sim", "", 213016, 30624, 0, 0},
  {"./work/64/AES_TEST__TEST.sim", "", 243640, 10759, 0, 1},
  {"./work/64/ROUND9_10.sim", "", 254399, 3612, 0, 1},
  {"./work/64/ROUND9_10__BEHAVIOR.sim", "", 258011, 16870, 0, 1},
  {"./work/64/SBOXES.sim", "", 274881, 3307, 0, 1},
  {"./work/64/SBOXES__BEHAVIOR.sim", "", 278188, 7092, 0, 1},
  {"./work/64/SHIFT_ROW.sim", "", 285280, 3332, 0, 1},
  {"./work/64/SHIFT_ROW__BEHAVIOR.sim", "", 288612, 30446, 0, 1},
  {"./work/64/MIX_COLUMN.sim", "", 319058, 3335, 0, 1},
  {"./work/64/MIX_COLUMN__BEHAVIOR.sim", "", 322393, 10795, 0, 1},
  {"./work/64/KEY_SCHEDULE.sim", "", 333188, 3901, 0, 1},
  {"./work/64/KEY_SCHEDULE__BEHAVIOR.sim", "", 337089, 17406, 0, 1},
  {"./work/64/SBOX.sim", "", 354495, 3381, 0, 1},
  {"./work/64/SBOX__BEHAVIOR.sim", "", 357876, 82570, 0, 1},
  {"./work/64/GALOIS.sim", "", 440446, 3387, 0, 1},
  {"./work/64/GALOIS__BEHAVIOR.sim", "", 443833, 17378, 0, 1},
  {"./work/64/G.sim", "", 461211, 3804, 0, 1},
  {"./work/64/G__BEHAVIOR.sim", "", 465015, 16450, 0, 1},

  };
  static lPkgFileInfoStruct lPkgFileInfoArr[] = {
  {"./work/64/STD_LOGIC_TEXTIO__.sim"},

  };
int gGetFileInfo(char *xFileName, long xTimeStamp, long *xFileOffsetPtr, size_t *xFileSizePtr, int xCheckInPkgSimFiles,  char **xRealFileName)
{
  int j, lNumOfPkgSimFiles;
  static void *ht = 0;
  static int i = 0;
  static int k = 0;
at_least_one_object_file = 1;
  lNumOfScsFiles = 23;
  lNumOfPkgSimFiles = 1;
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
