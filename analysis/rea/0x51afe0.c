
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl FUN_0051afe0(int *param_1)

{
  short sVar1;
  undefined2 uVar2;
  undefined4 uVar3;
  int iVar4;
  float fVar5;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  int iVar6;
  int *piVar7;
  int extraout_ECX;
  int extraout_EDX;
  float *unaff_ESI;
  uint uVar8;
  bool bVar9;
  ushort in_FPUStatusWord;
  float10 extraout_ST0;
  float10 extraout_ST0_00;
  float10 fVar10;
  float10 fVar11;
  float10 extraout_ST0_01;
  float10 fVar12;
  float10 extraout_ST1;
  float10 extraout_ST1_00;
  float10 extraout_ST1_01;
  float10 extraout_ST1_02;
  float *pfVar13;
  short local_7c;
  undefined4 local_58 [5];
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34 [4];
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  uint local_18;
  void *pvStack_14;
  undefined1 *puStack_10;
  undefined1 *local_c;
  undefined *local_8;
  
  puStack_10 = &LAB_00404716;
  pvStack_14 = ExceptionList;
  local_c = &stack0xffffff68;
  local_8 = &DAT_00403948;
  local_1c = 0;
  DAT_0054b07c = *param_1;
  local_20 = 0;
  local_24 = 0;
  local_34[0] = 0;
  local_44 = 0;
  local_58[0] = 0;
  if (DAT_0054b080 == 0) {
    sVar1 = 1;
    ExceptionList = &pvStack_14;
    local_c = &stack0xffffff68;
    do {
      if (0x14 < sVar1) {
        local_58[0] = 1;
        uVar3 = FUN_004afbc0(&DAT_0054b07c,local_58);
        goto LAB_0051b0fe;
      }
      uVar8 = (int)sVar1 - 1;
      if (0x13 < uVar8) {
        __vbaGenerateBoundsError();
      }
      *(undefined4 *)(DAT_0054b5f8 + uVar8 * 4) = 0x47c34f80;
      if (0x13 < uVar8) {
        __vbaGenerateBoundsError();
      }
      *(undefined4 *)(DAT_0054b5dc + uVar8 * 4) = 0;
      if (0x13 < uVar8) {
        __vbaGenerateBoundsError();
      }
      *(undefined4 *)(DAT_0054b5c0 + uVar8 * 4) = 0;
      if (0x13 < uVar8) {
        __vbaGenerateBoundsError();
      }
      *(undefined4 *)(DAT_0054b5a4 + uVar8 * 4) = 0;
      if (0x13 < uVar8) {
        __vbaGenerateBoundsError();
      }
      *(undefined2 *)(DAT_0054b630 + uVar8 * 2) = 0;
      bVar9 = SCARRY2(sVar1,1);
      sVar1 = sVar1 + 1;
    } while (!bVar9);
LAB_0051c300:
    __vbaErrorOverflow();
    DAT_0054b70c = 0xb50637bd;
    if ((in_FPUStatusWord & 0xd) == 0) {
      if (DAT_0054b000 == 0) {
        fVar12 = (float10)3.413e+06 / (float10)3600.0;
      }
      else {
        fVar12 = (float10)adj_fdiv_m32(0x45610000);
      }
      DAT_0054c020 = 0x54442d11;
      DAT_0054c024 = 0x400921fb;
      _DAT_0054b2f4 = 0x3d6978d5;
      _DAT_0054b2f8 = 0x3de147ae;
      DAT_0054b2fc = 0x41681062;
      DAT_0054b300 = 32.0;
      DAT_0054b304 = 1.8;
      DAT_0054b308 = 0x3f1ccccd;
      DAT_0054b30c = 0x3edcac08;
      DAT_0054b310 = 0x4051f8a1;
      DAT_0054b314 = 0x4a505020;
      DAT_0054b318 = 0x45610000;
      _DAT_0054b31c = 0x3e9c0ebf;
      DAT_0054b320 = 0x412c3958;
      DAT_0054b324 = 0x420d428f;
      _DAT_0054b328 = 0x418e3958;
      DAT_0054b32c = 0x400d1eb8;
      _DAT_0054b334 = 0x3e3d70a4;
      _DAT_0054b044 = 0x42140000;
      _DAT_0054bb08 = 0x3d75c28f;
      DAT_0054bfa8 = 0;
      DAT_0054b330 = (float)fVar12;
      if ((in_FPUStatusWord & 0xd) == 0) {
        *DAT_0054b380 = 0x42700000;
        DAT_0054b380[1] = 0x42840000;
        DAT_0054b380[2] = 0x42900000;
        DAT_0054b380[3] = 0x429c0000;
        DAT_0054b380[4] = 0x42a80000;
        DAT_0054b380[5] = 0x42b40000;
        DAT_0054b380[6] = 0x42e2851f;
        DAT_0054b380[7] = 0x4304e148;
        DAT_0054b380[8] = 0x431268f6;
        DAT_0054b380[9] = 0x431ce3d7;
        DAT_0054b380[10] = 0x432a0ccd;
        DAT_0054b380[0xb] = 0x4339a148;
        DAT_0054b380[0xc] = 0x4345b333;
        DAT_0054b380[0xd] = 0x434fc000;
        DAT_0054b380[0xe] = 0x43540000;
        DAT_0054b380[0xf] = 0x43610000;
        DAT_0054b380[0x10] = 0x437a0000;
        DAT_0054b380[0x11] = 0x43870000;
        DAT_0054b380[0x12] = 0x43910000;
        DAT_0054b380[0x13] = 0x43a00000;
        DAT_0054b380[0x14] = 0x43aa0000;
        DAT_0054b380[0x15] = 0x43b40000;
        DAT_0054b380[0x16] = 0x43be0000;
        DAT_0054b380[0x17] = 0x43c80000;
        DAT_0054b380[0x18] = 0x43d50000;
        DAT_0054b380[0x19] = 0x43e10000;
        DAT_0054b380[0x1a] = 0x43fa0000;
        DAT_0054b380[0x1b] = 0x44020000;
        DAT_0054b380[0x1c] = 0x44048000;
        DAT_0054b380[0x1d] = 0x44070000;
        DAT_0054b380[0x1e] = 0x44098000;
        DAT_0054b380[0x1f] = 0x440c0000;
        DAT_0054b380[0x20] = 0x440e8000;
        DAT_0054b380[0x21] = 0x44110000;
        DAT_0054b380[0x22] = 0x44138000;
        DAT_0054b380[0x23] = 0x44160000;
        DAT_0054b380[0x24] = 0x44188000;
        DAT_0054b380[0x25] = 0x441b0000;
        DAT_0054b380[0x26] = 0x441d8000;
        DAT_0054b380[0x27] = 0x44200000;
        DAT_0054b380[0x28] = 0x44228000;
        DAT_0054b380[0x29] = 0x44250000;
        DAT_0054b380[0x2a] = 0x44278000;
        DAT_0054b380[0x2b] = 0x442a0000;
        *DAT_0054b39c = 0x3e831f8a;
        DAT_0054b39c[1] = 0x3ea1f213;
        DAT_0054b39c[2] = 0x3ec6dc5d;
        DAT_0054b39c[3] = 0x3ef2fec5;
        DAT_0054b39c[4] = 0x3f13b646;
        DAT_0054b39c[5] = 0x3f333333;
        DAT_0054b39c[6] = 0x3fb33333;
        DAT_0054b39c[7] = 0x4019999a;
        DAT_0054b39c[8] = 0x4059999a;
        DAT_0054b39c[9] = 0x408ccccd;
        DAT_0054b39c[10] = 0x40c00000;
        DAT_0054b39c[0xb] = 0x41080000;
        DAT_0054b39c[0xc] = 0x41300000;
        DAT_0054b39c[0xd] = 0x41580000;
        DAT_0054b39c[0xe] = 0x416b3333;
        DAT_0054b39c[0xf] = 0x41973333;
        DAT_0054b39c[0x10] = 0x41ee6666;
        DAT_0054b39c[0x11] = 0x4227999a;
        DAT_0054b39c[0x12] = 0x42666666;
        DAT_0054b39c[0x13] = 0x42b33333;
        DAT_0054b39c[0x14] = 0x42ec0000;
        DAT_0054b39c[0x15] = 0x43190000;
        DAT_0054b39c[0x16] = 0x4343b333;
        DAT_0054b39c[0x17] = 0x4377424e;
        DAT_0054b39c[0x18] = 0x43a4af3b;
        DAT_0054b39c[0x19] = 0x43d34666;
        DAT_0054b39c[0x1a] = 0x442a370a;
        DAT_0054b39c[0x1b] = 0x444b21ec;
        DAT_0054b39c[0x1c] = 0x445d4eb8;
        DAT_0054b39c[0x1d] = 0x4470b28f;
        DAT_0054b39c[0x1e] = 0x4482adc3;
        DAT_0054b39c[0x1f] = 0x448dac29;
        DAT_0054b39c[0x20] = 0x44995c29;
        DAT_0054b39c[0x21] = 0x44a5c571;
        DAT_0054b39c[0x22] = 0x44b2f000;
        DAT_0054b39c[0x23] = 0x44c0e666;
        DAT_0054b39c[0x24] = 0x44cfb333;
        DAT_0054b39c[0x25] = 0x44df5ccd;
        DAT_0054b39c[0x26] = 0x44eff000;
        DAT_0054b39c[0x27] = 0x4500be66;
        DAT_0054b39c[0x28] = 0x450a0666;
        DAT_0054b39c[0x29] = 0x4513db33;
        DAT_0054b39c[0x2a] = 0x451e4333;
        DAT_0054b39c[0x2b] = 0x4529499a;
        *DAT_0054b364 = 0x3e831f8a;
        DAT_0054b364[1] = 0x3ea1f213;
        DAT_0054b364[2] = 0x3ec6dc5d;
        DAT_0054b364[3] = 0x3ef2fec5;
        DAT_0054b364[4] = 0x3f13b646;
        DAT_0054b364[5] = 0x3f333333;
        DAT_0054b364[6] = 0x3fb33333;
        DAT_0054b364[7] = 0x4019999a;
        DAT_0054b364[8] = 0x4059999a;
        DAT_0054b364[9] = 0x408ccccd;
        DAT_0054b364[10] = 0x40c00000;
        DAT_0054b364[0xb] = 0x41080000;
        DAT_0054b364[0xc] = 0x41300000;
        DAT_0054b364[0xd] = 0x41580000;
        DAT_0054b364[0xe] = 0x416b3333;
        DAT_0054b364[0xf] = 0x41a00000;
        DAT_0054b364[0x10] = 0x41c80000;
        DAT_0054b364[0x11] = 0x420c0000;
        DAT_0054b364[0x12] = 0x42480000;
        DAT_0054b364[0x13] = 0x42700000;
        DAT_0054b364[0x14] = 0x42a00000;
        DAT_0054b364[0x15] = 0x42b40000;
        DAT_0054b364[0x16] = 0x42c80000;
        DAT_0054b364[0x17] = 0x42f00000;
        DAT_0054b364[0x18] = 0x43160000;
        DAT_0054b364[0x19] = 0x43340000;
        DAT_0054b364[0x1a] = 0x43480000;
        DAT_0054b364[0x1b] = 0x43960000;
        DAT_0054b364[0x1c] = 0x43c80000;
        DAT_0054b364[0x1d] = 0x43fa0000;
        DAT_0054b364[0x1e] = 0x44160000;
        DAT_0054b364[0x1f] = 0x442f0000;
        DAT_0054b364[0x20] = 0x44480000;
        DAT_0054b364[0x21] = 0x44638000;
        DAT_0054b364[0x22] = 0x446d8000;
        DAT_0054b364[0x23] = 0x44778000;
        DAT_0054b364[0x24] = 0x4480c000;
        DAT_0054b364[0x25] = 0x4485c000;
        DAT_0054b364[0x26] = 0x448ac000;
        DAT_0054b364[0x27] = 0x448d4000;
        DAT_0054b364[0x28] = 0x44924000;
        DAT_0054b364[0x29] = 0x44974000;
        DAT_0054b364[0x2a] = 0x4499c000;
        DAT_0054b364[0x2b] = 0x449ec000;
        DAT_0054b364[0x2c] = 0x44a28000;
        DAT_0054b364[0x2d] = 0x44a50000;
        DAT_0054b364[0x2e] = 0x44aa0000;
        DAT_0054b364[0x2f] = 0x44af0000;
        DAT_0054b364[0x30] = 0x44b40000;
        DAT_0054b364[0x31] = 0x44b90000;
        DAT_0054b364[0x32] = 0x44be0000;
        DAT_0054b364[0x33] = 0x44c30000;
        DAT_0054b364[0x34] = 0x44c80000;
        DAT_0054b364[0x35] = 0x44cd0000;
        DAT_0054b364[0x36] = 0x44d48000;
        DAT_0054b364[0x37] = 0x44dc0000;
        DAT_0054b364[0x38] = 0x44e10000;
        DAT_0054b364[0x39] = 0x44e88000;
        DAT_0054b364[0x3a] = 0x44ed8000;
        DAT_0054b364[0x3b] = 0x44f28000;
        DAT_0054b364[0x3c] = 0x44fa0000;
        DAT_0054b364[0x3d] = 0x45034000;
        DAT_0054b364[0x3e] = 0x45098000;
        DAT_0054b364[0x3f] = 0x450fc000;
        DAT_0054b364[0x40] = 0x45160000;
        DAT_0054b364[0x41] = 0x451c4000;
        DAT_0054b364[0x42] = 0x45228000;
        DAT_0054b364[0x43] = 0x4528c000;
        *DAT_0054b348 = 0x4496e000;
        DAT_0054b348[1] = 0x44774000;
        DAT_0054b348[2] = 0x444b9333;
        DAT_0054b348[3] = 0x4428799a;
        DAT_0054b348[4] = 0x440c0000;
        DAT_0054b348[5] = 0x43e9799a;
        DAT_0054b348[6] = 0x4373051f;
        DAT_0054b348[7] = 0x43126666;
        DAT_0054b348[8] = 0x42d323d7;
        DAT_0054b348[9] = 0x42a5c937;
        DAT_0054b348[10] = 0x4277ef9e;
        DAT_0054b348[0xb] = 0x4232ee98;
        DAT_0054b348[0xc] = 0x42049168;
        DAT_0054b348[0xd] = 0x41e81cac;
        DAT_0054b348[0xe] = 0x41d6645a;
        DAT_0054b348[0xf] = 0x41a0b22d;
        DAT_0054b348[0x10] = 0x41826873;
        DAT_0054b348[0x11] = 0x413e559b;
        DAT_0054b348[0x12] = 0x41083958;
        DAT_0054b348[0x13] = 0x40e58e22;
        DAT_0054b348[0x14] = 0x40af1340;
        DAT_0054b348[0x15] = 0x409ca64c;
        DAT_0054b348[0x16] = 0x408dcac1;
        DAT_0054b348[0x17] = 0x406e8f5c;
        DAT_0054b348[0x18] = 0x4040e3bd;
        DAT_0054b348[0x19] = 0x4021ff2e;
        DAT_0054b348[0x1a] = 0x401262cc;
        DAT_0054b348[0x1b] = 0x3fc57881;
        DAT_0054b348[0x1c] = 0x3f949a02;
        DAT_0054b348[0x1d] = 0x3f6d7881;
        DAT_0054b348[0x1e] = 0x3f450e56;
        DAT_0054b348[0x1f] = 0x3f27d2c8;
        DAT_0054b348[0x20] = 0x3f11a75d;
        DAT_0054b348[0x21] = 0x3efd6388;
        DAT_0054b348[0x22] = 0x3ef1b08a;
        DAT_0054b348[0x23] = 0x3ee6cdf2;
        DAT_0054b348[0x24] = 0x3edce853;
        DAT_0054b348[0x25] = 0x3ed3a29c;
        DAT_0054b348[0x26] = 0x3ecaff6d;
        DAT_0054b348[0x27] = 0x3ec6e58a;
        DAT_0054b348[0x28] = 0x3ebf1950;
        DAT_0054b348[0x29] = 0x3eb7caea;
        DAT_0054b348[0x2a] = 0x3eb44e51;
        DAT_0054b348[0x2b] = 0x3eada661;
        DAT_0054b348[0x2c] = 0x3ea8e9f7;
        DAT_0054b348[0x2d] = 0x3ea5de16;
        DAT_0054b348[0x2e] = 0x3ea007dd;
        DAT_0054b348[0x2f] = 0x3e9a82e8;
        DAT_0054b348[0x30] = 0x3e95475a;
        DAT_0054b348[0x31] = 0x3e904ff4;
        DAT_0054b348[0x32] = 0x3e8b98c8;
        DAT_0054b348[0x33] = 0x3e871609;
        DAT_0054b348[0x34] = 0x3e82ca58;
        DAT_0054b348[0x35] = 0x3e7d60e9;
        DAT_0054b348[0x36] = 0x3e71bc56;
        DAT_0054b348[0x37] = 0x3e66ca04;
        DAT_0054b348[0x38] = 0x3e5fdb4d;
        DAT_0054b348[0x39] = 0x3e55f45e;
        DAT_0054b348[0x3a] = 0x3e4fa58f;
        DAT_0054b348[0x3b] = 0x3e49906d;
        DAT_0054b348[0x3c] = 0x3e40d456;
        DAT_0054b348[0x3d] = 0x3e3335d2;
        DAT_0054b348[0x3e] = 0x3e26a012;
        DAT_0054b348[0x3f] = 0x3e1af640;
        DAT_0054b348[0x40] = 0x3e102364;
        DAT_0054b348[0x41] = 0x3e05d0fa;
        DAT_0054b348[0x42] = 0x3df80347;
        DAT_0054b348[0x43] = 0x3de540cc;
        *DAT_0054b3b8 = 0;
        DAT_0054b3b8[1] = 0x42c80000;
        DAT_0054b3b8[2] = 0x43480000;
        DAT_0054b3b8[3] = 0x43c80000;
        DAT_0054b3b8[4] = 0x44160000;
        DAT_0054b3b8[5] = 0x44480000;
        DAT_0054b3b8[6] = 0x447a0000;
        DAT_0054b3b8[7] = 0x44960000;
        DAT_0054b3b8[8] = 0x44af0000;
        DAT_0054b3b8[9] = 0x44c80000;
        DAT_0054b3b8[10] = 0x44e10000;
        DAT_0054b3b8[0xb] = 0x44fa0000;
        DAT_0054b3b8[0xc] = 0x45098000;
        DAT_0054b3b8[0xd] = 0x45160000;
        DAT_0054b3b8[0xe] = 0x45228000;
        DAT_0054b3b8[0xf] = 0x452f0000;
        *DAT_0054b3d4 = 0;
        DAT_0054b3d4[1] = 0x450fc000;
        DAT_0054b3d4[2] = 0x45610000;
        DAT_0054b3d4[3] = 0x459c4000;
        DAT_0054b3d4[4] = 0x45c80000;
        DAT_0054b3d4[5] = 0x45ddf800;
        DAT_0054b3d4[6] = 0x45f66000;
        DAT_0054b3d4[7] = 0x4605dc00;
        DAT_0054b3d4[8] = 0x460f4c00;
        DAT_0054b3d4[9] = 0x4617b400;
        DAT_0054b3d4[10] = 0x461f2800;
        DAT_0054b3d4[0xb] = 0x4625c000;
        DAT_0054b3d4[0xc] = 0x462b8000;
        DAT_0054b3d4[0xd] = 0x462f2800;
        DAT_0054b3d4[0xe] = 0x46325c00;
        DAT_0054b3d4[0xf] = 0x4634a000;
        *DAT_0054b3f0 = 0;
        DAT_0054b3f0[1] = 0x43480000;
        DAT_0054b3f0[2] = 0x43c80000;
        DAT_0054b3f0[3] = 0x44480000;
        DAT_0054b3f0[4] = 0x44960000;
        DAT_0054b3f0[5] = 0x44ce1000;
        DAT_0054b3f0[6] = 0x4501a000;
        DAT_0054b3f0[7] = 0x451d1000;
        DAT_0054b3f0[8] = 0x45395000;
        DAT_0054b3f0[9] = 0x4556a000;
        DAT_0054b3f0[10] = 0x45752000;
        DAT_0054b3f0[0xb] = 0x458a9800;
        DAT_0054b3f0[0xc] = 0x459b9800;
        DAT_0054b3f0[0xd] = 0x45adf000;
        DAT_0054b3f0[0xe] = 0x45c23800;
        DAT_0054b3f0[0xf] = 0x45d8e000;
        _DAT_0054bff4 = 0x2b05fb6a;
        _DAT_0054bff0 = 0x3d48b439;
        DAT_0054bfc4 = 0x43160000;
        DAT_0054bff8 = 0x3e9eb852;
        DAT_0054bfec = 0x3983126f;
        DAT_0054bfc0 = 0x44153333;
        DAT_0054bfc8 = 0x44160000;
        *DAT_0054c038 = 0;
        DAT_0054c038[1] = 0x41200000;
        DAT_0054c038[2] = 0x41a00000;
        DAT_0054c038[3] = 0x41f00000;
        DAT_0054c038[4] = 0x420c0000;
        DAT_0054c038[5] = 0x42200000;
        DAT_0054c038[6] = 0x42c80000;
        *DAT_0054c054 = 0x40a00000;
        DAT_0054c054[1] = 0x40c00000;
        DAT_0054c054[2] = 0x40f00000;
        DAT_0054c054[3] = 0x41180000;
        DAT_0054c054[4] = 0x41400000;
        DAT_0054c054[5] = 0x41900000;
        DAT_0054c054[6] = 0x41a00000;
        return;
      }
    }
    __vbaFPException();
    return;
  }
  local_58[0] = 2;
  ExceptionList = &pvStack_14;
  uVar3 = FUN_004afbc0(&DAT_0054b07c,local_58);
  if (DAT_0054b07c == 1) {
    DAT_0054b55c = 0;
  }
LAB_0051b0fe:
  if (DAT_0054b000 == 0) {
    fVar12 = ((float10)DAT_0054b330 * (float10)DAT_0054b120) /
             ((float10)_DAT_0054b2a0 - (float10)_DAT_0054b128);
  }
  else {
    fVar12 = (float10)adj_fdiv_r(uVar3);
  }
  _DAT_0054b6fc = (float)fVar12;
  if ((in_FPUStatusWord & 0xd) == 0) {
    if (DAT_0054b000 != 0) {
      adj_fdiv_m64();
    }
    if ((in_FPUStatusWord & 0xd) == 0) {
      uVar2 = __vbaR8IntI2();
      if (DAT_0054b000 == 0) {
        fVar12 = (float10)DAT_0054b470 / (float10)DAT_0054b46c;
      }
      else {
        uVar2 = adj_fdiv_m32();
        fVar12 = extraout_ST0;
      }
      pfVar13 = (float *)&DAT_0054b1a8;
      _DAT_0054b74c = 0;
      _DAT_0054b750 = 0;
      _DAT_0054b704 = (float)fVar12;
      _DAT_0054b700 = uVar2;
      if (((in_FPUStatusWord & 0xd) == 0) &&
         (_DAT_0054b708 = DAT_0054b220 + DAT_0054b1bc, (in_FPUStatusWord & 0xd) == 0)) {
        iVar4 = (int)DAT_0054b4de;
        if (DAT_0054b000 == 0) {
          fVar12 = (float10)iVar4 / (float10)(float)DAT_0054b204;
        }
        else {
          pfVar13 = DAT_0054b204;
          fVar12 = (float10)adj_fdiv_m32();
        }
        DAT_0054b740 = (float)fVar12;
        if ((in_FPUStatusWord & 0xd) == 0) {
          if (DAT_0054b000 == 0) {
            fVar12 = ((float10)(float)DAT_0054b204 - (float10)iVar4) / (float10)(float)DAT_0054b204;
          }
          else {
            fVar12 = (float10)adj_fdiv_m32(DAT_0054b204);
          }
          DAT_0054b744 = (float)fVar12;
          if (((in_FPUStatusWord & 0xd) == 0) &&
             (DAT_0054b758 = (_DAT_0054b128 - _DAT_0054b1a8) * DAT_0054b41c + _DAT_0054b1a8,
             (in_FPUStatusWord & 0xd) == 0)) {
            _DAT_0054b75c = DAT_0054b758;
            fVar12 = FUN_0049bde0(pfVar13);
            DAT_0054b4c0 = (float)fVar12;
            fVar12 = FUN_0049beb0((float *)&DAT_0054b1fc);
            _DAT_0054b760 = (float)fVar12;
            DAT_0054b764 = (_DAT_0054b1fc - DAT_0054b4c0) * DAT_0054b41c + DAT_0054b4c0;
            if ((in_FPUStatusWord & 0xd) == 0) {
              fVar12 = (float10)FUN_0049bf00(&DAT_0054b764);
              DAT_0054b768 = (float *)(float)fVar12;
              fVar12 = FUN_0049c190(&DAT_0054b764);
              _DAT_0054b77c = 0;
              DAT_0054b76c = (float *)(float)fVar12;
              _DAT_0054b770 = 0;
              _DAT_0054b784 = 0;
              _DAT_0054b774 = 0;
              _DAT_0054b788 = 0;
              _DAT_0054b2ec = 0;
              _DAT_0054b7d0 = 0;
              _DAT_0054b7d4 = 0;
              _DAT_0054b7d8 = 0;
              _DAT_0054b7dc = 0;
              _DAT_0054b7e0 = 0;
              _DAT_0054b7e4 = 0;
              _DAT_0054b674 = 0;
              _DAT_0054b7e8 = 0;
              if (DAT_0054b488 == 0) {
                _DAT_0054b4f4 = DAT_0054b1a4 * DAT_0054b740;
                DAT_0054b40c = 0.0;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                _DAT_0054b4f8 = DAT_0054b1a4 * DAT_0054b744;
                _DAT_0054b4ac = 0;
                DAT_0054b4d0 = 0;
                DAT_0054b4ec = 0;
                DAT_0054b4d2 = 0;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                DAT_0054b4d4 = 0;
                _DAT_0054b4a8 = DAT_0054b1a0;
                DAT_0054b4d6 = 0;
                DAT_0054b4d8 = 0;
                DAT_0054b4da = 0;
                DAT_0054b4e0 = 0;
                DAT_0054b4e6 = 0;
                DAT_0054b4e8 = 0;
                DAT_0054b4a4 = DAT_0054b19c;
                _DAT_0054b498 = DAT_0054b758;
                DAT_0054b49c = DAT_0054b758;
                _DAT_0054b494 = DAT_0054b124;
                fVar12 = (float10)FUN_0049bf00((float *)&DAT_0054b494);
                DAT_0054b64c = (float)fVar12;
                fVar12 = FUN_0049c190((float *)&DAT_0054b494);
                DAT_0054b650 = (float)fVar12;
                DAT_0054b4fc = DAT_0054b764;
                _DAT_0054b500 = DAT_0054b764;
                DAT_0054b50c = DAT_0054b764;
                _DAT_0054b510 = DAT_0054b764;
                if (DAT_0054b000 == 0) {
                  fVar12 = (((float10)_DAT_0054b134 + (float10)DAT_0054b120) * (float10)DAT_0054b330
                           ) / (float10)DAT_0054b1a4;
                  fVar5 = DAT_0054b764;
                }
                else {
                  fVar5 = (float)adj_fdiv_m32();
                  fVar12 = extraout_ST0_00;
                }
                if (DAT_0054b000 == 0) {
                  fVar12 = fVar12 / ((float10)_DAT_0054b128 - (float10)_DAT_0054b760);
                }
                else {
                  fVar12 = (float10)adj_fdiv_r(fVar5);
                }
                DAT_0054b4b0 = (float)fVar12;
                if ((((in_FPUStatusWord & 0xd) != 0) ||
                    (_DAT_0054b67c = (_DAT_0054b134 + DAT_0054b120) * DAT_0054b330 * DAT_0054b740,
                    (in_FPUStatusWord & 0xd) != 0)) ||
                   (_DAT_0054b680 = (_DAT_0054b134 + DAT_0054b120) * DAT_0054b330 * DAT_0054b744,
                   (in_FPUStatusWord & 0xd) != 0)) goto LAB_0051c2fb;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                if (DAT_0054b000 == 0) {
                  fVar12 = ((float10)DAT_0054b154 - (float10)0.27) /
                           ((float10)_DAT_0054b128 - (float10)_DAT_0054b1a8);
                }
                else {
                  fVar12 = (float10)adj_fdiv_r(in_FPUStatusWord);
                }
                if (((in_FPUStatusWord & 0xd) != 0) ||
                   (_DAT_0054b6d4 =
                         (float)(((float10)_DAT_0054b498 - (float10)_DAT_0054b1a8) * fVar12 +
                                (float10)0.27), (in_FPUStatusWord & 0xd) != 0)) goto LAB_0051c2fb;
                fVar12 = (float10)__vbaFpR4();
                if ((float10)_DAT_0054b6d4 < fVar12) {
                  _DAT_0054b6d4 = 0.27;
                }
                in_FPUStatusWord =
                     (ushort)(_DAT_0054b6d4 < DAT_0054b154) << 8 |
                     (ushort)(NAN(_DAT_0054b6d4) || NAN(DAT_0054b154)) << 10 |
                     (ushort)(_DAT_0054b6d4 == DAT_0054b154) << 0xe;
                if (_DAT_0054b6d4 >= DAT_0054b154 && (_DAT_0054b6d4 == DAT_0054b154) == 0) {
                  _DAT_0054b6d4 = DAT_0054b154;
                }
                _DAT_0054b7ec = 1.0 - _DAT_0054b6d4;
                DAT_0054b4a0 = 1.0 - _DAT_0054b7ec;
                if (DAT_0054b000 == 0) {
                  fVar12 = (float10)_DAT_0054b7ec / (float10)DAT_0054b650;
                  uVar2 = extraout_var;
                }
                else {
                  fVar12 = (float10)adj_fdiv_m32();
                  uVar2 = extraout_var_00;
                }
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                if (DAT_0054b000 == 0) {
                  fVar10 = ((float10)1.0 - (float10)_DAT_0054b7ec) / (float10)DAT_0054b64c;
                }
                else {
                  fVar10 = (float10)adj_fdiv_m32();
                  fVar12 = extraout_ST1;
                  uVar2 = extraout_var_01;
                }
                if (DAT_0054b000 == 0) {
                  fVar11 = (float10)_DAT_0054b7ec / (float10)DAT_0054b650;
                }
                else {
                  fVar11 = (float10)adj_fdiv_m32();
                  fVar10 = extraout_ST1_00;
                  uVar2 = extraout_var_02;
                }
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                if (DAT_0054b000 == 0) {
                  fVar12 = fVar12 / (fVar11 + fVar10);
                }
                else {
                  fVar12 = (float10)adj_fdiv_r(CONCAT22(uVar2,in_FPUStatusWord));
                }
                DAT_0054b4f0 = (float)fVar12;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                if (DAT_0054b000 == 0) {
                  fVar12 = (float10)DAT_0054b4a4 /
                           ((float10)DAT_0054b4f0 * (float10)DAT_0054b650 +
                           ((float10)1.0 - (float10)DAT_0054b4f0) * (float10)DAT_0054b64c);
                }
                else {
                  fVar12 = (float10)adj_fdivr_m32();
                }
                DAT_0054b7f0 = (float)fVar12;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                if (DAT_0054b000 == 0) {
                  fVar12 = ((float10)_DAT_0054b1cc * (float10)_DAT_0054b214) /
                           (float10)(float)DAT_0054b768;
                }
                else {
                  fVar12 = (float10)adj_fdiv_m32();
                }
                DAT_0054b4cc = (float)fVar12;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                DAT_0054b4c4 = DAT_0054b1f8;
                DAT_0054b4c8 = DAT_0054b1f8;
                if (DAT_0054b000 == 0) {
                  fVar12 = ((float10)DAT_0054b1a4 * (float10)(float)DAT_0054b768) /
                           (float10)DAT_0054b188;
                }
                else {
                  fVar12 = (float10)adj_fdiv_m32();
                }
                if (((in_FPUStatusWord & 0xd) != 0) ||
                   (_DAT_0054b7f4 = (float)((float10)1.0 - fVar12), (in_FPUStatusWord & 0xd) != 0))
                goto LAB_0051c2fb;
                if (DAT_0054b000 == 0) {
                  fVar12 = (float10)_DAT_0054b7f4 / (float10)(float)DAT_0054b76c;
                }
                else {
                  unaff_ESI = DAT_0054b76c;
                  fVar12 = (float10)adj_fdiv_m32();
                }
                if (DAT_0054b000 == 0) {
                  fVar10 = ((float10)1.0 - (float10)_DAT_0054b7f4) / (float10)(float)DAT_0054b768;
                }
                else {
                  unaff_ESI = DAT_0054b768;
                  fVar10 = (float10)adj_fdiv_m32();
                  fVar12 = extraout_ST1_01;
                }
                if (DAT_0054b000 == 0) {
                  fVar11 = (float10)_DAT_0054b7f4 / (float10)(float)DAT_0054b76c;
                }
                else {
                  unaff_ESI = DAT_0054b76c;
                  fVar11 = (float10)adj_fdiv_m32();
                  fVar10 = extraout_ST1_02;
                }
                if (DAT_0054b000 == 0) {
                  fVar12 = fVar12 / (fVar11 + fVar10);
                }
                else {
                  fVar12 = (float10)adj_fdiv_r();
                }
                pfVar13 = &DAT_0054b764;
                DAT_0054b7f8 = (float)fVar12;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                DAT_0054b504 = DAT_0054b7f8;
                DAT_0054b508 = DAT_0054b7f8;
                uVar3 = FUN_0049ae10(&DAT_0054b764);
                DAT_0054b4ea = 0;
                _DAT_0054b54c = DAT_0054b2b8;
                if (DAT_0054b000 == 0) {
                  fVar12 = (((float10)_DAT_0054b134 + (float10)DAT_0054b120) * (float10)DAT_0054b330
                           ) / ((float10)(float)extraout_ST0_01 - (float10)DAT_0054b714);
                }
                else {
                  fVar12 = (float10)adj_fdiv_r(uVar3,&DAT_0054b548);
                }
                DAT_0054b538 = (float)fVar12;
                if (((((in_FPUStatusWord & 0xd) != 0) ||
                     (DAT_0054b528 = DAT_0054b538 * DAT_0054b740 * DAT_0054b41c,
                     (in_FPUStatusWord & 0xd) != 0)) ||
                    (DAT_0054b52c = DAT_0054b538 * DAT_0054b744 * DAT_0054b41c,
                    (in_FPUStatusWord & 0xd) != 0)) ||
                   (DAT_0054b530 = DAT_0054b12c * DAT_0054b740, DAT_0054b564 = DAT_0054b52c,
                   (in_FPUStatusWord & 0xd) != 0)) goto LAB_0051c2fb;
                DAT_0054b534 = DAT_0054b12c * DAT_0054b744;
                DAT_0054b548 = DAT_0054b2b0;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                DAT_0054b454 = 0x47c34ff3;
                DAT_0054b458 = 0x47c34ff3;
                DAT_0054b438 = 0x47c34ff3;
                DAT_0054b544 = DAT_0054b2b4;
                DAT_0054b560 = DAT_0054b528;
                fVar12 = FUN_0049bde0(pfVar13);
                _DAT_0054b7fc = (float)fVar12;
                _DAT_0054b800 = DAT_0054b544 - _DAT_0054b7fc;
                _DAT_0054b804 = 0;
                if (((in_FPUStatusWord & 0xd) != 0) ||
                   (_DAT_0054b540 = _DAT_0054b1b8 + 15.0, (in_FPUStatusWord & 0xd) != 0))
                goto LAB_0051c2fb;
                DAT_0054b53c = _DAT_0054bfa4 + 15.0;
                _DAT_0054b574 = DAT_0054b220;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                _DAT_0054b570 = DAT_0054b1bc;
                _DAT_0054b810 = 0;
                _DAT_0054b814 = 0;
                DAT_0054b55c = 0;
                DAT_0054b524 = 0;
                _DAT_0054ba4c = DAT_0054b124;
                _DAT_0054ba40 = DAT_0054b57c;
                DAT_0054b808 = (_DAT_0054b2a0 - _DAT_0054b1a8) * DAT_0054b41c + _DAT_0054b1a8;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                _DAT_0054b80c = 0x3f800000;
                DAT_0054b558 = 0x3f800000;
                _DAT_0054b818 = DAT_0054b41c;
                _DAT_0054b81c = DAT_0054b41c;
                DAT_0054b428 = DAT_0054b41c;
                DAT_0054b550 = DAT_0054b808;
                DAT_0054b554 = DAT_0054b808;
                FUN_00526200();
                if (DAT_0054b000 == 0) {
                  fVar12 = ((float10)DAT_0054b548 - (float10)DAT_0054b300) / (float10)DAT_0054b304;
                  iVar4 = DAT_0054bd20;
                }
                else {
                  fVar12 = (float10)adj_fdiv_m32(DAT_0054b304);
                  iVar4 = extraout_ECX;
                }
                *(double *)(iVar4 + 0x30) = (double)fVar12;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                if (DAT_0054b000 == 0) {
                  fVar12 = ((float10)DAT_0054b548 - (float10)DAT_0054b300) / (float10)DAT_0054b304;
                  iVar4 = DAT_0054bd20;
                }
                else {
                  fVar12 = (float10)adj_fdiv_m32();
                  iVar4 = extraout_EDX;
                }
                *(double *)(iVar4 + 0x38) = (double)fVar12;
                if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                _DAT_0054baa4 = 0;
                _DAT_0054baa8 = 0;
                DAT_0054c068 = DAT_0054c06c;
                DAT_0054b6f8 = DAT_0054b524;
              }
              else {
                _DAT_0054b818 = DAT_0054b424;
                DAT_0054b40c = DAT_0054b418;
                _DAT_0054bbc8 = DAT_0054b524;
                _DAT_0054b81c = DAT_0054b424;
                _DAT_0054b820 = DAT_0054b554;
                if (DAT_0054b080 == 0) {
                  sVar1 = 1;
                  do {
                    if (0x14 < sVar1) goto LAB_0051bac5;
                    uVar8 = (int)sVar1 - 1;
                    if (0x13 < uVar8) {
                      __vbaGenerateBoundsError();
                    }
                    if (*(short *)(DAT_0054b630 + uVar8 * 2) != 0) {
                      if ((0x13 < uVar8) && (__vbaGenerateBoundsError(), 0x13 < uVar8)) {
                        __vbaGenerateBoundsError();
                      }
                      *(float *)(DAT_0054b5f8 + uVar8 * 4) =
                           (DAT_0054b418 - *(float *)(DAT_0054b5dc + uVar8 * 4)) - 1.0;
                      if ((in_FPUStatusWord & 0xd) != 0) goto LAB_0051c2fb;
                    }
                    bVar9 = SCARRY2(sVar1,1);
                    sVar1 = sVar1 + 1;
                  } while (!bVar9);
                  goto LAB_0051c300;
                }
              }
LAB_0051bac5:
              _DAT_0054bfe8 = DAT_0054b548;
              _DAT_0054bfcc = 0;
              _DAT_0054bfbc = 0;
              _DAT_0054bbb0 = 0x47c34f80;
              if (*(short *)(DAT_0054b630 + 0x10) == -1) {
                _DAT_0054ba9c = DAT_0054b560;
                _DAT_0054baac = DAT_0054b564;
              }
              else {
                _DAT_0054ba9c = 0.0;
                _DAT_0054baac = 0.0;
              }
              _DAT_0054b490 = DAT_0054b48c;
              uVar3 = __vbaFpI4();
              uVar3 = (**(code **)(*DAT_0054b024 + 0x608))
                                (DAT_0054b024,0x68030000,3,local_40,uVar3,local_38);
              uVar3 = __vbaObjSet(&local_1c,uVar3);
              __vbaLateIdSt(uVar3);
              __vbaFreeObj();
              uVar3 = (**(code **)(*DAT_0054b024 + 0x60c))
                                (DAT_0054b024,0x68030000,3,local_40,1,local_38);
              uVar3 = __vbaObjSet(&local_1c,uVar3);
              __vbaLateIdSt(uVar3);
              __vbaFreeObj();
              FUN_004f8120((float *)&DAT_0054b48c);
              uVar3 = DAT_0054b944;
              local_18 = 1;
              uVar8 = local_18;
              do {
                local_18 = uVar8;
                local_7c = (short)uVar3;
                if (local_7c < (short)local_18) {
                  if (DAT_0054b000 == 0) {
                    fVar12 = (float10)DAT_0054b4b0 / (float10)30.0;
                  }
                  else {
                    unaff_ESI = (float *)0x51be08;
                    fVar12 = (float10)adj_fdiv_m32();
                  }
                  _DAT_0054b9f8 = 0;
                  _DAT_0054b9fc = 0;
                  DAT_0054ba0c = 0;
                  DAT_0054ba10 = 0;
                  _DAT_0054ba14 = 0;
                  _DAT_0054ba18 = 0;
                  DAT_0054b848 = DAT_0054b518;
                  _DAT_0054b838 = (float)fVar12;
                  if ((in_FPUStatusWord & 0xd) == 0) {
                    if (DAT_0054b000 == 0) {
                      fVar12 = (float10)DAT_0054b530 / (float10)DAT_0054b12c;
                    }
                    else {
                      fVar12 = (float10)adj_fdiv_m32();
                    }
                    if (DAT_0054b000 == 0) {
                      fVar12 = fVar12 / (float10)DAT_0054b740;
                    }
                    else {
                      fVar12 = (float10)adj_fdiv_m32();
                    }
                    _DAT_0054b83c = (float)(fVar12 * (float10)100.0);
                    if ((in_FPUStatusWord & 0xd) == 0) {
                      if (DAT_0054b000 == 0) {
                        fVar12 = (float10)DAT_0054b534 / (float10)DAT_0054b12c;
                      }
                      else {
                        fVar12 = (float10)adj_fdiv_m32();
                      }
                      if (DAT_0054b000 == 0) {
                        fVar12 = fVar12 / (float10)DAT_0054b744;
                      }
                      else {
                        fVar12 = (float10)adj_fdiv_m32();
                      }
                      _DAT_0054b840 = (float)(fVar12 * (float10)100.0);
                      if ((in_FPUStatusWord & 0xd) == 0) {
                        DAT_0054b844 = DAT_0054b514;
                        uVar3 = (**(code **)(*DAT_0054b024 + 0x548))(DAT_0054b024);
                        uVar3 = __vbaObjSet(&local_1c,uVar3);
                        uVar3 = __vbaLateIdCallLd(local_34,uVar3);
                        sVar1 = __vbaBoolVar(uVar3);
                        __vbaFreeObj();
                        __vbaFreeVar();
                        if (sVar1 == 0) {
                          uVar3 = (**(code **)(*DAT_0054b024 + 0x4c0))
                                            (DAT_0054b024,0x68030005,0xb,local_40,0xffffffff,
                                             local_38);
                          uVar3 = __vbaObjSet(&local_1c,uVar3);
                          __vbaLateIdSt(uVar3);
                          __vbaFreeObj();
                          local_3c = 0;
                        }
                        else {
                          uVar3 = (**(code **)(*DAT_0054b024 + 0x4c0))
                                            (DAT_0054b024,0x68030005,0xb,local_40,0,local_38);
                          uVar3 = __vbaObjSet(&local_1c,uVar3);
                          __vbaLateIdSt(uVar3);
                          __vbaFreeObj();
                          local_3c = 0xffffffff;
                        }
                        uVar3 = (**(code **)(*DAT_0054b024 + 0x448))
                                          (DAT_0054b024,0x68030005,0xb,local_40,local_3c,local_38);
                        uVar3 = __vbaObjSet(&local_1c,uVar3);
                        __vbaLateIdSt(uVar3);
                        __vbaFreeObj();
                        _DAT_0054b84c = DAT_0054b514;
                        pfVar13 = (float *)&DAT_0054b124;
                        _DAT_0054b858 = 0;
                        _DAT_0054b85c = 0;
                        DAT_0054b808 = (_DAT_0054b2a0 - _DAT_0054b1a8) * DAT_0054b41c +
                                       _DAT_0054b1a8;
                        if (((in_FPUStatusWord & 0xd) == 0) &&
                           (DAT_0054b850 = _DAT_0054b128 - _DAT_0054b1a8,
                           (in_FPUStatusWord & 0xd) == 0)) {
                          if (DAT_0054b000 == 0) {
                            fVar12 = (float10)(float)DAT_0054b768 /
                                     ((float10)DAT_0054b1f8 - (float10)_DAT_0054b1cc);
                          }
                          else {
                            pfVar13 = DAT_0054b768;
                            fVar12 = (float10)adj_fdivr_m32();
                          }
                          if (DAT_0054b000 == 0) {
                            fVar12 = (((float10)DAT_0054b1a4 -
                                      (float10)DAT_0054b4cc * (float10)(float)DAT_0054b204) * fVar12
                                     ) / (float10)(float)DAT_0054b204;
                          }
                          else {
                            pfVar13 = DAT_0054b204;
                            fVar12 = (float10)adj_fdiv_m32();
                          }
                          _DAT_0054b854 = (float)fVar12;
                          if ((in_FPUStatusWord & 0xd) == 0) {
                            fVar12 = FUN_0049c1e0(pfVar13,unaff_ESI);
                            _DAT_0054b860 = (float)fVar12;
                            DAT_0054b6c0 = DAT_0054b4a0 * 100.0;
                            if ((in_FPUStatusWord & 0xd) == 0) {
                              _DAT_0054b864 = 0;
                              _DAT_0054b868 = 0;
                              _DAT_0054b86c = 0;
                              DAT_0054b688 = DAT_0054b4f0;
                              FUN_0049b140(local_34,(float *)&DAT_0054b494,(float *)&DAT_0054b160);
                              fVar12 = (float10)__vbaR4Var(local_34);
                              DAT_0054b72c = (float)fVar12;
                              __vbaFreeVar();
                              _DAT_0054b870 = DAT_0054b464 * DAT_0054b12c;
                              if ((in_FPUStatusWord & 0xd) == 0) {
                                fVar12 = FUN_0049bde0(&DAT_0054b49c);
                                _DAT_0054b684 = (float)fVar12;
                                fVar12 = FUN_0049c1e0((float *)&DAT_0054b494,&DAT_0054b49c);
                                DAT_0054b654 = (float)fVar12;
                                if (DAT_0054b000 == 0) {
                                  fVar12 = (float10)DAT_0054b1a0 / (float10)DAT_0054b654;
                                }
                                else {
                                  fVar12 = (float10)adj_fdiv_m32();
                                }
                                DAT_0054c01c = 0;
                                DAT_0054c01e = 0;
                                DAT_0054bb3c = (float)fVar12;
                                if ((in_FPUStatusWord & 0xd) == 0) {
                                  DAT_0054bb38 = DAT_0054bb3c;
                                  uVar3 = (**(code **)(*DAT_0054b024 + 0x568))(DAT_0054b024);
                                  piVar7 = (int *)__vbaObjSet(&local_1c,uVar3);
                                  iVar4 = (**(code **)(*piVar7 + 0x40))(piVar7,0,&local_20);
                                  if (iVar4 < 0) {
                                    __vbaHresultCheckObj(iVar4,piVar7,&DAT_0041c968,0x40);
                                  }
                                  uVar3 = __vbaLateIdCallLd(local_34,local_20,0x68030009,0);
                                  uVar2 = __vbaI2Var(uVar3);
                                  local_3c = CONCAT22(local_3c._2_2_,uVar2);
                                  uVar3 = (**(code **)(*DAT_0054b038 + 0x3c8))
                                                    (DAT_0054b038,0x68030009,2,local_40,local_3c,
                                                     local_38);
                                  uVar3 = __vbaObjSet(&local_24,uVar3);
                                  __vbaLateIdSt(uVar3);
                                  __vbaFreeObjList(3,&local_1c,&local_20,&local_24);
                                  __vbaFreeVar();
                                  FUN_004f8920();
                                  DAT_0054b052 = 1;
                                  _DAT_0054b058 = DAT_0054b40c;
                                  _DAT_0054b070 = DAT_0054b40c;
                                  _DAT_0054b060 = DAT_0054b40c;
                                  _DAT_0054b068 = DAT_0054b40c;
                                  return;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  goto LAB_0051c2fb;
                }
                if ((DAT_0054b824 == (short *)0x0) || (*DAT_0054b824 != 1)) {
                  iVar4 = __vbaGenerateBoundsError();
                }
                else {
                  uVar8 = (int)(short)local_18 - *(int *)(DAT_0054b824 + 10);
                  if (*(uint *)(DAT_0054b824 + 8) <= uVar8) {
                    __vbaGenerateBoundsError();
                  }
                  iVar4 = uVar8 * 4;
                }
                *(undefined4 *)(*(int *)(DAT_0054b824 + 6) + iVar4) = 0;
                if ((DAT_0054b828 == (short *)0x0) || (*DAT_0054b828 != 1)) {
                  iVar4 = __vbaGenerateBoundsError();
                }
                else {
                  iVar6 = (int)(short)local_18;
                  iVar4 = *(int *)(DAT_0054b828 + 10);
                  if (*(uint *)(DAT_0054b828 + 8) <= (uint)(iVar6 - iVar4)) {
                    __vbaGenerateBoundsError();
                  }
                  iVar4 = (iVar6 - iVar4) * 4;
                }
                *(undefined4 *)(*(int *)(DAT_0054b828 + 6) + iVar4) = 0;
                if ((DAT_0054b82c == (short *)0x0) || (*DAT_0054b82c != 1)) {
                  iVar4 = __vbaGenerateBoundsError();
                }
                else {
                  iVar6 = (int)(short)local_18;
                  iVar4 = *(int *)(DAT_0054b82c + 10);
                  if (*(uint *)(DAT_0054b82c + 8) <= (uint)(iVar6 - iVar4)) {
                    __vbaGenerateBoundsError();
                  }
                  iVar4 = (iVar6 - iVar4) * 4;
                }
                *(undefined4 *)(*(int *)(DAT_0054b82c + 6) + iVar4) = 0;
                if ((DAT_0054b830 == (short *)0x0) || (*DAT_0054b830 != 1)) {
                  iVar4 = __vbaGenerateBoundsError();
                }
                else {
                  iVar6 = (int)(short)local_18;
                  iVar4 = *(int *)(DAT_0054b830 + 10);
                  if (*(uint *)(DAT_0054b830 + 8) <= (uint)(iVar6 - iVar4)) {
                    __vbaGenerateBoundsError();
                  }
                  iVar4 = (iVar6 - iVar4) * 4;
                }
                *(undefined4 *)(*(int *)(DAT_0054b830 + 6) + iVar4) = 0;
                uVar8 = (uint)(ushort)((short)local_18 + 1);
              } while (!SCARRY2((short)local_18,1));
              goto LAB_0051c300;
            }
          }
        }
      }
    }
  }
LAB_0051c2fb:
  __vbaFPException();
  return;
}

