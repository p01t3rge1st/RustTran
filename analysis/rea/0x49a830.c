
/* WARNING: Type propagation algorithm not settling */

void FUN_0049a830(void)

{
  bool bVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  float fVar5;
  ushort uVar6;
  float10 fVar7;
  int local_b4 [6];
  undefined4 local_9c [2];
  float local_94;
  undefined4 local_90;
  undefined4 local_8c;
  undefined4 local_88;
  int *local_84;
  undefined4 local_80;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c [4];
  undefined4 local_5c [4];
  undefined4 local_4c [4];
  undefined4 local_3c [4];
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
  local_18 = &stack0xffffff24;
  local_14 = &DAT_004019e8;
  local_10 = 0;
  local_c = 0;
  local_2c = 0;
  local_3c[0] = 0;
  local_4c[0] = 0;
  local_5c[0] = 0;
  local_6c[0] = 0;
  local_7c = 0;
  local_8c = 0;
  local_9c[0] = 0;
  local_b4[2] = 0;
  local_b4[1] = 0;
  local_b4[0] = 0;
  ExceptionList = &pvStack_20;
  __vbaOnError(1);
  local_94 = -5.189695e+11;
  local_90 = 0x3f50624d;
  local_9c[0] = 5;
  uVar2 = __vbaVarVargNofree();
  uVar2 = __vbaVarVargNofree(uVar2);
  uVar2 = __vbaVarSub(local_3c,uVar2);
  uVar2 = __vbaVarVargNofree(uVar2);
  uVar2 = __vbaVarAdd(local_4c,local_9c,uVar2);
  uVar2 = __vbaVarDiv(local_5c,uVar2);
  uVar2 = __vbaVarAbs(local_6c,uVar2);
  fVar7 = (float10)__vbaR4Var(uVar2);
  local_28 = (float)fVar7;
  __vbaFreeVar();
  fVar5 = 1.0;
  uVar6 = 0;
  if (2.0 < local_28) {
    if (DAT_0054b000 == 0) {
      fVar7 = (float10)1.0 / (float10)local_28;
    }
    else {
      fVar7 = (float10)adj_fdiv_m32(local_28);
    }
    fVar5 = (float)fVar7;
    local_24 = fVar5;
    if ((uVar6 & 0xd) != 0) {
      __vbaFPException();
      return;
    }
  }
  local_9c[0] = 4;
  local_94 = fVar5;
  uVar2 = __vbaVarVargNofree();
  uVar2 = __vbaVarVargNofree(uVar2);
  uVar2 = __vbaVarVargNofree(uVar2);
  uVar2 = __vbaVarMul(local_3c,uVar2);
  uVar2 = __vbaVarMul(local_4c,local_9c,uVar2);
  __vbaVarAdd(local_5c,uVar2);
  __vbaVargVarMove();
  __vbaVarVargNofree();
  __vbaVargVarCopy();
  uVar2 = Ordinal_685();
  piVar3 = (int *)__vbaObjSet(&local_2c,uVar2);
  iVar4 = (**(code **)(*piVar3 + 0x1c))(piVar3,local_b4);
  if (iVar4 < 0) {
    __vbaHresultCheckObj(iVar4,piVar3,&DAT_0041b0d0,0x1c);
  }
  bVar1 = 0 < local_b4[0];
  __vbaFreeObj();
  if (bVar1) {
    __vbaStrCopy();
    if (DAT_0054b010 == (int *)0x0) {
      __vbaNew2(&DAT_00407e8c,&DAT_0054b010);
    }
    piVar3 = DAT_0054b010;
    local_84 = DAT_0054b024;
    local_8c = 9;
    local_74 = 1;
    local_7c = 3;
    iVar4 = (**(code **)(*DAT_0054b010 + 0x2b0))
                      (DAT_0054b010,3,local_78,1,local_70,9,local_88,DAT_0054b024,local_80);
    if (iVar4 < 0) {
      __vbaHresultCheckObj(iVar4,piVar3,&DAT_0041aed8,0x2b0);
    }
    local_b4[1] = 0;
    iVar4 = (**(code **)(*DAT_0054b024 + 0x6fc))(DAT_0054b024,local_b4 + 1);
    if (iVar4 < 0) {
      __vbaHresultCheckObj(iVar4,DAT_0054b024,&LAB_0041e434,0x6fc);
    }
  }
  __vbaOnError(0);
  __vbaExitProc();
  return;
}

