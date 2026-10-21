
/* WARNING: Type propagation algorithm not settling */

void __cdecl FUN_0049ae10(float *param_1)

{
  float fVar1;
  bool bVar2;
  undefined4 uVar3;
  int *piVar4;
  int iVar5;
  ushort uVar6;
  float10 fVar7;
  float10 fVar8;
  float10 fVar9;
  int local_54 [4];
  int *local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
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
  local_18 = &stack0xffffff6c;
  local_14 = &DAT_00401ae0;
  local_10 = 0;
  local_c = 0;
  local_24 = 0.0;
  local_2c = 0;
  local_3c = 0;
  local_54[2] = 0;
  local_54[1] = 0;
  local_54[0] = 0;
  ExceptionList = &pvStack_20;
  __vbaOnError(1);
  fVar7 = (float10)Ordinal_587((double)*param_1);
  local_28 = (float)fVar7;
  fVar7 = (float10)__vbaFpR4();
  uVar6 = 0;
  if (fVar7 < (float10)*param_1) {
    fVar7 = (float10)__vbaFpR4();
    uVar6 = 0;
    if (fVar7 < (float10)*param_1) {
      local_28 = local_28 - 7.0;
      fVar7 = ((((((float10)local_28 * (float10)3.7170416 - (float10)9.1118126) * (float10)local_28
                 - (float10)24.44781) * (float10)local_28 - (float10)27.217176) * (float10)local_28
               - (float10)44.206896) * (float10)local_28 - (float10)46.351642) * (float10)local_28 +
              (float10)1187.6082;
    }
    else {
      fVar1 = *param_1;
      fVar7 = (float10)__vbaPowerR8((double)*param_1,0,0x40000000);
      if ((uVar6 & 0xd) != 0) goto LAB_0049b138;
      fVar8 = (float10)__vbaPowerR8((double)*param_1,0,0x40080000);
      if ((uVar6 & 0xd) != 0) goto LAB_0049b138;
      fVar9 = (float10)__vbaPowerR8((double)*param_1,0,0x40100000);
      fVar7 = (float10)(double)(fVar8 * (float10)4.5502391e-08 +
                               (float10)(double)((float10)(fVar1 * 0.06416805 + 1192.51) -
                                                fVar7 * (float10)9.9871952e-05)) -
              fVar9 * (float10)9.3721615e-12;
    }
  }
  else {
    fVar7 = (((((((float10)local_28 * (float10)-3.674e-05 - (float10)0.0005862) * (float10)local_28
                + (float10)0.0043507598) * (float10)local_28 - (float10)0.01453504) *
               (float10)local_28 + (float10)0.022775919) * (float10)local_28 + (float10)0.85550917)
             * (float10)local_28 + (float10)14.228318) * (float10)local_28 + (float10)1105.9625;
  }
  local_24 = (float)fVar7;
  if ((uVar6 & 0xd) == 0) {
    uVar3 = Ordinal_685();
    piVar4 = (int *)__vbaObjSet(&local_2c,uVar3);
    iVar5 = (**(code **)(*piVar4 + 0x1c))(piVar4,local_54);
    if (iVar5 < 0) {
      __vbaHresultCheckObj(iVar5,piVar4,&DAT_0041b0d0,0x1c);
    }
    bVar2 = 0 < local_54[0];
    __vbaFreeObj();
    if (bVar2) {
      __vbaStrCopy();
      if (DAT_0054b010 == (int *)0x0) {
        __vbaNew2(&DAT_00407e8c,&DAT_0054b010);
      }
      piVar4 = DAT_0054b010;
      local_44 = DAT_0054b024;
      local_54[2] = 9;
      local_34 = 1;
      local_3c = 3;
      iVar5 = (**(code **)(*DAT_0054b010 + 0x2b0))
                        (DAT_0054b010,3,local_38,1,local_30,9,local_54[3],DAT_0054b024,local_40);
      if (iVar5 < 0) {
        __vbaHresultCheckObj(iVar5,piVar4,&DAT_0041aed8,0x2b0);
      }
      local_54[1] = 0;
      iVar5 = (**(code **)(*DAT_0054b024 + 0x6fc))(DAT_0054b024,local_54 + 1);
      if (iVar5 < 0) {
        __vbaHresultCheckObj(iVar5,DAT_0054b024,&LAB_0041e434,0x6fc);
      }
    }
    __vbaOnError(0);
    __vbaExitProc();
    return;
  }
LAB_0049b138:
  __vbaFPException();
  return;
}

