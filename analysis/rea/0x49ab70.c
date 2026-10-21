
/* WARNING: Removing unreachable block (ram,0x0049ae09) */
/* WARNING: Type propagation algorithm not settling */

void __cdecl FUN_0049ab70(float *param_1)

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
  local_14 = &DAT_00401a10;
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
    local_24 = ((((((local_28 * -0.5872871 + 1.1490811) * local_28 + 7.4153447) * local_28 + 10.8019
                  ) * local_28 + 13.891584) * local_28 + 37.492428) * local_28 + 160.78159) *
               local_28 + 557.1534;
  }
  else {
    local_24 = (((((((((local_28 * -4.771e-05 + 0.00084618) * local_28 - 0.00533926) * local_28 +
                     0.01203737) * local_28 + 0.00908507) * local_28 - 0.06628012) * local_28 +
                  0.04103109) * local_28 + 0.2876651) * local_28 + 2.2225854) * local_28 + 33.320423
               ) * local_28 + 69.79554;
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

