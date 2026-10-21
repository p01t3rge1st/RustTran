
float10 __cdecl FUN_0049b430(int *param_1,int *param_2,short *param_3,float *param_4,float *param_5)

{
  float fVar1;
  float fVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined *puVar9;
  int *piVar10;
  int extraout_ECX;
  short *psVar11;
  int extraout_ECX_00;
  int extraout_EDX;
  int extraout_EDX_00;
  short sVar12;
  undefined2 uVar13;
  uint uVar14;
  float *unaff_EDI;
  int iVar15;
  int iVar16;
  bool bVar17;
  ushort in_FPUStatusWord;
  ushort uVar18;
  float10 fVar19;
  undefined **ppuVar20;
  int *piStack_c4;
  int *piStack_c0;
  undefined4 *puStack_bc;
  undefined *puStack_b8;
  undefined4 uStack_b4;
  int local_a0;
  int local_94;
  int local_54;
  int local_50;
  undefined4 local_4c;
  undefined4 local_48;
  int *local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  void *pvStack_24;
  undefined1 *puStack_20;
  undefined1 *local_1c;
  undefined *local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_8;
  
  puStack_20 = &LAB_00404716;
  pvStack_24 = ExceptionList;
  local_1c = &stack0xffffff50;
  local_18 = &DAT_00401bf0;
  local_14 = 0;
  local_10 = 0;
  local_2c = 0;
  local_3c = 0;
  local_4c = 0;
  local_50 = 0;
  local_54 = 0;
  local_8 = 2;
  uStack_b4 = 1;
  puStack_b8 = (undefined *)0x49b48c;
  ExceptionList = &pvStack_24;
  __vbaOnError();
  local_8 = 3;
  if (DAT_0054b000 != 0) {
    puStack_b8 = (undefined *)0x40000000;
    puStack_bc = (undefined4 *)0x0;
    piStack_c0 = (int *)0x49b4cd;
    adj_fdiv_m64();
  }
  if ((in_FPUStatusWord & 0xd) != 0) {
LAB_0049bdd1:
    fVar19 = (float10)__vbaFPException();
    return fVar19;
  }
  puStack_b8 = (undefined *)0x49b4dd;
  uVar4 = __vbaFpI2();
  local_8 = 4;
  psVar11 = (short *)*param_1;
  local_28 = uVar4;
  if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
    puStack_b8 = (undefined *)0x49b51a;
    iVar5 = __vbaGenerateBoundsError();
  }
  else {
    iVar5 = *(int *)(psVar11 + 10);
    if (*(uint *)(psVar11 + 8) <= 2U - iVar5) {
      puStack_b8 = (undefined *)0x49b50b;
      __vbaGenerateBoundsError();
    }
    iVar5 = (2U - iVar5) * 4;
  }
  psVar11 = (short *)*param_1;
  if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
    puStack_b8 = (undefined *)0x49b54d;
    iVar6 = __vbaGenerateBoundsError();
  }
  else {
    iVar6 = *(int *)(psVar11 + 10);
    if (*(uint *)(psVar11 + 8) <= 1U - iVar6) {
      puStack_b8 = (undefined *)0x49b53e;
      __vbaGenerateBoundsError();
    }
    iVar6 = (1U - iVar6) * 4;
  }
  psVar11 = (short *)*param_1;
  if (*(float *)(*(int *)(psVar11 + 6) + iVar6) < *(float *)(*(int *)(psVar11 + 6) + iVar5)) {
    do {
      while( true ) {
        local_8 = 5;
        sVar12 = (short)uVar4;
        if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
          puStack_b8 = (undefined *)0x49b597;
          iVar5 = __vbaGenerateBoundsError();
        }
        else {
          iVar5 = *(int *)(psVar11 + 10);
          if (*(uint *)(psVar11 + 8) <= (uint)(sVar12 - iVar5)) {
            puStack_b8 = (undefined *)0x49b588;
            __vbaGenerateBoundsError();
          }
          iVar5 = (sVar12 - iVar5) * 4;
        }
        psVar11 = (short *)*param_1;
        fVar1 = *param_4;
        fVar2 = *(float *)(*(int *)(psVar11 + 6) + iVar5);
        if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
          puStack_b8 = (undefined *)0x49b5ee;
          iVar5 = __vbaGenerateBoundsError();
        }
        else {
          if (SCARRY2(sVar12,1)) goto LAB_0049bdd6;
          uVar14 = (int)(short)(sVar12 + 1) - *(int *)(psVar11 + 10);
          if (*(uint *)(psVar11 + 8) <= uVar14) {
            puStack_b8 = (undefined *)0x49b5df;
            __vbaGenerateBoundsError();
          }
          iVar5 = uVar14 * 4;
        }
        psVar11 = (short *)*param_1;
        uVar18 = 0;
        if (fVar2 <= fVar1 && *param_4 <= *(float *)(*(int *)(psVar11 + 6) + iVar5)) {
          local_8 = 6;
          psVar11 = (short *)*param_2;
          if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
            puStack_b8 = (undefined *)0x49b704;
            local_28 = uVar4;
            iVar5 = __vbaGenerateBoundsError();
          }
          else {
            iVar5 = *(int *)(psVar11 + 10);
            local_28 = uVar4;
            if (*(uint *)(psVar11 + 8) <= (uint)(sVar12 - iVar5)) {
              puStack_b8 = (undefined *)0x49b6f5;
              __vbaGenerateBoundsError();
            }
            iVar5 = (sVar12 - iVar5) * 4;
          }
          psVar11 = (short *)*param_2;
          if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
            puStack_b8 = (undefined *)0x49b749;
            local_94 = __vbaGenerateBoundsError();
          }
          else {
            if (SCARRY2(sVar12,1)) goto LAB_0049bdd6;
            uVar14 = (int)(short)(sVar12 + 1) - *(int *)(psVar11 + 10);
            if (*(uint *)(psVar11 + 8) <= uVar14) {
              puStack_b8 = (undefined *)0x49b734;
              __vbaGenerateBoundsError();
            }
            local_94 = uVar14 * 4;
          }
          psVar11 = (short *)*param_2;
          if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
            puStack_b8 = (undefined *)0x49b77e;
            iVar6 = __vbaGenerateBoundsError();
          }
          else {
            iVar6 = *(int *)(psVar11 + 10);
            if (*(uint *)(psVar11 + 8) <= (uint)(sVar12 - iVar6)) {
              puStack_b8 = (undefined *)0x49b76f;
              __vbaGenerateBoundsError();
            }
            iVar6 = (sVar12 - iVar6) * 4;
          }
          psVar11 = (short *)*param_1;
          if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
            puStack_b8 = (undefined *)0x49b7bd;
            iVar7 = __vbaGenerateBoundsError();
          }
          else {
            if (SCARRY2(sVar12,1)) goto LAB_0049bdd6;
            uVar14 = (int)(short)(sVar12 + 1) - *(int *)(psVar11 + 10);
            if (*(uint *)(psVar11 + 8) <= uVar14) {
              puStack_b8 = (undefined *)0x49b7ae;
              __vbaGenerateBoundsError();
            }
            iVar7 = uVar14 * 4;
          }
          psVar11 = (short *)*param_1;
          if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
            puStack_b8 = (undefined *)0x49b7ef;
            iVar8 = __vbaGenerateBoundsError();
          }
          else {
            iVar15 = (int)(short)local_28;
            iVar8 = *(int *)(psVar11 + 10);
            if (*(uint *)(psVar11 + 8) <= (uint)(iVar15 - iVar8)) {
              puStack_b8 = (undefined *)0x49b7e0;
              __vbaGenerateBoundsError();
            }
            iVar8 = (iVar15 - iVar8) * 4;
          }
          psVar11 = (short *)*param_1;
          if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
            puStack_b8 = (undefined *)0x49b821;
            puVar9 = (undefined *)__vbaGenerateBoundsError();
          }
          else {
            iVar16 = (int)(short)local_28;
            iVar15 = *(int *)(psVar11 + 10);
            if (*(uint *)(psVar11 + 8) <= (uint)(iVar16 - iVar15)) {
              puStack_b8 = (undefined *)0x49b812;
              __vbaGenerateBoundsError();
            }
            puVar9 = (undefined *)((iVar16 - iVar15) * 4);
          }
          iVar15 = *(int *)(*param_2 + 0xc);
          iVar16 = *(int *)(*param_1 + 0xc);
          if (DAT_0054b000 == 0) {
            fVar19 = ((float10)*(float *)(iVar15 + local_94) - (float10)*(float *)(iVar15 + iVar6))
                     / ((float10)*(float *)(iVar16 + iVar7) - (float10)*(float *)(iVar16 + iVar8));
          }
          else {
            puStack_bc = (undefined4 *)0x49b85e;
            puStack_b8 = puVar9;
            fVar19 = (float10)adj_fdiv_r();
            puVar9 = puStack_b8;
            iVar15 = extraout_ECX;
            iVar16 = extraout_EDX;
          }
          *param_5 = (float)(((float10)*param_4 - (float10)*(float *)(puVar9 + iVar16)) * fVar19 +
                            (float10)*(float *)(iVar15 + iVar5));
          goto joined_r0x0049b87b;
        }
        local_8 = 7;
        sVar3 = *param_3;
        if (SBORROW2(sVar3,1)) goto LAB_0049bdd6;
        if (sVar12 == (short)(sVar3 + -1)) {
          local_8 = 8;
          local_28 = uVar4;
          goto LAB_0049bbc5;
        }
        if (sVar12 == 1) {
          local_8 = 10;
          local_28 = uVar4;
          goto LAB_0049bbe9;
        }
        local_8 = 0xb;
        if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
          puStack_b8 = (undefined *)0x49b688;
          iVar5 = __vbaGenerateBoundsError();
        }
        else {
          if (SCARRY2(sVar12,1)) goto LAB_0049bdd6;
          uVar14 = (int)(short)(sVar12 + 1) - *(int *)(psVar11 + 10);
          if (*(uint *)(psVar11 + 8) <= uVar14) {
            puStack_b8 = (undefined *)0x49b679;
            __vbaGenerateBoundsError();
          }
          iVar5 = uVar14 * 4;
        }
        psVar11 = (short *)*param_1;
        uVar13 = (undefined2)((uint)uVar4 >> 0x10);
        if (*param_4 <= *(float *)(*(int *)(psVar11 + 6) + iVar5)) break;
        local_8 = 0xc;
        uVar4 = CONCAT22(uVar13,sVar12 + 1);
        if (SCARRY2(sVar12,1)) goto LAB_0049bdd6;
      }
      local_8 = 0xd;
      uVar4 = CONCAT22(uVar13,sVar12 + -1);
    } while (!SBORROW2(sVar12,1));
  }
  else {
    do {
      local_8 = 0xe;
      sVar12 = (short)uVar4;
      if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
        puStack_b8 = (undefined *)0x49b8db;
        iVar5 = __vbaGenerateBoundsError();
      }
      else {
        iVar5 = *(int *)(psVar11 + 10);
        if (*(uint *)(psVar11 + 8) <= (uint)(sVar12 - iVar5)) {
          puStack_b8 = (undefined *)0x49b8cc;
          __vbaGenerateBoundsError();
        }
        iVar5 = (sVar12 - iVar5) * 4;
      }
      psVar11 = (short *)*param_1;
      fVar1 = *param_4;
      fVar2 = *(float *)(*(int *)(psVar11 + 6) + iVar5);
      if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
        puStack_b8 = (undefined *)0x49b932;
        iVar5 = __vbaGenerateBoundsError();
      }
      else {
        if (SCARRY2(sVar12,1)) break;
        uVar14 = (int)(short)(sVar12 + 1) - *(int *)(psVar11 + 10);
        if (*(uint *)(psVar11 + 8) <= uVar14) {
          puStack_b8 = (undefined *)0x49b923;
          __vbaGenerateBoundsError();
        }
        iVar5 = uVar14 * 4;
      }
      psVar11 = (short *)*param_1;
      uVar18 = 0;
      if (fVar1 <= fVar2 && *(float *)(*(int *)(psVar11 + 6) + iVar5) <= *param_4) {
        local_8 = 0xf;
        psVar11 = (short *)*param_2;
        if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
          puStack_b8 = (undefined *)0x49ba3c;
          local_28 = uVar4;
          iVar5 = __vbaGenerateBoundsError();
        }
        else {
          iVar5 = *(int *)(psVar11 + 10);
          local_28 = uVar4;
          if (*(uint *)(psVar11 + 8) <= (uint)(sVar12 - iVar5)) {
            puStack_b8 = (undefined *)0x49ba2d;
            __vbaGenerateBoundsError();
          }
          iVar5 = (sVar12 - iVar5) * 4;
        }
        psVar11 = (short *)*param_2;
        if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
          puStack_b8 = (undefined *)0x49ba81;
          local_a0 = __vbaGenerateBoundsError();
        }
        else {
          if (SCARRY2(sVar12,1)) break;
          uVar14 = (int)(short)(sVar12 + 1) - *(int *)(psVar11 + 10);
          if (*(uint *)(psVar11 + 8) <= uVar14) {
            puStack_b8 = (undefined *)0x49ba6c;
            __vbaGenerateBoundsError();
          }
          local_a0 = uVar14 * 4;
        }
        psVar11 = (short *)*param_2;
        if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
          puStack_b8 = (undefined *)0x49bab6;
          iVar6 = __vbaGenerateBoundsError();
        }
        else {
          iVar6 = *(int *)(psVar11 + 10);
          if (*(uint *)(psVar11 + 8) <= (uint)(sVar12 - iVar6)) {
            puStack_b8 = (undefined *)0x49baa7;
            __vbaGenerateBoundsError();
          }
          iVar6 = (sVar12 - iVar6) * 4;
        }
        psVar11 = (short *)*param_1;
        if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
          puStack_b8 = (undefined *)0x49baf5;
          iVar7 = __vbaGenerateBoundsError();
        }
        else {
          if (SCARRY2(sVar12,1)) break;
          uVar14 = (int)(short)(sVar12 + 1) - *(int *)(psVar11 + 10);
          if (*(uint *)(psVar11 + 8) <= uVar14) {
            puStack_b8 = (undefined *)0x49bae6;
            __vbaGenerateBoundsError();
          }
          iVar7 = uVar14 * 4;
        }
        psVar11 = (short *)*param_1;
        if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
          puStack_b8 = (undefined *)0x49bb27;
          iVar8 = __vbaGenerateBoundsError();
        }
        else {
          iVar15 = (int)(short)local_28;
          iVar8 = *(int *)(psVar11 + 10);
          if (*(uint *)(psVar11 + 8) <= (uint)(iVar15 - iVar8)) {
            puStack_b8 = (undefined *)0x49bb18;
            __vbaGenerateBoundsError();
          }
          iVar8 = (iVar15 - iVar8) * 4;
        }
        psVar11 = (short *)*param_1;
        if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
          puStack_b8 = (undefined *)0x49bb59;
          puVar9 = (undefined *)__vbaGenerateBoundsError();
        }
        else {
          iVar16 = (int)(short)local_28;
          iVar15 = *(int *)(psVar11 + 10);
          if (*(uint *)(psVar11 + 8) <= (uint)(iVar16 - iVar15)) {
            puStack_b8 = (undefined *)0x49bb4a;
            __vbaGenerateBoundsError();
          }
          puVar9 = (undefined *)((iVar16 - iVar15) * 4);
        }
        iVar15 = *(int *)(*param_2 + 0xc);
        iVar16 = *(int *)(*param_1 + 0xc);
        if (DAT_0054b000 == 0) {
          fVar19 = ((float10)*(float *)(iVar15 + local_a0) - (float10)*(float *)(iVar15 + iVar6)) /
                   ((float10)*(float *)(iVar16 + iVar7) - (float10)*(float *)(iVar16 + iVar8));
        }
        else {
          puStack_bc = (undefined4 *)0x49bb96;
          puStack_b8 = puVar9;
          fVar19 = (float10)adj_fdiv_r();
          puVar9 = puStack_b8;
          iVar15 = extraout_ECX_00;
          iVar16 = extraout_EDX_00;
        }
        *param_5 = (float)(((float10)*param_4 - (float10)*(float *)(puVar9 + iVar16)) * fVar19 +
                          (float10)*(float *)(iVar15 + iVar5));
