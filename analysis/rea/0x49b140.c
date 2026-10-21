
/* WARNING: Type propagation algorithm not settling */

void __cdecl FUN_0049b140(undefined4 param_1,float *param_2,float *param_3)

{
  bool bVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  ushort uVar5;
  float10 fVar6;
  int local_60 [4];
  int *local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  undefined8 local_40;
  undefined4 local_38;
  undefined4 local_34;
  float local_24;
  void *pvStack_20;
  undefined1 *puStack_1c;
  undefined1 *local_18;
  undefined *local_14;
  undefined4 local_10;
  undefined4 local_c;
  
  puStack_1c = &LAB_00404716;
  pvStack_20 = ExceptionList;
  local_18 = &stack0xffffff78;
  local_14 = &DAT_00401bb8;
  local_10 = 0;
  local_c = 0;
  local_24 = 0.0;
  local_34 = 0;
  local_38 = 0;
  local_48 = 0;
  local_60[2] = 0;
  local_60[1] = 0;
  local_60[0] = 0;
  ExceptionList = &pvStack_20;
  __vbaOnError(1);
  fVar6 = FUN_0049bde0(param_3);
  local_24 = (float)fVar6;
  uVar5 = 0;
  if (*param_3 <= 220.0) {
    local_40 = (double)CONCAT44(local_40._4_4_,*param_3 - 32.0);
    local_48 = 4;
  }
  else {
    fVar6 = (float10)FUN_0049ab70(&local_24);
    if (((uVar5 & 0xd) != 0) ||
       (local_40 = (double)(fVar6 - ((float10)*param_2 - (float10)local_24) * (float10)0.00167),
       (uVar5 & 0xd) != 0)) {
      __vbaFPException();
      return;
    }
    local_48 = 5;
  }
  __vbaVarMove();
  uVar2 = Ordinal_685();
  piVar3 = (int *)__vbaObjSet(&local_38,uVar2);
  iVar4 = (**(code **)(*piVar3 + 0x1c))(piVar3,local_60);
  if (iVar4 < 0) {
    __vbaHresultCheckObj(iVar4,piVar3,&DAT_0041b0d0,0x1c);
  }
  bVar1 = 0 < local_60[0];
  __vbaFreeObj();
  if (bVar1) {
    __vbaStrCopy();
    if (DAT_0054b010 == (int *)0x0) {
      __vbaNew2(&DAT_00407e8c,&DAT_0054b010);
    }
    piVar3 = DAT_0054b010;
    local_50 = DAT_0054b024;
    local_60[2] = 9;
    local_40 = (double)CONCAT44(local_40._4_4_,1);
    local_48 = 3;
    iVar4 = (**(code **)(*DAT_0054b010 + 0x2b0))
                      (DAT_0054b010,3,local_44,1,local_40._4_4_,9,local_60[3],DAT_0054b024,local_4c)
    ;
    if (iVar4 < 0) {
      __vbaHresultCheckObj(iVar4,piVar3,&DAT_0041aed8,0x2b0);
    }
    local_60[1] = 0;
    iVar4 = (**(code **)(*DAT_0054b024 + 0x6fc))(DAT_0054b024,local_60 + 1);
    if (iVar4 < 0) {
      __vbaHresultCheckObj(iVar4,DAT_0054b024,&LAB_0041e434,0x6fc);
    }
  }
  __vbaOnError(0);
  __vbaExitProc();
  return;
}

