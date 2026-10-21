
/* WARNING: Type propagation algorithm not settling */

void FUN_0049a4f0(void)

{
  bool bVar1;
  short sVar2;
  undefined4 uVar3;
  int *piVar4;
  int iVar5;
  ushort in_FPUStatusWord;
  float10 fVar6;
  int local_a8 [4];
  undefined4 local_98;
  undefined4 local_90 [2];
  float local_88;
  undefined4 local_80;
  undefined4 local_7c;
  int *local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60 [4];
  undefined4 local_50 [4];
  undefined4 local_40 [4];
  undefined4 local_30 [2];
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
  local_18 = &stack0xffffff30;
  local_14 = &DAT_004019c0;
  local_10 = 0;
  local_c = 0;
  local_24 = 0.0;
  local_30[0] = 0;
  local_40[0] = 0;
  local_50[0] = 0;
  local_60[0] = 0;
  local_70 = 0;
  local_80 = 0;
  local_90[0] = 0;
  local_a8[2] = 0;
  local_a8[1] = 0;
  local_a8[0] = 0;
  ExceptionList = &pvStack_20;
  __vbaOnError(1);
  local_68 = 0;
  local_64 = 0x40240000;
  local_70 = 0x8005;
  uVar3 = __vbaVarVargNofree();
  sVar2 = __vbaVarTstLt(&local_70,uVar3);
  if (sVar2 == 0) {
    local_68 = 0;
    local_64 = 0x4062c000;
    local_70 = 0x8005;
    uVar3 = __vbaVarVargNofree();
    sVar2 = __vbaVarTstLt(&local_70,uVar3);
    if (sVar2 == 0) {
      local_68 = 0;
      local_64 = 0x414e8480;
      local_70 = 0x8005;
      uVar3 = __vbaVarVargNofree();
      sVar2 = __vbaVarTstLt(&local_70,uVar3);
      if (sVar2 == 0) {
        local_98 = 0x3e883127;
        local_28 = 0.335;
      }
      else {
        local_98 = 0x3e051eb8;
        local_28 = 0.283;
      }
    }
    else {
      local_98 = 0x3d9ce076;
      local_28 = 0.181;
    }
  }
  else {
    local_98 = 0x3d76fd22;
    local_28 = 0.0639;
  }
  local_a8[2] = 4;
  local_68 = 0x9999999a;
  local_64 = 0x3fb99999;
  local_70 = 5;
  local_88 = -local_28;
  if ((in_FPUStatusWord & 0xd) == 0) {
    local_90[0] = 4;
    uVar3 = __vbaVarVargNofree(local_a8 + 2);
    uVar3 = __vbaVarAdd(local_40,&local_70,uVar3);
    uVar3 = __vbaVarPow(local_50,local_90,uVar3);
    uVar3 = __vbaVarMul(local_60,uVar3);
    fVar6 = (float10)__vbaR4Var(uVar3);
    local_24 = (float)fVar6;
    __vbaFreeVar();
    uVar3 = Ordinal_685();
    piVar4 = (int *)__vbaObjSet(local_30,uVar3);
    iVar5 = (**(code **)(*piVar4 + 0x1c))(piVar4,local_a8);
    if (iVar5 < 0) {
      __vbaHresultCheckObj(iVar5,piVar4,&DAT_0041b0d0,0x1c);
    }
    bVar1 = 0 < local_a8[0];
    __vbaFreeObj();
    if (bVar1) {
      __vbaStrCopy();
      if (DAT_0054b010 == (int *)0x0) {
        __vbaNew2(&DAT_00407e8c,&DAT_0054b010);
      }
      piVar4 = DAT_0054b010;
      local_78 = DAT_0054b024;
      local_80 = 9;
      local_68 = 1;
      local_70 = 3;
      iVar5 = (**(code **)(*DAT_0054b010 + 0x2b0))
                        (DAT_0054b010,3,local_6c,1,local_64,9,local_7c,DAT_0054b024,local_74);
      if (iVar5 < 0) {
        __vbaHresultCheckObj(iVar5,piVar4,&DAT_0041aed8,0x2b0);
      }
      local_a8[1] = 0;
      iVar5 = (**(code **)(*DAT_0054b024 + 0x6fc))(DAT_0054b024,local_a8 + 1);
      if (iVar5 < 0) {
        __vbaHresultCheckObj(iVar5,DAT_0054b024,&LAB_0041e434,0x6fc);
      }
    }
    __vbaOnError(0);
    __vbaExitProc();
    return;
  }
  __vbaFPException();
  return;
}