joined_r0x0049b87b:
        if ((uVar18 & 0xd) != 0) goto LAB_0049bdd1;
        goto LAB_0049bc27;
      }
      local_8 = 0x10;
      sVar3 = *param_3;
      if (SBORROW2(sVar3,1)) break;
      if (sVar12 == (short)(sVar3 + -1)) {
        local_8 = 0x11;
        local_28 = uVar4;
LAB_0049bbc5:
        psVar11 = (short *)*param_2;
        if ((psVar11 != (short *)0x0) && (*psVar11 == 1)) {
          uVar14 = (int)sVar3 - *(int *)(psVar11 + 10);
          bVar17 = uVar14 < *(uint *)(psVar11 + 8);
          goto LAB_0049bc03;
        }
LAB_0049bc14:
        puStack_b8 = (undefined *)0x49bc1a;
        iVar5 = __vbaGenerateBoundsError();
LAB_0049bc1a:
        *param_5 = *(float *)(*(int *)(*param_2 + 0xc) + iVar5);
LAB_0049bc27:
        local_8 = 0x17;
        puStack_b8 = (undefined *)0x49bc3a;
        fVar19 = (float10)__vbaFpR4();
        if ((float10)*param_5 < fVar19) {
          *param_5 = 0.0;
        }
        local_8 = 0x19;
        puStack_b8 = (undefined *)0x49bc5d;
        puStack_b8 = (undefined *)Ordinal_685();
        puStack_bc = &local_2c;
        piStack_c0 = (int *)0x49bc68;
        piVar10 = (int *)__vbaObjSet();
        piStack_c0 = &local_54;
        piStack_c4 = piVar10;
        iVar5 = (**(code **)(*piVar10 + 0x1c))();
        if (iVar5 < 0) {
          __vbaHresultCheckObj(iVar5,piVar10,&DAT_0041b0d0,0x1c);
        }
        bVar17 = 0 < local_54;
        __vbaFreeObj();
        if (bVar17) {
          local_8 = 0x1a;
          __vbaStrCopy();
          local_8 = 0x1b;
          if (DAT_0054b010 == (int *)0x0) {
            __vbaNew2(&DAT_00407e8c,&DAT_0054b010);
          }
          piVar10 = DAT_0054b010;
          local_44 = DAT_0054b024;
          local_4c = 9;
          local_34 = 1;
          local_3c = 3;
          iVar5 = (**(code **)(*DAT_0054b010 + 0x2b0))
                            (DAT_0054b010,3,local_38,1,local_30,9,local_48,DAT_0054b024,local_40);
          if (iVar5 < 0) {
            __vbaHresultCheckObj(iVar5,piVar10,&DAT_0041aed8,0x2b0);
          }
          local_8 = 0x1c;
          local_50 = 0;
          iVar5 = (**(code **)(*DAT_0054b024 + 0x6fc))(DAT_0054b024,&local_50);
          if (iVar5 < 0) {
            __vbaHresultCheckObj(iVar5,DAT_0054b024,&LAB_0041e434,0x6fc);
          }
        }
        local_8 = 0x1d;
        __vbaOnError(0);
        fVar19 = (float10)__vbaExitProc();
        return fVar19;
      }
      if (sVar12 == 1) {
        local_8 = 0x13;
        local_28 = uVar4;
LAB_0049bbe9:
        psVar11 = (short *)*param_2;
        if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) goto LAB_0049bc14;
        uVar14 = 1 - *(int *)(psVar11 + 10);
        bVar17 = uVar14 < *(uint *)(psVar11 + 8);
