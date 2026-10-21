
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0051d3d0(void)

{
  code *pcVar1;
  short sVar2;
  ushort uVar3;
  ushort uVar4;
  ushort uVar5;
  short sVar6;
  int iVar7;
  int *piVar8;
  byte bVar13;
  float *pfVar9;
  double ******ppppppdVar10;
  double *****pppppdVar11;
  undefined4 uVar12;
  int extraout_ECX;
  int extraout_ECX_00;
  int extraout_ECX_01;
  int extraout_ECX_02;
  int extraout_ECX_03;
  int extraout_ECX_04;
  int extraout_ECX_05;
  float *extraout_ECX_06;
  float *extraout_ECX_07;
  float *pfVar14;
  float *extraout_ECX_08;
  float *extraout_ECX_09;
  float *pfVar15;
  int extraout_ECX_10;
  float *extraout_ECX_11;
  int extraout_EDX;
  float *extraout_EDX_00;
  code *pcVar16;
  code *pcVar17;
  uint uVar18;
  int iVar19;
  code *pcVar20;
  uint uVar21;
  bool bVar22;
  ushort in_FPUStatusWord;
  ushort uVar23;
  float10 fVar24;
  float10 fVar25;
  float10 fVar26;
  float10 extraout_ST1;
  float10 extraout_ST1_00;
  float10 extraout_ST1_01;
  float10 extraout_ST1_02;
  float10 extraout_ST1_03;
  float10 extraout_ST1_04;
  float10 extraout_ST1_05;
  float10 extraout_ST1_06;
  float10 extraout_ST1_07;
  float10 extraout_ST1_08;
  float10 extraout_ST1_09;
  double *****pppppdStack_3f4;
  double *****pppppdStack_3f0;
  double *****pppppdStack_3ec;
  double *****pppppdStack_3e8;
  double *****pppppdStack_3e4;
  double *****pppppdStack_3e0;
  double *****pppppdStack_3dc;
  double *****pppppdStack_3d8;
  double *****pppppdStack_3d4;
  double *****pppppdStack_3d0;
  double *****pppppdStack_3cc;
  double *****pppppdStack_3c8;
  double *****pppppdStack_3c4;
  double *****pppppdStack_3c0;
  double *****pppppdStack_3bc;
  double *****pppppdStack_3b8;
  double *****pppppdStack_3b4;
  double *****pppppdStack_3b0;
  double *****pppppdStack_3ac;
  double *****pppppdStack_3a8;
  double *****pppppdStack_3a4;
  double *****pppppdStack_3a0;
  double *****pppppdStack_39c;
  double *****pppppdStack_398;
  double *****pppppdStack_394;
  double *****pppppdStack_390;
  double *****pppppdStack_38c;
  double *****pppppdStack_388;
  double *****pppppdStack_384;
  double *****pppppdStack_380;
  double *****pppppdStack_37c;
  double *****pppppdStack_378;
  double *****pppppdStack_374;
  double *****pppppdStack_370;
  double *****pppppdStack_36c;
  double *****pppppdStack_368;
  double *****pppppdStack_364;
  double *****pppppdStack_360;
  double *****pppppdStack_35c;
  double *****pppppdStack_358;
  double *****pppppdStack_354;
  double *****pppppdStack_350;
  double *****pppppdStack_34c;
  double *****pppppdStack_348;
  double *****pppppdStack_344;
  double *****pppppdStack_340;
  double *****pppppdStack_33c;
  double *****pppppdStack_338;
  double *****pppppdStack_334;
  double *****pppppdStack_330;
  double *****pppppdStack_32c;
  float *pfVar27;
  double *pdVar28;
  float *pfVar29;
  double *pdVar30;
  float *pfVar31;
  double *pdVar32;
  float *pfVar33;
  double *pdVar34;
  float *pfVar35;
  double *pdVar36;
  float *pfVar37;
  double *pdVar38;
  double *pdVar39;
  double dVar40;
  double dVar41;
  int *piVar42;
  float fVar43;
  double *****local_f8;
  double *****local_f0;
  double ***local_bc [4];
  undefined4 local_ac;
  float local_a4;
  float local_9c [4];
  undefined4 local_8c;
  double ***local_7c [2];
  float local_74;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  double *****local_5c;
  double ****local_58;
  undefined4 local_54;
  double local_48;
  float local_40;
  float local_3c;
  float local_38;
  float *local_34;
  float local_30;
  float local_2c;
  uint local_28;
  float local_24;
  double local_1c;
  void *pvStack_14;
  undefined1 *puStack_10;
  undefined1 *local_c;
  undefined *local_8;
  
  puStack_10 = &LAB_00404716;
  pvStack_14 = ExceptionList;
  local_c = &stack0xfffffdcc;
  local_8 = &DAT_004039f0;
  local_24 = 99999.0;
  local_1c = 0.0;
  local_28 = 0;
  local_2c = 0.0;
  local_30 = 0.0;
  local_38 = 0.0;
  local_48 = 0.0;
  local_54 = 0;
  local_58 = (double ****)0x0;
  local_5c = (double *****)0x0;
  local_60 = 0;
  local_64 = 0;
  local_68 = 0;
  local_6c = 0;
  local_7c[0] = (double ***)0x0;
  local_8c = 0;
  local_9c[0] = 0.0;
  local_ac = 0;
  local_bc[0] = (double ***)0x0;
  ExceptionList = &pvStack_14;
  FUN_00524640();
  _DAT_0054beb0 = (double)DAT_0054b414;
  _DAT_0054beb8 = (double)(DAT_0054b40c - DAT_0054b44c);
  if ((in_FPUStatusWord & 0xd) != 0) goto LAB_00524628;
  if (DAT_0054b000 == 0) {
    fVar24 = ((float10)DAT_0054b53c - (float10)_DAT_0054bfa4) / (float10)DAT_0054b310;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
  }
  _DAT_0054be90 = (double)fVar24;
  if ((in_FPUStatusWord & 0xd) != 0) goto LAB_00524628;
  pcVar16 = __vbaVarCat_exref;
  if (((*(short *)(DAT_0054b630 + 0xe) == 0) && (in_FPUStatusWord = 0, _DAT_0054be90 < 0.0)) &&
     (DAT_0054bec8 == 0)) {
    DAT_0054bec8 = 1;
    __vbaVarDup();
    Ordinal_660();
    pcVar16 = __vbaVarCat_exref;
    __vbaVarCat();
    __vbaStrVarMove();
    __vbaStrMove();
    iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
    in_FPUStatusWord = 0;
    if (iVar7 < 0) {
      __vbaHresultCheckObj();
    }
    __vbaFreeStr();
    __vbaFreeVarList();
    uVar18 = (uint)(ushort)(DAT_0054bd2c + 1);
    pcVar1 = (code *)0x1;
    pcVar17 = (code *)0x1;
    sVar6 = DAT_0054bd2c;
    while (pcVar20 = (code *)0x8, !SCARRY2(sVar6,1)) {
      pcVar20 = (code *)0x8;
      sVar6 = (short)pcVar1;
      pcVar17 = pcVar1;
      if ((short)uVar18 < sVar6) {
        if (!SCARRY2(DAT_0054bd2c,2)) {
          uVar18 = (int)(short)(DAT_0054bd2c + 2) - 1;
          if (7 < uVar18) {
            __vbaGenerateBoundsError();
          }
          *(undefined4 *)(DAT_0054bd20 + uVar18 * 8) = 0;
          *(undefined4 *)(DAT_0054bd20 + 4 + uVar18 * 8) = 0x40590000;
          goto LAB_0051d6f6;
        }
        break;
      }
      if (7 < (int)sVar6 - 1U) {
        __vbaGenerateBoundsError();
      }
      if (DAT_0054b000 == 0) {
        fVar24 = ((float10)_DAT_0054bad4 - (float10)DAT_0054b300) / (float10)(float)DAT_0054b304;
        iVar7 = DAT_0054bd20;
      }
      else {
        fVar24 = (float10)adj_fdiv_m32();
        iVar7 = extraout_EDX;
      }
      *(double *)(iVar7 + ((int)sVar6 - 1U) * 8) = (double)fVar24;
      if ((in_FPUStatusWord & 0xd) != 0) goto LAB_00524628;
      pcVar1 = (code *)(uint)(ushort)(sVar6 + 1);
    }
    goto LAB_0052462d;
  }
LAB_0051d6f6:
  (**(code **)(*DAT_0054b038 + 0x3b4))();
  pcVar17 = __vbaObjSet_exref;
  __vbaObjSet();
  __vbaLateIdCallLd();
  sVar6 = __vbaI2Var();
  if (DAT_0054b000 == 0) {
    fVar24 = ((float10)(int)sVar6 * (float10)0.002) / (float10)100.0;
  }
  else {
    fVar24 = (float10)adj_fdiv_m64();
  }
  _DAT_0054c014 =
       (double)(((float10)_DAT_0054b54c - (float10)_DAT_0054c014) * fVar24 + (float10)_DAT_0054c014)
  ;
  if ((in_FPUStatusWord & 0xd) != 0) goto LAB_00524628;
  __vbaFreeObj();
  __vbaFreeVar();
  uVar23 = 0;
  if ((0.0 < *(double *)(DAT_0054bd04 + 0x30)) && (DAT_0054c01c == 0)) {
    DAT_0054c01c = 1;
    __vbaVarDup();
    Ordinal_660();
    (*pcVar16)();
    __vbaStrVarMove();
    __vbaStrMove();
    iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
    uVar23 = 0;
    if (iVar7 < 0) {
      __vbaHresultCheckObj();
    }
    __vbaFreeStr();
    __vbaFreeVarList();
  }
  if (((DAT_0054bf2c == 0) && (DAT_0054bf30 == 0x3ff00000)) && (DAT_0054c01e == 0)) {
    DAT_0054c01e = 1;
    __vbaVarDup();
    Ordinal_660();
    (*pcVar16)();
    __vbaStrVarMove();
    __vbaStrMove();
    iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
    uVar23 = 0;
    if (iVar7 < 0) {
      __vbaHresultCheckObj();
    }
    __vbaFreeStr();
    __vbaFreeVarList();
  }
  fVar24 = FUN_0049c190((float *)&DAT_0054b494);
  DAT_0054b650 = (float)fVar24;
  fVar24 = (float10)FUN_0049bf00((float *)&DAT_0054b494);
  DAT_0054b64c = (float)fVar24;
  fVar24 = (float10)FUN_0049ae10((float *)&DAT_0054b494);
  DAT_0054b724 = (float)fVar24;
  fVar24 = (float10)FUN_0049ab70((float *)&DAT_0054b494);
  DAT_0054b728 = (float)fVar24;
  fVar24 = (float10)FUN_0049a3f0();
  local_34 = (float *)(float)fVar24;
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  fVar24 = FUN_0049beb0((float *)&stack0xfffffeac);
  local_40 = (float)fVar24;
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  fVar24 = FUN_0049beb0((float *)0x51da7a);
  local_3c = (float)fVar24;
  pfVar15 = (float *)&stack0xfffffea8;
  if (DAT_0054b000 == 0) {
    fVar24 = ((float10)local_40 - (float10)local_3c) / (float10)2.0;
  }
  else {
    pfVar15 = (float *)0x40000000;
    fVar24 = (float10)adj_fdiv_m32();
  }
  if (DAT_0054b000 == 0) {
    fVar24 = fVar24 / (float10)(float)local_34;
  }
  else {
    pfVar15 = local_34;
    fVar24 = (float10)adj_fdiv_m32();
  }
  _DAT_0054b778 = (float)fVar24;
  if (((uVar23 & 0xd) != 0) || ((uVar23 & 0xd) != 0)) goto LAB_00524628;
  fVar24 = (float10)FUN_0049ae10(pfVar15);
  fVar43 = (float)fVar24;
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  fVar24 = (float10)FUN_0049ae10((float *)&stack0xfffffeac);
  if (DAT_0054b000 == 0) {
    fVar24 = (fVar24 - (float10)fVar43) / (float10)2.0;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
  }
  if (DAT_0054b000 == 0) {
    fVar24 = fVar24 / (float10)(float)local_34;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
  }
  _DAT_0054b71c = (float)fVar24;
  if (((uVar23 & 0xd) != 0) || ((uVar23 & 0xd) != 0)) goto LAB_00524628;
  fVar24 = FUN_0049c190((float *)&stack0xfffffea8);
  fVar43 = (float)fVar24;
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  fVar24 = FUN_0049c190((float *)&stack0xfffffeac);
  if (DAT_0054b000 == 0) {
    fVar24 = (fVar24 - (float10)fVar43) / (float10)2.0;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
  }
  if (DAT_0054b000 == 0) {
    fVar24 = fVar24 / (float10)(float)local_34;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
  }
  _DAT_0054b658 = (float)fVar24;
  if (((uVar23 & 0xd) != 0) || ((uVar23 & 0xd) != 0)) goto LAB_00524628;
  fVar24 = (float10)FUN_0049ab70((float *)&stack0xfffffea8);
  fVar43 = (float)fVar24;
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  fVar24 = (float10)FUN_0049ab70((float *)&stack0xfffffeac);
  pfVar15 = (float *)&stack0xfffffea8;
  if (DAT_0054b000 == 0) {
    fVar24 = (fVar24 - (float10)fVar43) / (float10)2.0;
  }
  else {
    pfVar15 = (float *)0x40000000;
    fVar24 = (float10)adj_fdiv_m32();
  }
  if (DAT_0054b000 == 0) {
    fVar24 = fVar24 / (float10)(float)local_34;
  }
  else {
    pfVar15 = local_34;
    fVar24 = (float10)adj_fdiv_m32();
  }
  _DAT_0054b720 = (float)fVar24;
  if (((uVar23 & 0xd) != 0) || ((uVar23 & 0xd) != 0)) goto LAB_00524628;
  fVar24 = (float10)FUN_0049bf00(pfVar15);
  fVar43 = (float)fVar24;
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  fVar24 = (float10)FUN_0049bf00((float *)&stack0xfffffeac);
  if (DAT_0054b000 == 0) {
    fVar24 = (fVar24 - (float10)fVar43) / (float10)2.0;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
  }
  if (DAT_0054b000 == 0) {
    fVar24 = fVar24 / (float10)(float)local_34;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
  }
  _DAT_0054b65c = (float)fVar24;
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  (*(code *)(*DAT_0054b024)[0x132])();
  __vbaObjSet();
  __vbaLateIdCallLd();
  sVar6 = __vbaI2Var();
  __vbaFreeObj();
  __vbaFreeVar();
  if ((sVar6 != 1) &&
     (_DAT_0054b75c = DAT_0054b850 * _DAT_0054b818 + _DAT_0054b1a8, (uVar23 & 0xd) != 0))
  goto LAB_00524628;
  (*(code *)(*DAT_0054b024)[0x109])();
  __vbaObjSet();
  __vbaLateIdCallLd();
  sVar6 = __vbaI2Var();
  __vbaFreeObj();
  __vbaFreeVar();
  if (sVar6 != 1) {
    if (DAT_0054b000 == 0) {
      fVar24 = ((float10)DAT_0054b154 - (float10)0.27) / (float10)DAT_0054b850;
    }
    else {
      fVar24 = (float10)adj_fdiv_m32();
    }
    if (((uVar23 & 0xd) != 0) ||
       (_DAT_0054b6d4 =
             (float)(((float10)_DAT_0054b75c - (float10)_DAT_0054b1a8) * fVar24 + (float10)0.27),
       (uVar23 & 0xd) != 0)) goto LAB_00524628;
  }
  fVar24 = (float10)__vbaFpR4();
  uVar23 = 0;
  if ((float10)_DAT_0054b6d4 < fVar24) {
    _DAT_0054b6d4 = 0.27;
  }
  Ordinal_605();
  FUN_0050da40();
  _DAT_0054ba30 = *(undefined4 *)(DAT_0054b5f8 + 0x18);
  FUN_00512520(&DAT_0054b40c,&DAT_0054b42c,(float **)&DAT_0054b430,(float *)&DAT_0054b860,
               (float *)&DAT_0054b654,(float *)&DAT_0054b740,(float *)&DAT_0054b744,
               (float *)&DAT_0054b12c,&DAT_0054b530,&DAT_0054b534,(float *)&DAT_0054ba30,
               (float **)&DAT_0054b4e2,(float **)&DAT_0054b4e4,(float *)&DAT_0054ba34,
               (float *)&DAT_0054b83c,(float *)&DAT_0054b840,&DAT_0054b414,(float *)&DAT_0054b130);
  FUN_00510850((float *)&DAT_0054b494,(float *)&DAT_0054b1c4,&DAT_0054b4e8,(float *)&DAT_0054ba20,
               &DAT_0054b454,(float *********)&DAT_0054b40c,(float *)&DAT_0054b6e0,&DAT_0054b694,
               (float *)&DAT_0054b160,&local_2c,(float *)&DAT_0054ba38,&DAT_0054b548,
               (float *)&DAT_0054ba40,&DAT_0054b414);
  FUN_00511b00((float *)&DAT_0054b494,(float *)&DAT_0054b1b8,&DAT_0054b4e6,(float *)&DAT_0054b540,
               (float *)&DAT_0054b804,(float *)&DAT_0054b570,&DAT_0054b414,(float *)&DAT_0054b574,
               (float *)&DAT_0054b708,(float *)&DAT_0054b1c0,&DAT_0054b40c);
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  fVar24 = FUN_0049be80((float *)&stack0xfffffeac);
  _DAT_0054b6c4 =
       (1.0 - (float)fVar24) * _DAT_0054ba20 + _DAT_0054ba1c + _DAT_0054b804 + _DAT_0054ba28;
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  fVar24 = FUN_0049b3a0((float *)&DAT_0054b494,(short *)&stack0xfffffeb0);
  _DAT_0054ba44 = (float)fVar24;
  fVar24 = FUN_0049b3a0((float *)&DAT_0054b494,(short *)&stack0xfffffeb0);
  _DAT_0054ba48 = (float)fVar24;
  pppppdVar11 = (double *****)0x51e0c7;
  FUN_0050f660((float *)&DAT_0054b494,&DAT_0054b124,(float *)&DAT_0054b148,(float *)&DAT_0054b140,
               (float *)&DAT_0054b138,(float *)&DAT_0054b14c,(float *)&DAT_0054b144,
               (float *)&DAT_0054b4a0,(float *)&DAT_0054b6a8,&DAT_0054b4d0,(float *)&DAT_0054ba48,
               (float *)&DAT_0054ba44,(float *)&DAT_0054b13c);
  _DAT_0054b6d0 = _DAT_0054b494 - _DAT_0054ba4c;
  if (((uVar23 & 0xd) != 0) || (_DAT_0054ba50 = DAT_0054b534 + DAT_0054b530, (uVar23 & 0xd) != 0))
  goto LAB_00524628;
  if (DAT_0054b4da == 1) {
    local_74 = DAT_0054b40c - DAT_0054b44c;
    local_7c[0] = (double ***)0x4;
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    fVar24 = (float10)FUN_0049a4f0();
joined_r0x0051e55f:
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    fVar43 = (float)fVar24;
    fVar24 = FUN_0049be80((float *)&stack0xfffffeac);
    _DAT_0054ba54 =
         DAT_0054b330 * DAT_0054b120 * DAT_0054b41c * fVar43 * DAT_0054b420 * (float)fVar24;
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    __vbaFreeVar();
  }
  else {
    if ((*(short *)(DAT_0054b630 + 0xe) == 0) && (DAT_0054b4da == 0)) {
      if (DAT_0054b44c <= DAT_0054b40c) {
        __vbaVarDup();
        Ordinal_660();
        (*pcVar16)();
        __vbaStrVarMove();
        __vbaStrMove();
        iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
        if (iVar7 < 0) {
          __vbaHresultCheckObj();
        }
        __vbaFreeStr();
        __vbaFreeVarList();
        DAT_0054b434 = DAT_0054b44c;
        DAT_0054b4da = 1;
        (*(code *)(*DAT_0054b024)[0x151])();
        __vbaObjSet();
        __vbaLateIdSt();
        __vbaFreeObj();
        __vbaFreeVar();
        __vbaFpI2();
        (*(code *)(*DAT_0054b024)[0x13d])();
        piVar8 = (int *)__vbaObjSet();
        iVar7 = (**(code **)(*piVar8 + 0x40))();
        uVar23 = 0;
        if (iVar7 < 0) {
          __vbaHresultCheckObj();
        }
        __vbaLateIdSt();
        __vbaFreeObjList();
        *(undefined2 *)(DAT_0054b630 + 0x16) = 0xffff;
        *(undefined4 *)(DAT_0054b5dc + 0x2c) = 0x40400000;
        *(undefined4 *)(DAT_0054b5a4 + 0x2c) = 0xc2c80000;
        *(float *)(DAT_0054b5f8 + 0x2c) = DAT_0054b40c;
        DAT_0054b484 = 1;
        (*(code *)(*DAT_0054b024)[0x152])();
        __vbaObjSet();
        __vbaLateIdSt();
        __vbaFreeObj();
        (*(code *)(*DAT_0054b024)[0x130])();
        __vbaObjSet();
        __vbaLateIdSt();
        __vbaFreeObj();
        if (*(short *)(DAT_0054b630 + 0x10) == 0) {
          *(undefined2 *)(DAT_0054b630 + 0x10) = 0xffff;
        }
        DAT_0054b4da = 1;
        _DAT_0054b81c = 0.0;
        DAT_0054b424 = 0;
        DAT_0054b48c = 0;
        __vbaFpI4();
        (*(code *)(*DAT_0054b024)[0x182])();
        __vbaObjSet();
        __vbaLateIdSt();
        __vbaFreeObj();
        FUN_004f8120((float *)&DAT_0054b48c);
        local_7c[0] = (double ***)0x4;
        local_74 = (DAT_0054b40c - DAT_0054b44c) + 2.0;
        if ((uVar23 & 0xd) != 0) goto LAB_00524628;
        pppppdVar11 = (double *****)local_7c;
        fVar24 = (float10)FUN_0049a4f0();
        goto joined_r0x0051e55f;
      }
      if (_DAT_0054b15c < _DAT_0054b494) {
        if ((DAT_0054ba68 <= 66.0) || (_DAT_0054b870 <= _DAT_0054ba50)) {
          if (_DAT_0054b494 < _DAT_0054b150) {
            if (DAT_0054b6c0 <= 92.0) {
              pppppdVar11 = (double *****)0x51ee53;
              fVar24 = (float10)__vbaFpR4();
              if (fVar24 < (float10)DAT_0054b460) {
                if ((DAT_0054b844 < _DAT_0054b21c) || (DAT_0054b848 < _DAT_0054b21c)) {
                  DAT_0054b796 = 0xffff;
                  DAT_0054b44c = DAT_0054b40c;
                  (*(code *)(*DAT_0054b024)[0xdc])();
                  piVar8 = (int *)__vbaObjSet();
                  iVar7 = (**(code **)(*piVar8 + 0x6c))();
                  if (iVar7 < 0) {
                    __vbaHresultCheckObj();
                  }
                  __vbaFreeObj();
                  __vbaVarDup();
                  Ordinal_660();
                  __vbaVarDup();
                  Ordinal_660();
                  (*pcVar16)();
                  (*pcVar16)();
                  (*pcVar16)();
                  __vbaStrVarMove();
                  __vbaStrMove();
                  iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
                  uVar23 = 0;
                  if (iVar7 < 0) {
                    __vbaHresultCheckObj();
                  }
                  __vbaFreeStr();
                  __vbaFreeVarList();
                  DAT_0054b43c = DAT_0054b40c;
                  DAT_0054b440 = DAT_0054b40c;
                }
                else {
                  (*(code *)(*DAT_0054b024)[0x14c])();
                  piVar8 = (int *)__vbaObjSet();
                  iVar7 = (**(code **)(*piVar8 + 0x40))();
                  if (iVar7 < 0) {
                    __vbaHresultCheckObj();
                  }
                  (*(code *)(*DAT_0054b024)[0x14c])();
                  piVar8 = (int *)__vbaObjSet();
                  iVar7 = (**(code **)(*piVar8 + 0x40))();
                  uVar23 = 0;
                  if (iVar7 < 0) {
                    __vbaHresultCheckObj();
                  }
                  __vbaLateIdCallLd();
                  sVar6 = __vbaI2Var();
                  __vbaLateIdCallLd();
                  sVar2 = __vbaI2Var();
                  __vbaFreeObjList();
                  __vbaFreeVarList();
                  if (sVar6 == 0 && sVar2 == 0) {
                    DAT_0054b44c = DAT_0054b40c;
                    local_24 = DAT_0054b40c;
                    __vbaVarDup();
                    Ordinal_660();
                    (*pcVar16)();
                    __vbaStrVarMove();
                    __vbaStrMove();
                    iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
                    uVar23 = 0;
                    if (iVar7 < 0) {
                      __vbaHresultCheckObj();
                    }
                    __vbaFreeStr();
                    __vbaFreeVarList();
                  }
                }
              }
              else {
                _DAT_0054ba60 = DAT_0054b460 * 100.0;
                DAT_0054b794 = 0xffff;
                DAT_0054b44c = DAT_0054b40c;
                (*(code *)(*DAT_0054b024)[0xd6])();
                piVar8 = (int *)__vbaObjSet();
                iVar7 = (**(code **)(*piVar8 + 0x6c))();
                if (iVar7 < 0) {
                  __vbaHresultCheckObj();
                }
                __vbaFreeObj();
                __vbaVarDup();
                Ordinal_660();
                __vbaVarDup();
                Ordinal_660();
                (*pcVar16)();
                (*pcVar16)();
                (*pcVar16)();
                __vbaStrVarMove();
                __vbaStrMove();
                iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
                uVar23 = 0;
                if (iVar7 < 0) {
                  __vbaHresultCheckObj();
                }
                __vbaFreeStr();
                __vbaFreeVarList();
              }
            }
            else {
              DAT_0054b44c = DAT_0054b40c;
              __vbaVarDup();
              pppppdVar11 = (double *****)0x1;
              Ordinal_660();
              __vbaVarDup();
              Ordinal_660();
              (*pcVar16)();
              (*pcVar16)();
              (*pcVar16)();
              __vbaStrVarMove();
              __vbaStrMove();
              iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
              if (iVar7 < 0) {
                __vbaHresultCheckObj();
              }
              __vbaFreeStr();
              __vbaFreeVarList();
              _DAT_0054b790 = 0xffff;
              (*(code *)(*DAT_0054b024)[0xd2])();
              piVar8 = (int *)__vbaObjSet();
              iVar7 = (**(code **)(*piVar8 + 0x6c))();
              uVar23 = 0;
              if (iVar7 < 0) {
                __vbaHresultCheckObj();
              }
              __vbaFreeObj();
            }
          }
          else {
            DAT_0054b78e = 0xffff;
            DAT_0054b44c = DAT_0054b40c;
            (*(code *)(*DAT_0054b024)[0xd1])();
            piVar8 = (int *)__vbaObjSet();
            iVar7 = (**(code **)(*piVar8 + 0x6c))();
            uVar23 = 0;
            if (iVar7 < 0) {
              __vbaHresultCheckObj();
            }
            __vbaFreeObj();
            __vbaVarDup();
            Ordinal_660();
            __vbaVarDup();
            if (DAT_0054b000 == 0) {
              fVar24 = (float10)_DAT_0054b150 / (float10)(float)DAT_0054b2fc;
            }
            else {
              fVar24 = (float10)adj_fdiv_m32();
            }
            pppppdVar11 = (double *****)0x1;
            local_ac = 4;
            local_a4 = (float)fVar24;
            if ((uVar23 & 0xd) != 0) goto LAB_00524628;
            Ordinal_660();
            (*pcVar16)();
            (*pcVar16)();
            (*pcVar16)();
            __vbaStrVarMove();
            __vbaStrMove();
            iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
            uVar23 = 0;
            if (iVar7 < 0) {
              __vbaHresultCheckObj();
            }
            __vbaFreeStr();
            __vbaFreeVarList();
          }
        }
        else {
          _DAT_0054ba58 = DAT_0054b464 * 100.0;
          DAT_0054b792 = 0xffff;
          DAT_0054b44c = DAT_0054b40c;
          pppppdVar11 = DAT_0054b024;
          (*(code *)(*DAT_0054b024)[0xdd])();
          piVar8 = (int *)__vbaObjSet();
          iVar7 = (**(code **)(*piVar8 + 0x6c))();
          if (iVar7 < 0) {
            __vbaHresultCheckObj();
          }
          __vbaFreeObj();
          __vbaVarDup();
          Ordinal_660();
          __vbaVarDup();
          Ordinal_660();
          (*pcVar16)();
          (*pcVar16)();
          (*pcVar16)();
          __vbaStrVarMove();
          __vbaStrMove();
          iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
          uVar23 = 0;
          if (iVar7 < 0) {
            __vbaHresultCheckObj();
          }
          __vbaFreeStr();
          __vbaFreeVarList();
        }
      }
      else {
        DAT_0054b44c = DAT_0054b40c;
        DAT_0054b78c = 0xffff;
        (*(code *)(*DAT_0054b024)[0xde])();
        piVar8 = (int *)__vbaObjSet();
        iVar7 = (**(code **)(*piVar8 + 0x6c))();
        uVar23 = 0;
        if (iVar7 < 0) {
          __vbaHresultCheckObj();
        }
        __vbaFreeObj();
        __vbaVarDup();
        Ordinal_660();
        __vbaVarDup();
        if (DAT_0054b000 == 0) {
          fVar24 = (float10)_DAT_0054b15c / (float10)(float)DAT_0054b2fc;
        }
        else {
          fVar24 = (float10)adj_fdiv_m32();
        }
        pppppdVar11 = (double *****)local_bc;
        local_ac = 4;
        local_a4 = (float)fVar24;
        if ((uVar23 & 0xd) != 0) goto LAB_00524628;
        Ordinal_660();
        (*pcVar16)();
        (*pcVar16)();
        (*pcVar16)();
        __vbaStrVarMove();
        __vbaStrMove();
        iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
        uVar23 = 0;
        if (iVar7 < 0) {
          __vbaHresultCheckObj();
        }
        __vbaFreeStr();
        __vbaFreeVarList();
      }
    }
    _DAT_0054ba54 = DAT_0054b558 * DAT_0054b120 * DAT_0054b41c * DAT_0054b330;
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  }
  if (DAT_0054b000 == 0) {
    fVar24 = (float10)_DAT_0054ba54 / (float10)DAT_0054b330;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
  }
  if (DAT_0054b000 == 0) {
    fVar24 = fVar24 / (float10)DAT_0054b120;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
  }
  DAT_0054ba64 = (float)(fVar24 * (float10)100.0);
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  if (*(short *)(DAT_0054b630 + 0xe) == -1) {
    _DAT_0054b190 = 0x47c34f80;
  }
  if ((*(short *)(DAT_0054b630 + 0xe) == 0) && (DAT_0054bec8 != 0)) {
    uVar23 = 0;
    if (1.0 < (double)CONCAT44(DAT_0054bf48,DAT_0054bf44)) {
      if (DAT_0054b000 == 0) {
        fVar24 = (float10)(double)CONCAT44(DAT_0054bf48,DAT_0054bf44) /
                 ((float10)_DAT_0054beb0 * (float10)1.055);
      }
      else {
        fVar24 = (float10)adj_fdivr_m64();
      }
      if (DAT_0054b000 == 0) {
        fVar24 = fVar24 / (float10)DAT_0054b330;
      }
      else {
        fVar24 = (float10)adj_fdiv_m32();
      }
      if (DAT_0054b000 == 0) {
        fVar24 = fVar24 / (float10)DAT_0054b120;
      }
      else {
        fVar24 = (float10)adj_fdiv_m32();
      }
      DAT_0054ba68 = (float)(fVar24 * (float10)100.0);
      if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    }
    pppppdVar11 = (double *****)0x51f5ba;
    fVar24 = (float10)FUN_0052cbc0((double *)&DAT_0054beb8);
    if (DAT_0054b000 == 0) {
      fVar24 = fVar24 / (float10)1000.0;
    }
    else {
      pppppdVar11 = (double *****)0x408f4000;
      fVar24 = (float10)adj_fdiv_m64();
    }
    if (DAT_0054b000 == 0) {
      fVar24 = fVar24 / (float10)DAT_0054b120;
    }
    else {
      fVar24 = (float10)adj_fdiv_m32();
    }
    DAT_0054ba64 = (float)(fVar24 * (float10)100.0);
    if ((((uVar23 & 0xd) != 0) ||
        (DAT_0054b554 = (float)DAT_0054b304 * (float)_DAT_0054bdfc + DAT_0054b300,
        (uVar23 & 0xd) != 0)) ||
       (_DAT_0054bad4 = (float)DAT_0054b304 * (float)_DAT_0054be04 + DAT_0054b300,
       (uVar23 & 0xd) != 0)) goto LAB_00524628;
  }
  else {
    if (DAT_0054b000 == 0) {
      fVar24 = (((float10)DAT_0054b550 - (float10)_DAT_0054b498) * (float10)_DAT_0054b6fc) /
               (float10)DAT_0054b330;
    }
    else {
      fVar24 = (float10)adj_fdiv_m32();
    }
    if (DAT_0054b000 == 0) {
      fVar24 = fVar24 / (float10)DAT_0054b120;
    }
    else {
      fVar24 = (float10)adj_fdiv_m32();
    }
    DAT_0054ba68 = (float)(fVar24 * (float10)100.0);
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    DAT_0054b554 = DAT_0054b550;
    _DAT_0054bad4 = DAT_0054b550;
  }
  if (DAT_0054b000 == 0) {
    fVar24 = ((float10)DAT_0054b554 + (float10)_DAT_0054b498) / (float10)2.0;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
  }
  _DAT_0054b56c = (float)fVar24;
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  if (DAT_0054bec8 == 1) {
    if (DAT_0054b000 == 0) {
      fVar24 = (float10)DAT_0054ba68 / (float10)100.0;
    }
    else {
      fVar24 = (float10)adj_fdiv_m32();
    }
    pdVar30 = &local_48;
    pdVar39 = (double *)&DAT_0054be98;
    pdVar38 = (double *)&DAT_0054bdec;
    pdVar36 = (double *)&DAT_0054bddc;
    pdVar34 = (double *)&DAT_0054c014;
    pdVar32 = (double *)&DAT_0054bdd4;
    pdVar28 = (double *)&DAT_0054bde4;
    if (DAT_0054b000 == 0) {
      fVar24 = (fVar24 * (float10)DAT_0054b120 * (float10)DAT_0054b330) /
               (float10)(float)DAT_0054bad8;
    }
    else {
      pdVar28 = DAT_0054bad8;
      fVar24 = (float10)adj_fdiv_m32();
    }
    if (DAT_0054b000 == 0) {
      fVar24 = fVar24 / (float10)(float)DAT_0054b32c;
    }
    else {
      pdVar28 = DAT_0054b32c;
      fVar24 = (float10)adj_fdiv_m32();
    }
    _DAT_0054bde4 = (double)fVar24;
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    if (DAT_0054b000 == 0) {
      fVar24 = (float10)_DAT_0054b6c4 / (float10)(float)DAT_0054b32c;
    }
    else {
      pdVar28 = DAT_0054b32c;
      fVar24 = (float10)adj_fdiv_m32();
    }
    local_48 = (double)fVar24;
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    if (DAT_0054b000 == 0) {
      fVar24 = (float10)_DAT_0054b494 / (float10)(float)DAT_0054b2fc;
    }
    else {
      pdVar28 = DAT_0054b2fc;
      fVar24 = (float10)adj_fdiv_m32();
    }
    _DAT_0054bdd4 = (double)fVar24;
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    if (DAT_0054b000 == 0) {
      fVar24 = ((float10)DAT_0054b548 - (float10)DAT_0054b300) / (float10)(float)DAT_0054b304;
    }
    else {
      pdVar28 = DAT_0054b304;
      fVar24 = (float10)adj_fdiv_m32();
    }
    _DAT_0054bddc = (double)fVar24;
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    if (DAT_0054b000 == 0) {
      fVar24 = (float10)DAT_0054b544 / (float10)(float)DAT_0054b2fc;
    }
    else {
      pdVar28 = DAT_0054b2fc;
      fVar24 = (float10)adj_fdiv_m32();
    }
    _DAT_0054bdec = (double)fVar24;
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    if (DAT_0054b000 == 0) {
      fVar24 = ((float10)_DAT_0054b498 - (float10)DAT_0054b300) / (float10)(float)DAT_0054b304;
    }
    else {
      pdVar28 = DAT_0054b304;
      fVar24 = (float10)adj_fdiv_m32();
    }
    _DAT_0054be98 = (double)fVar24;
    if (((uVar23 & 0xd) != 0) ||
       (local_1c = (double)(DAT_0054ba64 * DAT_0054b41c), (uVar23 & 0xd) != 0)) goto LAB_00524628;
    FUN_00526b40(pdVar28,(double *)pppppdVar11,pdVar30,pdVar32,pdVar34,pdVar36,pdVar38,pdVar39);
  }
  uVar23 = 0;
  if (0.01 < *(double *)(DAT_0054bd04 + 0x38)) {
    _DAT_0054bfe4 =
         (float)(((float10)_DAT_0054bd48 + (float10)_DAT_0054bd40 + (float10)_DAT_0054bd50 +
                 (float10)_DAT_0054bd58) * (float10)*(double *)(DAT_0054bd04 + 0x38) *
                (float10)(float)DAT_0054b32c);
    fVar24 = (float10)__vbaPowerR8();
    dVar40 = (double)fVar24;
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    fVar24 = (float10)__vbaPowerR8();
    fVar24 = (float10)dVar40 - fVar24;
    if (DAT_0054b000 == 0) {
      fVar26 = (float10)_DAT_0054bff4 / (float10)2.0;
    }
    else {
      fVar26 = (float10)adj_fdiv_m32();
      fVar24 = extraout_ST1;
    }
    if ((((uVar23 & 0xd) != 0) || (_DAT_0054bfd0 = (float)(fVar26 * fVar24), (uVar23 & 0xd) != 0))
       || ((_DAT_0054bfd4 =
                 (((float)DAT_0054b304 * (float)*(double *)(DAT_0054bd20 + 0x38) + DAT_0054b300) -
                 _DAT_0054bfe8) * _DAT_0054bff0, (uVar23 & 0xd) != 0 || ((uVar23 & 0xd) != 0))))
    goto LAB_00524628;
    fVar24 = (float10)__vbaFpR8();
    uVar23 = 0;
    if (fVar24 < (float10)0.0) {
      _DAT_0054bfd0 = 1.0;
      _DAT_0054bfd4 = 1.0;
    }
    _DAT_0054bfcc = (_DAT_0054bfd4 + _DAT_0054bfd0) * DAT_0054b414 + _DAT_0054bfcc;
    if (DAT_0054b000 != 0) {
      adj_fdiv_m32();
    }
    if (DAT_0054b000 != 0) {
      adj_fdiv_m32();
    }
    if (DAT_0054b000 != 0) {
      adj_fdiv_m32();
    }
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    fVar24 = (float10)Ordinal_614();
    dVar40 = (double)fVar24;
    if (((uVar23 & 0xd) != 0) || ((uVar23 & 0xd) != 0)) goto LAB_00524628;
    if (DAT_0054b000 == 0) {
      fVar24 = ((float10)_DAT_0054bfd4 + (float10)_DAT_0054bfd0) /
               ABS((float10)_DAT_0054bfd4 + (float10)_DAT_0054bfd0);
    }
    else {
      fVar24 = (float10)adj_fdiv_r();
    }
    _DAT_0054bfe8 = (float)(fVar24 * (float10)dVar40 + (float10)DAT_0054b2b0);
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
    uVar23 = 0;
    if (_DAT_0054bfe8 <= 1629.0) {
      _DAT_0054bfb4 = 0.0;
    }
    else {
      _DAT_0054bfe8 = 1629.0;
      if (DAT_0054b000 != 0) {
        adj_fdiv_m32();
      }
      if (DAT_0054b000 != 0) {
        adj_fdiv_m32();
      }
      if ((uVar23 & 0xd) != 0) goto LAB_00524628;
      if (DAT_0054b000 != 0) {
        adj_fdiv_m64();
      }
      if ((uVar23 & 0xd) != 0) goto LAB_00524628;
      Ordinal_614();
      fVar24 = (float10)__vbaPowerR8();
      _DAT_0054bfd8 = (float)fVar24;
      fVar24 = (float10)__vbaPowerR8();
      if (DAT_0054b000 == 0) {
        fVar26 = (((float10)_DAT_0054bfd4 + (float10)_DAT_0054bfd0) * (float10)DAT_0054b414) /
                 (float10)DAT_0054bfc0;
      }
      else {
        fVar26 = (float10)adj_fdiv_m32();
        fVar24 = extraout_ST1_00;
      }
      if ((((uVar23 & 0xd) != 0) ||
          (_DAT_0054bfb4 =
                (float)(fVar26 * (float10)(double)CONCAT44(DAT_0054c024,DAT_0054c020) * fVar24),
          (uVar23 & 0xd) != 0)) ||
         (_DAT_0054bfbc = _DAT_0054bfbc + _DAT_0054bfb4, (uVar23 & 0xd) != 0)) goto LAB_00524628;
    }
  }
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  if (DAT_0054b000 == 0) {
    fVar24 = (-(float10)_DAT_0054c000 * (float10)55.85) / (float10)46.0;
    iVar7 = DAT_0054b5f8;
  }
  else {
    fVar24 = (float10)adj_fdiv_m64();
    iVar7 = extraout_ECX;
  }
  fVar24 = fVar24 * (float10)337.0;
  if (DAT_0054b000 == 0) {
    fVar26 = (float10)_DAT_0054bffc / (float10)18.0;
  }
  else {
    fVar26 = (float10)adj_fdiv_m32();
    iVar7 = extraout_ECX_00;
    fVar24 = extraout_ST1_01;
  }
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  fVar24 = fVar26 * (float10)977846.0 + fVar24;
  if (DAT_0054b000 == 0) {
    fVar26 = (float10)_DAT_0054bfb4 / (float10)DAT_0054b414;
  }
  else {
    fVar26 = (float10)adj_fdiv_m32();
    iVar7 = extraout_ECX_01;
    fVar24 = extraout_ST1_02;
  }
  if (DAT_0054b000 == 0) {
    fVar26 = fVar26 / (float10)(float)DAT_0054b32c;
  }
  else {
    fVar26 = (float10)adj_fdiv_m32();
    iVar7 = extraout_ECX_02;
    fVar24 = extraout_ST1_03;
  }
  if (((uVar23 & 0xd) != 0) ||
     (_DAT_0054bfb8 = (float)(fVar26 * (float10)_DAT_0054c004 * fVar24), (uVar23 & 0xd) != 0))
  goto LAB_00524628;
  if (DAT_0054b000 == 0) {
    fVar24 = (float10)_DAT_0054bffc / (float10)18.0;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
    iVar7 = extraout_ECX_03;
  }
  fVar24 = fVar24 * (float10)10.0;
  if (DAT_0054b000 == 0) {
    fVar26 = ((float10)_DAT_0054c000 * (float10)30.0) / (float10)46.0;
  }
  else {
    fVar26 = (float10)adj_fdiv_m32();
    iVar7 = extraout_ECX_04;
    fVar24 = extraout_ST1_04;
  }
  _DAT_0054c008 = (float)((float10)_DAT_0054c004 * (float10)_DAT_0054bfbc * (fVar26 + fVar24));
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  if (DAT_0054b000 == 0) {
    fVar24 = ((float10)DAT_0054ba68 * (float10)DAT_0054b120) / (float10)100.0;
  }
  else {
    fVar24 = (float10)adj_fdiv_m32();
    iVar7 = extraout_ECX_05;
  }
  DAT_0054ba6c = (float)fVar24;
  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  uVar23 = 0;
  if (DAT_0054b40c <= *(float *)(iVar7 + 0x20)) {
    DAT_0054b484 = 0;
LAB_0051ff34:
    DAT_0054b50c = (_DAT_0054b1fc - DAT_0054b4c0) * _DAT_0054b818 + DAT_0054b4c0;
    if ((uVar23 & 0xd) != 0) goto LAB_00524628;
  }
  else {
    DAT_0054b484 = 1;
    (*(code *)(*DAT_0054b024)[0x132])();
    __vbaObjSet();
    __vbaLateIdCallLd();
    sVar6 = __vbaI2Var();
    __vbaFreeObj();
    __vbaFreeVar();
    if (sVar6 == 0) {
      (*(code *)(*DAT_0054b024)[0x131])();
      __vbaObjSet();
      __vbaLateIdCallLd();
      sVar6 = __vbaI2Var();
      __vbaFreeObj();
      __vbaFreeVar();
      if (sVar6 == 0) goto LAB_0051ff34;
    }
    else {
      if (DAT_0054b000 == 0) {
        fVar24 = (float10)_DAT_0054b2ec / (float10)DAT_0054b318;
      }
      else {
        fVar24 = (float10)adj_fdiv_m32();
      }
      _DAT_0054b75c = (float)((float10)_DAT_0054b75c - fVar24 * (float10)DAT_0054b414);
      if ((uVar23 & 0xd) != 0) goto LAB_00524628;
      fVar24 = FUN_0049bde0((float *)&DAT_0054b75c);
      DAT_0054b50c = (float)fVar24;
    }
  }
  _DAT_0054b510 = DAT_0054b50c;
  FUN_00505370((float *)&DAT_0054b6b8,&DAT_0054b4fc,(float *)&DAT_0054b4b0,(float *)&DAT_0054b838,
               (float *)&DAT_0054b84c,(float *)&DAT_0054b12c,&DAT_0054b530,&DAT_0054b41c,
               &DAT_0054b844,(float *)&DAT_0054b560,(float *)&DAT_0054b740,(float *)&DAT_0054b67c,
               (float *)&DAT_0054b4cc,(float *)&DAT_0054b4c4,(float *)&DAT_0054b1f8,
               (float *)&DAT_0054b214,(float *)&DAT_0054b854,(float *)&DAT_0054b218,&DAT_0054b40c,
               (float *)(DAT_0054b5f8 + 0x20),&DAT_0054b538,(float *)&DAT_0054b528,&DAT_0054ba68,
               &DAT_0054b4e2,(float *)&DAT_0054b1a4,(float *)&DAT_0054b498,(float *)&DAT_0054b4f4,
               (float *)&DAT_0054b1cc,&DAT_0054b4de);
  if ((uVar23 & 0xd) == 0) {
    __vbaFpI2();
    FUN_00505370((float *)0x5200d9,(float *)&DAT_0054b500,(float *)&DAT_0054b4b0,
                 (float *)&DAT_0054b838,(float *)&DAT_0054b84c,(float *)&DAT_0054b12c,&DAT_0054b534,
                 &DAT_0054b41c,&DAT_0054b848,(float *)&DAT_0054b564,(float *)&DAT_0054b744,
                 (float *)&DAT_0054b680,(float *)&DAT_0054b4cc,(float *)&DAT_0054b4c8,
                 (float *)&DAT_0054b1f8,(float *)&DAT_0054b214,(float *)&DAT_0054b854,
                 (float *)&DAT_0054b218,&DAT_0054b40c,(float *)(DAT_0054b5f8 + 0x20),&DAT_0054b538,
                 (float *)&DAT_0054b52c,&DAT_0054ba68,&DAT_0054b4e4,(float *)&DAT_0054b1a4,
                 (float *)&DAT_0054b498,(float *)&DAT_0054b4f8,(float *)&DAT_0054b1cc,
                 (short *)&stack0xfffffeb0);
    uVar23 = 0;
    if (DAT_0054b844 <= 0.0) {
      if (DAT_0054b000 != 0) {
        adj_fdiv_m32();
      }
      if (DAT_0054b000 != 0) {
        adj_fdivr_m32();
      }
      if (((uVar23 & 0xd) != 0) || ((uVar23 & 0xd) != 0)) goto LAB_00524628;
      (*(code *)(*DAT_0054b024)[0x16a])();
      piVar8 = (int *)__vbaObjSet();
      iVar7 = (**(code **)(*piVar8 + 0x40))();
      if (iVar7 < 0) {
        __vbaHresultCheckObj();
      }
      __vbaLateIdSt();
    }
    else {
      if (DAT_0054b000 != 0) {
        adj_fdiv_m32();
      }
      if (((uVar23 & 0xd) != 0) || ((uVar23 & 0xd) != 0)) goto LAB_00524628;
      (*(code *)(*DAT_0054b024)[0x16a])();
      piVar8 = (int *)__vbaObjSet();
      iVar7 = (**(code **)(*piVar8 + 0x40))();
      if (iVar7 < 0) {
        __vbaHresultCheckObj();
      }
      __vbaLateIdSt();
    }
    __vbaFreeObjList();
    uVar23 = 0;
    if (DAT_0054b848 <= 0.0) {
      if (DAT_0054b000 != 0) {
        adj_fdiv_m32();
      }
      if (DAT_0054b000 != 0) {
        adj_fdivr_m32();
      }
      if (((uVar23 & 0xd) != 0) || ((uVar23 & 0xd) != 0)) goto LAB_00524628;
      (*(code *)(*DAT_0054b024)[0x16a])();
      piVar8 = (int *)__vbaObjSet();
      iVar7 = (**(code **)(*piVar8 + 0x40))();
      uVar23 = 0;
      if (iVar7 < 0) {
        __vbaHresultCheckObj();
      }
      __vbaLateIdSt();
    }
    else {
      if (DAT_0054b000 != 0) {
        adj_fdiv_m32();
      }
      if (((uVar23 & 0xd) != 0) || ((uVar23 & 0xd) != 0)) goto LAB_00524628;
      (*(code *)(*DAT_0054b024)[0x16a])();
      piVar8 = (int *)__vbaObjSet();
      iVar7 = (**(code **)(*piVar8 + 0x40))();
      uVar23 = 0;
      if (iVar7 < 0) {
        __vbaHresultCheckObj();
      }
      __vbaLateIdSt();
    }
    __vbaFreeObjList();
    fVar24 = FUN_0049b3a0(&DAT_0054b4c0,(short *)&stack0xfffffeb0);
    if ((uVar23 & 0xd) == 0) {
      if (DAT_0054b000 == 0) {
        fVar24 = (((float10)DAT_0054b614[3] + (float10)DAT_0054b614[2]) * (float10)0.1076 *
                 (float10)(float)fVar24) / (float10)DAT_0054b538;
      }
      else {
        fVar24 = (float10)adj_fdiv_m32();
      }
      _DAT_0054ba70 = (float)fVar24;
      if ((uVar23 & 0xd) == 0) {
        (*(code *)(*DAT_0054b024)[300])();
        __vbaObjSet();
        __vbaLateIdCallLd();
        sVar6 = __vbaI2Var();
        __vbaFreeObj();
        __vbaFreeVar();
        if (sVar6 != 1) {
          uVar23 = 0;
          if (DAT_0054b40c <= *(float *)(DAT_0054b5f8 + 0x38)) {
            _DAT_0054ba74 = DAT_0054b474;
          }
          else {
            _DAT_0054b81c = 1.0 - DAT_0054b614[0xe];
            _DAT_0054ba74 = 0x43480000;
          }
        }
        piVar8 = (int *)0x403e7ae1;
        if (DAT_0054b000 == 0) {
          fVar24 = ((float10)DAT_0054bd78 * (float10)1000.0) / (float10)2.0;
        }
        else {
          piVar8 = (int *)0x40000000;
          fVar24 = (float10)adj_fdiv_m32();
        }
        if ((uVar23 & 0xd) == 0) {
          dVar40 = (double)(fVar24 * (float10)22400.0);
          fVar24 = (float10)__vbaPowerR8();
          piVar42 = (int *)&stack0xfffffea8;
          if (DAT_0054b000 == 0) {
            fVar24 = (float10)dVar40 / (fVar24 * (float10)DAT_0054b2c0);
          }
          else {
            piVar8 = (int *)((ulonglong)dVar40 >> 0x20);
            piVar42 = SUB84(dVar40,0);
            fVar24 = (float10)adj_fdivr_m64();
          }
          DAT_0054bae4 = (float)(fVar24 * (float10)100.0);
          if (((uVar23 & 0xd) == 0) && ((uVar23 & 0xd) == 0)) {
            fVar24 = FUN_005124e0((float *)&stack0xfffffeac,piVar42,piVar8);
            _DAT_0054bfac = (float)fVar24;
            if ((*(short *)(DAT_0054b630 + 8) == 0) ||
               ((DAT_0054bfa8 != 0 ||
                (bVar13 = DAT_0054bae4 < _DAT_0054bfac |
                          (byte)((ushort)((ushort)(NAN(DAT_0054bae4) || NAN(_DAT_0054bfac)) << 10)
                                >> 8) |
                          (byte)((ushort)((ushort)(DAT_0054bae4 == _DAT_0054bfac) << 0xe) >> 8),
                DAT_0054bae4 < _DAT_0054bfac || (DAT_0054bae4 == _DAT_0054bfac) != 0)))) {
              uVar23 = (ushort)(DAT_0054bae4 < 1.0) << 8 | (ushort)NAN(DAT_0054bae4) << 10 |
                       (ushort)(DAT_0054bae4 == 1.0) << 0xe;
              if ((DAT_0054bae4 < 1.0) && (DAT_0054bfa8 == 1)) {
                iVar7 = (*(code *)(*DAT_0054b024)[0x19])();
                uVar23 = (uVar23 >> 8 & 0x7f) << 8;
                if (iVar7 < 0) {
                  __vbaHresultCheckObj();
                }
                DAT_0054bfa8 = 0;
                _DAT_0054b754 = 0.0;
              }
              else {
                fVar26 = (float10)__vbaFpR4();
                fVar24 = (float10)DAT_0054b40c;
                uVar23 = (ushort)(fVar26 < fVar24) << 8 | (ushort)(NAN(fVar26) || NAN(fVar24)) << 10
                         | (ushort)(fVar26 == fVar24) << 0xe;
                if ((fVar26 < fVar24) && (DAT_0054bfa8 == 1)) {
                  iVar7 = (*(code *)(*DAT_0054b024)[0x19])();
                  uVar23 = (uVar23 >> 8 & 0x7f) << 8;
                  if (iVar7 < 0) {
                    __vbaHresultCheckObj();
                  }
                  _DAT_0054b754 = DAT_0054bae4 * 5e+06;
                  if (((uVar23 & 0xd) != 0) ||
                     (DAT_0054bd78 = DAT_0054bd78 * 0.8, (uVar23 & 0xd) != 0)) goto LAB_00524628;
                }
              }
            }
            else {
              iVar7 = (*(code *)(*DAT_0054b024)[0x19])();
              bVar13 = bVar13 & 0x7f;
              if (iVar7 < 0) {
                __vbaHresultCheckObj();
              }
              __vbaVarDup();
              Ordinal_660();
              __vbaVarDup();
              Ordinal_660();
              (*pcVar16)();
              (*pcVar16)();
              (*pcVar16)();
              __vbaStrVarMove();
              __vbaStrMove();
              iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
              uVar23 = (bVar13 & 0x7f) << 8;
              if (iVar7 < 0) {
                __vbaHresultCheckObj();
              }
              __vbaFreeStr();
              __vbaFreeVarList();
              DAT_0054bfa8 = 1;
              _DAT_0054bfb0 = DAT_0054b544;
              *(float *)(DAT_0054b5f8 + 0x10) = DAT_0054b40c;
            }
            FUN_005059e0();
            if (((uVar23 & 0xd) == 0) && ((uVar23 & 0xd) == 0)) {
              if (DAT_0054b000 == 0) {
                fVar24 = ((float10)_DAT_0054b494 - (float10)_DAT_0054b500) /
                         ABS(((float10)_DAT_0054b494 - (float10)_DAT_0054b500) + (float10)0.01);
              }
              else {
                fVar24 = (float10)adj_fdiv_r();
              }
              _DAT_0054ba80 = (float)fVar24;
              if (((uVar23 & 0xd) == 0) && ((uVar23 & 0xd) == 0)) {
                fVar24 = FUN_0049be80((float *)0x520aa2);
                fVar43 = (float)fVar24;
                if (DAT_0054b000 != 0) {
                  adj_fdiv_r();
                }
                if (((uVar23 & 0xd) == 0) && ((uVar23 & 0xd) == 0)) {
                  fVar24 = (float10)Ordinal_614();
                  if ((uVar23 & 0xd) == 0) {
                    if (((((uVar23 & 0xd) == 0) &&
                         (_DAT_0054b6cc =
                               (1.0 - _DAT_0054ba34) *
                               _DAT_0054b1b4 * _DAT_0054ba80 * fVar43 * (float)fVar24 *
                               DAT_0054b614[10], (uVar23 & 0xd) == 0)) && ((uVar23 & 0xd) == 0)) &&
                       ((uVar23 & 0xd) == 0)) {
                      if (DAT_0054b000 == 0) {
                        fVar24 = ((float10)_DAT_0054b494 - (float10)DAT_0054b4fc) /
                                 ABS(((float10)_DAT_0054b494 - (float10)DAT_0054b4fc) +
                                     (float10)0.01);
                      }
                      else {
                        fVar24 = (float10)adj_fdiv_r();
                      }
                      _DAT_0054ba84 = (float)fVar24;
                      if (((uVar23 & 0xd) == 0) && ((uVar23 & 0xd) == 0)) {
                        fVar24 = FUN_0049be80((float *)&stack0xfffffeac);
                        fVar43 = (float)fVar24;
                        if (DAT_0054b000 != 0) {
                          adj_fdiv_r();
                        }
                        if (((uVar23 & 0xd) == 0) && ((uVar23 & 0xd) == 0)) {
                          fVar24 = (float10)Ordinal_614();
                          if ((uVar23 & 0xd) == 0) {
                            if (((((uVar23 & 0xd) == 0) &&
                                 (_DAT_0054b6c8 =
                                       (1.0 - _DAT_0054ba34) *
                                       _DAT_0054ba84 * _DAT_0054b1b4 * fVar43 * (float)fVar24 *
                                       DAT_0054b614[9], (uVar23 & 0xd) == 0)) &&
                                (_DAT_0054ba88 = _DAT_0054b6c8 + _DAT_0054b6cc, (uVar23 & 0xd) == 0)
                                ) && (((uVar23 & 0xd) == 0 && ((uVar23 & 0xd) == 0)))) {
                              pfVar15 = (float *)((ulonglong)
                                                  (double)(ABS(DAT_0054b4fc - _DAT_0054b500) + 0.1)
                                                 >> 0x20);
                              fVar24 = (float10)Ordinal_614();
                              bVar13 = (byte)(uVar23 >> 8);
                              dVar40 = (double)fVar24;
                              (*(code *)(*DAT_0054b024)[0x14c])();
                              piVar8 = (int *)__vbaObjSet();
                              iVar7 = (**(code **)(*piVar8 + 0x40))();
                              bVar13 = bVar13 & 0x7f;
                              if (iVar7 < 0) {
                                __vbaHresultCheckObj();
                              }
                              __vbaLateIdCallLd();
                              (*(code *)(*DAT_0054b024)[0x14c])();
                              piVar8 = (int *)__vbaObjSet();
                              iVar7 = (**(code **)(*piVar8 + 0x40))();
                              uVar23 = (bVar13 & 0x7f) << 8;
                              if (iVar7 < 0) {
                                __vbaHresultCheckObj();
                              }
                              __vbaLateIdCallLd();
                              sVar6 = __vbaI2Var();
                              dVar41 = (double)(int)sVar6;
                              if ((uVar23 & 0xd) == 0) {
                                if ((uVar23 & 0xd) == 0) {
                                  if (DAT_0054b000 == 0) {
                                    fVar24 = (((float10)DAT_0054b4fc - (float10)_DAT_0054b500) *
                                             (float10)10.0) /
                                             (ABS((float10)DAT_0054b4fc - (float10)_DAT_0054b500) +
                                             (float10)0.1);
                                  }
                                  else {
                                    pfVar15 = (float *)CONCAT22(sVar6 >> 0xf,uVar23);
                                    fVar24 = (float10)adj_fdiv_r();
                                  }
                                  if (DAT_0054b000 == 0) {
                                    fVar24 = (fVar24 * (float10)dVar40 * (float10)dVar41) /
                                             (float10)100.0;
                                  }
                                  else {
                                    pfVar15 = (float *)0x40590000;
                                    fVar24 = (float10)adj_fdiv_m64();
                                  }
                                  if ((uVar23 & 0xd) == 0) {
                                    dVar40 = (double)fVar24;
                                    sVar6 = __vbaI2Var();
                                    if (DAT_0054b000 == 0) {
                                      fVar24 = ((float10)dVar40 * (float10)(int)sVar6) /
                                               (float10)100.0;
                                    }
                                    else {
                                      fVar24 = (float10)adj_fdiv_m64();
                                    }
                                    _DAT_0054bf84 = (float)fVar24;
                                    if ((uVar23 & 0xd) == 0) {
                                      __vbaFreeObjList();
                                      __vbaFreeVarList();
                                      __vbaFpI2();
                                      FUN_00508960();
                                      if ((uVar23 & 0xd) == 0) {
                                        __vbaFpI2();
                                        pfVar27 = &DAT_0054b850;
                                        FUN_00508960();
                                        (*(code *)(*DAT_0054b024)[0x153])();
                                        piVar8 = (int *)__vbaObjSet();
                                        iVar7 = (**(code **)(*piVar8 + 0x40))();
                                        if (iVar7 < 0) {
                                          __vbaHresultCheckObj();
                                        }
                                        (*(code *)(*DAT_0054b024)[0x153])();
                                        pfVar9 = (float *)__vbaObjSet();
                                        iVar7 = (**(code **)((int)*pfVar9 + 0x40))();
                                        uVar23 = 0;
                                        if (iVar7 < 0) {
                                          __vbaHresultCheckObj();
                                        }
                                        if ((uVar23 & 0xd) == 0) {
                                          fVar24 = (float10)__vbaFpR4();
                                          uVar4 = (ushort)(fVar24 < (float10)DAT_0054b40c);
                                          __vbaLateIdCallLd();
                                          uVar23 = __vbaBoolVar();
                                          __vbaLateIdCallLd();
                                          uVar3 = __vbaBoolVar();
                                          uVar23 = ~uVar23 & ~uVar3 & -uVar4;
                                          __vbaFreeObjList();
                                          __vbaFreeVarList();
                                          if (uVar23 != 0) {
                                            (*(code *)(*DAT_0054b024)[0x153])();
                                            piVar8 = (int *)__vbaObjSet();
                                            iVar7 = (**(code **)(*piVar8 + 0x40))();
                                            if (iVar7 < 0) {
                                              __vbaHresultCheckObj();
                                            }
                                            __vbaLateIdSt();
                                            __vbaFreeObjList();
                                            __vbaVarDup();
                                            Ordinal_660();
                                            __vbaVarDup();
                                            Ordinal_660();
                                            (*pcVar16)();
                                            (*pcVar16)();
                                            (*pcVar16)();
                                            __vbaStrVarMove();
                                            __vbaStrMove();
                                            iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))();
                                            if (iVar7 < 0) {
                                              __vbaHresultCheckObj();
                                            }
                                            __vbaFreeStr();
                                            pfVar27 = local_9c;
                                            __vbaFreeVarList();
                                          }
                                          (*(code *)(*DAT_0054b024)[0x153])();
                                          piVar8 = (int *)__vbaObjSet();
                                          iVar7 = (**(code **)(*piVar8 + 0x40))();
                                          if (iVar7 < 0) {
                                            __vbaHresultCheckObj();
                                          }
                                          (*(code *)(*DAT_0054b024)[0x153])();
                                          piVar8 = (int *)__vbaObjSet();
                                          iVar7 = (**(code **)(*piVar8 + 0x40))();
                                          if (iVar7 < 0) {
                                            __vbaHresultCheckObj();
                                          }
                                          (*(code *)(*DAT_0054b024)[0x153])();
                                          piVar8 = (int *)__vbaObjSet();
                                          iVar7 = (**(code **)(*piVar8 + 0x40))();
                                          uVar23 = 0;
                                          if (iVar7 < 0) {
                                            __vbaHresultCheckObj();
                                          }
                                          __vbaLateIdCallLd();
                                          uVar3 = __vbaBoolVar();
                                          __vbaLateIdCallLd();
                                          uVar4 = __vbaBoolVar();
                                          __vbaLateIdCallLd();
                                          uVar5 = __vbaBoolVar();
                                          __vbaFreeObjList();
                                          __vbaFreeVarList();
                                          if ((ushort)(~uVar3 & ~uVar4 & ~uVar5) == 0) {
                                            DAT_0054b798 = 0xffff;
                                            pcVar16 = __vbaLateIdSt_exref;
                                            pcVar20 = __vbaFreeObj_exref;
                                          }
                                          else {
                                            DAT_0054b798 = 0;
                                            (*(code *)(*DAT_0054b024)[0x13b])();
                                            piVar8 = (int *)__vbaObjSet();
                                            iVar7 = (**(code **)(*piVar8 + 0x40))();
                                            if (iVar7 < 0) {
                                              __vbaHresultCheckObj();
                                            }
                                            __vbaLateIdCallLd();
                                            sVar6 = __vbaBoolVar();
                                            __vbaFreeObjList();
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              (*(code *)(*DAT_0054b024)[0x13b])();
                                              piVar8 = (int *)__vbaObjSet();
                                              iVar7 = (**(code **)(*piVar8 + 0x40))();
                                              if (iVar7 < 0) {
                                                __vbaHresultCheckObj();
                                              }
                                              __vbaLateIdSt();
                                              __vbaFreeObjList();
                                            }
                                            (*(code *)(*DAT_0054b024)[0x13b])();
                                            piVar8 = (int *)__vbaObjSet();
                                            iVar7 = (**(code **)(*piVar8 + 0x40))();
                                            if (iVar7 < 0) {
                                              __vbaHresultCheckObj();
                                            }
                                            __vbaLateIdCallLd();
                                            sVar6 = __vbaBoolVar();
                                            __vbaFreeObjList();
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              (*(code *)(*DAT_0054b024)[0x13b])();
                                              piVar8 = (int *)__vbaObjSet();
                                              iVar7 = (**(code **)(*piVar8 + 0x40))();
                                              if (iVar7 < 0) {
                                                __vbaHresultCheckObj();
                                              }
                                              __vbaLateIdSt();
                                              __vbaFreeObjList();
                                            }
                                            (*(code *)(*DAT_0054b024)[0x13a])();
                                            piVar8 = (int *)__vbaObjSet();
                                            iVar7 = (**(code **)(*piVar8 + 0x40))();
                                            if (iVar7 < 0) {
                                              __vbaHresultCheckObj();
                                            }
                                            __vbaLateIdSt();
                                            __vbaFreeObjList();
                                            (*(code *)(*DAT_0054b024)[0x15b])();
                                            piVar8 = (int *)__vbaObjSet();
                                            iVar7 = (**(code **)(*piVar8 + 0x40))();
                                            if (iVar7 < 0) {
                                              __vbaHresultCheckObj();
                                            }
                                            __vbaLateIdCallLd();
                                            sVar6 = __vbaBoolVar();
                                            __vbaFreeObjList();
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              (*(code *)(*DAT_0054b024)[0x15b])();
                                              piVar8 = (int *)__vbaObjSet();
                                              iVar7 = (**(code **)(*piVar8 + 0x40))();
                                              if (iVar7 < 0) {
                                                __vbaHresultCheckObj();
                                              }
                                              __vbaLateIdSt();
                                              __vbaFreeObjList();
                                              (*(code *)(*DAT_0054b024)[0x15b])();
                                              piVar8 = (int *)__vbaObjSet();
                                              iVar7 = (**(code **)(*piVar8 + 0x40))();
                                              if (iVar7 < 0) {
                                                __vbaHresultCheckObj();
                                              }
                                              __vbaLateIdSt();
                                              pppppdStack_32c = (double *****)0x5219da;
                                              __vbaFreeObjList();
                                            }
                                            (*(code *)(*DAT_0054b024)[0x15b])();
                                            piVar8 = (int *)__vbaObjSet();
                                            iVar7 = (**(code **)(*piVar8 + 0x40))();
                                            if (iVar7 < 0) {
                                              __vbaHresultCheckObj();
                                            }
                                            pfVar27 = (float *)__vbaLateIdCallLd();
                                            sVar6 = __vbaBoolVar();
                                            __vbaFreeObjList();
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              (*(code *)(*DAT_0054b024)[0x15b])();
                                              piVar8 = (int *)__vbaObjSet();
                                              iVar7 = (**(code **)(*piVar8 + 0x40))();
                                              if (iVar7 < 0) {
                                                __vbaHresultCheckObj();
                                              }
                                              __vbaLateIdSt();
                                              __vbaFreeObjList();
                                              (*(code *)(*DAT_0054b024)[0x15b])();
                                              piVar8 = (int *)__vbaObjSet();
                                              pppppdStack_330 =
                                                   (double *****)(**(code **)(*piVar8 + 0x40))();
                                              if ((int)pppppdStack_330 < 0) {
                                                pppppdStack_334 = (double *****)0x521b38;
                                                pppppdStack_32c = (double *****)piVar8;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_334 = (double *****)0x68030005;
                                              pppppdStack_330 = (double *****)0x2;
                                              pppppdStack_32c = local_f8;
                                              pppppdStack_338 = local_5c;
                                              pppppdStack_33c = (double *****)0x521b6f;
                                              __vbaLateIdSt();
                                              pppppdStack_33c = (double *****)&local_5c;
                                              pppppdStack_340 = &local_58;
                                              pppppdStack_344 = (double *****)0x2;
                                              pppppdStack_348 = (double *****)0x521b7b;
                                              __vbaFreeObjList();
                                            }
                                            (*(code *)(*DAT_0054b024)[0x157])();
                                            piVar8 = (int *)__vbaObjSet();
                                            iVar7 = (**(code **)(*piVar8 + 0x40))();
                                            if (iVar7 < 0) {
                                              __vbaHresultCheckObj();
                                            }
                                            __vbaLateIdCallLd();
                                            sVar6 = __vbaBoolVar();
                                            __vbaFreeObjList();
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              (*(code *)(*DAT_0054b024)[0x157])();
                                              piVar8 = (int *)__vbaObjSet();
                                              iVar7 = (**(code **)(*piVar8 + 0x40))();
                                              if (iVar7 < 0) {
                                                __vbaHresultCheckObj();
                                              }
                                              __vbaLateIdSt();
                                              pppppdStack_32c = &local_58;
                                              pppppdStack_330 = (double *****)0x2;
                                              pppppdStack_334 = (double *****)0x521c8a;
                                              __vbaFreeObjList();
                                              pppppdStack_32c = (double *****)0x521caf;
                                              pppppdStack_32c =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x157])()
                                              ;
                                              pppppdStack_330 = &local_58;
                                              pppppdStack_334 = (double *****)0x521cb6;
                                              ppppppdVar10 = (double ******)__vbaObjSet();
                                              pppppdStack_334 = (double *****)&local_5c;
                                              pppppdStack_338 = (double *****)0x0;
                                              pppppdStack_340 = (double *****)0x521cc4;
                                              pppppdStack_33c = (double *****)ppppppdVar10;
                                              pppppdStack_34c =
                                                   (double *****)(*(code *)(*ppppppdVar10)[0x10])();
                                              if ((int)pppppdStack_34c < 0) {
                                                pppppdStack_340 = (double *****)0x40;
                                                pppppdStack_344 = (double *****)&DAT_0041c968;
                                                pppppdStack_350 = (double *****)0x521cd9;
                                                pppppdStack_348 = (double *****)ppppppdVar10;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_350 = (double *****)0x68030005;
                                              pppppdStack_34c = (double *****)0x2;
                                              pppppdStack_348 = local_f8;
                                              pppppdStack_344 = (double *****)0x0;
                                              pppppdStack_340 = local_f0;
                                              pppppdStack_354 = local_5c;
                                              pppppdStack_358 = (double *****)0x521d10;
                                              __vbaLateIdSt();
                                              pppppdStack_358 = (double *****)&local_5c;
                                              pppppdStack_35c = &local_58;
                                              pppppdStack_360 = (double *****)0x2;
                                              pppppdStack_364 = (double *****)0x521d1c;
                                              __vbaFreeObjList();
                                            }
                                            (*(code *)(*DAT_0054b024)[0x157])();
                                            piVar8 = (int *)__vbaObjSet();
                                            iVar7 = (**(code **)(*piVar8 + 0x40))();
                                            if (iVar7 < 0) {
                                              __vbaHresultCheckObj();
                                            }
                                            pfVar9 = (float *)__vbaLateIdCallLd();
                                            sVar6 = __vbaBoolVar();
                                            __vbaFreeObjList();
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              (*(code *)(*DAT_0054b024)[0x157])();
                                              pppppdVar11 = (double *****)__vbaObjSet();
                                              pppppdStack_32c = (double *****)0x521dd3;
                                              pppppdStack_338 =
                                                   (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                              if ((int)pppppdStack_338 < 0) {
                                                pppppdStack_32c = (double *****)0x40;
                                                pppppdStack_330 = (double *****)&DAT_0041c968;
                                                pppppdStack_33c = (double *****)0x521de8;
                                                pppppdStack_334 = pppppdVar11;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_33c = (double *****)0x68030004;
                                              pppppdStack_338 = (double *****)0xb;
                                              pppppdStack_334 = local_f8;
                                              pppppdStack_330 = (double *****)0xffffffff;
                                              pppppdStack_32c = local_f0;
                                              pppppdStack_340 = local_5c;
                                              pppppdStack_344 = (double *****)0x521e1f;
                                              __vbaLateIdSt();
                                              pppppdStack_344 = (double *****)&local_5c;
                                              pppppdStack_348 = &local_58;
                                              pppppdStack_34c = (double *****)0x2;
                                              pppppdStack_350 = (double *****)0x521e2b;
                                              __vbaFreeObjList();
                                              pppppdStack_344 = DAT_0054b024;
                                              pppppdStack_348 = (double *****)0x521e50;
                                              pppppdStack_348 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x157])()
                                              ;
                                              pppppdStack_34c = &local_58;
                                              pppppdStack_350 = (double *****)0x521e57;
                                              ppppppdVar10 = (double ******)__vbaObjSet();
                                              pppppdStack_350 = (double *****)&local_5c;
                                              pppppdStack_354 = (double *****)0x1;
                                              pppppdStack_35c = (double *****)0x521e65;
                                              pppppdStack_358 = (double *****)ppppppdVar10;
                                              pppppdStack_368 =
                                                   (double *****)(*(code *)(*ppppppdVar10)[0x10])();
                                              if ((int)pppppdStack_368 < 0) {
                                                pppppdStack_35c = (double *****)0x40;
                                                pppppdStack_360 = (double *****)&DAT_0041c968;
                                                pppppdStack_36c = (double *****)0x521e7a;
                                                pppppdStack_364 = (double *****)ppppppdVar10;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_36c = (double *****)0x68030005;
                                              pppppdStack_368 = (double *****)0x2;
                                              pppppdStack_364 = local_f8;
                                              pppppdStack_360 = (double *****)0x0;
                                              pppppdStack_35c = local_f0;
                                              pppppdStack_370 = local_5c;
                                              pppppdStack_374 = (double *****)0x521eb1;
                                              __vbaLateIdSt();
                                              pppppdStack_374 = (double *****)&local_5c;
                                              pppppdStack_378 = &local_58;
                                              pppppdStack_37c = (double *****)0x2;
                                              pppppdStack_380 = (double *****)0x521ebd;
                                              __vbaFreeObjList();
                                            }
                                            (*(code *)(*DAT_0054b024)[0x146])();
                                            pppppdVar11 = (double *****)__vbaObjSet();
                                            pppppdStack_32c = (double *****)0x521ee3;
                                            pppppdStack_338 =
                                                 (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                            if ((int)pppppdStack_338 < 0) {
                                              pppppdStack_32c = (double *****)0x40;
                                              pppppdStack_330 = (double *****)&DAT_0041c968;
                                              pppppdStack_33c = (double *****)0x521ef8;
                                              pppppdStack_334 = pppppdVar11;
                                              __vbaHresultCheckObj();
                                            }
                                            pppppdStack_32c = (double *****)0x0;
                                            pppppdStack_330 = (double *****)0x68030004;
                                            pppppdStack_338 = (double *****)local_7c;
                                            pppppdStack_334 = local_5c;
                                            pppppdStack_33c = (double *****)0x521f0d;
                                            pppppdStack_32c = (double *****)__vbaLateIdCallLd();
                                            pppppdStack_330 = (double *****)0x521f17;
                                            sVar6 = __vbaBoolVar();
                                            pppppdStack_330 = (double *****)&local_5c;
                                            pppppdStack_334 = &local_58;
                                            pppppdStack_338 = (double *****)0x2;
                                            pppppdStack_33c = (double *****)0x521f28;
                                            __vbaFreeObjList();
                                            pppppdStack_330 = (double *****)0x521f34;
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              pppppdStack_330 = DAT_0054b024;
                                              pppppdStack_334 = (double *****)0x521f5f;
                                              pppppdStack_334 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x146])()
                                              ;
                                              pppppdStack_338 = &local_58;
                                              pppppdStack_33c = (double *****)0x521f66;
                                              pppppdVar11 = (double *****)__vbaObjSet();
                                              pppppdStack_33c = (double *****)&local_5c;
                                              pppppdStack_340 = (double *****)0x0;
                                              pppppdStack_348 = (double *****)0x521f74;
                                              pppppdStack_344 = pppppdVar11;
                                              pppppdStack_354 =
                                                   (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                              if ((int)pppppdStack_354 < 0) {
                                                pppppdStack_348 = (double *****)0x40;
                                                pppppdStack_34c = (double *****)&DAT_0041c968;
                                                pppppdStack_358 = (double *****)0x521f89;
                                                pppppdStack_350 = pppppdVar11;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_358 = (double *****)0x68030004;
                                              pppppdStack_354 = (double *****)0xb;
                                              pppppdStack_350 = local_f8;
                                              pppppdStack_34c = (double *****)0xffffffff;
                                              pppppdStack_348 = local_f0;
                                              pppppdStack_35c = local_5c;
                                              pppppdStack_360 = (double *****)0x521fc0;
                                              __vbaLateIdSt();
                                              pppppdStack_360 = (double *****)&local_5c;
                                              pppppdStack_364 = &local_58;
                                              pppppdStack_368 = (double *****)0x2;
                                              pppppdStack_36c = (double *****)0x521fcc;
                                              __vbaFreeObjList();
                                              pppppdStack_360 = DAT_0054b024;
                                              pppppdStack_364 = (double *****)0x521ff1;
                                              pppppdStack_364 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x146])()
                                              ;
                                              pppppdStack_368 = &local_58;
                                              pppppdStack_36c = (double *****)0x521ff8;
                                              ppppppdVar10 = (double ******)__vbaObjSet();
                                              pppppdStack_36c = (double *****)&local_5c;
                                              pppppdStack_370 = (double *****)0x0;
                                              pppppdStack_378 = (double *****)0x522006;
                                              pppppdStack_374 = (double *****)ppppppdVar10;
                                              pppppdStack_384 =
                                                   (double *****)(*(code *)(*ppppppdVar10)[0x10])();
                                              if ((int)pppppdStack_384 < 0) {
                                                pppppdStack_378 = (double *****)0x40;
                                                pppppdStack_37c = (double *****)&DAT_0041c968;
                                                pppppdStack_388 = (double *****)0x52201b;
                                                pppppdStack_380 = (double *****)ppppppdVar10;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_388 = (double *****)0x68030005;
                                              pppppdStack_384 = (double *****)0x2;
                                              pppppdStack_380 = local_f8;
                                              pppppdStack_37c = (double *****)0x0;
                                              pppppdStack_378 = local_f0;
                                              pppppdStack_38c = local_5c;
                                              pppppdStack_390 = (double *****)0x522052;
                                              __vbaLateIdSt();
                                              pppppdStack_390 = (double *****)&local_5c;
                                              pppppdStack_394 = &local_58;
                                              pppppdStack_398 = (double *****)0x2;
                                              pppppdStack_39c = (double *****)0x52205e;
                                              __vbaFreeObjList();
                                            }
                                            pppppdStack_330 = DAT_0054b024;
                                            pppppdStack_334 = (double *****)0x52206f;
                                            pppppdStack_334 =
                                                 (double *****)(*(code *)(*DAT_0054b024)[0x146])();
                                            pppppdStack_338 = &local_58;
                                            pppppdStack_33c = (double *****)0x522076;
                                            pppppdVar11 = (double *****)__vbaObjSet();
                                            pppppdStack_33c = (double *****)&local_5c;
                                            pppppdStack_340 = (double *****)0x1;
                                            pppppdStack_348 = (double *****)0x522084;
                                            pppppdStack_344 = pppppdVar11;
                                            pppppdStack_354 =
                                                 (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                            if ((int)pppppdStack_354 < 0) {
                                              pppppdStack_348 = (double *****)0x40;
                                              pppppdStack_34c = (double *****)&DAT_0041c968;
                                              pppppdStack_358 = (double *****)0x522099;
                                              pppppdStack_350 = pppppdVar11;
                                              __vbaHresultCheckObj();
                                            }
                                            pppppdStack_348 = (double *****)0x0;
                                            pppppdStack_34c = (double *****)0x68030004;
                                            pppppdStack_354 = (double *****)local_7c;
                                            pppppdStack_350 = local_5c;
                                            pppppdStack_358 = (double *****)0x5220ae;
                                            pppppdStack_348 = (double *****)__vbaLateIdCallLd();
                                            pppppdStack_34c = (double *****)0x5220b8;
                                            sVar6 = __vbaBoolVar();
                                            pppppdStack_34c = (double *****)&local_5c;
                                            pppppdStack_350 = &local_58;
                                            pppppdStack_354 = (double *****)0x2;
                                            pppppdStack_358 = (double *****)0x5220c9;
                                            __vbaFreeObjList();
                                            pppppdStack_34c = (double *****)0x5220d5;
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              pppppdStack_34c = DAT_0054b024;
                                              pppppdStack_350 = (double *****)0x522100;
                                              pppppdStack_350 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x146])()
                                              ;
                                              pppppdStack_354 = &local_58;
                                              pppppdStack_358 = (double *****)0x522107;
                                              pppppdVar11 = (double *****)__vbaObjSet();
                                              pppppdStack_358 = (double *****)&local_5c;
                                              pppppdStack_35c = (double *****)0x1;
                                              pppppdStack_364 = (double *****)0x522115;
                                              pppppdStack_360 = pppppdVar11;
                                              pppppdStack_370 =
                                                   (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                              if ((int)pppppdStack_370 < 0) {
                                                pppppdStack_364 = (double *****)0x40;
                                                pppppdStack_368 = (double *****)&DAT_0041c968;
                                                pppppdStack_374 = (double *****)0x52212a;
                                                pppppdStack_36c = pppppdVar11;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_374 = (double *****)0x68030004;
                                              pppppdStack_370 = (double *****)0xb;
                                              pppppdStack_36c = local_f8;
                                              pppppdStack_368 = (double *****)0xffffffff;
                                              pppppdStack_364 = local_f0;
                                              pppppdStack_378 = local_5c;
                                              pppppdStack_37c = (double *****)0x522161;
                                              __vbaLateIdSt();
                                              pppppdStack_37c = (double *****)&local_5c;
                                              pppppdStack_380 = &local_58;
                                              pppppdStack_384 = (double *****)0x2;
                                              pppppdStack_388 = (double *****)0x52216d;
                                              __vbaFreeObjList();
                                              pppppdStack_37c = DAT_0054b024;
                                              pppppdStack_380 = (double *****)0x522192;
                                              pppppdStack_380 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x146])()
                                              ;
                                              pppppdStack_384 = &local_58;
                                              pppppdStack_388 = (double *****)0x522199;
                                              ppppppdVar10 = (double ******)__vbaObjSet();
                                              pppppdStack_388 = (double *****)&local_5c;
                                              pppppdStack_38c = (double *****)0x1;
                                              pppppdStack_394 = (double *****)0x5221a7;
                                              pppppdStack_390 = (double *****)ppppppdVar10;
                                              pppppdStack_3a0 =
                                                   (double *****)(*(code *)(*ppppppdVar10)[0x10])();
                                              if ((int)pppppdStack_3a0 < 0) {
                                                pppppdStack_394 = (double *****)0x40;
                                                pppppdStack_398 = (double *****)&DAT_0041c968;
                                                pppppdStack_3a4 = (double *****)0x5221bc;
                                                pppppdStack_39c = (double *****)ppppppdVar10;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_3a4 = (double *****)0x68030005;
                                              pppppdStack_3a0 = (double *****)0x2;
                                              pppppdStack_39c = local_f8;
                                              pppppdStack_398 = (double *****)0x0;
                                              pppppdStack_394 = local_f0;
                                              pppppdStack_3a8 = local_5c;
                                              pppppdStack_3ac = (double *****)0x5221f3;
                                              __vbaLateIdSt();
                                              pppppdStack_3ac = (double *****)&local_5c;
                                              pppppdStack_3b0 = &local_58;
                                              pppppdStack_3b4 = (double *****)0x2;
                                              pppppdStack_3b8 = (double *****)0x5221ff;
                                              __vbaFreeObjList();
                                            }
                                            pppppdStack_34c = DAT_0054b024;
                                            pppppdStack_350 = (double *****)0x522210;
                                            pppppdStack_350 =
                                                 (double *****)(*(code *)(*DAT_0054b024)[0x125])();
                                            pppppdStack_354 = &local_58;
                                            pppppdStack_358 = (double *****)0x522217;
                                            pppppdVar11 = (double *****)__vbaObjSet();
                                            pppppdStack_358 = (double *****)&local_5c;
                                            pppppdStack_35c = (double *****)0x0;
                                            pppppdStack_364 = (double *****)0x522225;
                                            pppppdStack_360 = pppppdVar11;
                                            pppppdStack_370 =
                                                 (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                            if ((int)pppppdStack_370 < 0) {
                                              pppppdStack_364 = (double *****)0x40;
                                              pppppdStack_368 = (double *****)&DAT_0041c968;
                                              pppppdStack_374 = (double *****)0x52223a;
                                              pppppdStack_36c = pppppdVar11;
                                              __vbaHresultCheckObj();
                                            }
                                            pppppdStack_364 = (double *****)0x0;
                                            pppppdStack_368 = (double *****)0x68030006;
                                            pppppdStack_370 = (double *****)local_7c;
                                            pppppdStack_36c = local_5c;
                                            pppppdStack_374 = (double *****)0x52224f;
                                            pppppdStack_364 = (double *****)__vbaLateIdCallLd();
                                            pppppdStack_368 = (double *****)0x522259;
                                            sVar6 = __vbaBoolVar();
                                            pppppdStack_368 = (double *****)&local_5c;
                                            pppppdStack_36c = &local_58;
                                            pppppdStack_370 = (double *****)0x2;
                                            pppppdStack_374 = (double *****)0x52226a;
                                            __vbaFreeObjList();
                                            pppppdStack_368 = (double *****)0x522276;
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              pppppdStack_368 = DAT_0054b024;
                                              pppppdStack_36c = (double *****)0x5222a1;
                                              pppppdStack_36c =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x125])()
                                              ;
                                              pppppdStack_370 = &local_58;
                                              pppppdStack_374 = (double *****)0x5222a8;
                                              pppppdVar11 = (double *****)__vbaObjSet();
                                              pppppdStack_374 = (double *****)&local_5c;
                                              pppppdStack_378 = (double *****)0x0;
                                              pppppdStack_380 = (double *****)0x5222b6;
                                              pppppdStack_37c = pppppdVar11;
                                              pppppdStack_38c =
                                                   (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                              if ((int)pppppdStack_38c < 0) {
                                                pppppdStack_380 = (double *****)0x40;
                                                pppppdStack_384 = (double *****)&DAT_0041c968;
                                                pppppdStack_390 = (double *****)0x5222cb;
                                                pppppdStack_388 = pppppdVar11;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_390 = (double *****)0x68030006;
                                              pppppdStack_38c = (double *****)0xb;
                                              pppppdStack_388 = local_f8;
                                              pppppdStack_384 = (double *****)0xffffffff;
                                              pppppdStack_380 = local_f0;
                                              pppppdStack_394 = local_5c;
                                              pppppdStack_398 = (double *****)0x522302;
                                              __vbaLateIdSt();
                                              pppppdStack_398 = (double *****)&local_5c;
                                              pppppdStack_39c = &local_58;
                                              pppppdStack_3a0 = (double *****)0x2;
                                              pppppdStack_3a4 = (double *****)0x52230e;
                                              __vbaFreeObjList();
                                              pppppdStack_398 = DAT_0054b024;
                                              pppppdStack_39c = (double *****)0x522333;
                                              pppppdStack_39c =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x125])()
                                              ;
                                              pppppdStack_3a0 = &local_58;
                                              pppppdStack_3a4 = (double *****)0x52233a;
                                              ppppppdVar10 = (double ******)__vbaObjSet();
                                              pppppdStack_3a4 = (double *****)&local_5c;
                                              pppppdStack_3a8 = (double *****)0x0;
                                              pppppdStack_3b0 = (double *****)0x522348;
                                              pppppdStack_3ac = (double *****)ppppppdVar10;
                                              pppppdStack_3bc =
                                                   (double *****)(*(code *)(*ppppppdVar10)[0x10])();
                                              if ((int)pppppdStack_3bc < 0) {
                                                pppppdStack_3b0 = (double *****)0x40;
                                                pppppdStack_3b4 = (double *****)&DAT_0041c968;
                                                pppppdStack_3c0 = (double *****)0x52235d;
                                                pppppdStack_3b8 = (double *****)ppppppdVar10;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_3c0 = (double *****)0x68030007;
                                              pppppdStack_3bc = (double *****)0x2;
                                              pppppdStack_3b8 = local_f8;
                                              pppppdStack_3b4 = (double *****)0x0;
                                              pppppdStack_3b0 = local_f0;
                                              pppppdStack_3c4 = local_5c;
                                              pppppdStack_3c8 = (double *****)0x522394;
                                              __vbaLateIdSt();
                                              pppppdStack_3c8 = (double *****)&local_5c;
                                              pppppdStack_3cc = &local_58;
                                              pppppdStack_3d0 = (double *****)0x2;
                                              pppppdStack_3d4 = (double *****)0x5223a0;
                                              __vbaFreeObjList();
                                            }
                                            pppppdStack_368 = DAT_0054b024;
                                            pppppdStack_36c = (double *****)0x5223b1;
                                            pppppdStack_36c =
                                                 (double *****)(*(code *)(*DAT_0054b024)[0x125])();
                                            pppppdStack_370 = &local_58;
                                            pppppdStack_374 = (double *****)0x5223b8;
                                            pppppdVar11 = (double *****)__vbaObjSet();
                                            pppppdStack_374 = (double *****)&local_5c;
                                            pppppdStack_378 = (double *****)0x1;
                                            pppppdStack_380 = (double *****)0x5223c6;
                                            pppppdStack_37c = pppppdVar11;
                                            pppppdStack_38c =
                                                 (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                            if ((int)pppppdStack_38c < 0) {
                                              pppppdStack_380 = (double *****)0x40;
                                              pppppdStack_384 = (double *****)&DAT_0041c968;
                                              pppppdStack_390 = (double *****)0x5223db;
                                              pppppdStack_388 = pppppdVar11;
                                              __vbaHresultCheckObj();
                                            }
                                            pppppdStack_380 = (double *****)0x0;
                                            pppppdStack_384 = (double *****)0x68030006;
                                            pppppdStack_38c = (double *****)local_7c;
                                            pppppdStack_388 = local_5c;
                                            pppppdStack_390 = (double *****)0x5223f0;
                                            pppppdStack_380 = (double *****)__vbaLateIdCallLd();
                                            pppppdStack_384 = (double *****)0x5223fa;
                                            sVar6 = __vbaBoolVar();
                                            pppppdStack_384 = (double *****)&local_5c;
                                            pppppdStack_388 = &local_58;
                                            pppppdStack_38c = (double *****)0x2;
                                            pppppdStack_390 = (double *****)0x52240b;
                                            __vbaFreeObjList();
                                            pppppdStack_384 = (double *****)0x522417;
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              pppppdStack_384 = DAT_0054b024;
                                              pppppdStack_388 = (double *****)0x522442;
                                              pppppdStack_388 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x125])()
                                              ;
                                              pppppdStack_38c = &local_58;
                                              pppppdStack_390 = (double *****)0x522449;
                                              pppppdVar11 = (double *****)__vbaObjSet();
                                              pppppdStack_390 = (double *****)&local_5c;
                                              pppppdStack_394 = (double *****)0x1;
                                              pppppdStack_39c = (double *****)0x522457;
                                              pppppdStack_398 = pppppdVar11;
                                              pppppdStack_3a8 =
                                                   (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                              if ((int)pppppdStack_3a8 < 0) {
                                                pppppdStack_39c = (double *****)0x40;
                                                pppppdStack_3a0 = (double *****)&DAT_0041c968;
                                                pppppdStack_3ac = (double *****)0x52246c;
                                                pppppdStack_3a4 = pppppdVar11;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_3ac = (double *****)0x68030006;
                                              pppppdStack_3a8 = (double *****)0xb;
                                              pppppdStack_3a4 = local_f8;
                                              pppppdStack_3a0 = (double *****)0xffffffff;
                                              pppppdStack_39c = local_f0;
                                              pppppdStack_3b0 = local_5c;
                                              pppppdStack_3b4 = (double *****)0x5224a3;
                                              __vbaLateIdSt();
                                              pppppdStack_3b4 = (double *****)&local_5c;
                                              pppppdStack_3b8 = &local_58;
                                              pppppdStack_3bc = (double *****)0x2;
                                              pppppdStack_3c0 = (double *****)0x5224af;
                                              __vbaFreeObjList();
                                              pppppdStack_3b4 = DAT_0054b024;
                                              pppppdStack_3b8 = (double *****)0x5224d4;
                                              pppppdStack_3b8 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x125])()
                                              ;
                                              pppppdStack_3bc = &local_58;
                                              pppppdStack_3c0 = (double *****)0x5224db;
                                              ppppppdVar10 = (double ******)__vbaObjSet();
                                              pppppdStack_3c0 = (double *****)&local_5c;
                                              pppppdStack_3c4 = (double *****)0x1;
                                              pppppdStack_3cc = (double *****)0x5224e9;
                                              pppppdStack_3c8 = (double *****)ppppppdVar10;
                                              pppppdStack_3d8 =
                                                   (double *****)(*(code *)(*ppppppdVar10)[0x10])();
                                              if ((int)pppppdStack_3d8 < 0) {
                                                pppppdStack_3cc = (double *****)0x40;
                                                pppppdStack_3d0 = (double *****)&DAT_0041c968;
                                                pppppdStack_3dc = (double *****)0x5224fe;
                                                pppppdStack_3d4 = (double *****)ppppppdVar10;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_3dc = (double *****)0x68030007;
                                              pppppdStack_3d8 = (double *****)0x2;
                                              pppppdStack_3d4 = local_f8;
                                              pppppdStack_3d0 = (double *****)0x0;
                                              pppppdStack_3cc = local_f0;
                                              pppppdStack_3e0 = local_5c;
                                              pppppdStack_3e4 = (double *****)0x522535;
                                              __vbaLateIdSt();
                                              pppppdStack_3e4 = (double *****)&local_5c;
                                              pppppdStack_3e8 = &local_58;
                                              pppppdStack_3ec = (double *****)0x2;
                                              pppppdStack_3f0 = (double *****)0x522541;
                                              __vbaFreeObjList();
                                            }
                                            pppppdStack_384 = DAT_0054b024;
                                            pppppdStack_388 = (double *****)0x522552;
                                            pppppdStack_388 =
                                                 (double *****)(*(code *)(*DAT_0054b024)[0x125])();
                                            pppppdStack_38c = &local_58;
                                            pppppdStack_390 = (double *****)0x522559;
                                            pppppdVar11 = (double *****)__vbaObjSet();
                                            pppppdStack_390 = (double *****)&local_5c;
                                            pppppdStack_394 = (double *****)0x2;
                                            pppppdStack_39c = (double *****)0x522567;
                                            pppppdStack_398 = pppppdVar11;
                                            pppppdStack_3a8 =
                                                 (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                            if ((int)pppppdStack_3a8 < 0) {
                                              pppppdStack_39c = (double *****)0x40;
                                              pppppdStack_3a0 = (double *****)&DAT_0041c968;
                                              pppppdStack_3ac = (double *****)0x52257c;
                                              pppppdStack_3a4 = pppppdVar11;
                                              __vbaHresultCheckObj();
                                            }
                                            pppppdStack_39c = (double *****)0x0;
                                            pppppdStack_3a0 = (double *****)0x68030006;
                                            pppppdStack_3a8 = (double *****)local_7c;
                                            pppppdStack_3a4 = local_5c;
                                            pppppdStack_3ac = (double *****)0x522591;
                                            pppppdStack_39c = (double *****)__vbaLateIdCallLd();
                                            pppppdStack_3a0 = (double *****)0x52259b;
                                            sVar6 = __vbaBoolVar();
                                            pppppdStack_3a0 = (double *****)&local_5c;
                                            pppppdStack_3a4 = &local_58;
                                            pppppdStack_3a8 = (double *****)0x2;
                                            pppppdStack_3ac = (double *****)0x5225ac;
                                            __vbaFreeObjList();
                                            pppppdStack_3a0 = (double *****)0x5225b8;
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              pppppdStack_3a0 = DAT_0054b024;
                                              pppppdStack_3a4 = (double *****)0x5225e3;
                                              pppppdStack_3a4 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x125])()
                                              ;
                                              pppppdStack_3a8 = &local_58;
                                              pppppdStack_3ac = (double *****)0x5225ea;
                                              pppppdVar11 = (double *****)__vbaObjSet();
                                              pppppdStack_3ac = (double *****)&local_5c;
                                              pppppdStack_3b0 = (double *****)0x2;
                                              pppppdStack_3b8 = (double *****)0x5225f8;
                                              pppppdStack_3b4 = pppppdVar11;
                                              pppppdStack_3c4 =
                                                   (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                              if ((int)pppppdStack_3c4 < 0) {
                                                pppppdStack_3b8 = (double *****)0x40;
                                                pppppdStack_3bc = (double *****)&DAT_0041c968;
                                                pppppdStack_3c8 = (double *****)0x52260d;
                                                pppppdStack_3c0 = pppppdVar11;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_3c8 = (double *****)0x68030006;
                                              pppppdStack_3c4 = (double *****)0xb;
                                              pppppdStack_3c0 = local_f8;
                                              pppppdStack_3bc = (double *****)0xffffffff;
                                              pppppdStack_3b8 = local_f0;
                                              pppppdStack_3cc = local_5c;
                                              pppppdStack_3d0 = (double *****)0x522644;
                                              __vbaLateIdSt();
                                              pppppdStack_3d0 = (double *****)&local_5c;
                                              pppppdStack_3d4 = &local_58;
                                              pppppdStack_3d8 = (double *****)0x2;
                                              pppppdStack_3dc = (double *****)0x522650;
                                              __vbaFreeObjList();
                                              pppppdStack_3d0 = DAT_0054b024;
                                              pppppdStack_3d4 = (double *****)0x522675;
                                              pppppdStack_3d4 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x125])()
                                              ;
                                              pppppdStack_3d8 = &local_58;
                                              pppppdStack_3dc = (double *****)0x52267c;
                                              ppppppdVar10 = (double ******)__vbaObjSet();
                                              pppppdStack_3dc = (double *****)&local_5c;
                                              pppppdStack_3e0 = (double *****)0x2;
                                              pppppdStack_3e8 = (double *****)0x52268a;
                                              pppppdStack_3e4 = (double *****)ppppppdVar10;
                                              pppppdStack_3f4 =
                                                   (double *****)(*(code *)(*ppppppdVar10)[0x10])();
                                              if ((int)pppppdStack_3f4 < 0) {
                                                pppppdStack_3e8 = (double *****)0x40;
                                                pppppdStack_3ec = (double *****)&DAT_0041c968;
                                                pppppdStack_3f0 = (double *****)ppppppdVar10;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_3f4 = (double *****)0x2;
                                              pppppdStack_3f0 = local_f8;
                                              pppppdStack_3ec = (double *****)0x0;
                                              pppppdStack_3e8 = local_f0;
                                              __vbaLateIdSt(local_5c,0x68030007);
                                              __vbaFreeObjList(2,&local_58,&local_5c);
                                            }
                                            pppppdStack_3a0 = DAT_0054b024;
                                            pppppdStack_3a4 = (double *****)0x5226f3;
                                            pppppdStack_3a4 =
                                                 (double *****)(*(code *)(*DAT_0054b024)[0x125])();
                                            pppppdStack_3a8 = &local_58;
                                            pppppdStack_3ac = (double *****)0x5226fa;
                                            pppppdVar11 = (double *****)__vbaObjSet();
                                            pppppdStack_3ac = (double *****)&local_5c;
                                            pppppdStack_3b0 = (double *****)0x3;
                                            pppppdStack_3b8 = (double *****)0x522708;
                                            pppppdStack_3b4 = pppppdVar11;
                                            pppppdStack_3c4 =
                                                 (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                            if ((int)pppppdStack_3c4 < 0) {
                                              pppppdStack_3b8 = (double *****)0x40;
                                              pppppdStack_3bc = (double *****)&DAT_0041c968;
                                              pppppdStack_3c8 = (double *****)0x52271d;
                                              pppppdStack_3c0 = pppppdVar11;
                                              __vbaHresultCheckObj();
                                            }
                                            pppppdStack_3b8 = (double *****)0x0;
                                            pppppdStack_3bc = (double *****)0x68030006;
                                            pppppdStack_3c4 = (double *****)local_7c;
                                            pppppdStack_3c0 = local_5c;
                                            pppppdStack_3c8 = (double *****)0x522732;
                                            pppppdStack_3b8 = (double *****)__vbaLateIdCallLd();
                                            pppppdStack_3bc = (double *****)0x52273c;
                                            sVar6 = __vbaBoolVar();
                                            pppppdStack_3bc = (double *****)&local_5c;
                                            pppppdStack_3c0 = &local_58;
                                            pppppdStack_3c4 = (double *****)0x2;
                                            pppppdStack_3c8 = (double *****)0x52274d;
                                            __vbaFreeObjList();
                                            pppppdStack_3bc = (double *****)0x522759;
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              pppppdStack_3bc = DAT_0054b024;
                                              pppppdStack_3c0 = (double *****)0x522784;
                                              pppppdStack_3c0 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x125])()
                                              ;
                                              pppppdStack_3c4 = &local_58;
                                              pppppdStack_3c8 = (double *****)0x52278b;
                                              pppppdVar11 = (double *****)__vbaObjSet();
                                              pppppdStack_3c8 = (double *****)&local_5c;
                                              pppppdStack_3cc = (double *****)0x3;
                                              pppppdStack_3d4 = (double *****)0x522799;
                                              pppppdStack_3d0 = pppppdVar11;
                                              pppppdStack_3e0 =
                                                   (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                              if ((int)pppppdStack_3e0 < 0) {
                                                pppppdStack_3d4 = (double *****)0x40;
                                                pppppdStack_3d8 = (double *****)&DAT_0041c968;
                                                pppppdStack_3e4 = (double *****)0x5227ae;
                                                pppppdStack_3dc = pppppdVar11;
                                                __vbaHresultCheckObj();
                                              }
                                              pppppdStack_3e4 = (double *****)0x68030006;
                                              pppppdStack_3e0 = (double *****)0xb;
                                              pppppdStack_3dc = local_f8;
                                              pppppdStack_3d8 = (double *****)0xffffffff;
                                              pppppdStack_3d4 = local_f0;
                                              pppppdStack_3e8 = local_5c;
                                              pppppdStack_3ec = (double *****)0x5227e5;
                                              __vbaLateIdSt();
                                              pppppdStack_3ec = (double *****)&local_5c;
                                              pppppdStack_3f0 = &local_58;
                                              pppppdStack_3f4 = (double *****)0x2;
                                              __vbaFreeObjList();
                                              pppppdStack_3ec = DAT_0054b024;
                                              pppppdStack_3f0 = (double *****)0x522816;
                                              pppppdStack_3f0 =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x125])()
                                              ;
                                              pppppdStack_3f4 = &local_58;
                                              piVar8 = (int *)__vbaObjSet();
                                              iVar7 = (**(code **)(*piVar8 + 0x40))
                                                                (piVar8,3,&local_5c);
                                              if (iVar7 < 0) {
                                                __vbaHresultCheckObj
                                                          (iVar7,piVar8,&DAT_0041c968,0x40);
                                              }
                                              __vbaLateIdSt(local_5c,0x68030007,2,local_f8,0,
                                                            local_f0);
                                              __vbaFreeObjList(2,&local_58,&local_5c);
                                            }
                                            pppppdStack_3bc = DAT_0054b024;
                                            pppppdStack_3c0 = (double *****)0x522894;
                                            pppppdStack_3c0 =
                                                 (double *****)(*(code *)(*DAT_0054b024)[0x13e])();
                                            pppppdStack_3c4 = &local_58;
                                            pppppdStack_3c8 = (double *****)0x52289b;
                                            pppppdVar11 = (double *****)__vbaObjSet();
                                            pppppdStack_3c8 = (double *****)&local_5c;
                                            pppppdStack_3cc = (double *****)0x0;
                                            pppppdStack_3d4 = (double *****)0x5228a9;
                                            pppppdStack_3d0 = pppppdVar11;
                                            pppppdStack_3e0 =
                                                 (double *****)(*(code *)(*pppppdVar11)[0x10])();
                                            uVar23 = 0;
                                            if ((int)pppppdStack_3e0 < 0) {
                                              pppppdStack_3d4 = (double *****)0x40;
                                              pppppdStack_3d8 = (double *****)&DAT_0041c968;
                                              pppppdStack_3e4 = (double *****)0x5228be;
                                              pppppdStack_3dc = pppppdVar11;
                                              __vbaHresultCheckObj();
                                            }
                                            pppppdStack_3d4 = (double *****)0x0;
                                            pppppdStack_3d8 = (double *****)0x68030008;
                                            pppppdStack_3e0 = (double *****)local_7c;
                                            pppppdStack_3dc = local_5c;
                                            pppppdStack_3e4 = (double *****)0x5228d3;
                                            pppppdStack_3d4 = (double *****)__vbaLateIdCallLd();
                                            pppppdStack_3d8 = (double *****)0x5228dd;
                                            sVar6 = __vbaBoolVar();
                                            pppppdStack_3d8 = (double *****)&local_5c;
                                            pppppdStack_3dc = &local_58;
                                            pppppdStack_3e0 = (double *****)0x2;
                                            pppppdStack_3e4 = (double *****)0x5228ee;
                                            __vbaFreeObjList();
                                            pppppdStack_3d8 = (double *****)0x5228fa;
                                            __vbaFreeVar();
                                            if (sVar6 != -1) {
                                              pppppdStack_3d8 = DAT_0054b024;
                                              pppppdStack_3dc = (double *****)0x522925;
                                              pppppdStack_3dc =
                                                   (double *****)(*(code *)(*DAT_0054b024)[0x13e])()
                                              ;
                                              pppppdStack_3e0 = &local_58;
                                              pppppdStack_3e4 = (double *****)0x52292c;
                                              piVar8 = (int *)__vbaObjSet();
                                              pppppdStack_3e4 = (double *****)&local_5c;
                                              pppppdStack_3e8 = (double *****)0x0;
                                              pppppdStack_3f0 = (double *****)0x52293a;
                                              pppppdStack_3ec = (double *****)piVar8;
                                              iVar7 = (**(code **)(*piVar8 + 0x40))();
                                              if (iVar7 < 0) {
                                                pppppdStack_3f0 = (double *****)0x40;
                                                pppppdStack_3f4 = (double *****)&DAT_0041c968;
                                                __vbaHresultCheckObj(iVar7,piVar8);
                                              }
                                              pppppdStack_3f4 = (double *****)0xffffffff;
                                              __vbaLateIdSt(local_5c,0x68030008,0xb,local_f8);
                                              __vbaFreeObjList(2,&local_58,&local_5c);
                                              uVar12 = (*(code *)(*DAT_0054b024)[0x13e])
                                                                 (DAT_0054b024);
                                              piVar8 = (int *)__vbaObjSet(&local_58,uVar12);
                                              iVar7 = (**(code **)(*piVar8 + 0x40))
                                                                (piVar8,0,&local_5c);
                                              uVar23 = 0;
                                              if (iVar7 < 0) {
                                                __vbaHresultCheckObj
                                                          (iVar7,piVar8,&DAT_0041c968,0x40);
                                              }
                                              __vbaLateIdSt(local_5c,0x68030009,2,local_f8,0,
                                                            local_f0);
                                              __vbaFreeObjList(2,&local_58,&local_5c);
                                            }
                                            pppppdStack_3e8 = (double *****)0x68030017;
                                            pppppdStack_3e4 = (double *****)0xb;
                                            pppppdStack_3e0 = local_f8;
                                            pppppdStack_3dc = (double *****)0xffffffff;
                                            pppppdStack_3d8 = local_f0;
                                            pppppdStack_3ec = DAT_0054b024;
                                            pppppdStack_3f0 = (double *****)0x522a6a;
                                            pppppdStack_3f0 =
                                                 (double *****)(*(code *)(*DAT_0054b024)[0x115])();
                                            pppppdStack_3f4 = &local_58;
                                            uVar12 = __vbaObjSet();
                                            pcVar16 = __vbaLateIdSt_exref;
                                            __vbaLateIdSt(uVar12);
                                            pcVar20 = __vbaFreeObj_exref;
                                            __vbaFreeObj();
                                            uVar12 = (*(code *)(*DAT_0054b024)[0x115])
                                                               (DAT_0054b024,0x68030016,0xb,local_f8
                                                                ,0xffffffff,local_f0);
                                            uVar12 = __vbaObjSet(&local_58,uVar12);
                                            __vbaLateIdSt(uVar12);
                                            __vbaFreeObj();
                                            uVar12 = (*(code *)(*DAT_0054b024)[0x115])
                                                               (DAT_0054b024,0x68030002,2,local_f8,0
                                                                ,local_f0);
                                            uVar12 = __vbaObjSet(&local_58,uVar12);
                                            __vbaLateIdSt(uVar12);
                                            __vbaFreeObj();
                                            uVar12 = (*(code *)(*DAT_0054b024)[0x115])
                                                               (DAT_0054b024,0x68030003,2,local_f8,0
                                                                ,local_f0);
                                            uVar12 = __vbaObjSet(&local_58,uVar12);
                                            __vbaLateIdSt(uVar12);
                                            __vbaFreeObj();
                                            DAT_0054b42c = DAT_0054b40c;
                                            DAT_0054b430 = DAT_0054b40c;
                                          }
                                          _DAT_0054b87c = _DAT_0054b878 + _DAT_0054b874;
                                          if (((uVar23 & 0xd) == 0) && ((uVar23 & 0xd) == 0)) {
                                            fVar24 = (float10)__vbaFpR4();
                                            fVar43 = (float)fVar24;
                                            fVar24 = (float10)__vbaFpR4();
                                            DAT_0054bbc4 = (ushort)(fVar24 < (float10)fVar43);
                                            (*(code *)(*DAT_0054b024)[0x13e])();
                                            piVar8 = (int *)__vbaObjSet();
                                            iVar7 = (**(code **)(*piVar8 + 0x40))();
                                            uVar23 = 0;
                                            if (iVar7 < 0) {
                                              __vbaHresultCheckObj();
                                            }
                                            __vbaLateIdCallLd();
                                            __vbaI2Var();
                                            if (DAT_0054b000 != 0) {
                                              adj_fdiv_m64();
                                            }
                                            if ((uVar23 & 0xd) == 0) {
                                              fVar24 = (float10)__vbaFpR8();
                                              uVar3 = (ushort)(fVar24 !=
                                                              (float10)(int)(short)DAT_0054bbc4);
                                              (*(code *)(*DAT_0054b024)[0x13e])();
                                              piVar8 = (int *)__vbaObjSet();
                                              iVar7 = (**(code **)(*piVar8 + 0x40))();
                                              uVar23 = 0;
                                              if (iVar7 < 0) {
                                                __vbaHresultCheckObj();
                                              }
                                              __vbaLateIdCallLd();
                                              uVar4 = __vbaBoolVar();
                                              uVar3 = ~uVar4 & -uVar3;
                                              __vbaFreeObjList();
                                              __vbaFreeVarList();
                                              if (uVar3 != 0) {
                                                if ((int)(short)((short)DAT_0054bbc4 * 100) !=
                                                    (short)DAT_0054bbc4 * 100) {
LAB_0052462d:
                                                  __vbaErrorOverflow();
                                                  ExceptionList = &stack0xfffffdb4;
                                                  sVar6 = 1;
                                                  pppppdStack_334 = (double *****)0x0;
                                                  pppppdStack_344 = (double *****)0x0;
                                                  pppppdStack_354 = (double *****)0x0;
                                                  pppppdStack_364 = (double *****)0x0;
                                                  pppppdStack_374 = (double *****)0x0;
                                                  pppppdStack_384 = (double *****)0x0;
                                                  pppppdStack_394 = (double *****)0x0;
                                                  pppppdStack_3bc = (double *****)pcVar20;
                                                  pppppdStack_3b8 = (double *****)pcVar17;
                                                  pppppdStack_3b4 = (double *****)pcVar16;
                                                  do {
                                                    pcVar16 = __vbaGenerateBoundsError_exref;
                                                    if (0x14 < sVar6) {
                                                      return;
                                                    }
                                                    iVar7 = (int)sVar6;
                                                    if (0x13 < iVar7 - 1U) {
                                                      pppppdStack_3c0 = (double *****)0x5246fd;
                                                      __vbaGenerateBoundsError();
                                                    }
                                                    if (*(short *)(DAT_0054b630 + (iVar7 - 1U) * 2)
                                                        == 0) {
                                                      uVar18 = (int)sVar6 - 1;
                                                      if (0x13 < uVar18) {
                                                        pppppdStack_3c0 = (double *****)0x524b1f;
                                                        __vbaGenerateBoundsError();
                                                      }
                                                      DAT_0054b614[uVar18] = 0.0;
                                                    }
                                                    else {
                                                      uVar18 = (int)sVar6 - 1;
                                                      if (0x13 < uVar18) {
                                                        pppppdStack_3c0 = (double *****)0x52471b;
                                                        __vbaGenerateBoundsError();
                                                      }
                                                      pfVar15 = (float *)(DAT_0054b5f8 + uVar18 * 4)
                                                      ;
                                                      pppppdStack_3c0 = (double *****)0x524730;
                                                      fVar24 = (float10)__vbaFpR4();
                                                      uVar23 = 0;
                                                      if (fVar24 == (float10)*pfVar15) {
                                                        iVar7 = (int)sVar6;
                                                        if (0x13 < iVar7 - 1U) {
                                                          pppppdStack_3c0 = (double *****)0x524749;
                                                          __vbaGenerateBoundsError();
                                                        }
                                                        iVar19 = (int)sVar6;
                                                        if (0x13 < iVar19 - 1U) {
                                                          pppppdStack_3c0 = (double *****)0x524755;
                                                          __vbaGenerateBoundsError();
                                                        }
                                                        *(float *)(DAT_0054b5f8 + (iVar19 - 1U) * 4)
                                                             = DAT_0054b40c +
                                                               *(float *)(DAT_0054b5c0 +
                                                                         (iVar7 - 1U) * 4);
                                                        if ((uVar23 & 0xd) != 0) goto LAB_00524ba2;
                                                        pppppdStack_3c0 = (double *****)0x52479c;
                                                        __vbaVarDup();
                                                        pppppdStack_3c0 = (double *****)0x1;
                                                        pppppdStack_3c8 =
                                                             (double *****)&stack0xfffffd9c;
                                                        pppppdStack_3c4 = (double *****)0x1;
                                                        pppppdStack_3cc =
                                                             (double *****)&stack0xfffffcec;
                                                        pppppdStack_3d0 =
                                                             (double *****)&stack0xfffffd8c;
                                                        pppppdStack_3d4 = (double *****)0x5247cb;
                                                        Ordinal_660();
                                                        pppppdStack_32c = (double *****)0x424b6c;
                                                        pppppdStack_334 = (double *****)0x8;
                                                        pppppdStack_34c =
                                                             (double *****)&DAT_00424b9c;
                                                        pppppdStack_354 = (double *****)0x8;
                                                        pppppdStack_3d4 = (double *****)0x5247f6;
                                                        __vbaVarDup();
                                                        pppppdStack_33c =
                                                             (double *****)&stack0xfffffdb0;
                                                        pppppdStack_3d4 = (double *****)0x1;
                                                        pppppdStack_3dc =
                                                             (double *****)&stack0xfffffd6c;
                                                        pppppdStack_3d8 = (double *****)0x1;
                                                        pppppdStack_3e0 =
                                                             (double *****)&pppppdStack_344;
                                                        pppppdStack_3e4 =
                                                             (double *****)&stack0xfffffd5c;
                                                        pppppdStack_344 = (double *****)0x4002;
                                                        pppppdStack_3e8 = (double *****)0x52481e;
                                                        Ordinal_660();
                                                        pppppdStack_35c = (double *****)0x424ba4;
                                                        pppppdStack_364 = (double *****)0x8;
                                                        pppppdStack_37c = (double *****)0x424bc4;
                                                        pppppdStack_384 = (double *****)0x8;
                                                        pppppdStack_3e8 = (double *****)0x52484c;
                                                        __vbaVarDup();
                                                        iVar7 = (int)sVar6;
                                                        if (0x13 < iVar7 - 1U) {
                                                          pppppdStack_3e8 = (double *****)0x52485c;
                                                          __vbaGenerateBoundsError();
                                                        }
                                                        pppppdStack_3e8 = (double *****)0x1;
                                                        pppppdStack_3f0 =
                                                             (double *****)&stack0xfffffd2c;
                                                        pppppdStack_3ec = (double *****)0x1;
                                                        pppppdStack_36c =
                                                             (double *****)
                                                             (DAT_0054b5a4 + (iVar7 - 1U) * 4);
                                                        pppppdStack_3f4 =
                                                             (double *****)&pppppdStack_374;
                                                        pppppdStack_374 = (double *****)0x4004;
                                                        Ordinal_660(&stack0xfffffd1c);
                                                        pppppdStack_38c =
                                                             (double *****)&DAT_00424258;
                                                        pppppdStack_394 = (double *****)0x8;
                                                        uVar12 = __vbaVarCat(&stack0xfffffd7c,
                                                                             &pppppdStack_334,
                                                                             &stack0xfffffd8c);
                                                        uVar12 = __vbaVarCat(&stack0xfffffd4c,
                                                                             &stack0xfffffd5c,uVar12
                                                                            );
                                                        uVar12 = __vbaVarCat(&stack0xfffffd3c,
                                                                             &pppppdStack_364,uVar12
                                                                            );
                                                        uVar12 = __vbaVarCat(&stack0xfffffd0c,
                                                                             &stack0xfffffd1c,uVar12
                                                                            );
                                                        uVar12 = __vbaVarCat(&stack0xfffffcfc,
                                                                             &pppppdStack_394,uVar12
                                                                            );
                                                        __vbaStrVarMove(uVar12);
                                                        __vbaStrMove();
                                                        iVar7 = (**(code **)(*DAT_0054b028 + 0x6fc))
                                                                          (DAT_0054b028,
                                                                           &stack0xfffffdac);
                                                        if (iVar7 < 0) {
                                                          __vbaHresultCheckObj
                                                                    (iVar7,DAT_0054b028,
                                                                     &DAT_0041ccac,0x6fc);
                                                        }
                                                        __vbaFreeStr();
                                                        __vbaFreeVarList(0xb,&stack0xfffffd9c,
                                                                         &stack0xfffffd8c,
                                                                         &stack0xfffffd6c,
                                                                         &stack0xfffffd7c,
                                                                         &stack0xfffffd5c,
                                                                         &stack0xfffffd4c,
                                                                         &stack0xfffffd2c,
                                                                         &stack0xfffffd3c,
                                                                         &stack0xfffffd1c,
                                                                         &stack0xfffffd0c,
                                                                         &stack0xfffffcfc);
                                                        pcVar16 = __vbaGenerateBoundsError_exref;
                                                      }
                                                      uVar18 = (int)sVar6 - 1;
                                                      if (0x13 < uVar18) {
                                                        pppppdStack_3c0 = (double *****)0x524999;
                                                        (*pcVar16)();
                                                      }
                                                      uVar23 = 0;
                                                      if (*(float *)(DAT_0054b5f8 + uVar18 * 4) <=
                                                          DAT_0054b40c) {
                                                        if (0x13 < (int)sVar6 - 1U) {
                                                          pppppdStack_3c0 = (double *****)0x5249bf;
                                                          (*pcVar16)();
                                                        }
                                                        if (0x13 < (int)sVar6 - 1U) {
                                                          pppppdStack_3c0 = (double *****)0x5249cb;
                                                          (*pcVar16)();
                                                        }
                                                        if ((uVar23 & 0xd) != 0) {
LAB_00524ba2:
                                                          __vbaFPException();
                                                          return;
                                                        }
                                                        pppppdStack_3c0 = (double *****)0x5249ec;
                                                        fVar24 = (float10)__vbaFpR4();
                                                        uVar23 = 0;
                                                        if (fVar24 <= (float10)DAT_0054b40c) {
                                                          iVar7 = (int)sVar6;
                                                          if (0x13 < iVar7 - 1U) {
                                                            pppppdStack_3c0 = (double *****)0x524aca
                                                            ;
                                                            (*pcVar16)();
                                                          }
                                                          uVar18 = (int)sVar6 - 1;
                                                          if (0x13 < uVar18) {
                                                            pppppdStack_3c0 = (double *****)0x524ad6
                                                            ;
                                                            (*pcVar16)();
                                                          }
                                                          if (DAT_0054b000 == 0) {
                                                            fVar24 = (float10)*(float *)(
                                                  DAT_0054b5a4 + (iVar7 - 1U) * 4) / (float10)100.0;
                                                  pfVar15 = DAT_0054b614;
                                                  }
                                                  else {
                                                    pppppdStack_3c0 = (double *****)0x40590000;
                                                    pppppdStack_3bc = (double *****)0x0;
                                                    pppppdStack_3c8 = (double *****)0x524b06;
                                                    fVar24 = (float10)adj_fdiv_m64();
                                                    pfVar15 = extraout_ECX_11;
                                                  }
                                                  pfVar15[uVar18] = (float)fVar24;
                                                  }
                                                  else {
                                                    pppppdStack_39c = (double *****)(sVar6 + -1);
                                                    if ((double ******)0x13 < pppppdStack_39c) {
                                                      pppppdStack_3c0 = (double *****)0x524a0f;
                                                      (*pcVar16)();
                                                    }
                                                    pcVar16 = (code *)(sVar6 + -1);
                                                    if ((code *)0x13 < pcVar16) {
                                                      pppppdStack_3c0 = (double *****)0x524a1f;
                                                      __vbaGenerateBoundsError();
                                                    }
                                                    uVar21 = (int)sVar6 - 1;
                                                    if (0x13 < uVar21) {
                                                      pppppdStack_3c0 = (double *****)0x524a2f;
                                                      __vbaGenerateBoundsError();
                                                    }
                                                    uVar18 = (int)sVar6 - 1;
                                                    if (0x13 < uVar18) {
                                                      pppppdStack_3c0 = (double *****)0x524a3f;
                                                      __vbaGenerateBoundsError();
                                                    }
                                                    fVar24 = (float10)DAT_0054b40c -
                                                             (float10)*(float *)(DAT_0054b5f8 +
                                                                                (int)pcVar16 * 4);
                                                    if ((uVar23 & 0xd) != 0) goto LAB_00524ba2;
                                                    if (DAT_0054b000 == 0) {
                                                      fVar26 = (float10)*(float *)(DAT_0054b5a4 +
                                                                                  (int)
                                                  pppppdStack_39c * 4) / (float10)100.0;
                                                  iVar7 = DAT_0054b5dc;
                                                  }
                                                  else {
                                                    pppppdStack_3c0 = (double *****)0x40590000;
                                                    pppppdStack_3c4 = (double *****)0x0;
                                                    pppppdStack_3c8 = (double *****)0x524a8f;
                                                    fVar26 = (float10)adj_fdiv_m64();
                                                    iVar7 = extraout_ECX_10;
                                                    fVar24 = extraout_ST1_09;
                                                  }
                                                  if (DAT_0054b000 == 0) {
                                                    fVar24 = (fVar26 * fVar24) /
                                                             (float10)*(float *)(iVar7 + uVar21 * 4)
                                                    ;
                                                    pfVar15 = DAT_0054b614;
                                                  }
                                                  else {
                                                    pppppdStack_3c0 =
                                                         *(double ******)(iVar7 + uVar21 * 4);
                                                    pppppdStack_3c4 = (double *****)0x524aad;
                                                    fVar24 = (float10)adj_fdiv_m32();
                                                    pfVar15 = extraout_EDX_00;
                                                  }
                                                  pfVar15[uVar18] = (float)fVar24;
                                                  }
                                                  if ((uVar23 & 0xd) != 0) goto LAB_00524ba2;
                                                  }
                                                  }
                                                  bVar22 = SCARRY2(sVar6,1);
                                                  sVar6 = sVar6 + 1;
                                                  if (bVar22) {
                                                    pppppdStack_3c0 = (double *****)0x524bad;
                                                    __vbaErrorOverflow();
                                                    pppppdStack_3d0 = (double *****)&LAB_00404716;
                                                    pppppdStack_3d4 = ExceptionList;
                                                    pppppdStack_3cc = (double *****)&pppppdStack_3f4
                                                    ;
                                                    pppppdStack_3f4 = (double *****)0x0;
                                                    pppppdStack_3c8 = (double *****)&DAT_00403a18;
                                                    pppppdStack_3c4 =
                                                         (double *****)((uint)pppppdStack_3b8 & 1);
                                                    pppppdStack_3b8 =
                                                         (double *****)
                                                         ((uint)pppppdStack_3b8 & 0xfffffffe);
                                                    ExceptionList = &pppppdStack_3d4;
                                                    pppppdStack_3f0 = (double *****)uVar18;
                                                    pppppdStack_3ec = (double *****)pcVar16;
                                                    pppppdStack_3c0 = (double *****)&stack0xfffffdc4
                                                    ;
                                                    (**(code **)((int)*pppppdStack_3b8 + 4))
                                                              (pppppdStack_3b8);
                                                    pppppdStack_3d8 = (double *****)0x0;
                                                    DAT_0054b04a = 0xffff;
                                                    if (DAT_0054d360 == (int *)0x0) {
                                                      __vbaNew2(&DAT_0041b030,&DAT_0054d360);
                                                    }
                                                    piVar8 = DAT_0054d360;
                                                    if (DAT_0054c094 == 0) {
                                                      __vbaNew2(&DAT_0040bbf8,&DAT_0054c094);
                                                    }
                                                    iVar7 = *piVar8;
                                                    uVar12 = __vbaObjSetAddref(&pppppdStack_3d8,
                                                                               DAT_0054c094);
                                                    iVar7 = (**(code **)(iVar7 + 0x10))
                                                                      (piVar8,uVar12);
                                                    if (iVar7 < 0) {
                                                      __vbaHresultCheckObj
                                                                (iVar7,piVar8,&DAT_0041b020,0x10);
                                                    }
                                                    __vbaFreeObj();
                                                    return;
                                                  }
                                                  } while( true );
                                                }
                                                (*(code *)(*DAT_0054b024)[0x13e])();
                                                piVar8 = (int *)__vbaObjSet();
                                                iVar7 = (**(code **)(*piVar8 + 0x40))();
                                                uVar23 = 0;
                                                if (iVar7 < 0) {
                                                  __vbaHresultCheckObj();
                                                }
                                                (*pcVar16)();
                                                __vbaFreeObjList();
                                              }
                                              _DAT_0054bac4 = DAT_0054b6ac;
                                              if (((uVar23 & 0xd) == 0) &&
                                                 (_DAT_0054bab0 =
                                                       (DAT_0054b614[1] + *DAT_0054b614) * 0.10764,
                                                 (uVar23 & 0xd) == 0)) {
                                                _DAT_0054bac8 = DAT_0054b53c;
                                                FUN_0050af30();
                                                _DAT_0054b864 = DAT_0054b690 - DAT_0054b694;
                                                if (((uVar23 & 0xd) == 0) &&
                                                   (_DAT_0054b868 = DAT_0054b690 - DAT_0054b698,
                                                   (uVar23 & 0xd) == 0)) {
                                                  if (DAT_0054b000 == 0) {
                                                    fVar24 = (float10)_DAT_0054b67c /
                                                             (float10)(float)DAT_0054b314;
                                                    pfVar14 = DAT_0054b614;
                                                  }
                                                  else {
                                                    fVar24 = (float10)adj_fdiv_m32();
                                                    pfVar14 = extraout_ECX_06;
                                                  }
                                                  pfVar37 = (float *)&DAT_0054b1b0;
                                                  pfVar35 = &DAT_0054ba68;
                                                  pfVar33 = &DAT_0054ba64;
                                                  pfVar31 = &DAT_0054b120;
                                                  pfVar29 = &DAT_0054b550;
                                                  DAT_0054bacc = (float)(fVar24 * (float10)
                                                  DAT_0054b318);
                                                  if ((uVar23 & 0xd) == 0) {
                                                    if (DAT_0054b000 == 0) {
                                                      fVar24 = (float10)_DAT_0054b680 /
                                                               (float10)(float)DAT_0054b314;
                                                    }
                                                    else {
                                                      pfVar29 = DAT_0054b314;
                                                      fVar24 = (float10)adj_fdiv_m32();
                                                      pfVar14 = extraout_ECX_07;
                                                    }
                                                    DAT_0054bad0 = (float)(fVar24 * (float10)
                                                  DAT_0054b318);
                                                  if (((uVar23 & 0xd) == 0) &&
                                                     (DAT_0054b4bc = pfVar14[0x10] * 100.0,
                                                     (uVar23 & 0xd) == 0)) {
                                                    FUN_00504890(pfVar29,pfVar15,pfVar31,pfVar33,
                                                                 pfVar35,pfVar37);
                                                    DAT_0054bad8 = (double *)
                                                                   (DAT_0054b724 - DAT_0054b728);
                                                    if ((uVar23 & 0xd) == 0) {
                                                      if (DAT_0054b000 == 0) {
                                                        fVar24 = (float10)DAT_0054b1a0 /
                                                                 (float10)DAT_0054b650;
                                                      }
                                                      else {
                                                        fVar24 = (float10)adj_fdiv_m32();
                                                      }
                                                      _DAT_0054badc = (float)fVar24;
                                                      if (((uVar23 & 0xd) == 0) &&
                                                         ((*(short *)(DAT_0054b630 + 0x16) != -1 ||
                                                          (DAT_0054b524 = DAT_0054b47c *
                                                                          DAT_0054b614[0xb] +
                                                                          DAT_0054b6f8,
                                                          (uVar23 & 0xd) == 0)))) {
                                                        (*(code *)(*DAT_0054b024)[0x15e])();
                                                        __vbaObjSet();
                                                        __vbaLateIdCallLd();
                                                        sVar6 = __vbaI2Var();
                                                        (*pcVar20)();
                                                        __vbaFreeVar();
                                                        if (sVar6 == 1) {
                                                          DAT_0054b614[0xd] = -1.0;
                                                        }
                                                        else {
                                                          (*(code *)(*DAT_0054b024)[0x15e])();
                                                          __vbaObjSet();
                                                          __vbaLateIdCallLd();
                                                          sVar6 = __vbaI2Var();
                                                          (*pcVar20)();
                                                          __vbaFreeVar();
                                                          if (sVar6 == 2) {
                                                            DAT_0054b614[0xd] = 1.0;
                                                          }
                                                          else {
                                                            (*(code *)(*DAT_0054b024)[0x15e])();
                                                            __vbaObjSet();
                                                            __vbaLateIdCallLd();
                                                            sVar6 = __vbaI2Var();
                                                            (*pcVar20)();
                                                            __vbaFreeVar();
                                                            if (sVar6 == 0) {
                                                              DAT_0054b614[0xd] = 0.0;
                                                            }
                                                          }
                                                        }
                                                        if (DAT_0054b000 == 0) {
                                                          fVar24 = ((float10)DAT_0054c068 *
                                                                    (float10)DAT_0054b614[0xd] *
                                                                    (float10)_DAT_0054ba28 *
                                                                   (float10)DAT_0054b414) /
                                                                   (float10)DAT_0054bb38;
                                                        }
                                                        else {
                                                          fVar24 = (float10)adj_fdiv_m32();
                                                        }
                                                        fVar24 = (float10)DAT_0054c068 - fVar24;
                                                        if (DAT_0054b000 == 0) {
                                                          fVar26 = (((float10)_DAT_0054b6c4 -
                                                                    (float10)_DAT_0054ba28) *
                                                                   (float10)DAT_0054b414) /
                                                                   (float10)DAT_0054bb38;
                                                        }
                                                        else {
                                                          fVar26 = (float10)adj_fdiv_m32();
                                                          fVar24 = extraout_ST1_05;
                                                        }
                                                        DAT_0054c068 = (float)(((float10)
                                                  _DAT_0054c070 - (float10)DAT_0054c068) * fVar26 +
                                                  fVar24);
                                                  if (((uVar23 & 0xd) == 0) && ((uVar23 & 0xd) == 0)
                                                     ) {
                                                    if (DAT_0054b000 == 0) {
                                                      fVar24 = (((float10)DAT_0054c068 -
                                                                (float10)DAT_0054c06c) *
                                                                (float10)_DAT_0054b180 *
                                                               (float10)0.0001) /
                                                               (float10)DAT_0054b470;
                                                    }
                                                    else {
                                                      fVar24 = (float10)adj_fdiv_m32();
                                                    }
                                                    _DAT_0054baec = (float)fVar24;
                                                    if ((uVar23 & 0xd) == 0) {
                                                      FUN_00503f50((float *)&DAT_0054baf0,
                                                                   (float *)&DAT_0054b480,
                                                                   (float *)&DAT_0054bad4,
                                                                   (float *)&DAT_0054b808,
                                                                   (float *)&DAT_0054b478,
                                                                   (float *)&DAT_0054b498,
                                                                   (float *)&DAT_0054b758,
                                                                   (float *)&DAT_0054b75c,
                                                                   (float *)&DAT_0054b48c,
                                                                   (float *)&DAT_0054b818,
                                                                   &DAT_0054ba64,&DAT_0054b414,
                                                                   (float *)&DAT_0054b814,
                                                                   &DAT_0054b524,
                                                                   (float *)&DAT_0054baf4,
                                                                   (float *)&DAT_0054b2e4,
                                                                   &DAT_0054b44c,&DAT_0054b47c,
                                                                   &DAT_0054b40c,
                                                                   (float *)&DAT_0054b468,
                                                                   (float *)&DAT_0054b704,
                                                                   &DAT_0054b558,
                                                                   (float *)&DAT_0054baf8,
                                                                   (float *)&DAT_0054b55c,
                                                                   &DAT_0054b4da,
                                                                   (short *)&DAT_0054b700,
                                                                   (float *)&DAT_0054bafc,
                                                                   (float *)&DAT_0054baec,
                                                                   &DAT_0054ba68,
                                                                   (float *)&DAT_0054b81c,
                                                                   &DAT_0054b434,
                                                                   (short *)(DAT_0054b630 + 0x16));
                                                      local_28 = (uint)(DAT_0054b4da != 0);
                                                      _DAT_0054bb0c =
                                                           (_DAT_0054bb08 * _DAT_0054b2d4 +
                                                           _DAT_0054b2f8 * _DAT_0054b2d8) *
                                                           _DAT_0054b74c;
                                                      if ((uVar23 & 0xd) == 0) {
                                                        _DAT_0054bb10 = DAT_0054b548;
                                                        FUN_00502480((float *)&DAT_0054bb14,
                                                                     &DAT_0054b548,
                                                                     (float *)&DAT_0054b448,
                                                                     (float ******)&DAT_0054b40c,
                                                                     (float *)&DAT_0054b294,
                                                                     (float *)&DAT_0054b298,
                                                                     &local_38,&local_30,pfVar27,
                                                                     &DAT_0054b544,&DAT_0054b486,
                                                                     (float *)&DAT_0054bb20,
                                                                     (float *)&DAT_0054b2c8,
                                                                     (float *)&DAT_0054bb24,
                                                                     (float *)&DAT_0054b160);
                                                        _DAT_0054ba24 = local_30 + local_2c;
                                                        if ((uVar23 & 0xd) == 0) {
                                                          FUN_005034b0(&DAT_0054b544,
                                                                       (float *)&DAT_0054b2c4,
                                                                       (float ***)&DAT_0054b40c,
                                                                       pfVar9,(float *)&DAT_0054b750
                                                                       ,(float ***)&DAT_0054b160,
                                                                       (float *)&DAT_0054b2d0,
                                                                       (float *)&DAT_0054b2cc,
                                                                       &DAT_0054b548);
                                                          fVar24 = (float10)FUN_0049ae10((float *)&
                                                  DAT_0054bb20);
                                                  _DAT_0054c358 = (float)fVar24;
                                                  fVar24 = (float10)FUN_0049ab70((float *)&
                                                  DAT_0054bb20);
                                                  _DAT_0054c35c = (float)fVar24;
                                                  pppppdStack_32c = (double *****)0x5233ef;
                                                  fVar24 = FUN_0049c190((float *)&DAT_0054bb20);
                                                  DAT_0054b660 = (float)fVar24;
                                                  pppppdStack_32c = (double *****)0x5233ff;
                                                  fVar24 = (float10)FUN_0049bf00((float *)&
                                                  DAT_0054bb20);
                                                  DAT_0054b664 = (float)fVar24;
                                                  if (DAT_0054b000 == 0) {
                                                    fVar24 = ((float10)DAT_0054b2c0 -
                                                             (float10)_DAT_0054b2bc *
                                                             (float10)_DAT_0054b54c) /
                                                             (float10)DAT_0054b660;
                                                  }
                                                  else {
                                                    pppppdStack_330 = (double *****)0x523433;
                                                    fVar24 = (float10)adj_fdiv_m32();
                                                  }
                                                  _DAT_0054bb2c = (float)fVar24;
                                                  if ((uVar23 & 0xd) == 0) {
                                                    if (DAT_0054b000 == 0) {
                                                      fVar24 = ((float10)_DAT_0054b2bc *
                                                               (float10)_DAT_0054b54c) /
                                                               (float10)DAT_0054b664;
                                                    }
                                                    else {
                                                      fVar24 = (float10)adj_fdiv_m32();
                                                    }
                                                    DAT_0054bb30 = (float)fVar24;
                                                    if (((uVar23 & 0xd) == 0) &&
                                                       ((uVar23 & 0xd) == 0)) {
                                                      if (DAT_0054b000 == 0) {
                                                        fVar24 = (((float10)DAT_0054b544 -
                                                                  (float10)_DAT_0054bb20) *
                                                                 (float10)DAT_0054b2c0) /
                                                                 ((float10)DAT_0054b548 +
                                                                 (float10)459.67);
                                                      }
                                                      else {
                                                        fVar24 = (float10)adj_fdiv_r();
                                                      }
                                                      if (DAT_0054b000 == 0) {
                                                        fVar24 = fVar24 / (float10)53.34;
                                                      }
                                                      else {
                                                        fVar24 = (float10)adj_fdiv_m64();
                                                      }
                                                      _DAT_0054bb34 =
                                                           (float)(fVar24 * (float10)144.0);
                                                      if ((uVar23 & 0xd) == 0) {
                                                        fVar24 = (float10)__vbaFpR4();
                                                        uVar23 = 0;
                                                        if ((float10)DAT_0054b544 < fVar24) {
                                                          DAT_0054b544 = 14.7;
                                                        }
                                                        if (DAT_0054b000 == 0) {
                                                          fVar24 = (((float10)DAT_0054b614[0xf] *
                                                                     (float10)100.0 +
                                                                    (float10)_DAT_0054b2dc) *
                                                                   (float10)_DAT_0054bb34) /
                                                                   (float10)100.0;
                                                          pfVar15 = DAT_0054b614;
                                                        }
                                                        else {
                                                          fVar24 = (float10)adj_fdiv_m32();
                                                          pfVar15 = extraout_ECX_08;
                                                        }
                                                        if ((uVar23 & 0xd) == 0) {
                                                          if (DAT_0054b000 == 0) {
                                                            fVar24 = fVar24 / (float10)86400.0;
                                                          }
                                                          else {
                                                            fVar24 = (float10)adj_fdiv_m64();
                                                            pfVar15 = extraout_ECX_09;
                                                          }
                                                          _DAT_0054bb40 = (float)fVar24;
                                                          if ((uVar23 & 0xd) == 0) {
                                                            if (DAT_0054b000 == 0) {
                                                              fVar24 = (((float10)pfVar15[0xf] *
                                                                         (float10)100.0 +
                                                                        (float10)_DAT_0054b2dc) *
                                                                       (float10)_DAT_0054bb2c) /
                                                                       (float10)100.0;
                                                            }
                                                            else {
                                                              fVar24 = (float10)adj_fdiv_m32();
                                                            }
                                                            if ((uVar23 & 0xd) == 0) {
                                                              if (DAT_0054b000 == 0) {
                                                                fVar24 = fVar24 / (float10)86400.0;
                                                              }
                                                              else {
                                                                fVar24 = (float10)adj_fdiv_m64();
                                                              }
                                                              _DAT_0054bb44 = (float)fVar24;
                                                              if ((uVar23 & 0xd) == 0) {
                                                                fVar24 = (float10)__vbaFpR4();
                                                                uVar23 = 0;
                                                                if (fVar24 < (float10)DAT_0054b544)
                                                                {
                                                                  (*(code *)(*DAT_0054b024)[0x129])
                                                                            ();
                                                                  piVar8 = (int *)__vbaObjSet();
                                                                  iVar7 = (**(code **)(*piVar8 +
                                                                                      0x40))();
                                                                  uVar23 = 0;
                                                                  if (iVar7 < 0) {
                                                                    __vbaHresultCheckObj();
                                                                  }
                                                                  __vbaLateIdCallLd();
                                                                  if ((uVar23 & 0xd) != 0)
                                                                  goto LAB_00524628;
                                                                  fVar24 = (float10)Ordinal_614();
                                                                  dVar40 = (double)fVar24;
                                                                  sVar6 = __vbaI2Var();
                                                                  pcVar16 = __vbaFreeObjList_exref;
                                                                  if (DAT_0054b000 == 0) {
                                                                    fVar24 = ((float10)(int)sVar6 *
                                                                             (float10)_DAT_0054c064)
                                                                             / (float10)100.0;
                                                                  }
                                                                  else {
                                                                    fVar24 = (float10)adj_fdiv_m32()
                                                                    ;
                                                                  }
                                                                  if (((uVar23 & 0xd) != 0) ||
                                                                     (_DAT_0054c060 =
                                                                           (float)(fVar24 * (float10
                                                  )dVar40), (uVar23 & 0xd) != 0)) goto LAB_00524628;
                                                  __vbaFreeObjList();
                                                  __vbaFreeVar();
                                                  }
                                                  else {
                                                    _DAT_0054c060 = 0.0;
                                                    pcVar16 = __vbaFreeObjList_exref;
                                                  }
                                                  _DAT_0054bb48 =
                                                       _DAT_0054c060 + _DAT_0054bb44 + _DAT_0054bb40
                                                  ;
                                                  if ((uVar23 & 0xd) == 0) {
                                                    (*(code *)(*DAT_0054b024)[0x129])();
                                                    piVar8 = (int *)__vbaObjSet();
                                                    iVar7 = (**(code **)(*piVar8 + 0x40))();
                                                    uVar23 = 0;
                                                    if (iVar7 < 0) {
                                                      __vbaHresultCheckObj();
                                                    }
                                                    __vbaLateIdCallLd();
                                                    sVar6 = __vbaI2Var();
                                                    if (DAT_0054b000 == 0) {
                                                      fVar24 = (float10)(int)sVar6 / (float10)100.0;
                                                    }
                                                    else {
                                                      fVar24 = (float10)adj_fdiv_m64();
                                                    }
                                                    if ((uVar23 & 0xd) == 0) {
                                                      if (DAT_0054b000 == 0) {
                                                        fVar24 = (((float10)_DAT_0054bb34 +
                                                                  (float10)_DAT_0054bb2c) * fVar24)
                                                                 / (float10)86400.0;
                                                      }
                                                      else {
                                                        fVar24 = (float10)adj_fdiv_m64();
                                                      }
                                                      _DAT_0054bb48 =
                                                           (float)(fVar24 + (float10)_DAT_0054bb44 +
                                                                  (float10)_DAT_0054bb40);
                                                      if ((uVar23 & 0xd) == 0) {
                                                        (*pcVar16)();
                                                        __vbaFreeVar();
                                                        if (DAT_0054b000 == 0) {
                                                          fVar24 = (((float10)_DAT_0054b2dc +
                                                                    (float10)DAT_0054b614[0xf]) *
                                                                   (float10)DAT_0054bb30) /
                                                                   (float10)100.0;
                                                        }
                                                        else {
                                                          fVar24 = (float10)adj_fdiv_m32();
                                                        }
                                                        if ((uVar23 & 0xd) == 0) {
                                                          if (DAT_0054b000 == 0) {
                                                            fVar24 = fVar24 / (float10)86400.0;
                                                          }
                                                          else {
                                                            fVar24 = (float10)adj_fdiv_m64();
                                                          }
                                                          _DAT_0054bb4c = (float)fVar24;
                                                          if (((uVar23 & 0xd) == 0) &&
                                                             ((uVar23 & 0xd) == 0)) {
                                                            fVar24 = FUN_0049be80((float *)&
                                                  stack0xfffffeac);
                                                  fVar43 = (float)fVar24;
                                                  if (DAT_0054b000 == 0) {
                                                    fVar24 = (((float10)DAT_0054b4fc -
                                                              (float10)DAT_0054b544) *
                                                             (float10)DAT_0054b41c *
                                                             (float10)DAT_0054b538 *
                                                             (float10)_DAT_0054ba70) /
                                                             (float10)DAT_0054b4c0;
                                                  }
                                                  else {
                                                    fVar24 = (float10)adj_fdiv_m32();
                                                  }
                                                  _DAT_0054bb50 = (float)(fVar24 * (float10)fVar43);
                                                  if (((uVar23 & 0xd) == 0) && ((uVar23 & 0xd) == 0)
                                                     ) {
                                                    fVar24 = FUN_0049be80((float *)&stack0xfffffeac)
                                                    ;
                                                    fVar43 = (float)fVar24;
                                                    (*(code *)(*DAT_0054b024)[0x14c])();
                                                    piVar8 = (int *)__vbaObjSet();
                                                    iVar7 = (**(code **)(*piVar8 + 0x40))();
                                                    uVar23 = 0;
                                                    if (iVar7 < 0) {
                                                      __vbaHresultCheckObj();
                                                    }
                                                    __vbaLateIdCallLd();
                                                    sVar6 = __vbaI2Var();
                                                    dVar40 = (double)(int)sVar6;
                                                    if ((uVar23 & 0xd) == 0) {
                                                      if (DAT_0054b000 == 0) {
                                                        fVar24 = (((float10)DAT_0054b4fc -
                                                                  (float10)14.7) *
                                                                 (float10)DAT_0054b41c *
                                                                 (float10)DAT_0054b538 *
                                                                 (float10)_DAT_0054ba70) /
                                                                 (float10)DAT_0054b4c0;
                                                      }
                                                      else {
                                                        fVar24 = (float10)adj_fdiv_m32();
                                                      }
                                                      if (DAT_0054b000 == 0) {
                                                        fVar24 = (fVar24 * (float10)fVar43 *
                                                                 (float10)dVar40) / (float10)100.0;
                                                      }
                                                      else {
                                                        fVar24 = (float10)adj_fdiv_m64();
                                                      }
                                                      _DAT_0054bb54 = (float)fVar24;
                                                      if ((uVar23 & 0xd) == 0) {
                                                        (*pcVar16)();
                                                        __vbaFreeVar();
                                                        if (_DAT_0054bb50 < 0.0) {
                                                          _DAT_0054bb50 = 0.0;
                                                        }
                                                        if (_DAT_0054bb54 < 0.0) {
                                                          _DAT_0054bb54 = 0.0;
                                                        }
                                                        _DAT_0054bb58 =
                                                             ((((_DAT_0054b6a4 + _DAT_0054bb50 +
                                                                 _DAT_0054bf9c + _DAT_0054bb14) -
                                                               _DAT_0054ba24) - _DAT_0054bb4c) -
                                                             _DAT_0054bb44) * DAT_0054b414;
                                                        _DAT_0054bb5c =
                                                             _DAT_0054bb40 * DAT_0054b414 -
                                                             (float)DAT_0054b32c *
                                                             (float)_DAT_0054bf7c * DAT_0054b414;
                                                        fVar24 = (float10)__vbaFpR4();
                                                        uVar23 = 0;
                                                        if (fVar24 <= (float10)1.0) {
                                                          _DAT_0054bb60 = 1.0;
                                                          fVar24 = ((((float10)_DAT_0054b750 +
                                                                     (float10)_DAT_0054bb0c) -
                                                                    (float10)_DAT_0054b754) +
                                                                   (((float10)_DAT_0054c358 *
                                                                     (float10)0.7 +
                                                                    (float10)_DAT_0054bb1c *
                                                                    (float10)0.3) -
                                                                   (float10)local_38) *
                                                                   (float10)_DAT_0054bb14) *
                                                                   (float10)DAT_0054b414;
                                                          if (DAT_0054b000 == 0) {
                                                            fVar26 = (float10)_DAT_0054bdf4 /
                                                                     (float10)1000.0;
                                                          }
                                                          else {
                                                            fVar26 = (float10)adj_fdiv_m64();
                                                            fVar24 = extraout_ST1_08;
                                                          }
                                                          fVar24 = fVar24 - fVar26 * (float10)
                                                  DAT_0054b330 * (float10)DAT_0054b414;
                                                  }
                                                  else {
                                                    uVar23 = 0;
                                                    fVar24 = (float10)_DAT_0054bb14 *
                                                             (float10)local_38 +
                                                             (float10)_DAT_0054b73c *
                                                             (float10)_DAT_0054bf9c +
                                                             (float10)_DAT_0054ba90 *
                                                             (float10)_DAT_0054bb50 +
                                                             (float10)_DAT_0054b738 *
                                                             (float10)_DAT_0054b6a4;
                                                    if (_DAT_0054bb14 <= 5.0) {
                                                      fVar24 = ((fVar24 - (float10)_DAT_0054bb1c *
                                                                          (float10)_DAT_0054ba24) -
                                                               (float10)_DAT_0054bb44 *
                                                               (float10)_DAT_0054c358) -
                                                               (float10)_DAT_0054bb4c *
                                                               (float10)_DAT_0054c35c;
                                                    }
                                                    else {
                                                      fVar24 = ((fVar24 - ((float10)_DAT_0054c358 *
                                                                           (float10)0.7 +
                                                                          (float10)_DAT_0054bb1c *
                                                                          (float10)0.3) *
                                                                          (float10)_DAT_0054ba24) -
                                                               (float10)_DAT_0054bb44 *
                                                               (float10)_DAT_0054c358) -
                                                               (float10)_DAT_0054bb4c *
                                                               (float10)_DAT_0054c35c;
                                                    }
                                                    if (DAT_0054b000 == 0) {
                                                      fVar24 = fVar24 / ((((((float10)_DAT_0054b6a4
                                                                             + (float10)
                                                  _DAT_0054bb50 + (float10)_DAT_0054bf9c +
                                                  (float10)_DAT_0054bb14) - (float10)_DAT_0054ba24)
                                                  - (float10)_DAT_0054bb44) - (float10)_DAT_0054bb4c
                                                  ) + (float10)0.01);
                                                  }
                                                  else {
                                                    fVar24 = (float10)adj_fdiv_r();
                                                  }
                                                  _DAT_0054bb60 = (float)fVar24;
                                                  if (((uVar23 & 0xd) != 0) ||
                                                     (fVar24 = (((float10)_DAT_0054b750 +
                                                                (float10)_DAT_0054bb0c) -
                                                               (float10)_DAT_0054b754) *
                                                               (float10)DAT_0054b414,
                                                     (uVar23 & 0xd) != 0)) goto LAB_00524628;
                                                  if (DAT_0054b000 == 0) {
                                                    fVar26 = (float10)_DAT_0054bdf4 /
                                                             (float10)1000.0;
                                                  }
                                                  else {
                                                    fVar26 = (float10)adj_fdiv_m64();
                                                    fVar24 = extraout_ST1_06;
                                                  }
                                                  fVar24 = fVar24 - fVar26 * (float10)DAT_0054b330 *
                                                                    (float10)DAT_0054b414;
                                                  if ((uVar23 & 0xd) != 0) goto LAB_00524628;
                                                  if (DAT_0054b000 == 0) {
                                                    fVar26 = ((float10)DAT_0054b414 *
                                                             (float10)_DAT_0054bfb8) /
                                                             (float10)1.055;
                                                  }
                                                  else {
                                                    fVar26 = (float10)adj_fdiv_m64();
                                                    fVar24 = extraout_ST1_07;
                                                  }
                                                  fVar24 = fVar24 - fVar26;
                                                  }
                                                  _DAT_0054bb28 = (float)fVar24;
                                                  if (((((uVar23 & 0xd) == 0) &&
                                                       (_DAT_0054b674 =
                                                             _DAT_0054b6a4 + _DAT_0054bb50,
                                                       (uVar23 & 0xd) == 0)) &&
                                                      (_DAT_0054b4b8 =
                                                            _DAT_0054ba90 * _DAT_0054bb50 +
                                                            _DAT_0054b738 * _DAT_0054b6a4,
                                                      (uVar23 & 0xd) == 0)) && ((uVar23 & 0xd) == 0)
                                                     ) {
                                                    fVar24 = (float10)__vbaFpR4();
                                                    fVar26 = (float10)__vbaFpR4();
                                                    fVar25 = (float10)__vbaFpR4();
                                                    fVar43 = (float)fVar25;
                                                    fVar25 = (float10)__vbaFpR4();
                                                    uVar23 = 0;
                                                    if (fVar25 < (float10)fVar43 ||
                                                        ((float10)2.0 < fVar24 ||
                                                        (float10)2.0 < fVar26)) {
                                                      FUN_005011b0(&DAT_0054b544,
                                                                   (float *)&DAT_0054b800,
                                                                   &DAT_0054b548,
                                                                   (float *)&DAT_0054b54c,
                                                                   (float *)&DAT_0054bb58,
                                                                   (float *)&DAT_0054bb60,
                                                                   (float *)&DAT_0054bb5c,
                                                                   (float *)&DAT_0054bb28,
                                                                   &DAT_0054b2c0,
                                                                   (float *)&DAT_0054b2bc,
                                                                   (float *)&DAT_0054b160);
                                                    }
                                                    _DAT_0054b74c = DAT_0054b548 - _DAT_0054bb10;
                                                    if ((uVar23 & 0xd) == 0) {
                                                      FUN_004fa8e0((short *)&local_28);
                                                      FUN_0049a830();
                                                      DAT_0054b4f0 = DAT_0054b688;
                                                      FUN_0049a830();
                                                      FUN_0049a830();
                                                      FUN_0049a830();
                                                      FUN_0049a830();
                                                      FUN_0049a830();
                                                      if (1.0 < DAT_0054b504) {
                                                        DAT_0054b504 = 1.0;
                                                      }
                                                      FUN_0049a830();
                                                      if (1.0 < DAT_0054b508) {
                                                        DAT_0054b508 = 1.0;
                                                      }
                                                      FUN_0049a830();
                                                      FUN_0049a830();
                                                      FUN_0049a830();
                                                      FUN_0049a830();
                                                      if (_DAT_0054b4f4 < 0.0) {
                                                        _DAT_0054b4f4 = 0.0;
                                                      }
                                                      uVar23 = 0;
                                                      if (_DAT_0054b4f8 < 0.0) {
                                                        _DAT_0054b4f8 = 0.0;
                                                      }
                                                      FUN_0049a830();
                                                      FUN_0049a830();
                                                      if ((uVar23 & 0xd) == 0) {
                                                        fVar24 = FUN_0049be80((float *)&
                                                  stack0xfffffeac);
                                                  _DAT_0054bba4 = _DAT_0054bb50 * (float)fVar24;
                                                  if ((uVar23 & 0xd) == 0) {
                                                    uVar23 = 0;
                                                    if (_DAT_0054b494 < DAT_0054b544) {
                                                      _DAT_0054b494 = DAT_0054b544 + 0.1;
                                                    }
                                                    FUN_0049a830();
                                                    if ((uVar23 & 0xd) == 0) {
                                                      fVar24 = (float10)__vbaFpR4();
                                                      if ((fVar24 < (float10)DAT_0054b40c) &&
                                                         (iVar7 = (*(code *)(*DAT_0054b024)[0x1c7])
                                                                            (), iVar7 < 0)) {
                                                        __vbaHresultCheckObj();
                                                      }
                                                      return;
                                                    }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LAB_00524628:
  __vbaFPException();
  return;
}

