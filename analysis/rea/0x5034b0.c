
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl
FUN_005034b0(float *param_1,float *param_2,float ***param_3,float *param_4,float *param_5,
            float ***param_6,float *param_7,float *param_8,float *param_9)

{
  float *pfVar1;
  float fVar2;
  bool bVar3;
  float *pfVar4;
  short sVar5;
  ushort uVar6;
  short sVar7;
  float ****ppppfVar8;
  int iVar9;
  int *piVar10;
  float ***pppfVar11;
  float ***pppfVar12;
  float ****ppppfVar13;
  float *****pppppfVar14;
  undefined4 uVar15;
  float *pfVar16;
  float *pfVar17;
  float *unaff_EBX;
  code *pcVar18;
  float *unaff_ESI;
  short sVar19;
  float *unaff_EDI;
  code *pcVar20;
  undefined2 uVar22;
  float10 fVar23;
  float10 fVar24;
  float10 fVar25;
  undefined1 auStack_2f8 [40];
  int aiStack_2d0 [3];
  float ****ppppfStack_2c4;
  float ****ppppfStack_2c0;
  float ****ppppfStack_2bc;
  float ****ppppfStack_2b8;
  undefined4 uStack_2b4;
  int *piStack_2b0;
  undefined4 uStack_2ac;
  float ****ppppfStack_2a8;
  float *****pppppfStack_2a4;
  float ****ppppfStack_2a0;
  float ****ppppfStack_29c;
  float *****pppppfStack_298;
  undefined8 uStack_294;
  undefined8 uStack_28c;
  float *pfVar26;
  float *pfVar27;
  float *pfVar28;
  float *pfVar29;
  float *pfStack_25c;
  int iStack_250;
  int iStack_24c;
  float ****ppppfStack_23c;
  float ****ppppfStack_20c;
  float ***pppfStack_208;
  float ****ppppfStack_204;
  float ****ppppfStack_200;
  float ****ppppfStack_1fc;
  float ****ppppfStack_1f8;
  float ****ppppfStack_1f4;
  float ****ppppfStack_1f0;
  float ****ppppfStack_1ec;
  float ****ppppfStack_1e8;
  float ****ppppfStack_1e4;
  float ****ppppfStack_1e0;
  float ****ppppfStack_1dc;
  float ****ppppfStack_1d8;
  float ****ppppfStack_1d4;
  float ****ppppfStack_1d0;
  float ****ppppfStack_1cc;
  float ****ppppfStack_1c8;
  float ****ppppfStack_1c4;
  float ****ppppfStack_1c0;
  float ****ppppfStack_1bc;
  float ****ppppfStack_1b8;
  float ****ppppfStack_1b4;
  float ****ppppfStack_1b0;
  float ****ppppfStack_1ac;
  float ****ppppfStack_1a8;
  float ****ppppfStack_1a4;
  float ****ppppfStack_1a0;
  float ****ppppfStack_19c;
  float *pfStack_198;
  float ****ppppfStack_194;
  float *pfStack_190;
  float *local_180;
  float ****local_17c;
  float *local_178;
  float *local_174;
  float *local_170;
  float *pfStack_16c;
  float *pfStack_168;
  float *pfStack_164;
  undefined4 *puStack_160;
  float *pfStack_15c;
  float *pfStack_158;
  float *pfStack_154;
  float *pfStack_150;
  float *pfStack_14c;
  float *pfStack_148;
  float *pfStack_144;
  short *psStack_13c;
  float *pfStack_138;
  float *local_134;
  float ***local_130;
  float ***local_12c;
  float *pfStack_128;
  wchar_t *local_124;
  undefined4 local_11c;
  wchar_t *local_114;
  float **local_fc [2];
  wchar_t *local_f4;
  undefined4 local_ec;
  float ****local_e8;
  float ****local_e4;
  undefined4 local_e0;
  float ****local_dc;
  float ****local_d8;
  float ****local_d4;
  float ****local_d0;
  float ***local_cc [4];
  float ***local_bc [4];
  float ***local_ac [4];
  float ***local_9c [4];
  float ***local_8c [2];
  float local_84;
  float ***local_7c [4];
  float ***local_6c [4];
  float ***local_5c [4];
  float ***local_4c;
  float ***local_48;
  float ***local_44;
  float ***local_40;
  float ****local_3c;
  float **local_38;
  float ***local_34;
  float ***local_30;
  float ***local_2c;
  float ***local_28;
  float ***local_24;
  void *pvStack_20;
  undefined1 *puStack_1c;
  undefined1 *local_18;
  undefined *local_14;
  undefined4 local_10;
  undefined4 local_c;
  float *pfVar21;
  
  puStack_1c = &LAB_00404716;
  pvStack_20 = ExceptionList;
  local_18 = &stack0xfffffe74;
  local_14 = &DAT_004032a8;
  local_10 = 0;
  local_c = 0;
  local_24 = (float ***)0x0;
  local_28 = (float ***)0x0;
  local_2c = (float ***)0x0;
  local_30 = (float ***)0x0;
  local_34 = (float ***)0x0;
  local_38 = (float **)0x0;
  local_3c = (float ****)0x0;
  local_40 = (float ***)0x0;
  local_44 = (float ***)0x0;
  local_48 = (float ***)0x0;
  local_4c = (float ***)0x0;
  local_5c[0] = (float ***)0x0;
  local_6c[0] = (float ***)0x0;
  local_7c[0] = (float ***)0x0;
  local_8c[0] = (float ***)0x0;
  local_9c[0] = (float ***)0x0;
  local_ac[0] = (float ***)0x0;
  local_bc[0] = (float ***)0x0;
  local_cc[0] = (float ***)0x0;
  local_dc = (float ****)0x0;
  local_ec = 0;
  local_fc[0] = (float **)0x0;
  local_11c = 0;
  local_12c = (float ***)0x0;
  local_130 = (float ***)0x0;
  local_134 = (float *)0x0;
  pfStack_190 = (float *)0x1;
  ppppfStack_194 = (float ****)0x503564;
  ExceptionList = &pvStack_20;
  __vbaOnError();
  uVar6 = 0;
  pcVar18 = __vbaObjSet_exref;
  pcVar20 = __vbaLateIdCallLd_exref;
  if (*param_2 <= *param_1 && (float)*param_3 < *param_4) {
    *param_4 = (float)*param_3;
    local_e4 = (float ****)0x423ecc;
    local_ec = 8;
    ppppfStack_194 = (float ****)0x5035c6;
    __vbaVarDup();
    local_d4 = (float ****)param_3;
    local_dc = (float ****)0x4004;
    ppppfStack_194 = (float ****)0x1;
    pfStack_198 = (float *)0x1;
    ppppfStack_19c = local_5c;
    ppppfStack_1a0 = (float ****)&local_dc;
    ppppfStack_1a4 = local_6c;
    ppppfStack_1a8 = (float ****)0x5035f1;
    Ordinal_660();
    local_f4 = L" sec, Fan Coolers Starts ";
    local_fc[0] = (float **)0x8;
    local_114 = L"###0.0";
    local_11c = 8;
    ppppfStack_1a8 = (float ****)0x50361f;
    __vbaVarDup();
    if (DAT_0054b000 == 0) {
      fVar23 = (float10)*param_2 / (float10)(float)DAT_0054b2fc;
    }
    else {
      ppppfStack_1a8 = DAT_0054b2fc;
      ppppfStack_1ac = (float ****)0x503640;
      fVar23 = (float10)adj_fdiv_m32();
    }
    local_84 = (float)fVar23;
    if ((uVar6 & 0xd) != 0) goto LAB_00503f39;
    local_8c[0] = (float ***)0x4;
    ppppfStack_1a8 = (float ****)0x1;
    ppppfStack_1ac = (float ****)0x1;
    ppppfStack_1b0 = local_9c;
    ppppfStack_1b4 = local_8c;
    ppppfStack_1b8 = local_ac;
    ppppfStack_1bc = (float ****)0x503672;
    Ordinal_660();
    local_124 = L" bar";
    local_12c = (float ***)0x8;
    ppppfStack_1bc = local_6c;
    ppppfStack_1c0 = (float ****)local_fc;
    ppppfStack_1c4 = local_7c;
    ppppfStack_1c8 = (float ****)0x503699;
    ppppfStack_1c8 = (float ****)__vbaVarCat();
    ppppfStack_1cc = local_ac;
    ppppfStack_1d0 = local_bc;
    ppppfStack_1d4 = (float ****)0x5036aa;
    ppppfStack_1d4 = (float ****)__vbaVarCat();
    ppppfStack_1d8 = &local_12c;
    ppppfStack_1dc = local_cc;
    ppppfStack_1e0 = (float ****)0x5036bb;
    ppppfStack_1e0 = (float ****)__vbaVarCat();
    ppppfStack_1e4 = (float ****)0x5036c2;
    __vbaStrVarMove();
    ppppfStack_1e4 = (float ****)0x5036cd;
    __vbaStrMove();
    ppppfStack_1e4 = &local_24;
    ppppfStack_1e8 = DAT_0054b028;
    ppppfStack_1ec = (float ****)0x5036df;
    ppppfVar8 = (float ****)(*(code *)(*DAT_0054b028)[0x1bf])();
    if ((int)ppppfVar8 < 0) {
      ppppfStack_1ec = (float ****)0x6fc;
      ppppfStack_1f0 = (float ****)&DAT_0041ccac;
      ppppfStack_1f4 = DAT_0054b028;
      ppppfStack_1fc = (float ****)0x5036fd;
      ppppfStack_1f8 = ppppfVar8;
      __vbaHresultCheckObj();
    }
    ppppfStack_1ec = (float ****)0x503706;
    __vbaFreeStr();
    ppppfStack_1ec = local_cc;
    ppppfStack_1f0 = local_bc;
    ppppfStack_1f4 = local_ac;
    ppppfStack_1f8 = local_7c;
    ppppfStack_1fc = local_9c;
    ppppfStack_200 = local_8c;
    ppppfStack_204 = local_6c;
    pppfStack_208 = (float ***)local_5c;
    ppppfStack_20c = (float ****)0x8;
    __vbaFreeVarList();
    ppppfStack_1ec = DAT_0054b024;
    ppppfStack_1f0 = (float ****)0x50374d;
    ppppfStack_1f0 = (float ****)(*(code *)(*DAT_0054b024)[0x125])();
    pcVar18 = __vbaObjSet_exref;
    ppppfStack_1f4 = &local_28;
    ppppfStack_1f8 = (float ****)0x50375a;
    ppppfVar8 = (float ****)__vbaObjSet();
    ppppfStack_1f8 = &local_2c;
    ppppfStack_1fc = (float ****)0x0;
    ppppfStack_204 = (float ****)0x503768;
    ppppfStack_200 = ppppfVar8;
    iVar9 = (*(code *)(*ppppfVar8)[0x10])();
    if (iVar9 < 0) {
      ppppfStack_204 = (float ****)0x40;
      pppfStack_208 = (float ***)&DAT_0041c968;
      ppppfStack_20c = ppppfVar8;
      __vbaHresultCheckObj();
    }
    ppppfStack_204 = DAT_0054b024;
    pppfStack_208 = (float ***)0x50378b;
    pppfStack_208 = (float ***)(*(code *)(*DAT_0054b024)[0x125])();
    ppppfStack_20c = &local_30;
    piVar10 = (int *)__vbaObjSet();
    iVar9 = (**(code **)(*piVar10 + 0x40))();
    if (iVar9 < 0) {
      __vbaHresultCheckObj();
    }
    pcVar20 = __vbaLateIdCallLd_exref;
    __vbaLateIdCallLd();
    sVar5 = __vbaI2Var();
    __vbaLateIdCallLd();
    uVar6 = __vbaBoolVar();
    __vbaFreeObjList();
    __vbaFreeVarList();
    if ((ushort)(-(ushort)(sVar5 == 0) & ~uVar6) != 0) {
      local_d4 = (float ****)0x64;
      local_dc = (float ****)0x2;
      (*(code *)(*DAT_0054b024)[0x125])();
      piVar10 = (int *)__vbaObjSet();
      iVar9 = (**(code **)(*piVar10 + 0x40))();
      if (iVar9 < 0) {
        __vbaHresultCheckObj();
      }
      __vbaLateIdSt();
      __vbaFreeObjList();
    }
    (*(code *)(*DAT_0054b024)[0x125])();
    piVar10 = (int *)__vbaObjSet();
    iVar9 = (**(code **)(*piVar10 + 0x40))();
    if (iVar9 < 0) {
      __vbaHresultCheckObj();
    }
    ppppfStack_23c = DAT_0054b024;
    (*(code *)(*DAT_0054b024)[0x125])();
    piVar10 = (int *)__vbaObjSet();
    iVar9 = (**(code **)(*piVar10 + 0x40))();
    if (iVar9 < 0) {
      __vbaHresultCheckObj();
    }
    __vbaLateIdCallLd();
    sVar5 = __vbaI2Var();
    __vbaLateIdCallLd();
    uVar6 = __vbaBoolVar();
    __vbaFreeObjList();
    __vbaFreeVarList();
    if ((ushort)(-(ushort)(sVar5 == 0) & ~uVar6) != 0) {
      local_d4 = (float ****)0x64;
      local_dc = (float ****)0x2;
      ppppfStack_194 = DAT_0054b024;
      pfStack_198 = (float *)0x5039e1;
      pfStack_198 = (float *)(*(code *)(*DAT_0054b024)[0x125])();
      ppppfStack_19c = &local_28;
      ppppfStack_1a0 = (float ****)0x5039e8;
      ppppfVar8 = (float ****)__vbaObjSet();
      ppppfStack_1a0 = &local_2c;
      ppppfStack_1a4 = (float ****)0x1;
      ppppfStack_1ac = (float ****)0x5039f6;
      ppppfStack_1a8 = ppppfVar8;
      ppppfStack_1b8 = (float ****)(*(code *)(*ppppfVar8)[0x10])();
      if ((int)ppppfStack_1b8 < 0) {
        ppppfStack_1ac = (float ****)0x40;
        ppppfStack_1b0 = (float ****)&DAT_0041c968;
        ppppfStack_1bc = (float ****)0x503a0b;
        ppppfStack_1b4 = ppppfVar8;
        __vbaHresultCheckObj();
      }
      ppppfStack_1b8 = local_dc;
      ppppfStack_1b4 = local_d8;
      ppppfStack_1b0 = local_d4;
      ppppfStack_1ac = local_d0;
      ppppfStack_1bc = (float ****)0x68030007;
      ppppfStack_1c0 = (float ****)local_2c;
      ppppfStack_1c4 = (float ****)0x503a42;
      __vbaLateIdSt();
      ppppfStack_1c4 = &local_2c;
      ppppfStack_1c8 = &local_28;
      ppppfStack_1cc = (float ****)0x2;
      ppppfStack_1d0 = (float ****)0x503a52;
      __vbaFreeObjList();
    }
  }
  ppppfStack_194 = DAT_0054b024;
  pfStack_198 = (float *)0x503a71;
  pfStack_198 = (float *)(*(code *)(*DAT_0054b024)[0x125])();
  ppppfStack_19c = &local_28;
  ppppfStack_1a0 = (float ****)0x503a78;
  ppppfVar8 = (float ****)(*pcVar18)();
  ppppfStack_1a0 = &local_2c;
  ppppfStack_1a4 = (float ****)0x0;
  ppppfStack_1ac = (float ****)0x503a86;
  ppppfStack_1a8 = ppppfVar8;
  ppppfStack_1b8 = (float ****)(*(code *)(*ppppfVar8)[0x10])();
  if ((int)ppppfStack_1b8 < 0) {
    ppppfStack_1ac = (float ****)0x40;
    ppppfStack_1b0 = (float ****)&DAT_0041c968;
    ppppfStack_1bc = (float ****)0x503a9b;
    ppppfStack_1b4 = ppppfVar8;
    __vbaHresultCheckObj();
  }
  ppppfStack_1ac = (float ****)0x0;
  ppppfStack_1b0 = (float ****)0x68030007;
  ppppfStack_1b4 = (float ****)local_2c;
  ppppfStack_1b8 = local_5c;
  ppppfStack_1bc = (float ****)0x503aac;
  (*pcVar20)();
  ppppfStack_1ac = DAT_0054b024;
  ppppfStack_1b0 = (float ****)0x503abd;
  ppppfStack_1b0 = (float ****)(*(code *)(*DAT_0054b024)[0x125])();
  ppppfStack_1b4 = &local_30;
  ppppfStack_1b8 = (float ****)0x503ac4;
  pppfVar11 = (float ***)(*pcVar18)();
  ppppfStack_1b8 = &local_34;
  ppppfStack_1bc = (float ****)0x1;
  ppppfStack_1c4 = (float ****)0x503ad8;
  ppppfStack_1c0 = (float ****)pppfVar11;
  ppppfStack_1d0 = (float ****)(*(code *)(*pppfVar11)[0x10])();
  if ((int)ppppfStack_1d0 < 0) {
    ppppfStack_1c4 = (float ****)0x40;
    ppppfStack_1c8 = (float ****)&DAT_0041c968;
    ppppfStack_1d4 = (float ****)0x503aed;
    ppppfStack_1cc = (float ****)pppfVar11;
    __vbaHresultCheckObj();
  }
  ppppfStack_1c4 = (float ****)0x0;
  ppppfStack_1c8 = (float ****)0x68030007;
  ppppfStack_1cc = (float ****)local_34;
  ppppfStack_1d0 = local_6c;
  ppppfStack_1d4 = (float ****)0x503afe;
  (*pcVar20)();
  ppppfStack_1c4 = DAT_0054b024;
  ppppfStack_1c8 = (float ****)0x503b0f;
  ppppfStack_1c8 = (float ****)(*(code *)(*DAT_0054b024)[0x125])();
  ppppfStack_1cc = (float ****)&local_38;
  ppppfStack_1d0 = (float ****)0x503b16;
  ppppfVar8 = (float ****)(*pcVar18)();
  ppppfStack_1d0 = (float ****)&local_3c;
  ppppfStack_1d4 = (float ****)0x2;
  ppppfStack_1dc = (float ****)0x503b24;
  ppppfStack_1d8 = ppppfVar8;
  ppppfStack_1e8 = (float ****)(*(code *)(*ppppfVar8)[0x10])();
  if ((int)ppppfStack_1e8 < 0) {
    ppppfStack_1dc = (float ****)0x40;
    ppppfStack_1e0 = (float ****)&DAT_0041c968;
    ppppfStack_1ec = (float ****)0x503b39;
    ppppfStack_1e4 = ppppfVar8;
    __vbaHresultCheckObj();
  }
  ppppfStack_1dc = (float ****)0x0;
  ppppfStack_1e0 = (float ****)0x68030007;
  ppppfStack_1e4 = local_3c;
  ppppfStack_1e8 = local_7c;
  ppppfStack_1ec = (float ****)0x503b4a;
  (*pcVar20)();
  ppppfStack_1dc = DAT_0054b024;
  ppppfStack_1e0 = (float ****)0x503b5b;
  ppppfStack_1e0 = (float ****)(*(code *)(*DAT_0054b024)[0x125])();
  ppppfStack_1e4 = &local_40;
  ppppfStack_1e8 = (float ****)0x503b62;
  piVar10 = (int *)(*pcVar18)();
  ppppfStack_1e8 = &local_44;
  ppppfStack_1ec = (float ****)0x3;
  ppppfStack_1f4 = (float ****)0x503b70;
  ppppfStack_1f0 = (float ****)piVar10;
  ppppfStack_200 = (float ****)(**(code **)(*piVar10 + 0x40))();
  if ((int)ppppfStack_200 < 0) {
    ppppfStack_1f4 = (float ****)0x40;
    ppppfStack_1f8 = (float ****)&DAT_0041c968;
    ppppfStack_204 = (float ****)0x503b85;
    ppppfStack_1fc = (float ****)piVar10;
    __vbaHresultCheckObj();
  }
  ppppfStack_1f4 = (float ****)0x0;
  ppppfStack_1f8 = (float ****)0x68030007;
  ppppfStack_1fc = (float ****)local_44;
  ppppfStack_200 = local_8c;
  ppppfStack_204 = (float ****)0x503b99;
  (*pcVar20)();
  ppppfStack_1f4 = DAT_0054b024;
  ppppfStack_1f8 = (float ****)0x503baa;
  ppppfStack_1f8 = (float ****)(*(code *)(*DAT_0054b024)[0x155])();
  ppppfStack_1fc = &local_48;
  ppppfStack_200 = (float ****)0x503bb1;
  pppfVar12 = (float ***)(*pcVar18)();
  ppppfStack_200 = &local_4c;
  ppppfStack_204 = (float ****)0x0;
  ppppfStack_20c = (float ****)0x503bbf;
  pppfStack_208 = pppfVar12;
  iVar9 = (*(code *)(*pppfVar12)[0x10])();
  uVar6 = 0;
  if (iVar9 < 0) {
    ppppfStack_20c = (float ****)0x40;
    __vbaHresultCheckObj();
  }
  ppppfStack_20c = (float ****)0x0;
  (*pcVar20)();
  pfVar26 = (float *)__vbaI2Var_exref;
  ppppfStack_20c = local_6c;
  sVar5 = __vbaI2Var();
  uVar22 = (undefined2)((uint)pcVar20 >> 0x10);
  sVar7 = __vbaI2Var();
  sVar19 = sVar5 + sVar7;
  pfVar21 = (float *)CONCAT22(uVar22,sVar19);
  if (!SCARRY2(sVar5,sVar7)) {
    ppppfStack_1a8 = local_7c;
    ppppfStack_1ac = (float ****)0x503c0f;
    sVar5 = __vbaI2Var();
    sVar7 = sVar19 + sVar5;
    pfVar21 = (float *)CONCAT22(uVar22,sVar7);
    if (!SCARRY2(sVar19,sVar5)) {
      ppppfStack_1a8 = local_8c;
      ppppfStack_1ac = (float ****)0x503c21;
      sVar5 = __vbaI2Var();
      pfVar21 = (float *)CONCAT22(uVar22,sVar7 + sVar5);
      if (!SCARRY2(sVar7,sVar5)) {
        if (DAT_0054b000 == 0) {
          fVar23 = ((float10)*param_9 - (float10)(float)*param_6) /
                   ((float10)*param_7 - (float10)(float)*param_6);
        }
        else {
          ppppfStack_1a8 = (float ****)param_6;
          ppppfStack_1ac = (float ****)0x503c65;
          fVar23 = (float10)adj_fdiv_r();
        }
        if (DAT_0054b000 == 0) {
          fVar23 = (fVar23 * (float10)*param_8 * (float10)(int)(short)(sVar7 + sVar5)) /
                   (float10)100.0;
        }
        else {
          ppppfStack_1a4 = (float ****)0x42c80000;
          ppppfStack_1ac = (float ****)0x503c8d;
          fVar23 = (float10)adj_fdiv_m32();
        }
        if ((uVar6 & 0xd) == 0) {
          ppppfStack_1a8 = local_9c;
          ppppfStack_1ac = (float ****)0x503ca6;
          sVar5 = __vbaI2Var();
          if (DAT_0054b000 == 0) {
            fVar23 = ((float10)(float)fVar23 * (float10)(int)sVar5) / (float10)100.0;
          }
          else {
            ppppfStack_1a4 = (float ****)0x42c80000;
            ppppfStack_1ac = (float ****)0x503ce3;
            fVar23 = (float10)adj_fdiv_m32();
          }
          *param_5 = (float)fVar23;
          if ((uVar6 & 0xd) == 0) {
            ppppfStack_1a8 = &local_4c;
            ppppfStack_1ac = &local_48;
            ppppfStack_1b0 = &local_44;
            ppppfStack_1b4 = &local_40;
            ppppfStack_1b8 = (float ****)&local_3c;
            ppppfStack_1bc = (float ****)&local_38;
            ppppfStack_1c0 = &local_34;
            ppppfStack_1c4 = &local_30;
            ppppfStack_1c8 = &local_2c;
            ppppfStack_1cc = &local_28;
            ppppfStack_1d0 = (float ****)0xa;
            ppppfStack_1d4 = (float ****)0x503d22;
            __vbaFreeObjList();
            ppppfStack_1d4 = local_9c;
            ppppfStack_1d8 = local_8c;
            ppppfStack_1dc = local_7c;
            ppppfStack_1e0 = local_6c;
            ppppfStack_1e4 = local_5c;
            ppppfStack_1e8 = (float ****)0x5;
            ppppfStack_1ec = (float ****)0x503d44;
            __vbaFreeVarList();
            ppppfStack_1a8 = (float ****)0x503d4d;
            ppppfStack_1a8 = (float ****)Ordinal_685();
            ppppfStack_1ac = &local_28;
            ppppfStack_1b0 = (float ****)0x503d58;
            ppppfVar8 = (float ****)__vbaObjSet();
            ppppfStack_1b0 = (float ****)&local_134;
            ppppfStack_1b8 = (float ****)0x503d67;
            ppppfStack_1b4 = ppppfVar8;
            ppppfVar13 = (float ****)(*(code *)(*ppppfVar8)[7])();
            if ((int)ppppfVar13 < 0) {
              ppppfStack_1b8 = (float ****)0x1c;
              ppppfStack_1bc = (float ****)&DAT_0041b0d0;
              ppppfStack_1c8 = (float ****)0x503d7c;
              ppppfStack_1c4 = ppppfVar13;
              ppppfStack_1c0 = ppppfVar8;
              __vbaHresultCheckObj();
            }
            bVar3 = 0 < (int)local_134;
            ppppfStack_1b8 = (float ****)0x503d9c;
            __vbaFreeObj();
            if (bVar3) {
              ppppfStack_1b8 = (float ****)0x503db5;
              __vbaStrCopy();
              if (DAT_0054b010 == (float ****)0x0) {
                ppppfStack_1b8 = (float ****)&DAT_0054b010;
                ppppfStack_1bc = (float ****)&DAT_00407e8c;
                ppppfStack_1c0 = (float ****)0x503dce;
                __vbaNew2();
              }
              ppppfVar8 = DAT_0054b010;
              local_e4 = DAT_0054b024;
              local_ec = 9;
              local_d4 = (float ****)0x1;
              local_dc = (float ****)0x3;
              ppppfStack_1c4 = (float ****)0x9;
              ppppfStack_1c0 = local_e8;
              ppppfStack_1bc = DAT_0054b024;
              ppppfStack_1b8 = (float ****)local_e0;
              ppppfStack_1d4 = (float ****)0x3;
              ppppfStack_1d0 = local_d8;
              ppppfStack_1cc = (float ****)0x1;
              ppppfStack_1c8 = local_d0;
              ppppfStack_1d8 = DAT_0054b010;
              ppppfStack_1dc = (float ****)0x503e46;
              iVar9 = (*(code *)(*DAT_0054b010)[0xac])();
              if (iVar9 < 0) {
                ppppfStack_1dc = (float ****)0x2b0;
                ppppfStack_1e0 = (float ****)&DAT_0041aed8;
                ppppfStack_1e4 = ppppfVar8;
                ppppfStack_1ec = (float ****)0x503e5e;
                ppppfStack_1e8 = (float ****)iVar9;
                __vbaHresultCheckObj();
              }
              local_130 = (float ***)0x0;
              ppppfStack_1dc = &local_130;
              ppppfStack_1e0 = DAT_0054b024;
              ppppfStack_1e4 = (float ****)0x503e7d;
              ppppfVar8 = (float ****)(*(code *)(*DAT_0054b024)[0x1bf])();
              if ((int)ppppfVar8 < 0) {
                ppppfStack_1b8 = (float ****)0x6fc;
                ppppfStack_1bc = (float ****)&LAB_0041e434;
                ppppfStack_1c0 = DAT_0054b024;
                ppppfStack_1c8 = (float ****)0x503e9b;
                ppppfStack_1c4 = ppppfVar8;
                __vbaHresultCheckObj();
              }
            }
            ppppfStack_1b8 = (float ****)0x0;
            ppppfStack_1bc = (float ****)0x503ea3;
            __vbaOnError();
            ppppfStack_1bc = (float ****)0x503ea9;
            __vbaExitProc();
            return;
          }
        }
LAB_00503f39:
        __vbaFPException();
        return;
      }
    }
  }
  ppppfStack_1a8 = (float ****)0x503f44;
  __vbaErrorOverflow();
  ppppfStack_1c4 = (float ****)&LAB_00404716;
  ppppfStack_1c8 = ExceptionList;
  ppppfStack_1c0 = (float ****)&stack0xfffffd80;
  ppppfStack_1bc = (float ****)&DAT_004032d0;
  ppppfStack_1b8 = (float ****)0x0;
  ppppfStack_1b4 = (float ****)0x0;
  ppppfStack_1d0 = (float ****)0x0;
  ppppfStack_1e4 = (float ****)0x0;
  ppppfStack_1f4 = (float ****)0x0;
  ppppfStack_204 = (float ****)0x0;
  pppfStack_208 = (float ***)0x0;
  ppppfStack_20c = (float ****)0x0;
  ppppfStack_1ac = (float ****)0x2;
  uStack_28c = (double)CONCAT44(0x503fac,(undefined4)uStack_28c);
  ExceptionList = &ppppfStack_1c8;
  ppppfStack_1a8 = (float ****)&stack0xfffffffc;
  __vbaOnError();
  ppppfVar8 = ppppfStack_1a0;
  ppppfStack_1ac = (float ****)0x3;
  *ppppfStack_1a0 = (float ***)((*pfStack_198 - (float)*ppppfStack_194) * (float)*ppppfStack_19c);
  if ((uVar6 & 0xd) == 0) {
    ppppfStack_1ac = (float ****)0x4;
    uStack_28c = 2.0;
    if ((uVar6 & 0xd) == 0) {
      uStack_294 = (double)(*unaff_EDI - *unaff_ESI);
      pppppfStack_298 = (float *****)0x503ffe;
      fVar23 = (float10)__vbaPowerR8();
      if ((uVar6 & 0xd) == 0) {
        if (((uVar6 & 0xd) == 0) &&
           (*pfStack_168 = (float)(((float10)*unaff_EDI - (float10)*unaff_ESI) *
                                   (float10)*pfStack_190 *
                                  (((float10)*unaff_EDI - (float10)*unaff_ESI) * (float10)0.006 +
                                   (float10)1.0 + fVar23 * (float10)1e-05)), (uVar6 & 0xd) == 0)) {
          ppppfStack_1ac = (float ****)0x5;
          pfVar4 = (float *)ABS(*local_134);
          if ((uVar6 & 0xd) == 0) {
            uStack_28c = (double)CONCAT44(0x50406e,(undefined4)uStack_28c);
            fVar23 = (float10)__vbaFpR4();
            pfVar1 = (float *)(float)fVar23;
            uStack_28c = (double)CONCAT44(0x504080,(undefined4)uStack_28c);
            fVar23 = (float10)__vbaFpR4();
            uVar6 = 0;
            if ((*local_124 != L'\0' || fVar23 <= (float10)(float)pfVar1) ||
                *(short *)pppfVar11 != 0) {
              ppppfStack_1ac = (float ****)0x8;
              if (DAT_0054b000 == 0) {
                fVar23 = (float10)(float)*local_130 / (float10)100.0;
              }
              else {
                uStack_28c = (double)CONCAT44(uStack_28c._4_4_,0x504178);
                fVar23 = (float10)adj_fdiv_m32();
              }
              *local_12c = (float **)(float)fVar23;
              if ((uVar6 & 0xd) != 0) goto LAB_0050487d;
              *pfStack_128 = *pfStack_158;
            }
            else {
              ppppfStack_1ac = (float ****)0x6;
              if (DAT_0054b000 == 0) {
                fVar23 = (float10)*local_178 / (float10)100.0;
              }
              else {
                uStack_28c = 52776558174337.805;
                fVar23 = (float10)adj_fdiv_m32();
              }
              ppppfStack_20c = (float ****)(float)fVar23;
              if ((uVar6 & 0xd) != 0) goto LAB_0050487d;
              uStack_28c = (double)CONCAT44(local_174,&ppppfStack_1d0);
              uStack_294 = (double)CONCAT44(unaff_EDI,unaff_EBX);
              pppppfStack_298 = &ppppfStack_20c;
              ppppfStack_29c = local_17c;
              pppppfStack_2a4 = (float *****)0x504112;
              FUN_005004d0(pfStack_138,(float *)local_17c,(float *)pppppfStack_298,unaff_EBX,
                           unaff_EDI,(float *)&ppppfStack_1d0,local_174);
              ppppfStack_1ac = (float ****)0x7;
              if (DAT_0054b000 == 0) {
                fVar23 = ((float10)(float)ppppfStack_1d0 * (float10)*pfStack_164) / (float10)60.0;
              }
              else {
                ppppfStack_2a8 = (float ****)0x50413d;
                fVar23 = (float10)adj_fdiv_m32();
              }
              *pfStack_16c = (float)(fVar23 + (float10)*pfStack_16c);
              if ((uVar6 & 0xd) != 0) goto LAB_0050487d;
            }
            ppppfStack_1ac = (float ****)0xa;
            *local_170 = *pfStack_168 + (float)*ppppfVar8 + *pfStack_16c + *local_134;
            if ((uVar6 & 0xd) == 0) {
              ppppfStack_1ac = (float ****)0xb;
              uStack_28c = (double)CONCAT44(0x5041d2,(undefined4)uStack_28c);
              fVar23 = (float10)__vbaFpR4();
              fVar2 = *local_170;
              pfVar17 = (float *)(int)*(short *)pppfVar11;
              iStack_250 = SUB84((double)(int)pfVar17,0);
              if ((iStack_250 == 0) &&
                 (iStack_24c = (int)((ulonglong)(double)(int)pfVar17 >> 0x20),
                 iStack_24c == 0x3ff00000)) {
                bVar3 = false;
              }
              else {
                bVar3 = true;
              }
              uStack_28c = (double)CONCAT44(0x504236,(undefined4)uStack_28c);
              fVar24 = (float10)__vbaFpR4();
              uVar6 = 0;
              if (((float10)fVar2 <= fVar23 || bVar3) || (float10)*pfStack_158 <= fVar24) {
                uVar6 = 0;
                if (*(short *)pppfVar11 == 2 && *local_170 < -5.0) {
                  *(short *)pppfVar11 = 1;
                }
              }
              else {
                ppppfStack_1ac = (float ****)0xc;
                ppppfStack_1ec = (float ****)0x0;
                ppppfStack_1f4 = (float ****)0xb;
                uStack_294 = (double)CONCAT44(ppppfStack_1f0,0xb);
                uStack_28c = (double)(ZEXT48(ppppfStack_1e8) << 0x20);
                pppppfStack_298 = (float *****)0x68030005;
                ppppfStack_29c = DAT_0054b024;
                ppppfStack_2a0 = (float ****)0x504294;
                ppppfStack_2a0 = (float ****)(*(code *)(*DAT_0054b024)[0x151])();
                pppppfStack_2a4 = &ppppfStack_1e4;
                ppppfStack_2a8 = (float ****)0x50429f;
                ppppfStack_2a8 = (float ****)__vbaObjSet();
                uStack_2ac = 0x5042a6;
                __vbaLateIdSt();
                uStack_2ac = 0x5042af;
                __vbaFreeObj();
                *(short *)pppfVar11 = 2;
                *puStack_160 = 0x47c34f80;
              }
              ppppfStack_1ac = (float ****)0x11;
              if (DAT_0054b000 == 0) {
                fVar23 = ((float10)*pfStack_16c - (float10)_DAT_0054bbc8) / (float10)*pfStack_15c;
              }
              else {
                uStack_28c = (double)CONCAT44(uStack_28c._4_4_,0x504336);
                fVar23 = (float10)adj_fdiv_m32();
              }
              if ((uVar6 & 0xd) == 0) {
                fVar2 = (float)(fVar23 * (float10)100.0 + (float10)*local_180);
                *local_180 = fVar2;
                uVar6 = 0;
                if (fVar2 < 0.0) {
                  *local_180 = 0.0;
                }
                ppppfStack_1ac = (float ****)0x14;
                uStack_28c = (double)CONCAT44(uStack_28c._4_4_,0x50438d);
                FUN_004f8120(local_180);
                _DAT_0054bbc8 = *pfStack_16c;
                ppppfStack_1cc = (float ****)0x1;
                _DAT_0054bbb8 = *pfStack_144;
                ppppfVar8 = ppppfStack_1cc;
                if (*(short *)pppfVar11 == 1) {
LAB_005046ff:
                  ppppfStack_1ac = (float ****)0x23;
                  uStack_28c = (double)CONCAT44(0x50470c,(undefined4)uStack_28c);
                  uVar15 = Ordinal_685();
                  uStack_28c = (double)CONCAT44(uVar15,&ppppfStack_1e4);
                  uStack_294 = (double)CONCAT44(0x504717,(undefined4)uStack_294);
                  ppppfVar8 = (float ****)__vbaObjSet();
                  uStack_294 = (double)CONCAT44(&ppppfStack_20c,ppppfVar8);
                  pppppfStack_298 = (float *****)0x504723;
                  pppppfVar14 = (float *****)(*(code *)(*ppppfVar8)[7])();
                  if ((int)pppppfVar14 < 0) {
                    pppppfStack_298 = (float *****)0x1c;
                    ppppfStack_29c = (float ****)&DAT_0041b0d0;
                    ppppfStack_2a8 = (float ****)0x504738;
                    pppppfStack_2a4 = pppppfVar14;
                    ppppfStack_2a0 = ppppfVar8;
                    __vbaHresultCheckObj();
                  }
                  bVar3 = 0 < (int)ppppfStack_20c;
                  pppppfStack_298 = (float *****)0x50474f;
                  __vbaFreeObj();
                  if (bVar3) {
                    ppppfStack_1ac = (float ****)0x24;
                    pppppfStack_298 = (float *****)0x50476f;
                    __vbaStrCopy();
                    ppppfStack_1ac = (float ****)0x25;
                    if (DAT_0054b010 == (float ****)0x0) {
                      pppppfStack_298 = &DAT_0054b010;
                      ppppfStack_29c = (float ****)&DAT_00407e8c;
                      ppppfStack_2a0 = (float ****)0x50478f;
                      __vbaNew2();
                    }
                    ppppfVar8 = DAT_0054b010;
                    ppppfStack_1fc = DAT_0054b024;
                    ppppfStack_204 = (float ****)0x9;
                    ppppfStack_1ec = (float ****)0x1;
                    ppppfStack_1f4 = (float ****)0x3;
                    pppppfStack_2a4 = (float *****)0x9;
                    ppppfStack_2a0 = ppppfStack_200;
                    ppppfStack_29c = DAT_0054b024;
                    pppppfStack_298 = (float *****)ppppfStack_1f8;
                    uStack_2b4 = 3;
                    piStack_2b0 = (int *)ppppfStack_1f0;
                    uStack_2ac = 1;
                    ppppfStack_2a8 = ppppfStack_1e8;
                    ppppfStack_2b8 = DAT_0054b010;
                    ppppfStack_2bc = (float ****)0x5047ec;
                    iVar9 = (*(code *)(*DAT_0054b010)[0xac])();
                    if (iVar9 < 0) {
                      ppppfStack_2bc = (float ****)0x2b0;
                      ppppfStack_2c0 = (float ****)&DAT_0041aed8;
                      ppppfStack_2c4 = ppppfVar8;
                      aiStack_2d0[1] = 0x504804;
                      aiStack_2d0[2] = iVar9;
                      __vbaHresultCheckObj();
                    }
                    ppppfStack_1ac = (float ****)0x26;
                    pppfStack_208 = (float ***)0x0;
                    ppppfStack_2bc = &pppfStack_208;
                    ppppfStack_2c0 = DAT_0054b024;
                    ppppfStack_2c4 = (float ****)0x504824;
                    pppppfVar14 = (float *****)(*(code *)(*DAT_0054b024)[0x1bf])();
                    if ((int)pppppfVar14 < 0) {
                      pppppfStack_298 = (float *****)0x6fc;
                      ppppfStack_29c = (float ****)&LAB_0041e434;
                      ppppfStack_2a0 = DAT_0054b024;
                      ppppfStack_2a8 = (float ****)0x504842;
                      pppppfStack_2a4 = pppppfVar14;
                      __vbaHresultCheckObj();
                    }
                  }
                  ppppfStack_1ac = (float ****)0x27;
                  pppppfStack_298 = (float *****)0x0;
                  ppppfStack_29c = (float ****)0x504851;
                  __vbaOnError();
                  ppppfStack_29c = (float ****)0x504857;
                  __vbaExitProc();
                  return;
                }
                while( true ) {
                  ppppfStack_1cc = ppppfVar8;
                  ppppfStack_1ac = (float ****)0x19;
                  pfVar16 = (float *)(int)(short)ppppfStack_1cc;
                  if (DAT_0054b000 == 0) {
                    fVar23 = (float10)(int)pfVar16 / (float10)1000.0;
                  }
                  else {
                    uStack_28c = 1000.0;
                    uStack_294 = (double)CONCAT44(0x50441d,(undefined4)uStack_294);
                    fVar23 = (float10)adj_fdiv_m64();
                  }
                  ppppfStack_1d4 = (float ****)(float)(fVar23 + (float10)*pfStack_158);
                  if ((uVar6 & 0xd) != 0) goto LAB_0050487d;
                  ppppfStack_1ac = (float ****)0x1a;
                  if (DAT_0054b000 == 0) {
                    fVar23 = (((float10)*local_170 - (float10)1.0) * (float10)*pfStack_150) /
                             (float10)1000.0;
                  }
                  else {
                    uStack_28c = (double)CONCAT44(uStack_28c._4_4_,0x50445f);
                    fVar23 = (float10)adj_fdiv_m32();
                  }
                  ppppfStack_1d8 =
                       (float ****)(float)((fVar23 + (float10)1.0) * (float10)*pfStack_14c);
                  if ((uVar6 & 0xd) != 0) goto LAB_0050487d;
                  ppppfStack_1ac = (float ****)0x1b;
                  if ((uVar6 & 0xd) != 0) goto LAB_0050487d;
                  uStack_28c = (double)(-*pfStack_154 * (float)ppppfStack_1d4);
                  uStack_294 = (double)CONCAT44(0x504498,(undefined4)uStack_294);
                  fVar23 = (float10)Ordinal_586();
                  if (DAT_0054b000 == 0) {
                    fVar23 = ((float10)*pfStack_150 * (float10)(double)fVar23) / (float10)1000.0;
                  }
                  else {
                    uStack_28c = (double)CONCAT44(0x408f4000,(undefined4)uStack_28c);
                    uStack_294 = (double)CONCAT44(0x5044c2,(undefined4)uStack_294);
                    fVar23 = (float10)adj_fdiv_m64();
                  }
                  ppppfStack_1dc = (float ****)(float)fVar23;
                  if ((uVar6 & 0xd) != 0) goto LAB_0050487d;
                  ppppfStack_1ac = (float ****)0x1c;
                  if (DAT_0054b000 == 0) {
                    fVar23 = -(float10)*pfStack_154 / (float10)1000.0;
                  }
                  else {
                    uStack_28c = (double)CONCAT44(uStack_28c._4_4_,0x5044f6);
                    fVar23 = (float10)adj_fdiv_m32();
                  }
                  if ((uVar6 & 0xd) != 0) goto LAB_0050487d;
                  uStack_28c = (double)fVar23;
                  uStack_294 = (double)CONCAT44(0x50450c,(undefined4)uStack_294);
                  fVar23 = (float10)Ordinal_586();
                  if (DAT_0054b000 == 0) {
                    fVar24 = (float10)*pfStack_14c / (float10)1000.0;
                  }
                  else {
                    uStack_28c = (double)CONCAT44(uStack_28c._4_4_,0x50452d);
                    fVar24 = (float10)adj_fdiv_m32();
                  }
                  if (((uVar6 & 0xd) != 0) || ((uVar6 & 0xd) != 0)) goto LAB_0050487d;
                  fVar2 = (float)((float10)*pfStack_144 * (float10)(double)fVar23 + fVar24);
                  *pfStack_144 = fVar2;
                  ppppfStack_1ac = (float ****)0x1d;
                  if (DAT_0054b000 == 0) {
                    fVar23 = ((float10)fVar2 * (float10)*pfStack_150) / (float10)1000.0;
                  }
                  else {
                    uStack_28c = (double)CONCAT44(uStack_28c._4_4_,0x504584);
                    fVar23 = (float10)adj_fdiv_m32();
                  }
                  ppppfStack_1e0 = (float ****)(float)(fVar23 * (float10)*pfStack_154);
                  if ((uVar6 & 0xd) != 0) goto LAB_0050487d;
                  *pfStack_148 = *pfStack_14c;
                  ppppfStack_1ac = (float ****)0x1f;
                  fVar2 = (float)ppppfStack_1dc + (float)ppppfStack_1d8 + (float)ppppfStack_1e0;
                  if ((uVar6 & 0xd) != 0) goto LAB_0050487d;
                  *pfStack_14c = fVar2;
                  ppppfStack_1ac = (float ****)0x20;
                  if (((uVar6 & 0xd) != 0) ||
                     (pfVar29 = (float *)ABS(fVar2 - *pfStack_148), (uVar6 & 0xd) != 0))
                  goto LAB_0050487d;
                  uStack_28c = (double)CONCAT44(0x504600,(undefined4)uStack_28c);
                  fVar23 = (float10)__vbaFpR4();
                  pfVar28 = (float *)(float)fVar23;
                  uStack_28c = (double)CONCAT44(0x504612,(undefined4)uStack_28c);
                  fVar23 = (float10)__vbaFpR4();
                  uVar6 = 0;
                  pfVar27 = (float *)(uint)((float10)(float)pfVar28 <= fVar23);
                  sVar5 = (short)ppppfStack_1cc;
                  if (*psStack_13c <= sVar5 || pfVar27 != (float *)0x0) break;
                  ppppfStack_1ac = (float ****)0x21;
                  ppppfVar8 = (float ****)CONCAT22((short)((uint)ppppfStack_1cc >> 0x10),sVar5 + 1);
                  if (SCARRY2(sVar5,1)) {
                    uStack_28c = (double)CONCAT44(0x504888,(undefined4)uStack_28c);
                    __vbaErrorOverflow();
                    uStack_28c = (double)CONCAT44(&ppppfStack_1a8,(undefined4)uStack_28c);
                    ppppfStack_2a0 = (float ****)&LAB_00404716;
                    pppppfStack_2a4 = ExceptionList;
                    ppppfStack_29c = (float ****)auStack_2f8;
                    pppppfStack_298 = (float *****)&DAT_00403360;
                    uStack_294 = 0.0;
                    ppppfStack_2a8 = (float ****)0x0;
                    ppppfStack_2b8 = (float ****)0x0;
                    aiStack_2d0[2] = 0;
                    aiStack_2d0[1] = 0;
                    aiStack_2d0[0] = 0;
                    ExceptionList = &pppppfStack_2a4;
                    __vbaOnError(1);
                    _DAT_0054b2f4 = 0x3d6978d5;
                    if (DAT_0054b000 == 0) {
                      fVar23 = (((float10)(float)*pppfVar12 - (float10)*pfVar27) * (float10)*pfVar26
                               ) / (float10)100.0;
                    }
                    else {
                      fVar23 = (float10)adj_fdiv_m32(0x42c80000);
                    }
                    if (DAT_0054b000 == 0) {
                      fVar23 = (fVar23 * (float10)DAT_0054b330) / (float10)*pfVar28;
                    }
                    else {
                      fVar23 = (float10)adj_fdiv_m32(*pfVar28);
                    }
                    if (DAT_0054b000 == 0) {
                      fVar23 = fVar23 / (float10)0.057;
                    }
                    else {
                      fVar23 = (float10)adj_fdiv_m32(0x3d6978d5);
                    }
                    *pfVar21 = (float)(fVar23 * (float10)*pfVar29 + (float10)*pfVar21);
                    if ((uVar6 & 0xd) != 0) {
                      __vbaFPException();
                      return;
                    }
                    pfStack_25c = (float *)((ulonglong)(double)(int)pfVar16 >> 0x20);
                    if (4040.0 < *pfStack_25c) {
                      *pfStack_25c = 4040.0;
                    }
                    if (4040.0 < *pfVar17) {
                      *pfVar17 = 4040.0;
                    }
                    if (4040.0 < *pfVar16) {
                      *pfVar16 = 4040.0;
                    }
                    if (1200.0 <= *pfVar17) {
                      if (100.0 < (float)*ppppfStack_23c) {
                        if (1200.0 < (float)*ppppfStack_23c) {
                          fVar23 = (float10)FUN_005050d0(pfVar17);
                          *pfVar1 = (float)fVar23;
                        }
                        else {
                          fVar23 = (float10)FUN_00504e20(pfVar17);
                          *pfVar1 = (float)fVar23;
                        }
                      }
                      else {
                        fVar23 = (float10)FUN_00504b80(pfVar17);
                        *pfVar1 = (float)fVar23;
                      }
                    }
                    if (*pfVar1 < *pfVar4) {
                      *pfVar1 = *pfVar4;
                    }
                    *pfVar4 = *pfVar1;
                    uVar15 = Ordinal_685();
                    piVar10 = (int *)__vbaObjSet(&ppppfStack_2a8,uVar15);
                    iVar9 = (**(code **)(*piVar10 + 0x1c))(piVar10,aiStack_2d0);
                    if (iVar9 < 0) {
                      __vbaHresultCheckObj(iVar9,piVar10,&DAT_0041b0d0,0x1c);
                    }
                    bVar3 = 0 < aiStack_2d0[0];
                    __vbaFreeObj();
                    if (bVar3) {
                      __vbaStrCopy();
                      if (DAT_0054b010 == (float ****)0x0) {
                        __vbaNew2(&DAT_00407e8c,&DAT_0054b010);
                      }
                      ppppfVar8 = DAT_0054b010;
                      ppppfStack_2c0 = DAT_0054b024;
                      aiStack_2d0[2] = 9;
                      piStack_2b0 = (int *)0x1;
                      ppppfStack_2b8 = (float ****)0x3;
                      iVar9 = (*(code *)(*DAT_0054b010)[0xac])
                                        (DAT_0054b010,3,uStack_2b4,1,uStack_2ac,9,ppppfStack_2c4,
                                         DAT_0054b024,ppppfStack_2bc);
                      if (iVar9 < 0) {
                        __vbaHresultCheckObj(iVar9,ppppfVar8,&DAT_0041aed8,0x2b0);
                      }
                      aiStack_2d0[1] = 0;
                      iVar9 = (*(code *)(*DAT_0054b024)[0x1bf])(DAT_0054b024,aiStack_2d0 + 1);
                      if (iVar9 < 0) {
                        __vbaHresultCheckObj(iVar9,DAT_0054b024,&LAB_0041e434,0x6fc);
                      }
                    }
                    __vbaOnError(0);
                    __vbaExitProc();
                    return;
                  }
                }
                ppppfStack_1ac = (float ****)0x22;
                uStack_28c = (double)(-*pfStack_154 *
                                     ((*pfStack_158 + *local_174) - (float)ppppfStack_1d4));
                uStack_294 = (double)CONCAT44(0x504692,(undefined4)uStack_294);
                fVar23 = (float10)Ordinal_586();
                if ((uVar6 & 0xd) == 0) {
                  uStack_28c = (double)(-*pfStack_154 *
                                       ((*pfStack_158 + *local_174) - (float)ppppfStack_1d4));
                  uStack_294 = (double)CONCAT44(0x5046bb,(undefined4)uStack_294);
                  fVar24 = (float10)Ordinal_586();
                  if (DAT_0054b000 == 0) {
                    fVar25 = (float10)*pfStack_14c / (float10)*pfStack_154;
                  }
                  else {
                    uStack_28c = (double)CONCAT44(uStack_28c._4_4_,0x5046d4);
                    fVar25 = (float10)adj_fdiv_m32();
                  }
                  if (((uVar6 & 0xd) == 0) &&
                     (*pfStack_144 = (float)((float10)*pfStack_144 * (float10)(double)fVar23 +
                                            ((float10)1.0 - (float10)(double)fVar24) * fVar25),
                     (uVar6 & 0xd) == 0)) goto LAB_005046ff;
                }
              }
            }
          }
        }
      }
    }
  }
LAB_0050487d:
  __vbaFPException();
  return;
}