LAB_0049bc03:
        if (!bVar17) {
          puStack_b8 = (undefined *)0x49bc0b;
          __vbaGenerateBoundsError();
        }
        iVar5 = uVar14 * 4;
        goto LAB_0049bc1a;
      }
      local_8 = 0x14;
      if ((psVar11 == (short *)0x0) || (*psVar11 != 1)) {
        puStack_b8 = (undefined *)0x49b9cc;
        iVar5 = __vbaGenerateBoundsError();
      }
      else {
        if (SCARRY2(sVar12,1)) break;
        uVar14 = (int)(short)(sVar12 + 1) - *(int *)(psVar11 + 10);
        if (*(uint *)(psVar11 + 8) <= uVar14) {
          puStack_b8 = (undefined *)0x49b9bd;
          __vbaGenerateBoundsError();
        }
        iVar5 = uVar14 * 4;
      }
      psVar11 = (short *)*param_1;
      if (*(float *)(*(int *)(psVar11 + 6) + iVar5) <= *param_4) {
        local_8 = 0x16;
        bVar17 = SBORROW2(sVar12,1);
        sVar12 = sVar12 + -1;
      }
      else {
        local_8 = 0x15;
        bVar17 = SCARRY2(sVar12,1);
        sVar12 = sVar12 + 1;
      }
      uVar4 = CONCAT22((short)((uint)uVar4 >> 0x10),sVar12);
    } while (!bVar17);
  }
LAB_0049bdd6:
  puStack_b8 = (undefined *)0x49bddc;
  __vbaErrorOverflow();
  ppuVar20 = &puStack_b8;
  piStack_c4 = (int *)0x0;
  piStack_c0 = (int *)0x2c;
  puStack_bc = (undefined4 *)&DAT_0054b390;
  puStack_b8 = &DAT_0054b374;
  FUN_0049b430((int *)ppuVar20,(int *)&puStack_bc,(short *)&piStack_c0,unaff_EDI,
               (float *)&piStack_c4);
  return (float10)(float)ppuVar20;
}

