
/* WARNING: Type propagation algorithm not settling */

void __cdecl
FUN_00511b00(float *param_1,float *param_2,short *param_3,float *param_4,float *param_5,
            float *param_6,float *param_7,float *param_8,float *param_9,float *param_10,
            undefined4 *param_11)

{
  float fVar1;
  bool bVar2;
  short sVar3;
  ushort uVar4;
  short sVar5;
  undefined4 uVar6;
  int ****ppppiVar7;
  undefined4 ****ppppuVar8;
  int *piVar9;
  int ****ppppiVar10;
  int iVar11;
  float *unaff_EBX;
  code *pcVar12;
  float *unaff_ESI;
  float *unaff_EDI;
  code *pcVar13;
  float10 fVar14;
  float10 fVar15;
  float10 extraout_ST1;
  int ****ppppiStack_13c;
  undefined4 ****ppppuStack_138;
  int ****ppppiStack_134;
  int ****ppppiStack_130;
  undefined4 ****ppppuStack_12c;
  undefined4 uStack_128;
  undefined4 ****ppppuStack_124;
  int ****ppppiStack_120;
  undefined *puStack_11c;
  int ****ppppiStack_118;
  int ****ppppiStack_114;
  undefined4 uStack_110;
  int ****ppppiStack_10c;
  int ****ppppiStack_108;
  int ****ppppiStack_104;
  int ****ppppiStack_100;
  int ****ppppiStack_fc;
  int ****ppppiStack_f8;
  int ****ppppiStack_f4;
  int ****ppppiStack_f0;
  undefined4 ****ppppuStack_ec;
  int ****ppppiStack_e8;
  int *piStack_e4;
  int ****ppppiStack_e0;
  int ****ppppiStack_dc;
  int ****ppppiStack_d8;
  int ****ppppiStack_d4;
  int ****ppppiStack_d0;
  undefined8 uStack_cc;
  float fStack_c4;
  float *local_b4;
  float *local_b0;
  float *pfStack_ac;
  float *local_a8;
  float *pfStack_a4;
  float *pfStack_a0;
  float *pfStack_9c;
  int local_78;
  int ***local_74;
  undefined4 local_70;
  int ****local_6c;
  int ****local_68;
  undefined4 local_64;
  undefined4 ****local_60;
  int ****local_5c;
  undefined4 local_58;
  int ****local_54;
  int ***local_50 [4];
  int ***local_40 [4];
  int ***local_30;
  int ***local_2c;
  undefined4 ****local_28;
  int ***local_24;
  void *pvStack_20;
  undefined1 *puStack_1c;
  undefined1 *local_18;
  undefined *local_14;
  undefined4 local_10;
  undefined4 local_c;
  
  puStack_1c = &LAB_00404716;
  pvStack_20 = ExceptionList;
  local_18 = &stack0xffffff40;
  local_14 = &DAT_00403590;
  local_10 = 0;
  local_c = 0;
  local_24 = (int ***)0x0;
  local_28 = (undefined4 ****)0x0;
  local_2c = (int ***)0x0;
  local_30 = (int ***)0x0;
  local_40[0] = (int ***)0x0;
  local_50[0] = (int ***)0x0;
  local_60 = (undefined4 ****)0x0;
  local_70 = 0;
  local_74 = (int ***)0x0;
  local_78 = 0;
  fStack_c4 = 1.4013e-45;
  uStack_cc = (double)CONCAT44(0x511b60,(undefined4)uStack_cc);
  ExceptionList = &pvStack_20;
  __vbaOnError();
  pcVar13 = __vbaLateIdCallLd_exref;
  if (*param_3 == 0 && *param_1 <= *param_2) {
    DAT_0054b458 = *param_11;
    *param_3 = 1;
    uStack_cc._4_4_ = DAT_0054b024;
    uStack_cc._0_4_ = 0x511bab;
    uVar6 = (*(code *)(*DAT_0054b024)[0x14e])();
    pcVar12 = __vbaObjSet_exref;
    uStack_cc = (double)CONCAT44(uStack_cc._4_4_,uVar6);
    ppppiStack_d0 = &local_24;
    ppppiStack_d4 = (int ****)0x511bb8;
    ppppiVar7 = (int ****)__vbaObjSet();
    ppppiStack_d4 = (int ****)&local_28;
    ppppiStack_d8 = (int ****)0x0;
    ppppiStack_e0 = (int ****)0x511bc5;
    ppppiStack_dc = ppppiVar7;
    ppppuVar8 = (undefined4 ****)(*(code *)(*ppppiVar7)[0x10])();
    if ((int)ppppuVar8 < 0) {
      ppppiStack_e0 = (int ****)0x40;
      piStack_e4 = (int *)&DAT_0041c968;
      ppppiStack_f0 = (int ****)0x511bda;
      ppppuStack_ec = ppppuVar8;
      ppppiStack_e8 = ppppiVar7;
      __vbaHresultCheckObj();
    }
    ppppiStack_e0 = DAT_0054b024;
    piStack_e4 = (int *)0x511be8;
    piStack_e4 = (int *)(*(code *)(*DAT_0054b024)[0x14e])();
    ppppiStack_e8 = &local_2c;
    ppppuStack_ec = (undefined4 ****)0x511bef;
    ppppuVar8 = (undefined4 ****)__vbaObjSet();
    ppppuStack_ec = &local_30;
    ppppiStack_f0 = (int ****)0x0;
    ppppiStack_f8 = (int ****)0x511c02;
    ppppiStack_f4 = ppppuVar8;
    ppppiStack_104 = (int ****)(*(code *)(*ppppuVar8)[0x10])();
    if ((int)ppppiStack_104 < 0) {
      ppppiStack_f8 = (int ****)0x40;
      ppppiStack_fc = (int ****)&DAT_0041c968;
      ppppiStack_108 = (int ****)0x511c17;
      ppppiStack_100 = ppppuVar8;
      __vbaHresultCheckObj();
    }
    pcVar13 = __vbaLateIdCallLd_exref;
    ppppiStack_f8 = (int ****)0x0;
    ppppiStack_fc = (int ****)0x68030009;
    ppppiStack_100 = local_28;
    ppppiStack_104 = local_40;
    ppppiStack_108 = (int ****)0x511c2d;
    ppppiStack_f8 = (int ****)__vbaLateIdCallLd();
    ppppiStack_fc = (int ****)0x511c37;
    sVar3 = __vbaI2Var();
    ppppiStack_fc = (int ****)0x0;
    ppppiStack_100 = (int ****)0x68030008;
    ppppiStack_104 = (int ****)local_30;
    ppppiStack_108 = local_50;
    ppppiStack_10c = (int ****)0x511c53;
    ppppiStack_fc = (int ****)__vbaLateIdCallLd();
    ppppiStack_100 = (int ****)0x511c5d;
    uVar4 = __vbaBoolVar();
    ppppiStack_100 = &local_30;
    ppppiStack_104 = &local_2c;
    ppppiStack_108 = (int ****)&local_28;
    ppppiStack_10c = &local_24;
    uStack_110 = 4;
    ppppiStack_114 = (int ****)0x511c79;
    __vbaFreeObjList();
    ppppiStack_114 = local_50;
    ppppiStack_118 = local_40;
    puStack_11c = (undefined *)0x2;
    ppppiStack_120 = (int ****)0x511c89;
    __vbaFreeVarList();
    if ((ushort)(-(ushort)(sVar3 == 0) & ~uVar4) != 0) {
      local_58 = 100;
      local_60 = (undefined4 ****)0x2;
      ppppiStack_100 = DAT_0054b024;
      ppppiStack_104 = (int ****)0x511cb2;
      ppppiStack_104 = (int ****)(*(code *)(*DAT_0054b024)[0x14e])();
      ppppiStack_108 = &local_24;
      ppppiStack_10c = (int ****)0x511cbd;
      ppppiVar7 = (int ****)__vbaObjSet();
      ppppiStack_10c = (int ****)&local_28;
      uStack_110 = 0;
      ppppiStack_118 = (int ****)0x511ccb;
      ppppiStack_114 = ppppiVar7;
      ppppuStack_124 = (undefined4 ****)(*(code *)(*ppppiVar7)[0x10])();
      if ((int)ppppuStack_124 < 0) {
        ppppiStack_118 = (int ****)0x40;
        puStack_11c = &DAT_0041c968;
        uStack_128 = 0x511ce0;
        ppppiStack_120 = ppppiVar7;
        __vbaHresultCheckObj();
      }
      ppppuStack_124 = local_60;
      ppppiStack_120 = local_5c;
      puStack_11c = (undefined *)0x64;
      ppppiStack_118 = local_54;
      uStack_128 = 0x68030009;
      ppppuStack_12c = local_28;
      ppppiStack_130 = (int ****)0x511d08;
      __vbaLateIdSt();
      ppppiStack_130 = (int ****)&local_28;
      ppppiStack_134 = &local_24;
      ppppuStack_138 = (undefined4 ****)0x2;
      ppppiStack_13c = (int ****)0x511d18;
      __vbaFreeObjList();
      pcVar12 = __vbaObjSet_exref;
    }
    ppppiStack_100 = DAT_0054b024;
    ppppiStack_104 = (int ****)0x511d2f;
    ppppiStack_104 = (int ****)(*(code *)(*DAT_0054b024)[0x14e])();
    ppppiStack_108 = &local_24;
    ppppiStack_10c = (int ****)0x511d36;
    ppppiVar7 = (int ****)(*pcVar12)();
    ppppiStack_10c = (int ****)&local_28;
    uStack_110 = 1;
    ppppiStack_118 = (int ****)0x511d44;
    ppppiStack_114 = ppppiVar7;
    ppppuVar8 = (undefined4 ****)(*(code *)(*ppppiVar7)[0x10])();
    if ((int)ppppuVar8 < 0) {
      ppppiStack_118 = (int ****)0x40;
      puStack_11c = &DAT_0041c968;
      uStack_128 = 0x511d59;
      ppppuStack_124 = ppppuVar8;
      ppppiStack_120 = ppppiVar7;
      __vbaHresultCheckObj();
    }
    ppppiStack_118 = DAT_0054b024;
    puStack_11c = (undefined *)0x511d67;
    puStack_11c = (undefined *)(*(code *)(*DAT_0054b024)[0x14e])();
    ppppiStack_120 = &local_2c;
    ppppuStack_124 = (undefined4 ****)0x511d6e;
    ppppuVar8 = (undefined4 ****)(*pcVar12)();
    ppppuStack_124 = &local_30;
    uStack_128 = 1;
    ppppiStack_130 = (int ****)0x511d82;
    ppppuStack_12c = ppppuVar8;
    ppppiStack_13c = (int ****)(*(code *)(*ppppuVar8)[0x10])();
    if ((int)ppppiStack_13c < 0) {
      ppppiStack_130 = (int ****)0x40;
      ppppiStack_134 = (int ****)&DAT_0041c968;
      ppppuStack_138 = ppppuVar8;
      __vbaHresultCheckObj();
    }
    ppppiStack_130 = (int ****)0x0;
    ppppiStack_134 = (int ****)0x68030009;
    ppppuStack_138 = local_28;
    ppppiStack_13c = local_40;
    ppppiStack_130 = (int ****)__vbaLateIdCallLd();
    ppppiStack_134 = (int ****)0x511db2;
    sVar3 = __vbaI2Var();
    ppppiStack_134 = (int ****)0x0;
    ppppuStack_138 = (undefined4 ****)0x68030008;
    ppppiStack_13c = (int ****)local_30;
    ppppiStack_134 = (int ****)__vbaLateIdCallLd(local_50);
    ppppuStack_138 = (undefined4 ****)0x511dd8;
    uVar4 = __vbaBoolVar();
    ppppuStack_138 = &local_30;
    ppppiStack_13c = &local_2c;
    __vbaFreeObjList(4,&local_24,&local_28);
    __vbaFreeVarList(2,local_40,local_50);
    if ((ushort)(-(ushort)(sVar3 == 0) & ~uVar4) != 0) {
      local_58 = 100;
      local_60 = (undefined4 ****)0x2;
      uStack_cc._4_4_ = DAT_0054b024;
      uStack_cc._0_4_ = 0x511e2e;
      uVar6 = (*(code *)(*DAT_0054b024)[0x14e])();
      uStack_cc = (double)CONCAT44(uStack_cc._4_4_,uVar6);
      ppppiStack_d0 = &local_24;
      ppppiStack_d4 = (int ****)0x511e39;
      ppppiVar7 = (int ****)__vbaObjSet();
      ppppiStack_d4 = (int ****)&local_28;
      ppppiStack_d8 = (int ****)0x1;
      ppppiStack_e0 = (int ****)0x511e47;
      ppppiStack_dc = ppppiVar7;
      ppppuStack_ec = (undefined4 ****)(*(code *)(*ppppiVar7)[0x10])();
      if ((int)ppppuStack_ec < 0) {
        ppppiStack_e0 = (int ****)0x40;
        piStack_e4 = (int *)&DAT_0041c968;
        ppppiStack_f0 = (int ****)0x511e5c;
        ppppiStack_e8 = ppppiVar7;
        __vbaHresultCheckObj();
      }
      ppppuStack_ec = (undefined4 ****)0x2;
      ppppiStack_e8 = local_5c;
      piStack_e4 = (int *)0x64;
      ppppiStack_e0 = local_54;
      ppppiStack_f0 = (int ****)0x68030009;
      ppppiStack_f4 = local_28;
      ppppiStack_f8 = (int ****)0x511e81;
      __vbaLateIdSt();
      ppppiStack_f8 = (int ****)&local_28;
      ppppiStack_fc = &local_24;
      ppppiStack_100 = (int ****)0x2;
      ppppiStack_104 = (int ****)0x511e91;
      __vbaFreeObjList();
      pcVar13 = __vbaLateIdCallLd_exref;
    }
  }
  if (*param_3 == 1) {
    if (1.0 <= *param_6 && *param_1 < *param_4) {
      uStack_cc = (double)(*param_4 - *param_1);
      ppppiStack_d0 = (int ****)0x511f0b;
      fVar14 = (float10)Ordinal_614();
      ppppiStack_d0 = DAT_0054b024;
      ppppiStack_d4 = (int ****)0x511f1c;
      ppppiStack_d4 = (int ****)(*(code *)(*DAT_0054b024)[0x14e])();
      ppppiStack_d8 = &local_24;
      ppppiStack_dc = (int ****)0x511f27;
      piVar9 = (int *)__vbaObjSet();
      ppppiStack_dc = (int ****)&local_28;
      ppppiStack_e0 = (int ****)0x0;
      ppppiStack_e8 = (int ****)0x511f35;
      piStack_e4 = piVar9;
      ppppiStack_f4 = (int ****)(**(code **)(*piVar9 + 0x40))();
      if ((int)ppppiStack_f4 < 0) {
        ppppiStack_e8 = (int ****)0x40;
        ppppuStack_ec = (undefined4 ****)&DAT_0041c968;
        ppppiStack_f8 = (int ****)0x511f4a;
        ppppiStack_f0 = (int ****)piVar9;
        __vbaHresultCheckObj();
      }
      ppppiStack_e8 = (int ****)0x0;
      ppppuStack_ec = (undefined4 ****)0x68030009;
      ppppiStack_f0 = local_28;
      ppppiStack_f4 = local_40;
      ppppiStack_f8 = (int ****)0x511f5b;
      (*pcVar13)();
      ppppiStack_e8 = DAT_0054b024;
      ppppuStack_ec = (undefined4 ****)0x511f6c;
      ppppuStack_ec = (undefined4 ****)(*(code *)(*DAT_0054b024)[0x14e])();
      ppppiStack_f0 = &local_2c;
      ppppiStack_f4 = (int ****)0x511f77;
      ppppiVar7 = (int ****)__vbaObjSet();
      ppppiStack_f4 = &local_30;
      ppppiStack_f8 = (int ****)0x1;
      ppppiStack_100 = (int ****)0x511f8b;
      ppppiStack_fc = ppppiVar7;
      ppppiStack_10c = (int ****)(*(code *)(*ppppiVar7)[0x10])();
      uVar4 = 0;
      if ((int)ppppiStack_10c < 0) {
        ppppiStack_100 = (int ****)0x40;
        ppppiStack_104 = (int ****)&DAT_0041c968;
        uStack_110 = 0x511fa0;
        ppppiStack_108 = ppppiVar7;
        __vbaHresultCheckObj();
      }
      ppppiStack_100 = (int ****)0x0;
      ppppiStack_104 = (int ****)0x68030009;
      ppppiStack_108 = (int ****)local_30;
      ppppiStack_10c = local_50;
      uStack_110 = 0x511fb1;
      (*pcVar13)();
      pcVar12 = __vbaI2Var_exref;
      ppppiStack_100 = local_50;
      ppppiStack_104 = (int ****)0x511fc0;
      sVar3 = __vbaI2Var();
      ppppiStack_104 = local_40;
      ppppiStack_108 = (int ****)0x511fc9;
      sVar5 = __vbaI2Var();
      if (SCARRY2(sVar3,sVar5)) {
        uStack_cc = (double)CONCAT44(0x512287,(undefined4)uStack_cc);
        __vbaErrorOverflow();
        uStack_cc = (double)CONCAT44(&stack0xfffffffc,(undefined4)uStack_cc);
        ppppiStack_e0 = (int ****)&LAB_00404716;
        piStack_e4 = ExceptionList;
        ppppiStack_134 = (int ****)param_6;
        ppppuStack_138 = (undefined4 ****)pcVar12;
        ppppiStack_dc = (int ****)&ppppiStack_13c;
        ppppiStack_d8 = (int ****)&DAT_004035b8;
        ppppiStack_d4 = (int ****)0x0;
        ppppiStack_d0 = (int ****)0x0;
        ppppuStack_ec = (undefined4 ****)0x0;
        ppppiStack_fc = (int ****)0x0;
        ppppiStack_10c = (int ****)0x0;
        uStack_110 = 0;
        ppppiStack_114 = (int ****)0x0;
        ExceptionList = &piStack_e4;
        ppppiStack_13c = (int ****)CONCAT22((short)((uint)pcVar13 >> 0x10),sVar3 + sVar5);
        __vbaOnError(1);
        if (DAT_0054b000 == 0) {
          fVar14 = ((float10)*unaff_EDI - (float10)*unaff_ESI) / (float10)*unaff_EBX;
        }
        else {
          fVar14 = (float10)adj_fdiv_m32(*unaff_EBX);
        }
        ppppiStack_e8 = (int ****)(float)fVar14;
        if ((uVar4 & 0xd) == 0) {
          if (DAT_0054b000 == 0) {
            fVar14 = ((float10)(float)ppppiStack_e8 * (float10)*pfStack_a4) / (float10)*local_a8;
          }
          else {
            fVar14 = (float10)adj_fdiv_m32(*local_a8);
          }
          *local_b4 = (float)((((float10)(float)ppppiStack_e8 - (float10)*local_b0) + fVar14) *
                              (float10)*pfStack_ac + (float10)*local_b4);
          if ((uVar4 & 0xd) == 0) {
            *local_b0 = (float)ppppiStack_e8;
            if (*pfStack_a0 < *local_b4) {
              if (*pfStack_9c < *local_b4) {
                *local_b4 = *pfStack_9c;
              }
            }
            else {
              *local_b4 = *pfStack_a0;
              *local_b0 = 0.0;
            }
            uVar6 = Ordinal_685();
            piVar9 = (int *)__vbaObjSet(&ppppuStack_ec,uVar6);
            iVar11 = (**(code **)(*piVar9 + 0x1c))(piVar9,&ppppiStack_114);
            if (iVar11 < 0) {
              __vbaHresultCheckObj(iVar11,piVar9,&DAT_0041b0d0,0x1c);
            }
            bVar2 = 0 < (int)ppppiStack_114;
            __vbaFreeObj();
            if (bVar2) {
              __vbaStrCopy();
              if (DAT_0054b010 == (int ****)0x0) {
                __vbaNew2(&DAT_00407e8c,&DAT_0054b010);
              }
              ppppiVar7 = DAT_0054b010;
              ppppiStack_104 = DAT_0054b024;
              ppppiStack_10c = (int ****)0x9;
              ppppiStack_f4 = (undefined4 ****)0x1;
              ppppiStack_fc = (int ****)0x3;
              iVar11 = (*(code *)(*DAT_0054b010)[0xac])
                                 (DAT_0054b010,3,ppppiStack_f8,1,ppppiStack_f0,9,ppppiStack_108,
                                  DAT_0054b024,ppppiStack_100);
              if (iVar11 < 0) {
                __vbaHresultCheckObj(iVar11,ppppiVar7,&DAT_0041aed8,0x2b0);
              }
              uStack_110 = 0;
              iVar11 = (*(code *)(*DAT_0054b024)[0x1bf])(DAT_0054b024,&uStack_110);
              if (iVar11 < 0) {
                __vbaHresultCheckObj(iVar11,DAT_0054b024,&LAB_0041e434,0x6fc);
              }
            }
            __vbaOnError(0);
            __vbaExitProc();
            return;
          }
        }
        __vbaFPException();
        return;
      }
      if (DAT_0054b000 == 0) {
        fVar14 = ((float10)*param_10 * (float10)(double)fVar14 *
                 (float10)(int)(short)(sVar3 + sVar5)) / (float10)100.0;
      }
      else {
        uStack_cc = (double)CONCAT44(0x40590000,(undefined4)uStack_cc);
        fStack_c4 = 0.0;
        ppppiStack_d0 = (int ****)0x512017;
        fVar14 = (float10)adj_fdiv_m64();
      }
      *param_5 = (float)fVar14;
      if ((uVar4 & 0xd) == 0) {
        uStack_cc = (double)CONCAT44(&local_30,&local_2c);
        ppppiStack_d0 = (int ****)&local_28;
        ppppiStack_d4 = &local_24;
        ppppiStack_d8 = (int ****)0x4;
        ppppiStack_dc = (int ****)0x51203e;
        __vbaFreeObjList();
        ppppiStack_dc = local_50;
        ppppiStack_e0 = local_40;
        piStack_e4 = (int *)0x2;
        ppppiStack_e8 = (int ****)0x51204e;
        __vbaFreeVarList();
        fVar14 = (float10)*param_6;
        if (DAT_0054b000 == 0) {
          fVar15 = (float10)*param_5 / (float10)62.4;
        }
        else {
          fStack_c4 = 4.172325e-08;
          uStack_cc = (double)CONCAT44(0x512077,(undefined4)uStack_cc);
          fVar15 = (float10)adj_fdiv_m64();
          fVar14 = extraout_ST1;
        }
        if ((uVar4 & 0xd) == 0) {
          fVar1 = (float)(fVar14 - fVar15 * (float10)*param_7);
          *param_6 = fVar1;
          uStack_cc = (double)CONCAT44(0x3ff4cccc,(undefined4)uStack_cc);
          fStack_c4 = -107374184.0;
          if (DAT_0054b000 == 0) {
            fVar14 = (float10)*param_8 / ((float10)*param_9 - (float10)fVar1);
          }
          else {
            fStack_c4 = *param_8;
            ppppiStack_d4 = (int ****)0x5120c2;
            fVar14 = (float10)adj_fdivr_m32();
          }
          if ((uVar4 & 0xd) == 0) {
            uStack_cc = (double)fVar14;
            ppppiStack_d0 = (int ****)0x5120d8;
            fVar14 = (float10)__vbaPowerR8();
            *param_4 = (float)(fVar14 * (float10)*param_4);
            if (((uVar4 & 0xd) == 0) && (*param_8 = *param_9 - *param_6, (uVar4 & 0xd) == 0))
            goto LAB_005120f9;
          }
        }
      }
      __vbaFPException();
      return;
    }
    *param_5 = 0.0;
  }
LAB_005120f9:
  uStack_cc = (double)CONCAT44(0x5120ff,(undefined4)uStack_cc);
  uVar6 = Ordinal_685();
  uStack_cc = (double)CONCAT44(uVar6,&local_24);
  ppppiStack_d0 = (int ****)0x51210a;
  ppppiVar7 = (int ****)__vbaObjSet();
  ppppiStack_d0 = (int ****)&local_78;
  ppppiStack_d8 = (int ****)0x512116;
  ppppiStack_d4 = ppppiVar7;
  piVar9 = (int *)(*(code *)(*ppppiVar7)[7])();
  if ((int)piVar9 < 0) {
    ppppiStack_d8 = (int ****)0x1c;
    ppppiStack_dc = (int ****)&DAT_0041b0d0;
    ppppiStack_e8 = (int ****)0x51212b;
    piStack_e4 = piVar9;
    ppppiStack_e0 = ppppiVar7;
    __vbaHresultCheckObj();
  }
  bVar2 = 0 < local_78;
  ppppiStack_d8 = (int ****)0x512148;
  __vbaFreeObj();
  if (bVar2) {
    ppppiStack_d8 = (int ****)0x512161;
    __vbaStrCopy();
    if (DAT_0054b010 == (int ****)0x0) {
      ppppiStack_d8 = (int ****)&DAT_0054b010;
      ppppiStack_dc = (int ****)&DAT_00407e8c;
      ppppiStack_e0 = (int ****)0x51217a;
      __vbaNew2();
    }
    ppppiVar7 = DAT_0054b010;
    local_68 = DAT_0054b024;
    local_70 = 9;
    local_58 = 1;
    local_60 = (undefined4 ****)0x3;
    piStack_e4 = (int *)0x9;
    ppppiStack_e0 = local_6c;
    ppppiStack_dc = DAT_0054b024;
    ppppiStack_d8 = (int ****)local_64;
    ppppiStack_f4 = (undefined4 ****)0x3;
    ppppiStack_f0 = local_5c;
    ppppuStack_ec = (undefined4 ****)0x1;
    ppppiStack_e8 = local_54;
    ppppiStack_f8 = DAT_0054b010;
    ppppiStack_fc = (int ****)0x5121d7;
    ppppiVar10 = (int ****)(*(code *)(*DAT_0054b010)[0xac])();
    if ((int)ppppiVar10 < 0) {
      ppppiStack_fc = (int ****)0x2b0;
      ppppiStack_100 = (int ****)&DAT_0041aed8;
      ppppiStack_104 = ppppiVar7;
      ppppiStack_10c = (int ****)0x5121ef;
      ppppiStack_108 = ppppiVar10;
      __vbaHresultCheckObj();
    }
    local_74 = (int ***)0x0;
    ppppiStack_fc = &local_74;
    ppppiStack_100 = DAT_0054b024;
    ppppiStack_104 = (int ****)0x512208;
    piVar9 = (int *)(*(code *)(*DAT_0054b024)[0x1bf])();
    if ((int)piVar9 < 0) {
      ppppiStack_d8 = (int ****)0x6fc;
      ppppiStack_dc = (int ****)&LAB_0041e434;
      ppppiStack_e0 = DAT_0054b024;
      ppppiStack_e8 = (int ****)0x512226;
      piStack_e4 = piVar9;
      __vbaHresultCheckObj();
    }
  }
  ppppiStack_d8 = (int ****)0x0;
  ppppiStack_dc = (int ****)0x51222e;
  __vbaOnError();
  ppppiStack_dc = (int ****)0x512234;
  __vbaExitProc();
  return;
}

