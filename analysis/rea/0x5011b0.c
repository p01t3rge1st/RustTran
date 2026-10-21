
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl
FUN_005011b0(float *param_1,float *param_2,float *param_3,float *param_4,float *param_5,
            float *param_6,float *param_7,float *param_8,float *param_9,float *param_10,
            float *param_11)

{
  bool bVar1;
  float fVar2;
  undefined2 uVar6;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined4 uVar3;
  int *piVar4;
  int iVar5;
  float *extraout_ECX;
  ushort in_FPUStatusWord;
  ushort uVar7;
  float10 fVar8;
  float10 extraout_ST0;
  float10 extraout_ST0_00;
  float10 fVar9;
  float10 fVar10;
  float10 fVar11;
  float10 extraout_ST0_01;
  float *pfVar12;
  int local_f8;
  int local_f4;
  undefined4 local_f0;
  undefined4 local_ec;
  int *local_e8;
  undefined4 local_e4;
  undefined4 local_e0;
  undefined4 local_dc;
  undefined4 local_d8;
  undefined4 local_d4;
  undefined4 local_d0 [2];
  float local_c8;
  float local_c4;
  float local_c0;
  float local_bc;
  float local_b8;
  float local_ac;
  float local_a8;
  float local_a4;
  float local_a0;
  float local_9c;
  float local_98;
  float local_94 [2];
  float local_8c;
  float local_88;
  float local_84;
  float local_80;
  float local_7c;
  float local_78;
  float local_74;
  float local_70;
  float local_6c;
  float local_68;
  float local_64;
  float local_60;
  float local_5c;
  float local_58;
  float local_54;
  float local_50;
  float local_4c;
  float local_48;
  float local_44;
  float local_40;
  float local_3c;
  float local_38;
  float local_34;
  float local_30;
  float local_2c;
  float local_28;
  void *pvStack_24;
  undefined1 *puStack_20;
  undefined1 *local_1c;
  undefined *local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_8;
  
  puStack_20 = &LAB_00404716;
  pvStack_24 = ExceptionList;
  local_1c = &stack0xfffffeb0;
  local_18 = &DAT_00403158;
  local_14 = 0;
  local_10 = 0;
  local_3c = 0.0;
  local_60 = 0.0;
  local_68 = 0.0;
  local_74 = 0.0;
  local_80 = 0.0;
  local_94[0] = 0.0;
  local_d0[0] = 0;
  local_e0 = 0;
  local_f0 = 0;
  local_f4 = 0;
  local_f8 = 0;
  local_8 = 2;
  ExceptionList = &pvStack_24;
  __vbaOnError(1);
  local_84 = 0.1714;
  local_34 = 53.54;
  _DAT_0054c010 = 459.67;
  local_80 = *param_3;
  local_6c = *param_1;
  local_8 = 8;
  fVar8 = FUN_0049bde0(&local_80);
  local_60 = (float)fVar8;
  local_8 = 9;
  fVar8 = (float10)FUN_0049ae10(&local_60);
  local_4c = (float)fVar8;
  local_8 = 10;
  fVar8 = (float10)FUN_0049ab70(&local_60);
  local_a4 = (float)fVar8;
  local_8 = 0xb;
  fVar8 = FUN_0049c190(&local_60);
  local_30 = (float)fVar8;
  local_8 = 0xc;
  fVar8 = (float10)FUN_0049bf00(&local_60);
  local_8c = (float)fVar8;
  fVar2 = *param_4;
  local_8 = 0xe;
  local_40 = fVar2;
  if (DAT_0054b000 == 0) {
    fVar8 = ((float10)*param_9 - (float10)fVar2 * (float10)*param_10) / (float10)local_30;
    pfVar12 = param_10;
  }
  else {
    fVar2 = (float)adj_fdiv_m32(local_30);
    pfVar12 = extraout_ECX;
    fVar8 = extraout_ST0;
  }
  local_c0 = (float)fVar8;
  uVar6 = (undefined2)((uint)fVar2 >> 0x10);
  if ((in_FPUStatusWord & 0xd) == 0) {
    local_8 = 0xf;
    if (DAT_0054b000 == 0) {
      fVar8 = ((float10)local_40 * (float10)*pfVar12) / (float10)local_8c;
    }
    else {
      fVar8 = (float10)adj_fdiv_m32(local_8c);
      uVar6 = extraout_var;
    }
    local_7c = (float)fVar8;
    if ((in_FPUStatusWord & 0xd) == 0) {
      local_8 = 0x10;
      local_78 = local_c0 + local_7c;
      if ((in_FPUStatusWord & 0xd) == 0) {
        local_8 = 0x11;
        if (DAT_0054b000 == 0) {
          fVar8 = (float10)local_c0 / (float10)local_78;
        }
        else {
          fVar8 = (float10)adj_fdiv_m32();
          uVar6 = extraout_var_00;
        }
        local_b8 = (float)fVar8;
        if ((in_FPUStatusWord & 0xd) == 0) {
          local_8 = 0x12;
          if (DAT_0054b000 == 0) {
            fVar8 = (((float10)local_6c - (float10)local_60) * (float10)*param_9) /
                    ((float10)local_80 + (float10)_DAT_0054c010);
          }
          else {
            fVar8 = (float10)adj_fdiv_r(CONCAT22(uVar6,in_FPUStatusWord));
          }
          if (DAT_0054b000 == 0) {
            fVar8 = fVar8 / (float10)53.54;
          }
          else {
            fVar8 = (float10)adj_fdiv_m32();
          }
          local_70 = (float)(fVar8 * (float10)144.0);
          if ((in_FPUStatusWord & 0xd) == 0) {
            local_8 = 0x13;
            local_a8 = (local_70 * 0.1714 * (local_80 + _DAT_0054c010) +
                       local_c0 * local_4c + local_a4 * local_7c) -
                       local_60 * _DAT_0054b334 * *param_9;
            if ((in_FPUStatusWord & 0xd) == 0) {
              local_8 = 0x14;
              local_70 = local_70 - *param_7;
              if ((in_FPUStatusWord & 0xd) == 0) {
                local_8 = 0x15;
                local_44 = ((*param_5 * *param_6 + local_a8) -
                           *param_7 * 0.1714 * (_DAT_0054c010 + *param_3)) - *param_8;
                if ((in_FPUStatusWord & 0xd) == 0) {
                  local_8 = 0x16;
                  local_98 = local_78 + *param_5;
                  if ((in_FPUStatusWord & 0xd) == 0) {
                    local_8 = 0x17;
                    local_a0 = local_b8 * local_4c + (1.0 - local_b8) * local_a4;
                    if ((in_FPUStatusWord & 0xd) == 0) {
                      local_8 = 0x18;
                      local_bc = (local_a0 * local_98 +
                                 local_70 * 0.1714 * (local_80 + _DAT_0054c010)) -
                                 local_60 * _DAT_0054b334 * *param_9;
                      if ((in_FPUStatusWord & 0xd) == 0) {
                        local_8 = 0x19;
                        local_54 = local_bc - local_44;
                        if ((in_FPUStatusWord & 0xd) == 0) {
                          local_8 = 0x1a;
                          if (DAT_0054b000 == 0) {
                            fVar8 = (float10)*param_9 / (float10)local_98;
                          }
                          else {
                            fVar8 = (float10)adj_fdiv_m32();
                          }
                          local_ac = (float)fVar8;
                          if ((in_FPUStatusWord & 0xd) == 0) {
                            local_8 = 0x1d;
                            local_3c = local_ac;
                            fVar8 = FUN_0049be30(&local_3c);
                            local_68 = (float)fVar8;
                            local_8 = 0x1e;
                            fVar8 = FUN_0049beb0(&local_68);
                            local_88 = (float)fVar8;
                            local_8 = 0x1f;
                            fVar8 = (float10)FUN_0049ae10(&local_68);
                            local_50 = (float)fVar8;
                            local_8 = 0x20;
                            local_28 = (local_98 * local_50 +
                                       local_70 * 0.1714 * (local_88 + _DAT_0054c010)) -
                                       local_68 * _DAT_0054b334 * *param_9;
                            if ((in_FPUStatusWord & 0xd) == 0) {
                              local_8 = 0x21;
                              local_5c = local_28 - local_44;
                              while ((in_FPUStatusWord & 0xd) == 0) {
LAB_0050164c:
                                local_8 = 0x22;
                                if (DAT_0054b000 == 0) {
                                  fVar8 = ((float10)local_88 + (float10)local_80) / (float10)2.0;
                                }
                                else {
                                  fVar8 = (float10)adj_fdiv_m32(0x40000000);
                                }
                                local_94[0] = (float)fVar8;
                                if ((in_FPUStatusWord & 0xd) != 0) break;
                                local_8 = 0x23;
                                fVar8 = FUN_0049bde0(local_94);
                                local_74 = (float)fVar8;
                                local_8 = 0x24;
                                fVar8 = (float10)FUN_0049ae10(&local_74);
                                local_58 = (float)fVar8;
                                local_8 = 0x25;
                                fVar8 = (float10)FUN_0049ab70(&local_74);
                                local_c8 = (float)fVar8;
                                local_8 = 0x26;
                                fVar8 = FUN_0049c190(&local_74);
                                local_48 = (float)fVar8;
                                local_8 = 0x27;
                                pfVar12 = &local_74;
                                uVar3 = FUN_0049bf00(pfVar12);
                                local_9c = (float)extraout_ST0_00;
                                local_8 = 0x28;
                                if (DAT_0054b000 == 0) {
                                  fVar8 = ((float10)local_ac - (float10)local_9c) /
                                          ((float10)local_48 - (float10)local_9c);
                                }
                                else {
                                  fVar8 = (float10)adj_fdiv_r(uVar3);
                                }
                                local_2c = (float)fVar8;
                                if ((in_FPUStatusWord & 0xd) != 0) break;
                                local_8 = 0x29;
                                local_c4 = local_58 * local_2c + (1.0 - local_2c) * local_c8;
                                if ((in_FPUStatusWord & 0xd) != 0) break;
                                local_8 = 0x2a;
                                local_38 = (local_c4 * local_98 +
                                           (local_94[0] + _DAT_0054c010) * local_84 * local_70) -
                                           local_74 * _DAT_0054b334 * *param_9;
                                if ((in_FPUStatusWord & 0xd) != 0) break;
                                local_8 = 0x2b;
                                local_64 = local_38 - local_44;
                                if (((in_FPUStatusWord & 0xd) != 0) ||
                                   (local_8 = 0x2c, (in_FPUStatusWord & 0xd) != 0)) break;
                                fVar8 = (float10)__vbaFpR4();
                                if ((in_FPUStatusWord & 0xd) != 0) break;
                                fVar9 = (float10)__vbaFpR4();
                                uVar7 = 0;
                                if ((float10)(float)fVar8 < fVar9) {
                                  local_94[0] = local_80;
                                  local_2c = local_b8;
                                  local_74 = local_60;
                                  local_9c = local_8c;
LAB_00501bc7:
                                  uVar7 = 0;
                                  local_8 = 0x4a;
                                  if (DAT_0054b000 == 0) {
                                    fVar8 = ((float10)local_70 * (float10)local_34 *
                                            ((float10)local_94[0] + (float10)_DAT_0054c010)) /
                                            (float10)*param_9;
                                  }
                                  else {
                                    pfVar12 = (float *)*param_9;
                                    fVar8 = (float10)adj_fdiv_m32();
                                  }
                                  if (DAT_0054b000 == 0) {
                                    fVar8 = fVar8 / (float10)144.0;
                                  }
                                  else {
                                    pfVar12 = (float *)0x43100000;
                                    fVar8 = (float10)adj_fdiv_m32();
                                  }
                                  if ((uVar7 & 0xd) == 0) {
                                    *param_2 = (float)fVar8;
                                    local_8 = 0x4b;
                                    *param_1 = (float)fVar8 + local_74;
                                    if ((uVar7 & 0xd) == 0) {
                                      *param_3 = local_94[0];
                                      local_8 = 0x4d;
                                      if (DAT_0054b000 == 0) {
                                        fVar8 = (((float10)1.0 - (float10)local_2c) *
                                                 (float10)local_98 * (float10)local_9c) /
                                                (float10)*param_10;
                                      }
                                      else {
                                        pfVar12 = (float *)*param_10;
                                        fVar8 = (float10)adj_fdiv_m32();
                                      }
                                      *param_4 = (float)fVar8;
                                      if ((uVar7 & 0xd) == 0) {
                                        local_8 = 0x4e;
                                        uVar3 = Ordinal_685(pfVar12);
                                        piVar4 = (int *)__vbaObjSet(local_d0,uVar3);
                                        iVar5 = (**(code **)(*piVar4 + 0x1c))(piVar4,&local_f8);
                                        if (iVar5 < 0) {
                                          __vbaHresultCheckObj(iVar5,piVar4,&DAT_0041b0d0,0x1c);
                                        }
                                        bVar1 = 0 < local_f8;
                                        __vbaFreeObj();
                                        if (bVar1) {
                                          local_8 = 0x4f;
                                          __vbaStrCopy();
                                          local_8 = 0x50;
                                          if (DAT_0054b010 == (int *)0x0) {
                                            __vbaNew2(&DAT_00407e8c,&DAT_0054b010);
                                          }
                                          piVar4 = DAT_0054b010;
                                          local_e8 = DAT_0054b024;
                                          local_f0 = 9;
                                          local_d8 = 1;
                                          local_e0 = 3;
                                          iVar5 = (**(code **)(*DAT_0054b010 + 0x2b0))
                                                            (DAT_0054b010,3,local_dc,1,local_d4,9,
                                                             local_ec,DAT_0054b024,local_e4);
                                          if (iVar5 < 0) {
                                            __vbaHresultCheckObj(iVar5,piVar4,&DAT_0041aed8,0x2b0);
                                          }
                                          local_8 = 0x51;
                                          local_f4 = 0;
                                          iVar5 = (**(code **)(*DAT_0054b024 + 0x6fc))
                                                            (DAT_0054b024,&local_f4);
                                          if (iVar5 < 0) {
                                            __vbaHresultCheckObj
                                                      (iVar5,DAT_0054b024,&LAB_0041e434,0x6fc);
                                          }
                                        }
                                        local_8 = 0x52;
                                        __vbaOnError(0);
                                        __vbaExitProc();
                                        return;
                                      }
                                    }
                                  }
                                  break;
                                }
                                local_8 = 0x32;
                                fVar8 = (float10)__vbaFpR4();
                                if ((uVar7 & 0xd) != 0) break;
                                fVar9 = (float10)__vbaFpR4();
                                fVar10 = (float10)__vbaFpR4();
                                fVar11 = (float10)__vbaFpR4();
                                if ((float10)(float)fVar10 < fVar11 || (float10)(float)fVar8 < fVar9
                                   ) goto LAB_00501bc7;
                                local_8 = 0x33;
                                fVar8 = (float10)__vbaFpR4();
                                fVar9 = (float10)__vbaFpR4();
                                in_FPUStatusWord = 0;
                                if ((float10)(float)fVar8 < fVar9) {
                                  local_88 = local_94[0];
                                  local_5c = local_64;
                                  goto LAB_0050164c;
                                }
                                local_8 = 0x36;
                                fVar8 = (float10)__vbaFpR4();
                                fVar9 = (float10)__vbaFpR4();
                                in_FPUStatusWord = 0;
                                if ((float10)(float)fVar8 < fVar9) {
                                  local_80 = local_94[0];
                                  local_54 = local_64;
                                  local_60 = local_74;
                                  local_8c = local_9c;
                                  goto LAB_0050164c;
                                }
                                local_88 = local_80;
                                local_5c = local_54;
                                local_8 = 0x3e;
                                fVar8 = (float10)__vbaFpR4();
                                in_FPUStatusWord = 0;
                                if (fVar8 <= (float10)*param_11) {
                                  local_80 = *param_11;
                                }
                                else {
                                  local_80 = local_80 - 10.0;
                                }
                                local_8 = 0x41;
                                fVar8 = FUN_0049bde0(&local_80);
                                local_60 = (float)fVar8;
                                local_8 = 0x42;
                                fVar8 = (float10)FUN_0049ae10(&local_60);
                                local_4c = (float)fVar8;
                                local_8 = 0x43;
                                fVar8 = (float10)FUN_0049ab70(&local_60);
                                local_a4 = (float)fVar8;
                                local_8 = 0x44;
                                fVar8 = FUN_0049c190(&local_60);
                                local_30 = (float)fVar8;
                                local_8 = 0x45;
                                uVar3 = FUN_0049bf00(&local_60);
                                local_8c = (float)extraout_ST0_01;
                                local_8 = 0x46;
                                if (DAT_0054b000 == 0) {
                                  fVar8 = ((float10)local_ac - (float10)local_8c) /
                                          ((float10)local_30 - (float10)local_8c);
                                }
                                else {
                                  fVar8 = (float10)adj_fdiv_r(uVar3);
                                }
                                local_b8 = (float)fVar8;
                                if ((in_FPUStatusWord & 0xd) != 0) break;
                                local_8 = 0x47;
                                local_a0 = local_b8 * local_4c + (1.0 - local_b8) * local_a4;
                                if ((in_FPUStatusWord & 0xd) != 0) break;
                                local_8 = 0x48;
                                local_bc = (local_a0 * local_98 +
                                           (local_80 + _DAT_0054c010) * local_84 * local_70) -
                                           local_60 * _DAT_0054b334 * *param_9;
                                if ((in_FPUStatusWord & 0xd) != 0) break;
                                local_8 = 0x49;
                                local_54 = local_bc - local_44;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  __vbaFPException();
  return;
}

