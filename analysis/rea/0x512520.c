
/* WARNING: Removing unreachable block (ram,0x00512925) */
/* WARNING: Removing unreachable block (ram,0x005127b8) */
/* WARNING: Removing unreachable block (ram,0x00512aea) */

void __cdecl
FUN_00512520(float *param_1,float *param_2,float **param_3,float *param_4,float *param_5,
            float *param_6,float *param_7,float *param_8,float *param_9,float *param_10,
            float *param_11,float **param_12,float **param_13,float *param_14,float *param_15,
            float *param_16,float *param_17,float *param_18)

{
  float fVar1;
  bool bVar2;
  short sVar3;
  float *pfVar4;
  float **ppfVar5;
  int iVar6;
  float *pfVar7;
  int *piVar8;
  undefined4 uVar9;
  short sVar10;
  float *extraout_ECX;
  float *extraout_ECX_00;
  float *extraout_ECX_01;
  float *extraout_ECX_02;
  float *extraout_ECX_03;
  float *extraout_EDX;
  float **ppfVar11;
  float **ppfVar12;
  uint uVar13;
  ushort uVar14;
  float10 fVar15;
  float10 extraout_ST0;
  float10 fVar16;
  float10 extraout_ST0_00;
  float10 extraout_ST0_01;
  float10 extraout_ST0_02;
  undefined8 uVar17;
  float **ppfStack_188;
  float **ppfStack_184;
  float **ppfStack_180;
  float *pfStack_17c;
  float **ppfStack_178;
  float *pfStack_174;
  undefined4 *puStack_170;
  float **ppfStack_16c;
  float **ppfStack_168;
  float **ppfStack_164;
  float *pfStack_160;
  float *pfStack_15c;
  float **ppfStack_158;
  float fStack_154;
  int *piStack_150;
  undefined *puStack_14c;
  undefined4 uStack_148;
  undefined1 *puStack_144;
  undefined *puStack_140;
  undefined4 uStack_13c;
  undefined1 *local_100;
  undefined1 *local_fc;
  undefined4 local_f8;
  undefined4 local_f4 [2];
  wchar_t *local_ec;
  undefined4 local_e4;
  undefined4 local_e0;
  wchar_t *local_dc;
  undefined4 local_d8;
  float *local_d4;
  float *local_d0;
  float *local_cc;
  undefined4 *local_c8;
  float local_c4 [4];
  float *local_b4 [4];
  float local_a4 [4];
  float *local_94;
  float local_90;
  float local_8c;
  float *local_88;
  float local_84;
  float local_80;
  float local_7c;
  undefined1 local_74 [12];
  undefined4 *local_68;
  undefined1 local_50 [12];
  undefined4 *local_44;
  float local_30;
  float local_2c;
  float local_28;
  float local_24;
  void *pvStack_20;
  undefined1 *puStack_1c;
  undefined1 *local_18;
  undefined *local_14;
  undefined4 local_10;
  undefined4 local_c;
  
  puStack_1c = &LAB_00404716;
  pvStack_20 = ExceptionList;
  local_18 = &stack0xfffffec8;
  local_14 = &DAT_004035e0;
  ppfVar11 = (float **)0x0;
  local_10 = 0;
  local_c = 0;
  local_8c = 0.0;
  local_90 = 0.0;
  local_94 = (float *)0x0;
  local_a4[0] = 0.0;
  local_b4[0] = (float *)0x0;
  local_c4[0] = 0.0;
  local_d4 = (float *)0x0;
  local_e4 = 0;
  local_f4[0] = 0;
  local_f8 = 0;
  local_fc = (undefined1 *)0x0;
  local_100 = (undefined1 *)0x0;
  uStack_13c = 4;
  puStack_140 = &DAT_004244fc;
  puStack_144 = local_50;
  uStack_148 = 0x5125af;
  ExceptionList = &pvStack_20;
  __vbaAryConstruct2();
  uStack_148 = 4;
  puStack_14c = &DAT_004244fc;
  piStack_150 = (int *)local_74;
  fStack_154 = 7.452212e-39;
  __vbaAryConstruct2();
  fStack_154 = 1.4013e-45;
  ppfStack_158 = (float **)0x5125c4;
  __vbaOnError();
  *local_44 = 0x40800000;
  local_44[1] = 0x42f00000;
  local_44[2] = 0xc1200000;
  local_44[3] = 0x42c80000;
  *local_68 = 0x40800000;
  local_68[1] = 0xc1200000;
  local_68[2] = 0x42f00000;
  local_68[3] = 0x42c80000;
  if (*param_2 < *param_11) {
    local_84 = *param_2;
    local_88 = (float *)*param_18;
  }
  else {
    local_84 = *param_11;
    local_88 = (float *)0x40000000;
  }
  uVar14 = 0;
  if (1.0 <= *param_14) {
    *param_14 = 0.9999;
  }
  if (DAT_0054b000 == 0) {
    fVar15 = (float10)*param_9 / (float10)*param_8;
    pfVar7 = param_14;
  }
  else {
    ppfStack_158 = (float **)*param_8;
    pfStack_15c = (float *)0x51266f;
    fVar15 = (float10)adj_fdiv_m32();
    pfVar7 = extraout_ECX;
  }
  if (DAT_0054b000 == 0) {
    fVar15 = fVar15 / (float10)*param_6;
  }
  else {
    ppfStack_158 = (float **)*param_6;
    pfStack_15c = (float *)0x512686;
    fVar15 = (float10)adj_fdiv_m32();
    pfVar7 = extraout_ECX_00;
  }
  if (DAT_0054b000 == 0) {
    fVar15 = (fVar15 * (float10)100.0 * (float10)*param_5) / (float10)*param_4;
    pfVar4 = param_5;
  }
  else {
    ppfStack_158 = (float **)*param_4;
    pfStack_15c = (float *)0x5126a8;
    pfVar4 = (float *)adj_fdiv_m32();
    pfVar7 = extraout_ECX_01;
    fVar15 = extraout_ST0;
  }
  if (DAT_0054b000 == 0) {
    fVar15 = fVar15 / ((float10)1.0 - (float10)*pfVar7);
  }
  else {
    pfStack_15c = (float *)0x5126c5;
    ppfStack_158 = (float **)pfVar4;
    fVar15 = (float10)adj_fdiv_r();
  }
  local_2c = (float)fVar15;
  if ((uVar14 & 0xd) != 0) goto LAB_00513877;
  bVar2 = local_84 <= *param_1;
  ppfVar12 = (float **)(uint)bVar2;
  ppfStack_158 = (float **)DAT_0054b024;
  pfStack_15c = (float *)0x5126f9;
  pfStack_15c = (float *)(**(code **)(*(int *)DAT_0054b024 + 0x48c))();
  pfStack_160 = &local_90;
  ppfStack_164 = (float **)0x512707;
  ppfVar5 = (float **)__vbaObjSet();
  ppfStack_164 = &local_94;
  ppfStack_168 = (float **)0x0;
  puStack_170 = (undefined4 *)0x512717;
  ppfStack_16c = ppfVar5;
  pfStack_17c = (float *)(*(code *)(*ppfVar5)[0x10])();
  uVar14 = 0;
  if ((int)pfStack_17c < 0) {
    puStack_170 = (undefined4 *)0x40;
    pfStack_174 = (float *)&DAT_0041c968;
    ppfStack_180 = (float **)0x51272c;
    ppfStack_178 = ppfVar5;
    __vbaHresultCheckObj();
  }
  puStack_170 = (undefined4 *)0x0;
  pfStack_174 = (float *)0x68030005;
  ppfStack_178 = (float **)local_94;
  pfStack_17c = local_a4;
  ppfStack_180 = (float **)0x512746;
  puStack_170 = (undefined4 *)__vbaLateIdCallLd();
  pfStack_174 = (float *)0x512750;
  sVar3 = __vbaI2Var();
  sVar10 = (short)(*(short *)param_12 * 100);
  ppfVar5 = param_12;
  if ((int)sVar10 != *(short *)param_12 * 100) goto LAB_0051387c;
  ppfVar12 = (float **)-(uint)(sVar10 != sVar3 && bVar2);
  ppfStack_158 = &local_94;
  pfStack_15c = &local_90;
  pfStack_160 = (float *)0x2;
  ppfStack_164 = (float **)0x512784;
  __vbaFreeObjList();
  ppfStack_158 = (float **)0x512793;
  __vbaFreeVar();
  if ((short)ppfVar12 == 0) {
    uVar14 = 0;
    if (*(short *)param_12 == 1 && local_84 <= *param_1) {
      *param_2 = *param_1;
      *(undefined2 *)param_12 = 0;
      ppfVar11 = (float **)0x0;
      uVar14 = 0;
      if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
      ppfVar12 = (float **)((short)(*(short *)param_13 + 1) + -1);
      if ((float **)0x1 < ppfVar12) {
        ppfStack_158 = (float **)0x512b0f;
        __vbaGenerateBoundsError();
      }
      *param_15 = (float)local_44[(int)ppfVar12 * 2];
      if (SCARRY2(*(short *)param_12,1)) goto LAB_0051387c;
      ppfVar12 = (float **)((short)(*(short *)param_12 + 1) + -1);
      if ((float **)0x1 < ppfVar12) {
        ppfStack_158 = (float **)0x512b39;
        __vbaGenerateBoundsError();
      }
      if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
      uVar13 = (int)(short)(*(short *)param_13 + 1) - 1;
      if (1 < uVar13) {
        ppfStack_158 = (float **)0x512b58;
        __vbaGenerateBoundsError();
      }
      *param_16 = (float)local_68[(int)ppfVar12 + uVar13 * 2];
      if ((DAT_0054b086 != 0) && (DAT_0054b08c != 0)) {
        local_dc = L"000000.0";
        local_e4 = 8;
        ppfStack_158 = (float **)0x512ba9;
        __vbaVarDup();
        local_cc = param_1;
        local_d4 = (float *)0x4004;
        ppfStack_158 = (float **)0x1;
        pfStack_15c = (float *)0x1;
        pfStack_160 = local_a4;
        ppfStack_164 = &local_d4;
        ppfStack_168 = local_b4;
        ppfStack_16c = (float **)0x512bdb;
        Ordinal_660();
        local_ec = L" sec, RCP-A trip";
        local_f4[0] = 8;
        ppfStack_16c = local_b4;
        puStack_170 = local_f4;
        pfStack_174 = local_c4;
        ppfStack_178 = (float **)0x512c06;
        ppfStack_178 = (float **)__vbaVarCat();
        pfStack_17c = (float *)0x512c0d;
        __vbaStrVarMove();
        pfStack_17c = (float *)0x512c1b;
        __vbaStrMove();
        pfStack_17c = &local_8c;
        ppfStack_180 = (float **)DAT_0054b028;
        ppfStack_184 = (float **)0x512c30;
        iVar6 = (**(code **)(*DAT_0054b028 + 0x6fc))();
        goto joined_r0x00512c34;
      }
    }
  }
  else if (*(short *)param_12 == 1) {
    *param_2 = *param_1;
    *(undefined2 *)param_12 = 0;
    if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
    ppfVar12 = (float **)((short)(*(short *)param_13 + 1) + -1);
    if ((float **)0x1 < ppfVar12) {
      ppfStack_158 = (float **)0x5127dd;
      __vbaGenerateBoundsError();
    }
    *param_15 = (float)local_44[(int)ppfVar12 * 2];
    if (SCARRY2(*(short *)param_12,1)) goto LAB_0051387c;
    ppfVar12 = (float **)((short)(*(short *)param_12 + 1) + -1);
    if ((float **)0x1 < ppfVar12) {
      ppfStack_158 = (float **)0x512807;
      __vbaGenerateBoundsError();
    }
    if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
    uVar13 = (int)(short)(*(short *)param_13 + 1) - 1;
    if (1 < uVar13) {
      ppfStack_158 = (float **)0x512826;
      __vbaGenerateBoundsError();
    }
    *param_16 = (float)local_68[(int)ppfVar12 + uVar13 * 2];
    if ((DAT_0054b086 != 0) && (DAT_0054b08c != 0)) {
      local_dc = L"000000.0";
      local_e4 = 8;
      ppfStack_158 = (float **)0x512877;
      __vbaVarDup();
      local_cc = param_1;
      local_d4 = (float *)0x4004;
      ppfStack_158 = (float **)0x1;
      pfStack_15c = (float *)0x1;
      pfStack_160 = local_a4;
      ppfStack_164 = &local_d4;
      ppfStack_168 = local_b4;
      ppfStack_16c = (float **)0x5128a9;
      Ordinal_660();
      local_ec = L" sec, RCP-A trip";
      local_f4[0] = 8;
      ppfStack_16c = local_b4;
      puStack_170 = local_f4;
      pfStack_174 = local_c4;
      ppfStack_178 = (float **)0x5128d4;
      ppfStack_178 = (float **)__vbaVarCat();
      pfStack_17c = (float *)0x5128db;
      __vbaStrVarMove();
      pfStack_17c = (float *)0x5128e9;
      __vbaStrMove();
      pfStack_17c = &local_8c;
      ppfStack_180 = (float **)DAT_0054b028;
      ppfStack_184 = (float **)0x5128fe;
      iVar6 = (**(code **)(*DAT_0054b028 + 0x6fc))();
joined_r0x00512c34:
      uVar14 = 0;
      if (iVar6 < 0) {
        uVar14 = 0;
        ppfStack_184 = (float **)0x6fc;
        ppfStack_188 = (float **)&DAT_0041ccac;
        __vbaHresultCheckObj(iVar6,DAT_0054b028);
      }
      ppfStack_184 = (float **)0x512c5a;
      __vbaFreeStr();
LAB_00512c6f:
      ppfStack_184 = (float **)local_c4;
      ppfStack_188 = local_b4;
      __vbaFreeVarList(3,local_a4);
    }
  }
  else {
    *param_2 = 99999.0;
    *(undefined2 *)param_12 = 1;
    ppfVar11 = (float **)0x1;
    if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
    ppfVar12 = (float **)((short)(*(short *)param_13 + 1) + -1);
    if ((float **)0x1 < ppfVar12) {
      ppfStack_158 = (float **)0x51294a;
      __vbaGenerateBoundsError();
    }
    *param_15 = (float)local_44[(int)ppfVar12 * 2 + 1];
    if (SCARRY2(*(short *)param_12,1)) goto LAB_0051387c;
    ppfVar12 = (float **)((short)(*(short *)param_12 + 1) + -1);
    if ((float **)0x1 < ppfVar12) {
      ppfStack_158 = (float **)0x512974;
      __vbaGenerateBoundsError();
    }
    if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
    uVar13 = (int)(short)(*(short *)param_13 + 1) - 1;
    if (1 < uVar13) {
      ppfStack_158 = (float **)0x512993;
      __vbaGenerateBoundsError();
    }
    *param_16 = (float)local_68[(int)ppfVar12 + uVar13 * 2];
    if ((DAT_0054b086 != 0) && (DAT_0054b08c != 0)) {
      local_dc = L"000000.0";
      local_e4 = 8;
      ppfStack_158 = (float **)0x5129e4;
      __vbaVarDup();
      local_cc = param_1;
      local_d4 = (float *)0x4004;
      ppfStack_158 = (float **)0x1;
      pfStack_15c = (float *)0x1;
      pfStack_160 = local_a4;
      ppfStack_164 = &local_d4;
      ppfStack_168 = local_b4;
      ppfStack_16c = (float **)0x512a16;
      Ordinal_660();
      local_ec = L" sec, RCP-A restart";
      local_f4[0] = 8;
      ppfStack_16c = local_b4;
      puStack_170 = local_f4;
      pfStack_174 = local_c4;
      ppfStack_178 = (float **)0x512a41;
      ppfStack_178 = (float **)__vbaVarCat();
      pfStack_17c = (float *)0x512a48;
      __vbaStrVarMove();
      pfStack_17c = (float *)0x512a56;
      __vbaStrMove();
      pfStack_17c = &local_8c;
      ppfStack_180 = (float **)DAT_0054b028;
      ppfStack_184 = (float **)0x512a6b;
      iVar6 = (**(code **)(*DAT_0054b028 + 0x6fc))();
      uVar14 = 0;
      if (iVar6 < 0) {
        ppfStack_184 = (float **)0x6fc;
        ppfStack_188 = (float **)&DAT_0041ccac;
        __vbaHresultCheckObj(iVar6,DAT_0054b028);
      }
      ppfStack_184 = (float **)0x512a95;
      __vbaFreeStr();
      goto LAB_00512c6f;
    }
  }
  if ((uVar14 & 0xd) != 0) goto LAB_00513877;
  if (DAT_0054b000 == 0) {
    fVar15 = ((float10)local_2c - (float10)*param_15) / (float10)100.0;
  }
  else {
    ppfStack_158 = (float **)0x40590000;
    fStack_154 = 0.0;
    pfStack_160 = (float *)0x512cae;
    fVar15 = (float10)adj_fdiv_m64();
  }
  local_7c = (float)fVar15;
  if (((uVar14 & 0xd) != 0) || ((uVar14 & 0xd) != 0)) goto LAB_00513877;
  ppfStack_158 = (float **)0x512cdc;
  fVar15 = (float10)__vbaFpR4();
  ppfStack_158 = (float **)0x512cee;
  fVar16 = (float10)__vbaFpR4();
  uVar14 = 0;
  if (fVar16 < (float10)(float)fVar15) {
    if (DAT_0054b000 == 0) {
      fVar15 = ((float10)local_7c * (float10)*param_17) / (float10)(float)local_88;
    }
    else {
      ppfStack_158 = (float **)local_88;
      pfStack_15c = (float *)0x512d1f;
      fVar15 = (float10)adj_fdiv_m32();
    }
    local_24 = (float)(fVar15 * (float10)100.0);
    if (((uVar14 & 0xd) != 0) || (local_2c = local_2c - local_24, (uVar14 & 0xd) != 0))
    goto LAB_00513877;
  }
  if (DAT_0054b000 == 0) {
    fVar15 = ((float10)local_2c * (float10)*param_8) / (float10)100.0;
    pfVar7 = param_8;
  }
  else {
    fStack_154 = 100.0;
    pfStack_15c = (float *)0x512d69;
    fVar15 = (float10)adj_fdiv_m32();
    pfVar7 = extraout_ECX_02;
  }
  if (DAT_0054b000 == 0) {
    fVar15 = (fVar15 * (float10)*param_6 * (float10)*param_4) / (float10)*param_5;
    pfVar4 = param_5;
  }
  else {
    fStack_154 = *param_5;
    pfStack_15c = (float *)0x512d8a;
    fVar15 = (float10)adj_fdiv_m32();
    pfVar7 = extraout_ECX_03;
    pfVar4 = extraout_EDX;
  }
  *param_9 = (float)(((float10)1.0 - (float10)*param_14) * fVar15);
  if ((uVar14 & 0xd) != 0) goto LAB_00513877;
  if (DAT_0054b000 == 0) {
    fVar15 = (float10)*param_10 / (float10)*pfVar7;
    pfVar7 = param_10;
  }
  else {
    fStack_154 = *pfVar7;
    pfStack_15c = (float *)0x512dbf;
    uVar17 = adj_fdiv_m32();
    pfVar4 = (float *)((ulonglong)uVar17 >> 0x20);
    pfVar7 = (float *)uVar17;
    fVar15 = extraout_ST0_00;
  }
  uVar17 = CONCAT44(pfVar4,pfVar7);
  if (DAT_0054b000 == 0) {
    fVar15 = fVar15 / (float10)*param_7;
  }
  else {
    fStack_154 = *param_7;
    pfStack_15c = (float *)0x512dd6;
    uVar17 = adj_fdiv_m32();
    fVar15 = extraout_ST0_01;
  }
  pfVar7 = (float *)uVar17;
  if (DAT_0054b000 == 0) {
    fVar15 = (fVar15 * (float10)100.0 * (float10)*(float *)((ulonglong)uVar17 >> 0x20)) /
             (float10)*param_4;
  }
  else {
    fStack_154 = *param_4;
    pfStack_15c = (float *)0x512df2;
    pfVar7 = (float *)adj_fdiv_m32();
    fVar15 = extraout_ST0_02;
  }
  if (DAT_0054b000 == 0) {
    fVar15 = fVar15 / ((float10)1.0 - (float10)*param_14);
  }
  else {
    pfStack_15c = (float *)0x512e0f;
    ppfStack_158 = (float **)pfVar7;
    fVar15 = (float10)adj_fdiv_r();
  }
  local_30 = (float)fVar15;
  if ((uVar14 & 0xd) != 0) goto LAB_00513877;
  fVar1 = *param_1;
  pfVar7 = *param_3;
  ppfVar12 = (float **)(uint)((float)pfVar7 <= fVar1);
  ppfStack_158 = (float **)DAT_0054b024;
  pfStack_15c = (float *)0x512e45;
  pfStack_15c = (float *)(**(code **)(*(int *)DAT_0054b024 + 0x48c))();
  pfStack_160 = &local_90;
  ppfStack_164 = (float **)0x512e53;
  ppfVar11 = (float **)__vbaObjSet();
  ppfStack_164 = &local_94;
  ppfStack_168 = (float **)0x1;
  puStack_170 = (undefined4 *)0x512e64;
  ppfStack_16c = ppfVar11;
  pfStack_17c = (float *)(*(code *)(*ppfVar11)[0x10])();
  uVar14 = 0;
  if ((int)pfStack_17c < 0) {
    puStack_170 = (undefined4 *)0x40;
    pfStack_174 = (float *)&DAT_0041c968;
    ppfStack_180 = (float **)0x512e79;
    ppfStack_178 = ppfVar11;
    __vbaHresultCheckObj();
  }
  puStack_170 = (undefined4 *)0x0;
  pfStack_174 = (float *)0x68030005;
  ppfStack_178 = (float **)local_94;
  pfStack_17c = local_a4;
  ppfStack_180 = (float **)0x512e94;
  puStack_170 = (undefined4 *)__vbaLateIdCallLd();
  pfStack_174 = (float *)0x512e9e;
  sVar3 = __vbaI2Var();
  sVar10 = (short)(*(short *)param_13 * 100);
  ppfVar11 = param_3;
  ppfVar5 = param_13;
  if ((int)sVar10 != *(short *)param_13 * 100) goto LAB_0051387c;
  ppfVar12 = (float **)-(uint)(sVar10 != sVar3 && (float)pfVar7 <= fVar1);
  ppfStack_158 = &local_94;
  pfStack_15c = &local_90;
  pfStack_160 = (float *)0x2;
  ppfStack_164 = (float **)0x512ed2;
  __vbaFreeObjList();
  ppfStack_158 = (float **)0x512ee1;
  __vbaFreeVar();
  if ((short)ppfVar12 == 0) {
    uVar14 = 0;
    ppfVar5 = param_13;
    if (*(short *)param_13 == 1 && (float)*param_3 <= *param_1) {
      *param_3 = (float *)*param_1;
      *(undefined2 *)param_13 = 0;
      ppfVar5 = param_13;
      if (SCARRY2(*(short *)param_12,1)) goto LAB_0051387c;
      ppfVar12 = (float **)((short)(*(short *)param_12 + 1) + -1);
      if ((float **)0x1 < ppfVar12) {
        ppfStack_158 = (float **)0x51326f;
        __vbaGenerateBoundsError();
      }
      ppfVar11 = param_13;
      ppfVar5 = param_13;
      if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
      ppfVar5 = (float **)((short)(*(short *)param_13 + 1) + -1);
      if ((float **)0x1 < ppfVar5) {
        ppfStack_158 = (float **)0x51328e;
        __vbaGenerateBoundsError();
      }
      *param_15 = (float)local_44[(int)ppfVar12 + (int)ppfVar5 * 2];
      if (SCARRY2(*(short *)param_12,1)) goto LAB_0051387c;
      ppfVar12 = (float **)((short)(*(short *)param_12 + 1) + -1);
      if ((float **)0x1 < ppfVar12) {
        ppfStack_158 = (float **)0x5132bb;
        __vbaGenerateBoundsError();
      }
      if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
      ppfVar5 = (float **)((short)(*(short *)param_13 + 1) + -1);
      if ((float **)0x1 < ppfVar5) {
        ppfStack_158 = (float **)0x5132d7;
        __vbaGenerateBoundsError();
      }
      *param_16 = (float)local_68[(int)ppfVar12 + (int)ppfVar5 * 2];
      if ((DAT_0054b086 != 0) && (DAT_0054b08c != 0)) {
        local_dc = L"000000.0";
        local_e4 = 8;
        ppfStack_158 = (float **)0x513328;
        __vbaVarDup();
        local_cc = param_1;
        local_d4 = (float *)0x4004;
        ppfStack_158 = (float **)0x1;
        pfStack_15c = (float *)0x1;
        pfStack_160 = local_a4;
        ppfStack_164 = &local_d4;
        ppfStack_168 = local_b4;
        ppfStack_16c = (float **)0x51335a;
        Ordinal_660();
        local_ec = L" sec, RCP-B trip";
        local_f4[0] = 8;
        ppfStack_16c = local_b4;
        puStack_170 = local_f4;
        pfStack_174 = local_c4;
        ppfStack_178 = (float **)0x513385;
        ppfStack_178 = (float **)__vbaVarCat();
        pfStack_17c = (float *)0x51338c;
        __vbaStrVarMove();
        pfStack_17c = (float *)0x51339a;
        __vbaStrMove();
        pfStack_17c = &local_8c;
        ppfStack_180 = (float **)DAT_0054b028;
        ppfStack_184 = (float **)0x5133af;
        iVar6 = (**(code **)(*DAT_0054b028 + 0x6fc))();
        uVar14 = 0;
        if (iVar6 < 0) {
          ppfStack_184 = (float **)0x6fc;
          ppfStack_188 = (float **)&DAT_0041ccac;
          __vbaHresultCheckObj(iVar6,DAT_0054b028);
        }
        ppfStack_184 = (float **)0x5133d9;
        __vbaFreeStr();
        goto LAB_005133ee;
      }
    }
  }
  else if (*(short *)param_13 == 1) {
    *param_3 = (float *)*param_1;
    *(undefined2 *)param_13 = 0;
    ppfVar5 = param_13;
    if (SCARRY2(*(short *)param_12,1)) goto LAB_0051387c;
    ppfVar12 = (float **)((short)(*(short *)param_12 + 1) + -1);
    if ((float **)0x1 < ppfVar12) {
      ppfStack_158 = (float **)0x512f1f;
      __vbaGenerateBoundsError();
    }
    ppfVar11 = param_13;
    ppfVar5 = param_13;
    if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
    ppfVar5 = (float **)((short)(*(short *)param_13 + 1) + -1);
    if ((float **)0x1 < ppfVar5) {
      ppfStack_158 = (float **)0x512f3e;
      __vbaGenerateBoundsError();
    }
    *param_15 = (float)local_44[(int)ppfVar12 + (int)ppfVar5 * 2];
    ppfVar11 = param_13;
    if (SCARRY2(*(short *)param_12,1)) goto LAB_0051387c;
    ppfVar12 = (float **)((short)(*(short *)param_12 + 1) + -1);
    if ((float **)0x1 < ppfVar12) {
      ppfStack_158 = (float **)0x512f6b;
      __vbaGenerateBoundsError();
    }
    ppfVar11 = param_13;
    if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
    ppfVar5 = (float **)((short)(*(short *)param_13 + 1) + -1);
    if ((float **)0x1 < ppfVar5) {
      ppfStack_158 = (float **)0x512f87;
      __vbaGenerateBoundsError();
    }
    *param_16 = (float)local_68[(int)ppfVar12 + (int)ppfVar5 * 2];
    ppfVar11 = param_13;
    if ((DAT_0054b086 != 0) && (DAT_0054b08c != 0)) {
      local_dc = L"000000.0";
      local_e4 = 8;
      ppfStack_158 = (float **)0x512fd8;
      __vbaVarDup();
      local_cc = param_1;
      local_d4 = (float *)0x4004;
      ppfStack_158 = (float **)0x1;
      pfStack_15c = (float *)0x1;
      pfStack_160 = local_a4;
      ppfStack_164 = &local_d4;
      ppfStack_168 = local_b4;
      ppfStack_16c = (float **)0x51300a;
      Ordinal_660();
      local_ec = L" sec, RCP-B trip";
      local_f4[0] = 8;
      ppfStack_16c = local_b4;
      puStack_170 = local_f4;
      pfStack_174 = local_c4;
      ppfStack_178 = (float **)0x513035;
      ppfStack_178 = (float **)__vbaVarCat();
      pfStack_17c = (float *)0x51303c;
      __vbaStrVarMove();
      pfStack_17c = (float *)0x51304a;
      __vbaStrMove();
      pfStack_17c = &local_8c;
      ppfStack_180 = (float **)DAT_0054b028;
      ppfStack_184 = (float **)0x51305f;
      iVar6 = (**(code **)(*DAT_0054b028 + 0x6fc))();
joined_r0x005131d9:
      uVar14 = 0;
      if (iVar6 < 0) {
        uVar14 = 0;
        ppfStack_184 = (float **)0x6fc;
        ppfStack_188 = (float **)&DAT_0041ccac;
        __vbaHresultCheckObj(iVar6,DAT_0054b028);
      }
      ppfStack_184 = (float **)0x5131ff;
      __vbaFreeStr();
LAB_005133ee:
      ppfStack_184 = (float **)local_c4;
      ppfStack_188 = local_b4;
      ppfVar12 = (float **)0x8;
      __vbaFreeVarList(3,local_a4);
      ppfVar11 = param_13;
    }
  }
  else {
    *param_3 = (float *)0x47c34f80;
    *(undefined2 *)param_13 = 1;
    ppfVar5 = param_13;
    if (SCARRY2(*(short *)param_12,1)) goto LAB_0051387c;
    ppfVar12 = (float **)((short)(*(short *)param_12 + 1) + -1);
    if ((float **)0x1 < ppfVar12) {
      ppfStack_158 = (float **)0x513098;
      __vbaGenerateBoundsError();
    }
    ppfVar11 = param_13;
    ppfVar5 = param_13;
    if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
    ppfVar5 = (float **)((short)(*(short *)param_13 + 1) + -1);
    if ((float **)0x1 < ppfVar5) {
      ppfStack_158 = (float **)0x5130b7;
      __vbaGenerateBoundsError();
    }
    *param_15 = (float)local_44[(int)ppfVar12 + (int)ppfVar5 * 2];
    ppfVar11 = param_13;
    if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
    ppfVar12 = (float **)((short)(*(short *)param_13 + 1) + -1);
    if ((float **)0x1 < ppfVar12) {
      ppfStack_158 = (float **)0x5130e1;
      __vbaGenerateBoundsError();
    }
    ppfVar11 = param_13;
    if (SCARRY2(*(short *)param_13,1)) goto LAB_0051387c;
    ppfVar5 = (float **)((short)(*(short *)param_13 + 1) + -1);
    if ((float **)0x1 < ppfVar5) {
      ppfStack_158 = (float **)0x5130fd;
      __vbaGenerateBoundsError();
    }
    *param_16 = (float)local_68[(int)ppfVar12 + (int)ppfVar5 * 2];
    ppfVar11 = param_13;
    if ((DAT_0054b086 != 0) && (DAT_0054b08c != 0)) {
      local_dc = L"000000.0";
      local_e4 = 8;
      ppfStack_158 = (float **)0x51314e;
      __vbaVarDup();
      local_cc = param_1;
      local_d4 = (float *)0x4004;
      ppfStack_158 = (float **)0x1;
      pfStack_15c = (float *)0x1;
      pfStack_160 = local_a4;
      ppfStack_164 = &local_d4;
      ppfStack_168 = local_b4;
      ppfStack_16c = (float **)0x513180;
      Ordinal_660();
      local_ec = L" sec, RCP-B restart";
      local_f4[0] = 8;
      ppfStack_16c = local_b4;
      puStack_170 = local_f4;
      pfStack_174 = local_c4;
      ppfStack_178 = (float **)0x5131ab;
      ppfStack_178 = (float **)__vbaVarCat();
      pfStack_17c = (float *)0x5131b2;
      __vbaStrVarMove();
      pfStack_17c = (float *)0x5131c0;
      __vbaStrMove();
      pfStack_17c = &local_8c;
      ppfStack_180 = (float **)DAT_0054b028;
      ppfStack_184 = (float **)0x5131d5;
      iVar6 = (**(code **)(*DAT_0054b028 + 0x6fc))();
      goto joined_r0x005131d9;
    }
  }
  if ((uVar14 & 0xd) == 0) {
    if (DAT_0054b000 == 0) {
      fVar15 = ((float10)local_30 - (float10)*param_16) / (float10)100.0;
    }
    else {
      ppfStack_158 = (float **)0x40590000;
      fStack_154 = 0.0;
      pfStack_160 = (float *)0x51342d;
      fVar15 = (float10)adj_fdiv_m64();
    }
    local_80 = (float)fVar15;
    if (((uVar14 & 0xd) == 0) && ((uVar14 & 0xd) == 0)) {
      ppfStack_158 = (float **)0x51345b;
      fVar15 = (float10)__vbaFpR4();
      ppfStack_158 = (float **)0x51346d;
      fVar16 = (float10)__vbaFpR4();
      uVar14 = 0;
      if (fVar16 < (float10)(float)fVar15) {
        if (DAT_0054b000 == 0) {
          fVar15 = ((float10)local_80 * (float10)*param_17) / (float10)*param_18;
        }
        else {
          ppfStack_158 = (float **)*param_18;
          pfStack_15c = (float *)0x513499;
          fVar15 = (float10)adj_fdiv_m32();
        }
        local_28 = (float)(fVar15 * (float10)100.0);
        if (((uVar14 & 0xd) != 0) || (local_30 = local_30 - local_28, (uVar14 & 0xd) != 0))
        goto LAB_00513877;
      }
      if (DAT_0054b000 == 0) {
        fVar15 = ((float10)local_30 * (float10)*param_8) / (float10)100.0;
      }
      else {
        fStack_154 = 100.0;
        pfStack_15c = (float *)0x5134e3;
        fVar15 = (float10)adj_fdiv_m32();
      }
      if (DAT_0054b000 == 0) {
        fVar15 = (fVar15 * (float10)*param_7 * (float10)*param_4) / (float10)*param_5;
      }
      else {
        fStack_154 = *param_5;
        pfStack_15c = (float *)0x513504;
        fVar15 = (float10)adj_fdiv_m32();
      }
      *param_10 = (float)(((float10)1.0 - (float10)*param_14) * fVar15);
      if ((uVar14 & 0xd) == 0) {
        sVar3 = (short)(*(short *)param_12 * 100);
        if ((int)sVar3 == *(short *)param_12 * 100) {
          local_cc = (float *)CONCAT22(local_cc._2_2_,sVar3);
          local_d4 = (float *)0x2;
          ppfStack_158 = (float **)DAT_0054b024;
          pfStack_15c = (float *)0x51354f;
          pfStack_15c = (float *)(**(code **)(*(int *)DAT_0054b024 + 0x48c))();
          ppfVar11 = (float **)__vbaObjSet_exref;
          pfStack_160 = &local_90;
          ppfStack_164 = (float **)0x51355f;
          ppfVar12 = (float **)__vbaObjSet();
          ppfStack_164 = &local_94;
          ppfStack_168 = (float **)0x0;
          puStack_170 = (undefined4 *)0x513570;
          ppfStack_16c = ppfVar12;
          pfStack_17c = (float *)(*(code *)(*ppfVar12)[0x10])();
          if ((int)pfStack_17c < 0) {
            puStack_170 = (undefined4 *)0x40;
            pfStack_174 = (float *)&DAT_0041c968;
            ppfStack_180 = (float **)0x513585;
            ppfStack_178 = ppfVar12;
            __vbaHresultCheckObj();
          }
          ppfVar5 = (float **)__vbaLateIdSt_exref;
          pfStack_17c = local_d4;
          ppfStack_178 = (float **)local_d0;
          pfStack_174 = local_cc;
          puStack_170 = local_c8;
          ppfStack_180 = (float **)0x68030005;
          ppfStack_184 = (float **)local_94;
          ppfStack_188 = (float **)0x5135c1;
          __vbaLateIdSt();
          ppfStack_188 = &local_94;
          __vbaFreeObjList(2,&local_90);
          sVar3 = (short)(*(short *)param_13 * 100);
          if ((int)sVar3 == *(short *)param_13 * 100) {
            local_cc = (float *)CONCAT22(local_cc._2_2_,sVar3);
            local_d4 = (float *)0x2;
            ppfStack_158 = (float **)DAT_0054b024;
            pfStack_15c = (float *)0x513609;
            pfStack_15c = (float *)(**(code **)(*(int *)DAT_0054b024 + 0x48c))();
            pfStack_160 = &local_90;
            ppfStack_164 = (float **)0x513613;
            ppfVar11 = (float **)__vbaObjSet();
            ppfStack_164 = &local_94;
            ppfStack_168 = (float **)0x1;
            puStack_170 = (undefined4 *)0x513624;
            ppfStack_16c = ppfVar11;
            pfStack_17c = (float *)(*(code *)(*ppfVar11)[0x10])();
            if ((int)pfStack_17c < 0) {
              puStack_170 = (undefined4 *)0x40;
              pfStack_174 = (float *)&DAT_0041c968;
              ppfStack_180 = (float **)0x513639;
              ppfStack_178 = ppfVar11;
              __vbaHresultCheckObj();
            }
            pfStack_17c = local_d4;
            ppfStack_178 = (float **)local_d0;
            pfStack_174 = local_cc;
            puStack_170 = local_c8;
            ppfStack_180 = (float **)0x68030005;
            ppfStack_184 = (float **)local_94;
            ppfStack_188 = (float **)0x51366f;
            __vbaLateIdSt();
            ppfStack_188 = &local_94;
            __vbaFreeObjList(2,&local_90);
            ppfStack_188 = (float **)0x51368e;
            ppfStack_188 = (float **)Ordinal_685();
            piVar8 = (int *)__vbaObjSet(&local_90);
            iVar6 = (**(code **)(*piVar8 + 0x1c))(piVar8,&local_fc);
            if (iVar6 < 0) {
              __vbaHresultCheckObj(iVar6,piVar8,&DAT_0041b0d0,0x1c);
            }
            bVar2 = 0 < (int)local_fc;
            __vbaFreeObj();
            if (bVar2) {
              __vbaStrCopy();
              if (DAT_0054b010 == (int *)0x0) {
                __vbaNew2(&DAT_00407e8c,&DAT_0054b010);
              }
              piVar8 = DAT_0054b010;
              local_dc = DAT_0054b024;
              local_e4 = 9;
              local_cc = (float *)0x1;
              local_d4 = (float *)0x3;
              iVar6 = (**(code **)(*DAT_0054b010 + 0x2b0))
                                (DAT_0054b010,3,local_d0,1,local_c8,9,local_e0,DAT_0054b024,local_d8
                                );
              if (iVar6 < 0) {
                __vbaHresultCheckObj(iVar6,piVar8,&DAT_0041aed8,0x2b0);
              }
              local_f8 = 0;
              iVar6 = (**(code **)(*(int *)DAT_0054b024 + 0x6fc))(DAT_0054b024,&local_f8);
              if (iVar6 < 0) {
                __vbaHresultCheckObj(iVar6,DAT_0054b024,&LAB_0041e434,0x6fc);
              }
            }
            __vbaOnError(0);
            __vbaExitProc();
            local_fc = local_50;
            __vbaAryDestruct(0,&local_fc,&LAB_00513864);
            local_100 = local_74;
            __vbaAryDestruct(0,&local_100);
            return;
          }
        }
LAB_0051387c:
        ppfStack_158 = (float **)0x513882;
        __vbaErrorOverflow();
        ppfStack_168 = (float **)&LAB_00404716;
        ppfStack_16c = ExceptionList;
        ppfStack_164 = (float **)&ppfStack_188;
        pfStack_160 = (float *)&DAT_00403608;
        pfStack_15c = (float *)((uint)piStack_150 & 1);
        piVar8 = (int *)((uint)piStack_150 & 0xfffffffe);
        ExceptionList = &ppfStack_16c;
        ppfStack_188 = ppfVar5;
        ppfStack_184 = ppfVar12;
        ppfStack_180 = ppfVar11;
        ppfStack_158 = (float **)&stack0xfffffffc;
        piStack_150 = piVar8;
        (**(code **)(*piVar8 + 4))(piVar8);
        pfStack_174 = (float *)0x0;
        (**(code **)(*piVar8 + 0x714))(piVar8);
        uVar9 = (**(code **)(*piVar8 + 0x32c))(piVar8);
        __vbaObjSet(&pfStack_174,uVar9);
        iVar6 = (**(code **)((int)*pfStack_174 + 0xe4))(pfStack_174,DAT_0054b0d4);
        if (iVar6 < 0) {
          __vbaHresultCheckObj(iVar6,pfStack_174,&DAT_0041bb00,0xe4);
        }
        iVar6 = (**(code **)((int)*pfStack_174 + 0x1b8))(pfStack_174);
        if (iVar6 < 0) {
          __vbaHresultCheckObj(iVar6,pfStack_174,&DAT_0041bb00,0x1b8);
        }
        __vbaObjSetAddref(&pfStack_174,0);
        pfStack_15c = (float *)0x0;
        __vbaFreeObj(&LAB_00513964);
        return;
      }
    }
  }
LAB_00513877:
  __vbaFPException();
  return;
}

