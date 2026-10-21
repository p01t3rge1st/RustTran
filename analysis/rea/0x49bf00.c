
/* WARNING: Removing unreachable block (ram,0x0049c17e) */
/* WARNING: Type propagation algorithm not settling */

void __cdecl FUN_0049bf00(float *param_1)

{
  bool bVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  float10 fVar5;
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
  local_18 = &stack0xffffff84;
  local_14 = &DAT_00401c68;
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
  fVar5 = (float10)Ordinal_587((double)*param_1);
  local_28 = (float)fVar5;
  fVar5 = (float10)__vbaFpR4();
  if (fVar5 < (float10)*param_1) {
    local_28 = local_28 - 7.0;
    local_24 = (((((local_28 * -0.00026381 + 0.00142678) * local_28 + 0.0021252) * local_28 +
                 0.00119227) * local_28 + 0.00197421) * local_28 + 0.00404696) * local_28 +
               0.02196328;
  }
  else {
    local_24 = (((((((local_28 * 4.68e-09 - 7.47e-08) * local_28 + 3.9696e-07) * local_28 -
                   3.6945e-07) * local_28 - 2.04944e-06) * local_28 + 6.7462797e-06) * local_28 +
                3.313274e-05) * local_28 + 0.00010394514) * local_28 + 0.016140835;
  }
  uVar2 = Ordinal_685();
  piVar3 = (int *)__vbaObjSet(&local_2c,uVar2);
  iVar4 = (**(code **)(*piVar3 + 0x1c))(piVar3,local_54);
  if (iVar4 < 0) {
    __vbaHresultCheckObj(iVar4,piVar3,&DAT_0041b0d0,0x1c);
  }
  bVar1 = 0 < local_54[0];
  __vbaFreeObj();
  if (bVar1) {
    __vbaStrCopy();
    if (DAT_0054b010 == (int *)0x0) {
      __vbaNew2(&DAT_00407e8c,&DAT_0054b010);
    }
    piVar3 = DAT_0054b010;
    local_44 = DAT_0054b024;
    local_54[2] = 9;
    local_34 = 1;
    local_3c = 3;
    iVar4 = (**(code **)(*DAT_0054b010 + 0x2b0))
                      (DAT_0054b010,3,local_38,1,local_30,9,local_54[3],DAT_0054b024,local_40);
    if (iVar4 < 0) {
      __vbaHresultCheckObj(iVar4,piVar3,&DAT_0041aed8,0x2b0);
    }
    local_54[1] = 0;
    iVar4 = (**(code **)(*DAT_0054b024 + 0x6fc))(DAT_0054b024,local_54 + 1);
    if (iVar4 < 0) {
      __vbaHresultCheckObj(iVar4,DAT_0054b024,&LAB_0041e434,0x6fc);
    }
  }
  __vbaOnError(0);
  __vbaExitProc();
  return;
}

