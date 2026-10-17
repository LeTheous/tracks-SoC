// Generator : SpinalHDL v1.13.0    git head : d9d72474863badf47d8585d187f3e04ae4749c59
// Component : VexRiscv
// Git hash  : baf7dc82f855eddaf5b0a20a6802c526f127e38a

`timescale 1ns/1ps

module VexRiscv (
  input  wire [31:0]   externalResetVector,
  input  wire          timerInterrupt,
  input  wire          externalInterrupt,
  input  wire          softwareInterrupt,
  input  wire          externalInterruptS,
  output reg           iBusWishbone_CYC,
  output reg           iBusWishbone_STB,
  input  wire          iBusWishbone_ACK,
  output wire          iBusWishbone_WE,
  output wire [29:0]   iBusWishbone_ADR,
  input  wire [31:0]   iBusWishbone_DAT_MISO,
  output wire [31:0]   iBusWishbone_DAT_MOSI,
  output wire [3:0]    iBusWishbone_SEL,
  input  wire          iBusWishbone_ERR,
  output wire [2:0]    iBusWishbone_CTI,
  output wire [1:0]    iBusWishbone_BTE,
  output wire          dBusWishbone_CYC,
  output wire          dBusWishbone_STB,
  input  wire          dBusWishbone_ACK,
  output wire          dBusWishbone_WE,
  output wire [29:0]   dBusWishbone_ADR,
  input  wire [31:0]   dBusWishbone_DAT_MISO,
  output wire [31:0]   dBusWishbone_DAT_MOSI,
  output wire [3:0]    dBusWishbone_SEL,
  input  wire          dBusWishbone_ERR,
  output wire [2:0]    dBusWishbone_CTI,
  output wire [1:0]    dBusWishbone_BTE,
  input  wire          clk,
  input  wire          reset
);
  localparam EnvCtrlEnum_NONE = 1'd0;
  localparam EnvCtrlEnum_XRET = 1'd1;
  localparam BranchCtrlEnum_INC = 2'd0;
  localparam BranchCtrlEnum_B = 2'd1;
  localparam BranchCtrlEnum_JAL = 2'd2;
  localparam BranchCtrlEnum_JALR = 2'd3;
  localparam ShiftCtrlEnum_DISABLE_1 = 2'd0;
  localparam ShiftCtrlEnum_SLL_1 = 2'd1;
  localparam ShiftCtrlEnum_SRL_1 = 2'd2;
  localparam ShiftCtrlEnum_SRA_1 = 2'd3;
  localparam AluBitwiseCtrlEnum_XOR_1 = 2'd0;
  localparam AluBitwiseCtrlEnum_OR_1 = 2'd1;
  localparam AluBitwiseCtrlEnum_AND_1 = 2'd2;
  localparam Src2CtrlEnum_RS = 2'd0;
  localparam Src2CtrlEnum_IMI = 2'd1;
  localparam Src2CtrlEnum_IMS = 2'd2;
  localparam Src2CtrlEnum_PC = 2'd3;
  localparam AluCtrlEnum_ADD_SUB = 2'd0;
  localparam AluCtrlEnum_SLT_SLTU = 2'd1;
  localparam AluCtrlEnum_BITWISE = 2'd2;
  localparam Src1CtrlEnum_RS = 2'd0;
  localparam Src1CtrlEnum_IMU = 2'd1;
  localparam Src1CtrlEnum_PC_INCREMENT = 2'd2;
  localparam Src1CtrlEnum_URS1 = 2'd3;

  wire                IBusCachedPlugin_cache_io_flush;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isUser;
  reg                 IBusCachedPlugin_cache_io_cpu_fill_valid;
  reg        [31:0]   RegFilePlugin_regFile_spinal_port0;
  reg        [31:0]   RegFilePlugin_regFile_spinal_port1;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_1;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_2;
  wire                _zz_decode_LEGAL_INSTRUCTION_3;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_4;
  wire       [11:0]   _zz_decode_LEGAL_INSTRUCTION_5;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_6;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_7;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_8;
  wire                _zz_decode_LEGAL_INSTRUCTION_9;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_10;
  wire       [5:0]    _zz_decode_LEGAL_INSTRUCTION_11;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_12;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_13;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_14;
  wire                _zz_decode_LEGAL_INSTRUCTION_15;
  wire                _zz_decode_LEGAL_INSTRUCTION_16;
  wire       [3:0]    _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  reg        [31:0]   _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  wire       [1:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_6;
  wire       [31:0]   _zz_IBusCachedPlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusCachedPlugin_fetchPc_pc_1;
  wire       [11:0]   _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire       [31:0]   _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2;
  wire       [19:0]   _zz__zz_2;
  wire       [11:0]   _zz__zz_4;
  wire       [31:0]   _zz__zz_6;
  wire       [31:0]   _zz__zz_6_1;
  wire       [19:0]   _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload;
  wire       [11:0]   _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_4;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_5;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_6;
  wire       [2:0]    _zz_DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire       [31:0]   _zz__zz_decode_IS_CSR;
  wire                _zz__zz_decode_IS_CSR_1;
  wire                _zz__zz_decode_IS_CSR_2;
  wire       [0:0]    _zz__zz_decode_IS_CSR_3;
  wire       [0:0]    _zz__zz_decode_IS_CSR_4;
  wire       [31:0]   _zz__zz_decode_IS_CSR_5;
  wire       [0:0]    _zz__zz_decode_IS_CSR_6;
  wire       [31:0]   _zz__zz_decode_IS_CSR_7;
  wire                _zz__zz_decode_IS_CSR_8;
  wire       [31:0]   _zz__zz_decode_IS_CSR_9;
  wire       [31:0]   _zz__zz_decode_IS_CSR_10;
  wire       [0:0]    _zz__zz_decode_IS_CSR_11;
  wire       [0:0]    _zz__zz_decode_IS_CSR_12;
  wire       [0:0]    _zz__zz_decode_IS_CSR_13;
  wire       [24:0]   _zz__zz_decode_IS_CSR_14;
  wire       [2:0]    _zz__zz_decode_IS_CSR_15;
  wire                _zz__zz_decode_IS_CSR_16;
  wire       [31:0]   _zz__zz_decode_IS_CSR_17;
  wire       [0:0]    _zz__zz_decode_IS_CSR_18;
  wire       [31:0]   _zz__zz_decode_IS_CSR_19;
  wire       [31:0]   _zz__zz_decode_IS_CSR_20;
  wire       [21:0]   _zz__zz_decode_IS_CSR_21;
  wire       [0:0]    _zz__zz_decode_IS_CSR_22;
  wire       [31:0]   _zz__zz_decode_IS_CSR_23;
  wire       [0:0]    _zz__zz_decode_IS_CSR_24;
  wire       [31:0]   _zz__zz_decode_IS_CSR_25;
  wire       [1:0]    _zz__zz_decode_IS_CSR_26;
  wire       [31:0]   _zz__zz_decode_IS_CSR_27;
  wire       [31:0]   _zz__zz_decode_IS_CSR_28;
  wire       [31:0]   _zz__zz_decode_IS_CSR_29;
  wire       [31:0]   _zz__zz_decode_IS_CSR_30;
  wire                _zz__zz_decode_IS_CSR_31;
  wire       [31:0]   _zz__zz_decode_IS_CSR_32;
  wire       [31:0]   _zz__zz_decode_IS_CSR_33;
  wire       [0:0]    _zz__zz_decode_IS_CSR_34;
  wire       [17:0]   _zz__zz_decode_IS_CSR_35;
  wire       [1:0]    _zz__zz_decode_IS_CSR_36;
  wire       [31:0]   _zz__zz_decode_IS_CSR_37;
  wire       [31:0]   _zz__zz_decode_IS_CSR_38;
  wire                _zz__zz_decode_IS_CSR_39;
  wire       [31:0]   _zz__zz_decode_IS_CSR_40;
  wire       [31:0]   _zz__zz_decode_IS_CSR_41;
  wire       [31:0]   _zz__zz_decode_IS_CSR_42;
  wire       [31:0]   _zz__zz_decode_IS_CSR_43;
  wire       [0:0]    _zz__zz_decode_IS_CSR_44;
  wire                _zz__zz_decode_IS_CSR_45;
  wire       [0:0]    _zz__zz_decode_IS_CSR_46;
  wire       [0:0]    _zz__zz_decode_IS_CSR_47;
  wire       [31:0]   _zz__zz_decode_IS_CSR_48;
  wire       [14:0]   _zz__zz_decode_IS_CSR_49;
  wire                _zz__zz_decode_IS_CSR_50;
  wire       [0:0]    _zz__zz_decode_IS_CSR_51;
  wire       [31:0]   _zz__zz_decode_IS_CSR_52;
  wire                _zz__zz_decode_IS_CSR_53;
  wire       [0:0]    _zz__zz_decode_IS_CSR_54;
  wire       [31:0]   _zz__zz_decode_IS_CSR_55;
  wire       [0:0]    _zz__zz_decode_IS_CSR_56;
  wire       [31:0]   _zz__zz_decode_IS_CSR_57;
  wire       [0:0]    _zz__zz_decode_IS_CSR_58;
  wire       [0:0]    _zz__zz_decode_IS_CSR_59;
  wire       [4:0]    _zz__zz_decode_IS_CSR_60;
  wire       [31:0]   _zz__zz_decode_IS_CSR_61;
  wire       [31:0]   _zz__zz_decode_IS_CSR_62;
  wire                _zz__zz_decode_IS_CSR_63;
  wire       [31:0]   _zz__zz_decode_IS_CSR_64;
  wire       [0:0]    _zz__zz_decode_IS_CSR_65;
  wire       [31:0]   _zz__zz_decode_IS_CSR_66;
  wire       [31:0]   _zz__zz_decode_IS_CSR_67;
  wire       [1:0]    _zz__zz_decode_IS_CSR_68;
  wire                _zz__zz_decode_IS_CSR_69;
  wire                _zz__zz_decode_IS_CSR_70;
  wire       [10:0]   _zz__zz_decode_IS_CSR_71;
  wire       [1:0]    _zz__zz_decode_IS_CSR_72;
  wire       [31:0]   _zz__zz_decode_IS_CSR_73;
  wire       [31:0]   _zz__zz_decode_IS_CSR_74;
  wire                _zz__zz_decode_IS_CSR_75;
  wire                _zz__zz_decode_IS_CSR_76;
  wire       [31:0]   _zz__zz_decode_IS_CSR_77;
  wire       [0:0]    _zz__zz_decode_IS_CSR_78;
  wire       [0:0]    _zz__zz_decode_IS_CSR_79;
  wire       [31:0]   _zz__zz_decode_IS_CSR_80;
  wire       [31:0]   _zz__zz_decode_IS_CSR_81;
  wire       [0:0]    _zz__zz_decode_IS_CSR_82;
  wire       [31:0]   _zz__zz_decode_IS_CSR_83;
  wire       [31:0]   _zz__zz_decode_IS_CSR_84;
  wire       [7:0]    _zz__zz_decode_IS_CSR_85;
  wire       [0:0]    _zz__zz_decode_IS_CSR_86;
  wire       [31:0]   _zz__zz_decode_IS_CSR_87;
  wire       [31:0]   _zz__zz_decode_IS_CSR_88;
  wire                _zz__zz_decode_IS_CSR_89;
  wire       [0:0]    _zz__zz_decode_IS_CSR_90;
  wire       [31:0]   _zz__zz_decode_IS_CSR_91;
  wire       [2:0]    _zz__zz_decode_IS_CSR_92;
  wire                _zz__zz_decode_IS_CSR_93;
  wire                _zz__zz_decode_IS_CSR_94;
  wire       [0:0]    _zz__zz_decode_IS_CSR_95;
  wire       [0:0]    _zz__zz_decode_IS_CSR_96;
  wire       [31:0]   _zz__zz_decode_IS_CSR_97;
  wire       [4:0]    _zz__zz_decode_IS_CSR_98;
  wire                _zz__zz_decode_IS_CSR_99;
  wire                _zz__zz_decode_IS_CSR_100;
  wire       [0:0]    _zz__zz_decode_IS_CSR_101;
  wire       [31:0]   _zz__zz_decode_IS_CSR_102;
  wire       [0:0]    _zz__zz_decode_IS_CSR_103;
  wire       [31:0]   _zz__zz_decode_IS_CSR_104;
  wire       [0:0]    _zz__zz_decode_IS_CSR_105;
  wire       [0:0]    _zz__zz_decode_IS_CSR_106;
  wire       [31:0]   _zz__zz_decode_IS_CSR_107;
  wire       [0:0]    _zz__zz_decode_IS_CSR_108;
  wire       [2:0]    _zz__zz_decode_IS_CSR_109;
  wire       [1:0]    _zz__zz_decode_IS_CSR_110;
  wire       [31:0]   _zz__zz_decode_IS_CSR_111;
  wire       [31:0]   _zz__zz_decode_IS_CSR_112;
  wire                _zz__zz_decode_IS_CSR_113;
  wire                _zz__zz_decode_IS_CSR_114;
  wire                _zz__zz_decode_IS_CSR_115;
  wire                _zz_RegFilePlugin_regFile_port;
  wire                _zz_decode_RegFilePlugin_rs1Data;
  wire                _zz_RegFilePlugin_regFile_port_1;
  wire                _zz_decode_RegFilePlugin_rs2Data;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_execute_SRC1;
  wire       [4:0]    _zz__zz_execute_SRC1_1;
  wire       [11:0]   _zz__zz_execute_SRC2_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [31:0]   _zz__zz_decode_RS2_3;
  wire       [32:0]   _zz__zz_decode_RS2_3_1;
  wire       [5:0]    _zz_memory_MulDivIterativePlugin_mul_counter_valueNext;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_mul_counter_valueNext_1;
  wire       [33:0]   _zz_memory_MulDivIterativePlugin_accumulator;
  wire       [33:0]   _zz_memory_MulDivIterativePlugin_accumulator_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_accumulator_2;
  wire       [33:0]   _zz_memory_MulDivIterativePlugin_accumulator_3;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_accumulator_4;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_accumulator_5;
  wire       [5:0]    _zz_memory_MulDivIterativePlugin_div_counter_valueNext;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_2;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_3;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_4;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_div_result_5;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_rs1_2;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_rs1_3;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_rs2_1;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_rs2_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_4;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire       [0:0]    _zz_execute_BranchPlugin_branch_src2_6;
  wire       [7:0]    _zz_execute_BranchPlugin_branch_src2_7;
  wire                _zz_execute_BranchPlugin_branch_src2_8;
  wire       [0:0]    _zz_execute_BranchPlugin_branch_src2_9;
  wire       [0:0]    _zz_execute_BranchPlugin_branch_src2_10;
  wire       [2:0]    _zz_execute_BranchPlugin_branch_src2_11;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3_1;
  wire                _zz_when;
  wire                _zz_when_1;
  wire       [29:0]   _zz_CsrPlugin_jumpInterface_payload;
  wire       [29:0]   _zz_CsrPlugin_jumpInterface_payload_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_0_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_0_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_0_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_1_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_1_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_1_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_2_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_2_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_2_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_3_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_3_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_3_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_4_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_4_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_4_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_5_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_5_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_5_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_6_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_6_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_6_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_7_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_7_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_7_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_8_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_8_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_8_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_9_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_9_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_9_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_10_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_10_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_10_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_11_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_11_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_11_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_12_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_12_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_12_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_13_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_13_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_13_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_14_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_14_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_14_2_1;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_15_5;
  wire       [35:0]   _zz__zz_PmpPlugin_ports_0_hits_15_2;
  wire       [33:0]   _zz__zz_PmpPlugin_ports_0_hits_15_2_1;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_0_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_0_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_1_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_1_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_2_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_2_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_3_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_3_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_4_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_4_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_5_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_5_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_6_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_6_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_7_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_7_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_8_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_8_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_9_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_9_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_10_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_10_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_11_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_11_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_12_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_12_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_13_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_13_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_14_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_14_8;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_15_7;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_15_8;
  wire       [4:0]    _zz_when_PmpPlugin_l250_8;
  wire       [4:0]    _zz_when_PmpPlugin_l250_9;
  wire       [4:0]    _zz_when_PmpPlugin_l250_10;
  reg        [4:0]    _zz_when_PmpPlugin_l250_11;
  wire       [2:0]    _zz_when_PmpPlugin_l250_12;
  reg        [4:0]    _zz_when_PmpPlugin_l250_13;
  wire       [2:0]    _zz_when_PmpPlugin_l250_14;
  wire       [4:0]    _zz_when_PmpPlugin_l250_15;
  reg        [4:0]    _zz_when_PmpPlugin_l250_16;
  wire       [2:0]    _zz_when_PmpPlugin_l250_17;
  reg        [4:0]    _zz_when_PmpPlugin_l250_18;
  wire       [2:0]    _zz_when_PmpPlugin_l250_19;
  wire       [4:0]    _zz_when_PmpPlugin_l250_20;
  reg        [4:0]    _zz_when_PmpPlugin_l250_21;
  wire       [2:0]    _zz_when_PmpPlugin_l250_22;
  reg        [4:0]    _zz_when_PmpPlugin_l250_23;
  wire       [2:0]    _zz_when_PmpPlugin_l250_24;
  wire       [0:0]    _zz_when_PmpPlugin_l250_25;
  wire       [0:0]    _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowRead_32;
  wire       [4:0]    _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowRead_32_1;
  wire       [15:0]   _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49;
  wire       [3:0]    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_50;
  wire       [0:0]    _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_32;
  wire       [4:0]    _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_32_1;
  wire       [15:0]   _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49;
  wire       [3:0]    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_50;
  wire       [0:0]    _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_32;
  wire       [4:0]    _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_32_1;
  wire       [15:0]   _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49;
  wire       [3:0]    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_50;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_105;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_106;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_107;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_108;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_109;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_110;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_111;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_112;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_113;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_114;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_115;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_116;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_117;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_118;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_119;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_120;
  wire       [26:0]   _zz_iBusWishbone_ADR_1;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_PREDICTION_HAD_BRANCHED1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [0:0]    _zz_memory_to_writeBack_ENV_CTRL;
  wire       [0:0]    _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       [0:0]    _zz_execute_to_memory_ENV_CTRL;
  wire       [0:0]    _zz_execute_to_memory_ENV_CTRL_1;
  wire       [0:0]    decode_ENV_CTRL;
  wire       [0:0]    _zz_decode_ENV_CTRL;
  wire       [0:0]    _zz_decode_to_execute_ENV_CTRL;
  wire       [0:0]    _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL_1;
  wire                decode_IS_DIV;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_MUL;
  wire       [1:0]    decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       [1:0]    decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       [1:0]    decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL_1;
  wire       [1:0]    decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL_1;
  wire                decode_MEMORY_ENABLE;
  wire       [1:0]    decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL_1;
  wire                decode_RESCHEDULE_NEXT;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       [0:0]    memory_ENV_CTRL;
  wire       [0:0]    _zz_memory_ENV_CTRL;
  wire       [0:0]    execute_ENV_CTRL;
  wire       [0:0]    _zz_execute_ENV_CTRL;
  wire       [0:0]    writeBack_ENV_CTRL;
  wire       [0:0]    _zz_writeBack_ENV_CTRL;
  wire                execute_RESCHEDULE_NEXT;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_PREDICTION_HAD_BRANCHED1;
  wire                execute_BRANCH_COND_RESULT;
  wire       [1:0]    execute_BRANCH_CTRL;
  wire       [1:0]    _zz_execute_BRANCH_CTRL;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire                execute_IS_RS1_SIGNED;
  wire       [31:0]   execute_RS1;
  wire                execute_IS_DIV;
  wire                execute_IS_MUL;
  wire                execute_IS_RS2_SIGNED;
  wire                memory_IS_DIV;
  wire       [31:0]   memory_INSTRUCTION;
  reg        [31:0]   _zz_decode_RS2;
  wire                memory_IS_MUL;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [1:0]    execute_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_execute_to_memory_PC;
  wire       [1:0]    execute_SRC2_CTRL;
  wire       [1:0]    _zz_execute_SRC2_CTRL;
  wire       [1:0]    execute_SRC1_CTRL;
  wire       [1:0]    _zz_execute_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       [1:0]    execute_ALU_CTRL;
  wire       [1:0]    _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       [1:0]    execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       [0:0]    _zz_decode_ENV_CTRL_1;
  wire       [1:0]    _zz_decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_1;
  wire       [1:0]    _zz_decode_SRC2_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_CTRL_1;
  wire       [1:0]    _zz_decode_SRC1_CTRL_1;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_ALIGNEMENT_FAULT;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       [1:0]    decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_1;
  wire       [31:0]   decode_INSTRUCTION;
  reg        [31:0]   _zz_execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [31:0]   _zz_decode_to_execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  wire                decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  wire                execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  wire                execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusCachedPlugin_fetcherHalt;
  wire                IBusCachedPlugin_forceNoDecodeCond;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusCachedPlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  reg                 IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire                IBusCachedPlugin_decodePrediction_rsp_wasWrong;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  reg                 IBusCachedPlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                IBusCachedPlugin_mmuBus_rsp_isPaging;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowRead;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                IBusCachedPlugin_mmuBus_rsp_exception;
  wire                IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  reg                 DBusSimplePlugin_memoryExceptionPort_valid;
  reg        [3:0]    DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire       [31:0]   DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  wire                BranchPlugin_inDebugNoFetchFlag;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  reg                 CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
  reg                 CsrPlugin_csrMapping_doForceFailCsr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  wire                CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  reg                 CsrPlugin_redoInterface_valid;
  wire       [31:0]   CsrPlugin_redoInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  wire                CsrPlugin_forceMachineWire;
  wire                CsrPlugin_allowInterrupts;
  wire                CsrPlugin_allowException;
  wire                CsrPlugin_allowEbreakException;
  reg                 CsrPlugin_xretAwayFromMachine;
  wire                IBusCachedPlugin_externalFlush;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_2;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_3;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_4;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                IBusCachedPlugin_fetchPc_output_fire;
  wire                IBusCachedPlugin_fetchPc_corrected;
  reg                 IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  wire                when_Fetcher_l133;
  wire                when_Fetcher_l133_1;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  wire       [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
  wire                when_Fetcher_l160;
  reg                 IBusCachedPlugin_iBusRsp_redoFetch;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_2_halt;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_payload;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_payload;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_payload;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_ready;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l242;
  wire                when_Fetcher_l322;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l331;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l331_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l331_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l331_3;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_4;
  wire                when_Fetcher_l331_4;
  wire                _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  reg        [18:0]   _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1;
  wire                _zz_2;
  reg        [10:0]   _zz_3;
  wire                _zz_4;
  reg        [18:0]   _zz_5;
  reg                 _zz_6;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload;
  reg        [10:0]   _zz_IBusCachedPlugin_predictionJumpInterface_payload_1;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  reg        [18:0]   _zz_IBusCachedPlugin_predictionJumpInterface_payload_3;
  wire                iBus_cmd_valid;
  wire                iBus_cmd_ready;
  reg        [31:0]   iBus_cmd_payload_address;
  wire       [2:0]    iBus_cmd_payload_size;
  wire                iBus_rsp_valid;
  wire       [31:0]   iBus_rsp_payload_data;
  wire                iBus_rsp_payload_error;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                when_IBusCachedPlugin_l245;
  wire                when_IBusCachedPlugin_l250;
  wire                when_IBusCachedPlugin_l256;
  wire                when_IBusCachedPlugin_l262;
  wire                when_IBusCachedPlugin_l273;
  wire                dBus_cmd_valid;
  wire                dBus_cmd_ready;
  wire                dBus_cmd_payload_wr;
  wire       [3:0]    dBus_cmd_payload_mask;
  wire       [31:0]   dBus_cmd_payload_address;
  wire       [31:0]   dBus_cmd_payload_data;
  wire       [1:0]    dBus_cmd_payload_size;
  wire                dBus_rsp_ready;
  wire                dBus_rsp_error;
  wire       [31:0]   dBus_rsp_data;
  wire                _zz_dBus_cmd_valid;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_dBus_cmd_payload_data;
  wire                when_DBusSimplePlugin_l435;
  reg        [3:0]    _zz_execute_DBusSimplePlugin_formalMask;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  wire                when_DBusSimplePlugin_l490;
  wire                when_DBusSimplePlugin_l497;
  wire                when_DBusSimplePlugin_l523;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire       [1:0]    switch_Misc_l245;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_1;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire                when_DBusSimplePlugin_l566;
  wire       [30:0]   _zz_decode_IS_CSR;
  wire                _zz_decode_IS_CSR_1;
  wire                _zz_decode_IS_CSR_2;
  wire                _zz_decode_IS_CSR_3;
  wire                _zz_decode_IS_CSR_4;
  wire                _zz_decode_IS_CSR_5;
  wire                _zz_decode_IS_CSR_6;
  wire                _zz_decode_IS_CSR_7;
  wire                _zz_decode_IS_CSR_8;
  wire       [1:0]    _zz_decode_SRC1_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_CTRL_2;
  wire       [1:0]    _zz_decode_SRC2_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_2;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_2;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_2;
  wire       [0:0]    _zz_decode_ENV_CTRL_2;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_10;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_execute_REGFILE_WRITE_DATA;
  reg        [31:0]   _zz_execute_SRC1;
  wire                _zz_execute_SRC2;
  reg        [19:0]   _zz_execute_SRC2_1;
  wire                _zz_execute_SRC2_2;
  reg        [19:0]   _zz_execute_SRC2_3;
  reg        [31:0]   _zz_execute_SRC2_4;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  reg                 execute_LightShifterPlugin_isActive;
  wire                execute_LightShifterPlugin_isShift;
  reg        [4:0]    execute_LightShifterPlugin_amplitudeReg;
  wire       [4:0]    execute_LightShifterPlugin_amplitude;
  wire       [31:0]   execute_LightShifterPlugin_shiftInput;
  wire                execute_LightShifterPlugin_done;
  wire                when_ShiftPlugins_l169;
  reg        [31:0]   _zz_decode_RS2_3;
  wire                when_ShiftPlugins_l175;
  wire                when_ShiftPlugins_l184;
  reg        [32:0]   memory_MulDivIterativePlugin_rs1;
  reg        [31:0]   memory_MulDivIterativePlugin_rs2;
  reg        [64:0]   memory_MulDivIterativePlugin_accumulator;
  wire                memory_MulDivIterativePlugin_frontendOk;
  reg                 memory_MulDivIterativePlugin_mul_counter_willIncrement;
  reg                 memory_MulDivIterativePlugin_mul_counter_willClear;
  reg        [5:0]    memory_MulDivIterativePlugin_mul_counter_valueNext;
  reg        [5:0]    memory_MulDivIterativePlugin_mul_counter_value;
  wire                memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc;
  wire                memory_MulDivIterativePlugin_mul_counter_willOverflow;
  wire                when_MulDivIterativePlugin_l96;
  wire                when_MulDivIterativePlugin_l97;
  wire                when_MulDivIterativePlugin_l100;
  wire                when_MulDivIterativePlugin_l110;
  reg                 memory_MulDivIterativePlugin_div_needRevert;
  reg                 memory_MulDivIterativePlugin_div_counter_willIncrement;
  reg                 memory_MulDivIterativePlugin_div_counter_willClear;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_valueNext;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_value;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflowIfInc;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflow;
  reg                 memory_MulDivIterativePlugin_div_done;
  wire                when_MulDivIterativePlugin_l126;
  wire                when_MulDivIterativePlugin_l126_1;
  reg        [31:0]   memory_MulDivIterativePlugin_div_result;
  wire                when_MulDivIterativePlugin_l128;
  wire                when_MulDivIterativePlugin_l129;
  wire                when_MulDivIterativePlugin_l132;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire                when_MulDivIterativePlugin_l151;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_result;
  wire                when_MulDivIterativePlugin_l162;
  wire                _zz_memory_MulDivIterativePlugin_rs2;
  wire                _zz_memory_MulDivIterativePlugin_rs1;
  reg        [32:0]   _zz_memory_MulDivIterativePlugin_rs1_1;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l245_1;
  reg                 _zz_execute_BRANCH_COND_RESULT;
  reg                 _zz_execute_BRANCH_COND_RESULT_1;
  wire                _zz_execute_BranchPlugin_missAlignedTarget;
  reg        [19:0]   _zz_execute_BranchPlugin_missAlignedTarget_1;
  wire                _zz_execute_BranchPlugin_missAlignedTarget_2;
  reg        [10:0]   _zz_execute_BranchPlugin_missAlignedTarget_3;
  wire                _zz_execute_BranchPlugin_missAlignedTarget_4;
  reg        [18:0]   _zz_execute_BranchPlugin_missAlignedTarget_5;
  reg                 _zz_execute_BranchPlugin_missAlignedTarget_6;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg        [1:0]    _zz_CsrPlugin_privilege;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle;
  reg        [63:0]   CsrPlugin_minstret;
  wire                CsrPlugin_medeleg_IAM;
  wire                CsrPlugin_medeleg_IAF;
  wire                CsrPlugin_medeleg_II;
  wire                CsrPlugin_medeleg_BP;
  wire                CsrPlugin_medeleg_LAM;
  wire                CsrPlugin_medeleg_LAF;
  wire                CsrPlugin_medeleg_SAM;
  wire                CsrPlugin_medeleg_SAF;
  wire                CsrPlugin_medeleg_EU;
  wire                CsrPlugin_medeleg_ES;
  wire                CsrPlugin_medeleg_IPF;
  wire                CsrPlugin_medeleg_LPF;
  wire                CsrPlugin_medeleg_SPF;
  wire                CsrPlugin_mideleg_ST;
  wire                CsrPlugin_mideleg_SE;
  wire                CsrPlugin_mideleg_SS;
  wire                CsrPlugin_mcounteren_IR;
  wire                CsrPlugin_mcounteren_TM;
  reg                 CsrPlugin_mcounteren_CY;
  wire                CsrPlugin_scounteren_IR;
  wire                CsrPlugin_scounteren_TM;
  reg                 CsrPlugin_scounteren_CY;
  reg                 CsrPlugin_sstatus_SIE;
  reg                 CsrPlugin_sstatus_SPIE;
  reg        [0:0]    CsrPlugin_sstatus_SPP;
  reg                 CsrPlugin_sip_SEIP_SOFT;
  reg                 CsrPlugin_sip_SEIP_INPUT;
  wire                CsrPlugin_sip_SEIP_OR;
  reg                 CsrPlugin_sip_STIP;
  reg                 CsrPlugin_sip_SSIP;
  reg                 CsrPlugin_sie_SEIE;
  reg                 CsrPlugin_sie_STIE;
  reg                 CsrPlugin_sie_SSIE;
  reg        [1:0]    CsrPlugin_stvec_mode;
  reg        [29:0]   CsrPlugin_stvec_base;
  reg                 CsrPlugin_scause_interrupt;
  reg        [3:0]    CsrPlugin_scause_exceptionCode;
  reg        [31:0]   CsrPlugin_stval;
  reg        [31:0]   CsrPlugin_sepc;
  reg        [21:0]   CsrPlugin_satp_PPN;
  reg        [8:0]    CsrPlugin_satp_ASID;
  reg        [0:0]    CsrPlugin_satp_MODE;
  reg                 CsrPlugin_rescheduleLogic_rescheduleNext;
  wire                when_CsrPlugin_l1153;
  wire                _zz_when_CsrPlugin_l1302;
  wire                _zz_when_CsrPlugin_l1302_1;
  wire                _zz_when_CsrPlugin_l1302_2;
  wire                _zz_when_CsrPlugin_l1302_3;
  wire                _zz_when_CsrPlugin_l1302_4;
  wire                _zz_when_CsrPlugin_l1302_5;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  reg        [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire                when_CsrPlugin_l1216;
  wire                when_CsrPlugin_l1216_1;
  wire                when_CsrPlugin_l1216_2;
  wire                when_CsrPlugin_l1216_3;
  wire                when_CsrPlugin_l1216_4;
  wire                when_CsrPlugin_l1216_5;
  wire                when_CsrPlugin_l1216_6;
  wire                when_CsrPlugin_l1216_7;
  wire                when_CsrPlugin_l1216_8;
  wire                when_CsrPlugin_l1216_9;
  wire                when_CsrPlugin_l1216_10;
  wire                when_CsrPlugin_l1216_11;
  wire                when_CsrPlugin_l1216_12;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  wire                _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire       [1:0]    _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_2;
  wire                _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3;
  wire                when_CsrPlugin_l1259;
  wire                when_CsrPlugin_l1259_1;
  wire                when_CsrPlugin_l1259_2;
  wire                when_CsrPlugin_l1259_3;
  wire                when_CsrPlugin_l1272;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l1296;
  wire                when_CsrPlugin_l1296_1;
  wire                when_CsrPlugin_l1302;
  wire                when_CsrPlugin_l1302_1;
  wire                when_CsrPlugin_l1302_2;
  wire                when_CsrPlugin_l1302_3;
  wire                when_CsrPlugin_l1302_4;
  wire                when_CsrPlugin_l1302_5;
  wire                when_CsrPlugin_l1302_6;
  wire                when_CsrPlugin_l1302_7;
  wire                when_CsrPlugin_l1302_8;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l1335;
  wire                when_CsrPlugin_l1335_1;
  wire                when_CsrPlugin_l1335_2;
  wire                when_CsrPlugin_l1340;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                when_CsrPlugin_l1346;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  wire                CsrPlugin_trapCauseEbreakDebug;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                CsrPlugin_trapEnterDebug;
  wire                when_CsrPlugin_l1390;
  wire                when_CsrPlugin_l1398;
  wire                when_CsrPlugin_l1456;
  wire       [1:0]    switch_CsrPlugin_l1460;
  wire                when_CsrPlugin_l1468;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1527;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1547;
  wire                when_CsrPlugin_l1548;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  reg        [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l245_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1587;
  wire                when_CsrPlugin_l1591;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute;
  reg                 _zz_when_PmpPlugin_l126;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_1;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_1;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_1;
  reg                 _zz_when_PmpPlugin_l126_1;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg                 _zz_PmpPlugin_ports_0_hits_0;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_0_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_0_2;
  wire                when_PmpPlugin_l126;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_0_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_0_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_0_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_0_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_2;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_2;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_2;
  reg                 _zz_when_PmpPlugin_l126_2;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_4;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_5;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_3;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_3;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_3;
  reg                 _zz_when_PmpPlugin_l126_3;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_6;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_7;
  reg                 _zz_PmpPlugin_ports_0_hits_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_1_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_1_2;
  wire                when_PmpPlugin_l126_1;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_1_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_1_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_1_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_1_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_4;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_4;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_4;
  reg                 _zz_when_PmpPlugin_l126_4;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_8;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_9;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_5;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_5;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_5;
  reg                 _zz_when_PmpPlugin_l126_5;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_10;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_11;
  reg                 _zz_PmpPlugin_ports_0_hits_2;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_2_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_2_2;
  wire                when_PmpPlugin_l126_2;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_2_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_2_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_2_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_2_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_6;
  reg                 _zz_when_PmpPlugin_l126_6;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_12;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_13;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_7;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_7;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_7;
  reg                 _zz_when_PmpPlugin_l126_7;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_14;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_15;
  reg                 _zz_PmpPlugin_ports_0_hits_3;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_3_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_3_2;
  wire                when_PmpPlugin_l126_3;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_3_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_3_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_3_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_3_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_8;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_8;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_8;
  reg                 _zz_when_PmpPlugin_l126_8;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_16;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_17;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_9;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_9;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_9;
  reg                 _zz_when_PmpPlugin_l126_9;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_18;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_19;
  reg                 _zz_PmpPlugin_ports_0_hits_4;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_4_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_4_2;
  wire                when_PmpPlugin_l126_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_4_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_4_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_4_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_4_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_10;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_10;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_10;
  reg                 _zz_when_PmpPlugin_l126_10;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_20;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_21;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_11;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_11;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_11;
  reg                 _zz_when_PmpPlugin_l126_11;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_22;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_23;
  reg                 _zz_PmpPlugin_ports_0_hits_5;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_5_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_5_2;
  wire                when_PmpPlugin_l126_5;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_5_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_5_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_5_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_5_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_12;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_12;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_12;
  reg                 _zz_when_PmpPlugin_l126_12;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_24;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_25;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_13;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_13;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_13;
  reg                 _zz_when_PmpPlugin_l126_13;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_26;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_27;
  reg                 _zz_PmpPlugin_ports_0_hits_6;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_6_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_6_2;
  wire                when_PmpPlugin_l126_6;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_6_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_6_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_6_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_6_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_14;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_14;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_14;
  reg                 _zz_when_PmpPlugin_l126_14;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_28;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_29;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_15;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_15;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_15;
  reg                 _zz_when_PmpPlugin_l126_15;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_30;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_31;
  reg                 _zz_PmpPlugin_ports_0_hits_7;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_7_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_7_2;
  wire                when_PmpPlugin_l126_7;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_7_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_7_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_7_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_7_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_16;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_16;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_16;
  reg                 _zz_when_PmpPlugin_l126_16;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_32;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_33;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_17;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_17;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_17;
  reg                 _zz_when_PmpPlugin_l126_17;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_34;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_35;
  reg                 _zz_PmpPlugin_ports_0_hits_8;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_8_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_8_2;
  wire                when_PmpPlugin_l126_8;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_8_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_8_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_8_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_8_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_18;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_18;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_18;
  reg                 _zz_when_PmpPlugin_l126_18;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_36;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_37;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_19;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_19;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_19;
  reg                 _zz_when_PmpPlugin_l126_19;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_38;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_39;
  reg                 _zz_PmpPlugin_ports_0_hits_9;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_9_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_9_2;
  wire                when_PmpPlugin_l126_9;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_9_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_9_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_9_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_9_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_20;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_20;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_20;
  reg                 _zz_when_PmpPlugin_l126_20;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_40;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_41;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_21;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_21;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_21;
  reg                 _zz_when_PmpPlugin_l126_21;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_42;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_43;
  reg                 _zz_PmpPlugin_ports_0_hits_10;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_10_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_10_2;
  wire                when_PmpPlugin_l126_10;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_10_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_10_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_10_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_10_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_22;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_22;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_22;
  reg                 _zz_when_PmpPlugin_l126_22;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_44;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_45;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_23;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_23;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_23;
  reg                 _zz_when_PmpPlugin_l126_23;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_46;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_47;
  reg                 _zz_PmpPlugin_ports_0_hits_11;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_11_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_11_2;
  wire                when_PmpPlugin_l126_11;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_11_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_11_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_11_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_11_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_24;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_24;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_24;
  reg                 _zz_when_PmpPlugin_l126_24;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_48;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_49;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_25;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_25;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_25;
  reg                 _zz_when_PmpPlugin_l126_25;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_50;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_51;
  reg                 _zz_PmpPlugin_ports_0_hits_12;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_12_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_12_2;
  wire                when_PmpPlugin_l126_12;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_12_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_12_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_12_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_12_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_26;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_26;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_26;
  reg                 _zz_when_PmpPlugin_l126_26;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_52;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_53;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_27;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_27;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_27;
  reg                 _zz_when_PmpPlugin_l126_27;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_54;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_55;
  reg                 _zz_PmpPlugin_ports_0_hits_13;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_13_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_13_2;
  wire                when_PmpPlugin_l126_13;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_13_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_13_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_13_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_13_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_28;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_28;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_28;
  reg                 _zz_when_PmpPlugin_l126_28;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_56;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_57;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_29;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_29;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_29;
  reg                 _zz_when_PmpPlugin_l126_29;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_58;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_59;
  reg                 _zz_PmpPlugin_ports_0_hits_14;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_14_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_14_2;
  wire                when_PmpPlugin_l126_14;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_14_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_14_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_14_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_14_6;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_30;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_30;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_30;
  reg                 _zz_when_PmpPlugin_l126_30;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_60;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_61;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_31;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_31;
  reg                 _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_31;
  reg                 _zz_when_PmpPlugin_l126_31;
  reg        [1:0]    _zz_CsrPlugin_csrMapping_readDataInit_62;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_63;
  reg                 _zz_PmpPlugin_ports_0_hits_15;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_15_1;
  reg        [35:0]   _zz_PmpPlugin_ports_0_hits_15_2;
  wire                when_PmpPlugin_l126_15;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_15_3;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_15_4;
  wire       [33:0]   _zz_PmpPlugin_ports_0_hits_15_5;
  wire       [35:0]   _zz_PmpPlugin_ports_0_hits_15_6;
  wire                PmpPlugin_ports_0_hits_0;
  wire                PmpPlugin_ports_0_hits_1;
  wire                PmpPlugin_ports_0_hits_2;
  wire                PmpPlugin_ports_0_hits_3;
  wire                PmpPlugin_ports_0_hits_4;
  wire                PmpPlugin_ports_0_hits_5;
  wire                PmpPlugin_ports_0_hits_6;
  wire                PmpPlugin_ports_0_hits_7;
  wire                PmpPlugin_ports_0_hits_8;
  wire                PmpPlugin_ports_0_hits_9;
  wire                PmpPlugin_ports_0_hits_10;
  wire                PmpPlugin_ports_0_hits_11;
  wire                PmpPlugin_ports_0_hits_12;
  wire                PmpPlugin_ports_0_hits_13;
  wire                PmpPlugin_ports_0_hits_14;
  wire                PmpPlugin_ports_0_hits_15;
  wire       [4:0]    _zz_when_PmpPlugin_l250;
  wire       [4:0]    _zz_when_PmpPlugin_l250_1;
  wire       [4:0]    _zz_when_PmpPlugin_l250_2;
  wire       [4:0]    _zz_when_PmpPlugin_l250_3;
  wire       [4:0]    _zz_when_PmpPlugin_l250_4;
  wire       [4:0]    _zz_when_PmpPlugin_l250_5;
  wire       [4:0]    _zz_when_PmpPlugin_l250_6;
  wire       [4:0]    _zz_when_PmpPlugin_l250_7;
  wire                when_PmpPlugin_l250;
  wire       [15:0]   _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_32;
  wire       [15:0]   _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_34;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_35;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_36;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_37;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_38;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_39;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_40;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_41;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_42;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_43;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_44;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_45;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_46;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_47;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_48;
  wire       [15:0]   _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_32;
  wire       [15:0]   _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_34;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_35;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_36;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_37;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_38;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_39;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_40;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_41;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_42;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_43;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_44;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_45;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_46;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_47;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_48;
  wire       [15:0]   _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_32;
  wire       [15:0]   _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_34;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_35;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_36;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_37;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_38;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_39;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_40;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_41;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_42;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_43;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_44;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_45;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_46;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_47;
  wire                _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_48;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg                 decode_to_execute_RESCHEDULE_NEXT;
  wire                when_Pipeline_l124_10;
  reg        [1:0]    decode_to_execute_SRC1_CTRL;
  wire                when_Pipeline_l124_11;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_12;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_13;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_15;
  reg        [1:0]    decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_16;
  reg        [1:0]    decode_to_execute_SRC2_CTRL;
  wire                when_Pipeline_l124_17;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_18;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_19;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_20;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_21;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_22;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_23;
  reg                 decode_to_execute_MEMORY_STORE;
  wire                when_Pipeline_l124_24;
  reg                 execute_to_memory_MEMORY_STORE;
  wire                when_Pipeline_l124_25;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_26;
  reg        [1:0]    decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_27;
  reg        [1:0]    decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_28;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_29;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_30;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  wire                when_Pipeline_l124_31;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  wire                when_Pipeline_l124_32;
  reg                 decode_to_execute_IS_DIV;
  wire                when_Pipeline_l124_33;
  reg                 execute_to_memory_IS_DIV;
  wire                when_Pipeline_l124_34;
  reg        [1:0]    decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_35;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_36;
  reg        [0:0]    decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_37;
  reg        [0:0]    execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_38;
  reg        [0:0]    memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_39;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_40;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_41;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_42;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED1;
  wire                when_Pipeline_l124_43;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_44;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_45;
  reg                 execute_to_memory_ALIGNEMENT_FAULT;
  wire                when_Pipeline_l124_46;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_47;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_48;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_49;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_50;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_51;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_52;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  wire                when_CsrPlugin_l1669;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1669_1;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1669_2;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1669_3;
  reg                 execute_CsrPlugin_csr_773;
  wire                when_CsrPlugin_l1669_4;
  reg                 execute_CsrPlugin_csr_833;
  wire                when_CsrPlugin_l1669_5;
  reg                 execute_CsrPlugin_csr_834;
  wire                when_CsrPlugin_l1669_6;
  reg                 execute_CsrPlugin_csr_835;
  wire                when_CsrPlugin_l1669_7;
  reg                 execute_CsrPlugin_csr_2816;
  wire                when_CsrPlugin_l1669_8;
  reg                 execute_CsrPlugin_csr_2944;
  wire                when_CsrPlugin_l1669_9;
  reg                 execute_CsrPlugin_csr_3072;
  wire                when_CsrPlugin_l1669_10;
  reg                 execute_CsrPlugin_csr_3200;
  wire                when_CsrPlugin_l1669_11;
  reg                 execute_CsrPlugin_csr_774;
  wire                when_CsrPlugin_l1669_12;
  reg                 execute_CsrPlugin_csr_262;
  wire                when_CsrPlugin_l1669_13;
  reg                 execute_CsrPlugin_csr_256;
  wire                when_CsrPlugin_l1669_14;
  reg                 execute_CsrPlugin_csr_324;
  wire                when_CsrPlugin_l1669_15;
  reg                 execute_CsrPlugin_csr_260;
  wire                when_CsrPlugin_l1669_16;
  reg                 execute_CsrPlugin_csr_261;
  wire                when_CsrPlugin_l1669_17;
  reg                 execute_CsrPlugin_csr_321;
  wire                when_CsrPlugin_l1669_18;
  reg                 execute_CsrPlugin_csr_322;
  wire                when_CsrPlugin_l1669_19;
  reg                 execute_CsrPlugin_csr_323;
  wire                when_CsrPlugin_l1669_20;
  reg                 execute_CsrPlugin_csr_384;
  wire                when_CsrPlugin_l1669_21;
  reg                 execute_CsrPlugin_csr_944;
  wire                when_CsrPlugin_l1669_22;
  reg                 execute_CsrPlugin_csr_945;
  wire                when_CsrPlugin_l1669_23;
  reg                 execute_CsrPlugin_csr_946;
  wire                when_CsrPlugin_l1669_24;
  reg                 execute_CsrPlugin_csr_947;
  wire                when_CsrPlugin_l1669_25;
  reg                 execute_CsrPlugin_csr_948;
  wire                when_CsrPlugin_l1669_26;
  reg                 execute_CsrPlugin_csr_949;
  wire                when_CsrPlugin_l1669_27;
  reg                 execute_CsrPlugin_csr_950;
  wire                when_CsrPlugin_l1669_28;
  reg                 execute_CsrPlugin_csr_951;
  wire                when_CsrPlugin_l1669_29;
  reg                 execute_CsrPlugin_csr_952;
  wire                when_CsrPlugin_l1669_30;
  reg                 execute_CsrPlugin_csr_953;
  wire                when_CsrPlugin_l1669_31;
  reg                 execute_CsrPlugin_csr_954;
  wire                when_CsrPlugin_l1669_32;
  reg                 execute_CsrPlugin_csr_955;
  wire                when_CsrPlugin_l1669_33;
  reg                 execute_CsrPlugin_csr_956;
  wire                when_CsrPlugin_l1669_34;
  reg                 execute_CsrPlugin_csr_957;
  wire                when_CsrPlugin_l1669_35;
  reg                 execute_CsrPlugin_csr_958;
  wire                when_CsrPlugin_l1669_36;
  reg                 execute_CsrPlugin_csr_959;
  wire                when_CsrPlugin_l1669_37;
  reg                 execute_CsrPlugin_csr_928;
  wire                when_CsrPlugin_l1669_38;
  reg                 execute_CsrPlugin_csr_929;
  wire                when_CsrPlugin_l1669_39;
  reg                 execute_CsrPlugin_csr_930;
  wire                when_CsrPlugin_l1669_40;
  reg                 execute_CsrPlugin_csr_931;
  wire       [1:0]    switch_CsrPlugin_l1031;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_64;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_65;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_66;
  wire                when_CsrPlugin_l964;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_67;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_68;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_69;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_70;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_71;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_72;
  wire                when_CsrPlugin_l1076;
  wire                when_CsrPlugin_l1077;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_73;
  wire                when_CsrPlugin_l1076_1;
  wire                when_CsrPlugin_l1077_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_74;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_75;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_76;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_77;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_78;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_79;
  wire                when_CsrPlugin_l964_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_80;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_81;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_82;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_83;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_84;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_85;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_86;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_87;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_88;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_89;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_90;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_91;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_92;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_93;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_94;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_95;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_96;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_97;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_98;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_99;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_100;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_101;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_102;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_103;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_104;
  wire       [11:0]   _zz_when_CsrPlugin_l1709;
  wire                when_CsrPlugin_l1709;
  reg                 when_CsrPlugin_l1719;
  wire                when_CsrPlugin_l1717;
  wire                when_CsrPlugin_l1725;
  reg        [2:0]    _zz_iBusWishbone_ADR;
  wire                when_InstructionCache_l240;
  wire                when_InstructionCache_l243;
  reg                 _zz_iBus_rsp_valid;
  reg        [31:0]   iBusWishbone_DAT_MISO_regNext;
  reg                 iBusWishbone_ERR_regNext;
  wire                dBus_cmd_halfPipe_valid;
  wire                dBus_cmd_halfPipe_ready;
  wire                dBus_cmd_halfPipe_payload_wr;
  wire       [3:0]    dBus_cmd_halfPipe_payload_mask;
  wire       [31:0]   dBus_cmd_halfPipe_payload_address;
  wire       [31:0]   dBus_cmd_halfPipe_payload_data;
  wire       [1:0]    dBus_cmd_halfPipe_payload_size;
  reg                 dBus_cmd_rValid;
  wire                dBus_cmd_halfPipe_fire;
  reg                 dBus_cmd_rData_wr;
  reg        [3:0]    dBus_cmd_rData_mask;
  reg        [31:0]   dBus_cmd_rData_address;
  reg        [31:0]   dBus_cmd_rData_data;
  reg        [1:0]    dBus_cmd_rData_size;
  reg        [3:0]    _zz_dBusWishbone_SEL;
  `ifndef SYNTHESIS
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_1_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_memory_ENV_CTRL_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_execute_ENV_CTRL_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_writeBack_ENV_CTRL_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_execute_SRC2_CTRL_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_execute_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] _zz_decode_ENV_CTRL_1_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [31:0] _zz_decode_ENV_CTRL_2_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_when = (|{decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid});
  assign _zz_when_1 = (|{BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid});
  assign _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload - 4'b0001);
  assign _zz_IBusCachedPlugin_fetchPc_pc_1 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_IBusCachedPlugin_fetchPc_pc = {29'd0, _zz_IBusCachedPlugin_fetchPc_pc_1};
  assign _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2 = {{_zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_4 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz__zz_6 = {{_zz_3,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz__zz_6_1 = {{_zz_5,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_DBusSimplePlugin_memoryExceptionPort_payload_code = (memory_MEMORY_STORE ? 3'b110 : 3'b100);
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_execute_SRC1 = 3'b100;
  assign _zz__zz_execute_SRC1_1 = execute_INSTRUCTION[19 : 15];
  assign _zz__zz_execute_SRC2_2 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? 32'h00000001 : 32'h0);
  assign _zz__zz_decode_RS2_3 = (_zz__zz_decode_RS2_3_1 >>> 1'd1);
  assign _zz__zz_decode_RS2_3_1 = {((execute_SHIFT_CTRL == ShiftCtrlEnum_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_memory_MulDivIterativePlugin_mul_counter_valueNext_1 = memory_MulDivIterativePlugin_mul_counter_willIncrement;
  assign _zz_memory_MulDivIterativePlugin_mul_counter_valueNext = {5'd0, _zz_memory_MulDivIterativePlugin_mul_counter_valueNext_1};
  assign _zz_memory_MulDivIterativePlugin_accumulator = (_zz_memory_MulDivIterativePlugin_accumulator_1 + _zz_memory_MulDivIterativePlugin_accumulator_3);
  assign _zz_memory_MulDivIterativePlugin_accumulator_2 = (memory_MulDivIterativePlugin_rs2[0] ? memory_MulDivIterativePlugin_rs1 : 33'h0);
  assign _zz_memory_MulDivIterativePlugin_accumulator_1 = {{1{_zz_memory_MulDivIterativePlugin_accumulator_2[32]}}, _zz_memory_MulDivIterativePlugin_accumulator_2};
  assign _zz_memory_MulDivIterativePlugin_accumulator_4 = _zz_memory_MulDivIterativePlugin_accumulator_5;
  assign _zz_memory_MulDivIterativePlugin_accumulator_3 = {{1{_zz_memory_MulDivIterativePlugin_accumulator_4[32]}}, _zz_memory_MulDivIterativePlugin_accumulator_4};
  assign _zz_memory_MulDivIterativePlugin_accumulator_5 = (memory_MulDivIterativePlugin_accumulator >>> 6'd32);
  assign _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1 = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_memory_MulDivIterativePlugin_div_counter_valueNext = {5'd0, _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1};
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder = memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1 = memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator = {_zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted,(! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_memory_MulDivIterativePlugin_div_result_1 = _zz_memory_MulDivIterativePlugin_div_result_2;
  assign _zz_memory_MulDivIterativePlugin_div_result_2 = _zz_memory_MulDivIterativePlugin_div_result_3;
  assign _zz_memory_MulDivIterativePlugin_div_result_3 = ({memory_MulDivIterativePlugin_div_needRevert,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_memory_MulDivIterativePlugin_div_result) : _zz_memory_MulDivIterativePlugin_div_result)} + _zz_memory_MulDivIterativePlugin_div_result_4);
  assign _zz_memory_MulDivIterativePlugin_div_result_5 = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_memory_MulDivIterativePlugin_div_result_4 = {32'd0, _zz_memory_MulDivIterativePlugin_div_result_5};
  assign _zz_memory_MulDivIterativePlugin_rs1_3 = _zz_memory_MulDivIterativePlugin_rs1;
  assign _zz_memory_MulDivIterativePlugin_rs1_2 = {32'd0, _zz_memory_MulDivIterativePlugin_rs1_3};
  assign _zz_memory_MulDivIterativePlugin_rs2_2 = _zz_memory_MulDivIterativePlugin_rs2;
  assign _zz_memory_MulDivIterativePlugin_rs2_1 = {31'd0, _zz_memory_MulDivIterativePlugin_rs2_2};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6 = {_zz_execute_BranchPlugin_missAlignedTarget_1,execute_INSTRUCTION[31 : 20]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1 = {{_zz_execute_BranchPlugin_missAlignedTarget_3,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2 = {{_zz_execute_BranchPlugin_missAlignedTarget_5,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_execute_BranchPlugin_branch_src2_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_execute_BranchPlugin_branch_src2_11 = 3'b100;
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code & (~ _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1));
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code - 2'b01);
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_2 & (~ _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3_1));
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_2 - 2'b01);
  assign _zz_CsrPlugin_jumpInterface_payload = (CsrPlugin_xtvec_base + _zz_CsrPlugin_jumpInterface_payload_1);
  assign _zz_CsrPlugin_jumpInterface_payload_1 = {26'd0, CsrPlugin_trapCause};
  assign _zz__zz_PmpPlugin_ports_0_hits_0_5 = (_zz_PmpPlugin_ports_0_hits_0_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_0_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_0_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_0_2_1 = (_zz_PmpPlugin_ports_0_hits_0_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_1_5 = (_zz_PmpPlugin_ports_0_hits_1_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_1_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_1_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_1_2_1 = (_zz_PmpPlugin_ports_0_hits_1_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_2_5 = (_zz_PmpPlugin_ports_0_hits_2_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_2_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_2_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_2_2_1 = (_zz_PmpPlugin_ports_0_hits_2_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_3_5 = (_zz_PmpPlugin_ports_0_hits_3_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_3_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_3_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_3_2_1 = (_zz_PmpPlugin_ports_0_hits_3_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_4_5 = (_zz_PmpPlugin_ports_0_hits_4_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_4_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_4_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_4_2_1 = (_zz_PmpPlugin_ports_0_hits_4_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_5_5 = (_zz_PmpPlugin_ports_0_hits_5_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_5_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_5_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_5_2_1 = (_zz_PmpPlugin_ports_0_hits_5_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_6_5 = (_zz_PmpPlugin_ports_0_hits_6_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_6_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_6_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_6_2_1 = (_zz_PmpPlugin_ports_0_hits_6_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_7_5 = (_zz_PmpPlugin_ports_0_hits_7_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_7_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_7_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_7_2_1 = (_zz_PmpPlugin_ports_0_hits_7_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_8_5 = (_zz_PmpPlugin_ports_0_hits_8_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_8_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_8_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_8_2_1 = (_zz_PmpPlugin_ports_0_hits_8_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_9_5 = (_zz_PmpPlugin_ports_0_hits_9_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_9_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_9_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_9_2_1 = (_zz_PmpPlugin_ports_0_hits_9_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_10_5 = (_zz_PmpPlugin_ports_0_hits_10_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_10_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_10_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_10_2_1 = (_zz_PmpPlugin_ports_0_hits_10_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_11_5 = (_zz_PmpPlugin_ports_0_hits_11_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_11_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_11_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_11_2_1 = (_zz_PmpPlugin_ports_0_hits_11_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_12_5 = (_zz_PmpPlugin_ports_0_hits_12_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_12_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_12_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_12_2_1 = (_zz_PmpPlugin_ports_0_hits_12_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_13_5 = (_zz_PmpPlugin_ports_0_hits_13_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_13_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_13_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_13_2_1 = (_zz_PmpPlugin_ports_0_hits_13_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_14_5 = (_zz_PmpPlugin_ports_0_hits_14_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_14_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_14_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_14_2_1 = (_zz_PmpPlugin_ports_0_hits_14_5 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_15_5 = (_zz_PmpPlugin_ports_0_hits_15_3 + 34'h000000001);
  assign _zz__zz_PmpPlugin_ports_0_hits_15_2 = ({2'd0,_zz__zz_PmpPlugin_ports_0_hits_15_2_1} <<< 2'd2);
  assign _zz__zz_PmpPlugin_ports_0_hits_15_2_1 = (_zz_PmpPlugin_ports_0_hits_15_5 + 34'h000000001);
  assign _zz_PmpPlugin_ports_0_hits_0_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_0_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_1_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_1_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_2_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_2_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_3_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_3_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_4_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_4_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_5_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_5_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_6_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_6_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_7_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_7_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_8_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_8_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_9_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_9_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_10_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_10_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_11_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_11_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_12_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_12_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_13_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_13_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_14_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_14_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_15_7 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_PmpPlugin_ports_0_hits_15_8 = {4'd0, IBusCachedPlugin_mmuBus_cmd_0_virtualAddress};
  assign _zz_when_PmpPlugin_l250_8 = (_zz_when_PmpPlugin_l250_9 + _zz_when_PmpPlugin_l250_20);
  assign _zz_when_PmpPlugin_l250_9 = (_zz_when_PmpPlugin_l250_10 + _zz_when_PmpPlugin_l250_15);
  assign _zz_when_PmpPlugin_l250_10 = (_zz_when_PmpPlugin_l250_11 + _zz_when_PmpPlugin_l250_13);
  assign _zz_when_PmpPlugin_l250_15 = (_zz_when_PmpPlugin_l250_16 + _zz_when_PmpPlugin_l250_18);
  assign _zz_when_PmpPlugin_l250_20 = (_zz_when_PmpPlugin_l250_21 + _zz_when_PmpPlugin_l250_23);
  assign _zz_when_PmpPlugin_l250_25 = PmpPlugin_ports_0_hits_15;
  assign _zz_when_PmpPlugin_l250_24 = {2'd0, _zz_when_PmpPlugin_l250_25};
  assign _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33 = (_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_32 - 16'h0001);
  assign _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33 = (_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_32 - 16'h0001);
  assign _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33 = (_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_32 - 16'h0001);
  assign _zz_iBusWishbone_ADR_1 = (iBus_cmd_payload_address >>> 3'd5);
  assign _zz_decode_RegFilePlugin_rs1Data = 1'b1;
  assign _zz_decode_RegFilePlugin_rs2Data = 1'b1;
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_6 = {_zz_IBusCachedPlugin_jump_pcLoad_payload_4,_zz_IBusCachedPlugin_jump_pcLoad_payload_3};
  assign _zz_when_PmpPlugin_l250_12 = {PmpPlugin_ports_0_hits_2,{PmpPlugin_ports_0_hits_1,PmpPlugin_ports_0_hits_0}};
  assign _zz_when_PmpPlugin_l250_14 = {PmpPlugin_ports_0_hits_5,{PmpPlugin_ports_0_hits_4,PmpPlugin_ports_0_hits_3}};
  assign _zz_when_PmpPlugin_l250_17 = {PmpPlugin_ports_0_hits_8,{PmpPlugin_ports_0_hits_7,PmpPlugin_ports_0_hits_6}};
  assign _zz_when_PmpPlugin_l250_19 = {PmpPlugin_ports_0_hits_11,{PmpPlugin_ports_0_hits_10,PmpPlugin_ports_0_hits_9}};
  assign _zz_when_PmpPlugin_l250_22 = {PmpPlugin_ports_0_hits_14,{PmpPlugin_ports_0_hits_13,PmpPlugin_ports_0_hits_12}};
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_50 = {_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_48,{_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_47,{_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_46,_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_45}}};
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_50 = {_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_48,{_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_47,{_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_46,_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_45}}};
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_50 = {_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_48,{_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_47,{_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_46,_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_45}}};
  assign _zz_decode_LEGAL_INSTRUCTION = 32'h0000107f;
  assign _zz_decode_LEGAL_INSTRUCTION_1 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_decode_LEGAL_INSTRUCTION_2 = 32'h00002073;
  assign _zz_decode_LEGAL_INSTRUCTION_3 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_decode_LEGAL_INSTRUCTION_4 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_decode_LEGAL_INSTRUCTION_5 = {((decode_INSTRUCTION & 32'h0000107f) == 32'h00000013),{((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_6) == 32'h00000003),{(_zz_decode_LEGAL_INSTRUCTION_7 == _zz_decode_LEGAL_INSTRUCTION_8),{_zz_decode_LEGAL_INSTRUCTION_9,{_zz_decode_LEGAL_INSTRUCTION_10,_zz_decode_LEGAL_INSTRUCTION_11}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_6 = 32'h0000207f;
  assign _zz_decode_LEGAL_INSTRUCTION_7 = (decode_INSTRUCTION & 32'h0000505f);
  assign _zz_decode_LEGAL_INSTRUCTION_8 = 32'h00000003;
  assign _zz_decode_LEGAL_INSTRUCTION_9 = ((decode_INSTRUCTION & 32'h0000707b) == 32'h00000063);
  assign _zz_decode_LEGAL_INSTRUCTION_10 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_LEGAL_INSTRUCTION_11 = {((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033),{((decode_INSTRUCTION & 32'hbe00705f) == 32'h00005013),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_12) == 32'h00001013),{(_zz_decode_LEGAL_INSTRUCTION_13 == _zz_decode_LEGAL_INSTRUCTION_14),{_zz_decode_LEGAL_INSTRUCTION_15,_zz_decode_LEGAL_INSTRUCTION_16}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_12 = 32'hfe00305f;
  assign _zz_decode_LEGAL_INSTRUCTION_13 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_decode_LEGAL_INSTRUCTION_14 = 32'h00000033;
  assign _zz_decode_LEGAL_INSTRUCTION_15 = ((decode_INSTRUCTION & 32'hfe007fff) == 32'h12000073);
  assign _zz_decode_LEGAL_INSTRUCTION_16 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_4 = decode_INSTRUCTION[31];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_5 = decode_INSTRUCTION[31];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_6 = decode_INSTRUCTION[7];
  assign _zz__zz_decode_IS_CSR = 32'h02003050;
  assign _zz__zz_decode_IS_CSR_1 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz__zz_decode_IS_CSR_2 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz__zz_decode_IS_CSR_3 = _zz_decode_IS_CSR_5;
  assign _zz__zz_decode_IS_CSR_4 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_5) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_6 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_7) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_8 = (|(_zz__zz_decode_IS_CSR_9 == _zz__zz_decode_IS_CSR_10));
  assign _zz__zz_decode_IS_CSR_11 = (|{_zz__zz_decode_IS_CSR_12,_zz__zz_decode_IS_CSR_13});
  assign _zz__zz_decode_IS_CSR_14 = {(|_zz__zz_decode_IS_CSR_15),{_zz__zz_decode_IS_CSR_16,{_zz__zz_decode_IS_CSR_18,_zz__zz_decode_IS_CSR_21}}};
  assign _zz__zz_decode_IS_CSR_5 = 32'h0000001c;
  assign _zz__zz_decode_IS_CSR_7 = 32'h00000058;
  assign _zz__zz_decode_IS_CSR_9 = (decode_INSTRUCTION & 32'h02004064);
  assign _zz__zz_decode_IS_CSR_10 = 32'h02004020;
  assign _zz__zz_decode_IS_CSR_12 = _zz_decode_IS_CSR_8;
  assign _zz__zz_decode_IS_CSR_13 = _zz_decode_IS_CSR_7;
  assign _zz__zz_decode_IS_CSR_15 = {_zz_decode_IS_CSR_8,{_zz_decode_IS_CSR_6,_zz_decode_IS_CSR_7}};
  assign _zz__zz_decode_IS_CSR_16 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_17) == 32'h02000030));
  assign _zz__zz_decode_IS_CSR_18 = (|(_zz__zz_decode_IS_CSR_19 == _zz__zz_decode_IS_CSR_20));
  assign _zz__zz_decode_IS_CSR_21 = {(|{_zz__zz_decode_IS_CSR_22,_zz__zz_decode_IS_CSR_24}),{(|_zz__zz_decode_IS_CSR_26),{_zz__zz_decode_IS_CSR_31,{_zz__zz_decode_IS_CSR_34,_zz__zz_decode_IS_CSR_35}}}};
  assign _zz__zz_decode_IS_CSR_17 = 32'h02004074;
  assign _zz__zz_decode_IS_CSR_19 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz__zz_decode_IS_CSR_20 = 32'h00005010;
  assign _zz__zz_decode_IS_CSR_22 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_23) == 32'h40001010);
  assign _zz__zz_decode_IS_CSR_24 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_25) == 32'h00001010);
  assign _zz__zz_decode_IS_CSR_26 = {(_zz__zz_decode_IS_CSR_27 == _zz__zz_decode_IS_CSR_28),(_zz__zz_decode_IS_CSR_29 == _zz__zz_decode_IS_CSR_30)};
  assign _zz__zz_decode_IS_CSR_31 = (|(_zz__zz_decode_IS_CSR_32 == _zz__zz_decode_IS_CSR_33));
  assign _zz__zz_decode_IS_CSR_34 = (|_zz_decode_IS_CSR_6);
  assign _zz__zz_decode_IS_CSR_35 = {(|_zz__zz_decode_IS_CSR_36),{_zz__zz_decode_IS_CSR_39,{_zz__zz_decode_IS_CSR_44,_zz__zz_decode_IS_CSR_49}}};
  assign _zz__zz_decode_IS_CSR_23 = 32'h40003054;
  assign _zz__zz_decode_IS_CSR_25 = 32'h02007054;
  assign _zz__zz_decode_IS_CSR_27 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz__zz_decode_IS_CSR_28 = 32'h00000024;
  assign _zz__zz_decode_IS_CSR_29 = (decode_INSTRUCTION & 32'h02003054);
  assign _zz__zz_decode_IS_CSR_30 = 32'h00001010;
  assign _zz__zz_decode_IS_CSR_32 = (decode_INSTRUCTION & 32'h00001000);
  assign _zz__zz_decode_IS_CSR_33 = 32'h00001000;
  assign _zz__zz_decode_IS_CSR_36 = {((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_37) == 32'h00002000),((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_38) == 32'h00001000)};
  assign _zz__zz_decode_IS_CSR_39 = (|{(_zz__zz_decode_IS_CSR_40 == _zz__zz_decode_IS_CSR_41),(_zz__zz_decode_IS_CSR_42 == _zz__zz_decode_IS_CSR_43)});
  assign _zz__zz_decode_IS_CSR_44 = (|{_zz__zz_decode_IS_CSR_45,{_zz__zz_decode_IS_CSR_46,_zz__zz_decode_IS_CSR_47}});
  assign _zz__zz_decode_IS_CSR_49 = {(|_zz__zz_decode_IS_CSR_50),{(|_zz__zz_decode_IS_CSR_51),{_zz__zz_decode_IS_CSR_53,{_zz__zz_decode_IS_CSR_58,_zz__zz_decode_IS_CSR_71}}}};
  assign _zz__zz_decode_IS_CSR_37 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_38 = 32'h00005000;
  assign _zz__zz_decode_IS_CSR_40 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz__zz_decode_IS_CSR_41 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_42 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz__zz_decode_IS_CSR_43 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_45 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_46 = _zz_decode_IS_CSR_3;
  assign _zz__zz_decode_IS_CSR_47 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_48) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_50 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_51 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_52) == 32'h00000010);
  assign _zz__zz_decode_IS_CSR_53 = (|{_zz_decode_IS_CSR_4,{_zz__zz_decode_IS_CSR_54,_zz__zz_decode_IS_CSR_56}});
  assign _zz__zz_decode_IS_CSR_58 = (|{_zz__zz_decode_IS_CSR_59,_zz__zz_decode_IS_CSR_60});
  assign _zz__zz_decode_IS_CSR_71 = {(|_zz__zz_decode_IS_CSR_72),{_zz__zz_decode_IS_CSR_75,{_zz__zz_decode_IS_CSR_78,_zz__zz_decode_IS_CSR_85}}};
  assign _zz__zz_decode_IS_CSR_48 = 32'h02003040;
  assign _zz__zz_decode_IS_CSR_52 = 32'h00000010;
  assign _zz__zz_decode_IS_CSR_54 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_55) == 32'h00000010);
  assign _zz__zz_decode_IS_CSR_56 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_57) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_59 = _zz_decode_IS_CSR_5;
  assign _zz__zz_decode_IS_CSR_60 = {(_zz__zz_decode_IS_CSR_61 == _zz__zz_decode_IS_CSR_62),{_zz__zz_decode_IS_CSR_63,{_zz__zz_decode_IS_CSR_65,_zz__zz_decode_IS_CSR_68}}};
  assign _zz__zz_decode_IS_CSR_72 = {_zz_decode_IS_CSR_4,(_zz__zz_decode_IS_CSR_73 == _zz__zz_decode_IS_CSR_74)};
  assign _zz__zz_decode_IS_CSR_75 = (|{_zz_decode_IS_CSR_4,_zz__zz_decode_IS_CSR_76});
  assign _zz__zz_decode_IS_CSR_78 = (|{_zz__zz_decode_IS_CSR_79,_zz__zz_decode_IS_CSR_82});
  assign _zz__zz_decode_IS_CSR_85 = {(|_zz__zz_decode_IS_CSR_86),{_zz__zz_decode_IS_CSR_89,{_zz__zz_decode_IS_CSR_95,_zz__zz_decode_IS_CSR_98}}};
  assign _zz__zz_decode_IS_CSR_55 = 32'h00000030;
  assign _zz__zz_decode_IS_CSR_57 = 32'h02000060;
  assign _zz__zz_decode_IS_CSR_61 = (decode_INSTRUCTION & 32'h00001010);
  assign _zz__zz_decode_IS_CSR_62 = 32'h00001010;
  assign _zz__zz_decode_IS_CSR_63 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_64) == 32'h00002010);
  assign _zz__zz_decode_IS_CSR_65 = (_zz__zz_decode_IS_CSR_66 == _zz__zz_decode_IS_CSR_67);
  assign _zz__zz_decode_IS_CSR_68 = {_zz__zz_decode_IS_CSR_69,_zz__zz_decode_IS_CSR_70};
  assign _zz__zz_decode_IS_CSR_73 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz__zz_decode_IS_CSR_74 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_76 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_77) == 32'h0);
  assign _zz__zz_decode_IS_CSR_79 = (_zz__zz_decode_IS_CSR_80 == _zz__zz_decode_IS_CSR_81);
  assign _zz__zz_decode_IS_CSR_82 = (_zz__zz_decode_IS_CSR_83 == _zz__zz_decode_IS_CSR_84);
  assign _zz__zz_decode_IS_CSR_86 = (_zz__zz_decode_IS_CSR_87 == _zz__zz_decode_IS_CSR_88);
  assign _zz__zz_decode_IS_CSR_89 = (|{_zz__zz_decode_IS_CSR_90,_zz__zz_decode_IS_CSR_92});
  assign _zz__zz_decode_IS_CSR_95 = (|_zz__zz_decode_IS_CSR_96);
  assign _zz__zz_decode_IS_CSR_98 = {_zz__zz_decode_IS_CSR_99,{_zz__zz_decode_IS_CSR_105,_zz__zz_decode_IS_CSR_109}};
  assign _zz__zz_decode_IS_CSR_64 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_66 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz__zz_decode_IS_CSR_67 = 32'h00000010;
  assign _zz__zz_decode_IS_CSR_69 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_70 = ((decode_INSTRUCTION & 32'h00000028) == 32'h0);
  assign _zz__zz_decode_IS_CSR_77 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_80 = (decode_INSTRUCTION & 32'h00006004);
  assign _zz__zz_decode_IS_CSR_81 = 32'h00006000;
  assign _zz__zz_decode_IS_CSR_83 = (decode_INSTRUCTION & 32'h00005014);
  assign _zz__zz_decode_IS_CSR_84 = 32'h00004010;
  assign _zz__zz_decode_IS_CSR_87 = (decode_INSTRUCTION & 32'h00006014);
  assign _zz__zz_decode_IS_CSR_88 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_90 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_91) == 32'h0);
  assign _zz__zz_decode_IS_CSR_92 = {_zz_decode_IS_CSR_3,{_zz__zz_decode_IS_CSR_93,_zz__zz_decode_IS_CSR_94}};
  assign _zz__zz_decode_IS_CSR_96 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_97) == 32'h0);
  assign _zz__zz_decode_IS_CSR_99 = (|{_zz__zz_decode_IS_CSR_100,{_zz__zz_decode_IS_CSR_101,_zz__zz_decode_IS_CSR_103}});
  assign _zz__zz_decode_IS_CSR_105 = (|{_zz__zz_decode_IS_CSR_106,_zz__zz_decode_IS_CSR_108});
  assign _zz__zz_decode_IS_CSR_109 = {(|_zz__zz_decode_IS_CSR_110),{_zz__zz_decode_IS_CSR_113,_zz__zz_decode_IS_CSR_115}};
  assign _zz__zz_decode_IS_CSR_91 = 32'h00000044;
  assign _zz__zz_decode_IS_CSR_93 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz__zz_decode_IS_CSR_94 = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz__zz_decode_IS_CSR_97 = 32'h00000058;
  assign _zz__zz_decode_IS_CSR_100 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_101 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_102) == 32'h00002010);
  assign _zz__zz_decode_IS_CSR_103 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_104) == 32'h40000030);
  assign _zz__zz_decode_IS_CSR_106 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_107) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_108 = _zz_decode_IS_CSR_2;
  assign _zz__zz_decode_IS_CSR_110 = {(_zz__zz_decode_IS_CSR_111 == _zz__zz_decode_IS_CSR_112),_zz_decode_IS_CSR_2};
  assign _zz__zz_decode_IS_CSR_113 = (|{_zz_decode_IS_CSR_1,_zz__zz_decode_IS_CSR_114});
  assign _zz__zz_decode_IS_CSR_115 = (|_zz_decode_IS_CSR_1);
  assign _zz__zz_decode_IS_CSR_102 = 32'h00002014;
  assign _zz__zz_decode_IS_CSR_104 = 32'h40004034;
  assign _zz__zz_decode_IS_CSR_107 = 32'h00000014;
  assign _zz__zz_decode_IS_CSR_111 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_IS_CSR_112 = 32'h00000004;
  assign _zz__zz_decode_IS_CSR_114 = ((decode_INSTRUCTION & 32'h02003050) == 32'h02000050);
  assign _zz_execute_BranchPlugin_branch_src2_6 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_7 = execute_INSTRUCTION[19 : 12];
  assign _zz_execute_BranchPlugin_branch_src2_8 = execute_INSTRUCTION[20];
  assign _zz_execute_BranchPlugin_branch_src2_9 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_10 = execute_INSTRUCTION[7];
  assign _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowRead_32 = PmpPlugin_ports_0_hits_5;
  assign _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowRead_32_1 = {PmpPlugin_ports_0_hits_4,{PmpPlugin_ports_0_hits_3,{PmpPlugin_ports_0_hits_2,{PmpPlugin_ports_0_hits_1,PmpPlugin_ports_0_hits_0}}}};
  assign _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_32 = PmpPlugin_ports_0_hits_5;
  assign _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_32_1 = {PmpPlugin_ports_0_hits_4,{PmpPlugin_ports_0_hits_3,{PmpPlugin_ports_0_hits_2,{PmpPlugin_ports_0_hits_1,PmpPlugin_ports_0_hits_0}}}};
  assign _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_32 = PmpPlugin_ports_0_hits_5;
  assign _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_32_1 = {PmpPlugin_ports_0_hits_4,{PmpPlugin_ports_0_hits_3,{PmpPlugin_ports_0_hits_2,{PmpPlugin_ports_0_hits_1,PmpPlugin_ports_0_hits_0}}}};
  assign _zz_CsrPlugin_csrMapping_readDataInit_105 = (_zz_CsrPlugin_csrMapping_readDataInit_64 | _zz_CsrPlugin_csrMapping_readDataInit_65);
  assign _zz_CsrPlugin_csrMapping_readDataInit_106 = (_zz_CsrPlugin_csrMapping_readDataInit_66 | _zz_CsrPlugin_csrMapping_readDataInit_67);
  assign _zz_CsrPlugin_csrMapping_readDataInit_107 = (_zz_CsrPlugin_csrMapping_readDataInit_68 | _zz_CsrPlugin_csrMapping_readDataInit_69);
  assign _zz_CsrPlugin_csrMapping_readDataInit_108 = (_zz_CsrPlugin_csrMapping_readDataInit_70 | _zz_CsrPlugin_csrMapping_readDataInit_71);
  assign _zz_CsrPlugin_csrMapping_readDataInit_109 = (_zz_CsrPlugin_csrMapping_readDataInit_72 | _zz_CsrPlugin_csrMapping_readDataInit_73);
  assign _zz_CsrPlugin_csrMapping_readDataInit_110 = (_zz_CsrPlugin_csrMapping_readDataInit_74 | _zz_CsrPlugin_csrMapping_readDataInit_75);
  assign _zz_CsrPlugin_csrMapping_readDataInit_111 = (_zz_CsrPlugin_csrMapping_readDataInit_76 | _zz_CsrPlugin_csrMapping_readDataInit_77);
  assign _zz_CsrPlugin_csrMapping_readDataInit_112 = (_zz_CsrPlugin_csrMapping_readDataInit_78 | _zz_CsrPlugin_csrMapping_readDataInit_79);
  assign _zz_CsrPlugin_csrMapping_readDataInit_113 = (_zz_CsrPlugin_csrMapping_readDataInit_80 | _zz_CsrPlugin_csrMapping_readDataInit_81);
  assign _zz_CsrPlugin_csrMapping_readDataInit_114 = (_zz_CsrPlugin_csrMapping_readDataInit_82 | _zz_CsrPlugin_csrMapping_readDataInit_83);
  assign _zz_CsrPlugin_csrMapping_readDataInit_115 = (_zz_CsrPlugin_csrMapping_readDataInit_84 | _zz_CsrPlugin_csrMapping_readDataInit_85);
  assign _zz_CsrPlugin_csrMapping_readDataInit_116 = (_zz_CsrPlugin_csrMapping_readDataInit_86 | _zz_CsrPlugin_csrMapping_readDataInit_87);
  assign _zz_CsrPlugin_csrMapping_readDataInit_117 = (_zz_CsrPlugin_csrMapping_readDataInit_88 | _zz_CsrPlugin_csrMapping_readDataInit_89);
  assign _zz_CsrPlugin_csrMapping_readDataInit_118 = (_zz_CsrPlugin_csrMapping_readDataInit_90 | _zz_CsrPlugin_csrMapping_readDataInit_91);
  assign _zz_CsrPlugin_csrMapping_readDataInit_119 = (_zz_CsrPlugin_csrMapping_readDataInit_92 | _zz_CsrPlugin_csrMapping_readDataInit_93);
  assign _zz_CsrPlugin_csrMapping_readDataInit_120 = (_zz_CsrPlugin_csrMapping_readDataInit_94 | _zz_CsrPlugin_csrMapping_readDataInit_95);
  always @(posedge clk) begin
    if(_zz_decode_RegFilePlugin_rs1Data) begin
      RegFilePlugin_regFile_spinal_port0 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @(posedge clk) begin
    if(_zz_decode_RegFilePlugin_rs2Data) begin
      RegFilePlugin_regFile_spinal_port1 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                              (IBusCachedPlugin_cache_io_flush                           ), //i
    .io_cpu_prefetch_isValid               (IBusCachedPlugin_cache_io_cpu_prefetch_isValid            ), //i
    .io_cpu_prefetch_haltIt                (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt             ), //o
    .io_cpu_prefetch_pc                    (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]     ), //i
    .io_cpu_fetch_isValid                  (IBusCachedPlugin_cache_io_cpu_fetch_isValid               ), //i
    .io_cpu_fetch_isStuck                  (IBusCachedPlugin_cache_io_cpu_fetch_isStuck               ), //i
    .io_cpu_fetch_isRemoved                (                                                          ), //i
    .io_cpu_fetch_pc                       (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]     ), //i
    .io_cpu_fetch_data                     (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]            ), //o
    .io_cpu_fetch_mmuRsp_physicalAddress   (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]         ), //i
    .io_cpu_fetch_mmuRsp_isIoAccess        (IBusCachedPlugin_mmuBus_rsp_isIoAccess                    ), //i
    .io_cpu_fetch_mmuRsp_isPaging          (IBusCachedPlugin_mmuBus_rsp_isPaging                      ), //i
    .io_cpu_fetch_mmuRsp_allowRead         (IBusCachedPlugin_mmuBus_rsp_allowRead                     ), //i
    .io_cpu_fetch_mmuRsp_allowWrite        (IBusCachedPlugin_mmuBus_rsp_allowWrite                    ), //i
    .io_cpu_fetch_mmuRsp_allowExecute      (IBusCachedPlugin_mmuBus_rsp_allowExecute                  ), //i
    .io_cpu_fetch_mmuRsp_exception         (IBusCachedPlugin_mmuBus_rsp_exception                     ), //i
    .io_cpu_fetch_mmuRsp_refilling         (IBusCachedPlugin_mmuBus_rsp_refilling                     ), //i
    .io_cpu_fetch_mmuRsp_bypassTranslation (IBusCachedPlugin_mmuBus_rsp_bypassTranslation             ), //i
    .io_cpu_fetch_physicalAddress          (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0] ), //o
    .io_cpu_decode_isValid                 (IBusCachedPlugin_cache_io_cpu_decode_isValid              ), //i
    .io_cpu_decode_isStuck                 (IBusCachedPlugin_cache_io_cpu_decode_isStuck              ), //i
    .io_cpu_decode_pc                      (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]     ), //i
    .io_cpu_decode_physicalAddress         (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]), //o
    .io_cpu_decode_data                    (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]           ), //o
    .io_cpu_decode_cacheMiss               (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss            ), //o
    .io_cpu_decode_error                   (IBusCachedPlugin_cache_io_cpu_decode_error                ), //o
    .io_cpu_decode_mmuRefilling            (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling         ), //o
    .io_cpu_decode_mmuException            (IBusCachedPlugin_cache_io_cpu_decode_mmuException         ), //o
    .io_cpu_decode_isUser                  (IBusCachedPlugin_cache_io_cpu_decode_isUser               ), //i
    .io_cpu_fill_valid                     (IBusCachedPlugin_cache_io_cpu_fill_valid                  ), //i
    .io_cpu_fill_payload                   (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]), //i
    .io_mem_cmd_valid                      (IBusCachedPlugin_cache_io_mem_cmd_valid                   ), //o
    .io_mem_cmd_ready                      (iBus_cmd_ready                                            ), //i
    .io_mem_cmd_payload_address            (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]   ), //o
    .io_mem_cmd_payload_size               (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]       ), //o
    .io_mem_rsp_valid                      (iBus_rsp_valid                                            ), //i
    .io_mem_rsp_payload_data               (iBus_rsp_payload_data[31:0]                               ), //i
    .io_mem_rsp_payload_error              (iBus_rsp_payload_error                                    ), //i
    .clk                                   (clk                                                       ), //i
    .reset                                 (reset                                                     )  //i
  );
  always @(*) begin
    case(_zz_IBusCachedPlugin_jump_pcLoad_payload_6)
      2'b00 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = CsrPlugin_jumpInterface_payload;
      2'b01 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = BranchPlugin_jumpInterface_payload;
      2'b10 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = CsrPlugin_redoInterface_payload;
      default : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = IBusCachedPlugin_predictionJumpInterface_payload;
    endcase
  end

  always @(*) begin
    case(_zz_when_PmpPlugin_l250_12)
      3'b000 : _zz_when_PmpPlugin_l250_11 = _zz_when_PmpPlugin_l250;
      3'b001 : _zz_when_PmpPlugin_l250_11 = _zz_when_PmpPlugin_l250_1;
      3'b010 : _zz_when_PmpPlugin_l250_11 = _zz_when_PmpPlugin_l250_2;
      3'b011 : _zz_when_PmpPlugin_l250_11 = _zz_when_PmpPlugin_l250_3;
      3'b100 : _zz_when_PmpPlugin_l250_11 = _zz_when_PmpPlugin_l250_4;
      3'b101 : _zz_when_PmpPlugin_l250_11 = _zz_when_PmpPlugin_l250_5;
      3'b110 : _zz_when_PmpPlugin_l250_11 = _zz_when_PmpPlugin_l250_6;
      default : _zz_when_PmpPlugin_l250_11 = _zz_when_PmpPlugin_l250_7;
    endcase
  end

  always @(*) begin
    case(_zz_when_PmpPlugin_l250_14)
      3'b000 : _zz_when_PmpPlugin_l250_13 = _zz_when_PmpPlugin_l250;
      3'b001 : _zz_when_PmpPlugin_l250_13 = _zz_when_PmpPlugin_l250_1;
      3'b010 : _zz_when_PmpPlugin_l250_13 = _zz_when_PmpPlugin_l250_2;
      3'b011 : _zz_when_PmpPlugin_l250_13 = _zz_when_PmpPlugin_l250_3;
      3'b100 : _zz_when_PmpPlugin_l250_13 = _zz_when_PmpPlugin_l250_4;
      3'b101 : _zz_when_PmpPlugin_l250_13 = _zz_when_PmpPlugin_l250_5;
      3'b110 : _zz_when_PmpPlugin_l250_13 = _zz_when_PmpPlugin_l250_6;
      default : _zz_when_PmpPlugin_l250_13 = _zz_when_PmpPlugin_l250_7;
    endcase
  end

  always @(*) begin
    case(_zz_when_PmpPlugin_l250_17)
      3'b000 : _zz_when_PmpPlugin_l250_16 = _zz_when_PmpPlugin_l250;
      3'b001 : _zz_when_PmpPlugin_l250_16 = _zz_when_PmpPlugin_l250_1;
      3'b010 : _zz_when_PmpPlugin_l250_16 = _zz_when_PmpPlugin_l250_2;
      3'b011 : _zz_when_PmpPlugin_l250_16 = _zz_when_PmpPlugin_l250_3;
      3'b100 : _zz_when_PmpPlugin_l250_16 = _zz_when_PmpPlugin_l250_4;
      3'b101 : _zz_when_PmpPlugin_l250_16 = _zz_when_PmpPlugin_l250_5;
      3'b110 : _zz_when_PmpPlugin_l250_16 = _zz_when_PmpPlugin_l250_6;
      default : _zz_when_PmpPlugin_l250_16 = _zz_when_PmpPlugin_l250_7;
    endcase
  end

  always @(*) begin
    case(_zz_when_PmpPlugin_l250_19)
      3'b000 : _zz_when_PmpPlugin_l250_18 = _zz_when_PmpPlugin_l250;
      3'b001 : _zz_when_PmpPlugin_l250_18 = _zz_when_PmpPlugin_l250_1;
      3'b010 : _zz_when_PmpPlugin_l250_18 = _zz_when_PmpPlugin_l250_2;
      3'b011 : _zz_when_PmpPlugin_l250_18 = _zz_when_PmpPlugin_l250_3;
      3'b100 : _zz_when_PmpPlugin_l250_18 = _zz_when_PmpPlugin_l250_4;
      3'b101 : _zz_when_PmpPlugin_l250_18 = _zz_when_PmpPlugin_l250_5;
      3'b110 : _zz_when_PmpPlugin_l250_18 = _zz_when_PmpPlugin_l250_6;
      default : _zz_when_PmpPlugin_l250_18 = _zz_when_PmpPlugin_l250_7;
    endcase
  end

  always @(*) begin
    case(_zz_when_PmpPlugin_l250_22)
      3'b000 : _zz_when_PmpPlugin_l250_21 = _zz_when_PmpPlugin_l250;
      3'b001 : _zz_when_PmpPlugin_l250_21 = _zz_when_PmpPlugin_l250_1;
      3'b010 : _zz_when_PmpPlugin_l250_21 = _zz_when_PmpPlugin_l250_2;
      3'b011 : _zz_when_PmpPlugin_l250_21 = _zz_when_PmpPlugin_l250_3;
      3'b100 : _zz_when_PmpPlugin_l250_21 = _zz_when_PmpPlugin_l250_4;
      3'b101 : _zz_when_PmpPlugin_l250_21 = _zz_when_PmpPlugin_l250_5;
      3'b110 : _zz_when_PmpPlugin_l250_21 = _zz_when_PmpPlugin_l250_6;
      default : _zz_when_PmpPlugin_l250_21 = _zz_when_PmpPlugin_l250_7;
    endcase
  end

  always @(*) begin
    case(_zz_when_PmpPlugin_l250_24)
      3'b000 : _zz_when_PmpPlugin_l250_23 = _zz_when_PmpPlugin_l250;
      3'b001 : _zz_when_PmpPlugin_l250_23 = _zz_when_PmpPlugin_l250_1;
      3'b010 : _zz_when_PmpPlugin_l250_23 = _zz_when_PmpPlugin_l250_2;
      3'b011 : _zz_when_PmpPlugin_l250_23 = _zz_when_PmpPlugin_l250_3;
      3'b100 : _zz_when_PmpPlugin_l250_23 = _zz_when_PmpPlugin_l250_4;
      3'b101 : _zz_when_PmpPlugin_l250_23 = _zz_when_PmpPlugin_l250_5;
      3'b110 : _zz_when_PmpPlugin_l250_23 = _zz_when_PmpPlugin_l250_6;
      default : _zz_when_PmpPlugin_l250_23 = _zz_when_PmpPlugin_l250_7;
    endcase
  end

  always @(*) begin
    case(_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_50)
      4'b0000 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead;
      4'b0001 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_2;
      4'b0010 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_4;
      4'b0011 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_6;
      4'b0100 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_8;
      4'b0101 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_10;
      4'b0110 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_12;
      4'b0111 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_14;
      4'b1000 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_16;
      4'b1001 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_18;
      4'b1010 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_20;
      4'b1011 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_22;
      4'b1100 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_24;
      4'b1101 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_26;
      4'b1110 : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_28;
      default : _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_30;
    endcase
  end

  always @(*) begin
    case(_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_50)
      4'b0000 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite;
      4'b0001 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_2;
      4'b0010 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_4;
      4'b0011 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_6;
      4'b0100 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_8;
      4'b0101 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_10;
      4'b0110 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_12;
      4'b0111 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_14;
      4'b1000 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_16;
      4'b1001 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_18;
      4'b1010 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_20;
      4'b1011 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_22;
      4'b1100 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_24;
      4'b1101 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_26;
      4'b1110 : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_28;
      default : _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_30;
    endcase
  end

  always @(*) begin
    case(_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_50)
      4'b0000 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute;
      4'b0001 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_2;
      4'b0010 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_4;
      4'b0011 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_6;
      4'b0100 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_8;
      4'b0101 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_10;
      4'b0110 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_12;
      4'b0111 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_14;
      4'b1000 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_16;
      4'b1001 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_18;
      4'b1010 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_20;
      4'b1011 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_22;
      4'b1100 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_24;
      4'b1101 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_26;
      4'b1110 : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_28;
      default : _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_30;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_string = "XRET";
      default : _zz_decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_ENV_CTRL_string = "XRET";
      default : _zz_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_ENV_CTRL_string = "XRET";
      default : _zz_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_execute_SRC2_CTRL_string = "PC ";
      default : _zz_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_2_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_2_string = "XRET";
      default : _zz_decode_ENV_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED1 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_PREDICTION_HAD_BRANCHED1 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_IS_CSR[29];
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign decode_IS_DIV = _zz_decode_IS_CSR[26];
  assign decode_IS_RS2_SIGNED = _zz_decode_IS_CSR[25];
  assign decode_IS_RS1_SIGNED = _zz_decode_IS_CSR[24];
  assign decode_IS_MUL = _zz_decode_IS_CSR[23];
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_IS_CSR[17];
  assign decode_MEMORY_STORE = _zz_decode_IS_CSR[14];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_IS_CSR[13];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_IS_CSR[12];
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL = _zz_decode_to_execute_SRC2_CTRL_1;
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign decode_MEMORY_ENABLE = _zz_decode_IS_CSR[5];
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign _zz_decode_to_execute_SRC1_CTRL = _zz_decode_to_execute_SRC1_CTRL_1;
  assign decode_RESCHEDULE_NEXT = _zz_decode_IS_CSR[1];
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  assign execute_RESCHEDULE_NEXT = decode_to_execute_RESCHEDULE_NEXT;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED1 = decode_to_execute_PREDICTION_HAD_BRANCHED1;
  assign execute_BRANCH_COND_RESULT = _zz_execute_BRANCH_COND_RESULT_1;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign decode_RS2_USE = _zz_decode_IS_CSR[16];
  assign decode_RS1_USE = _zz_decode_IS_CSR[6];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
  end

  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  always @(*) begin
    _zz_decode_RS2 = memory_REGFILE_WRITE_DATA;
    if(when_MulDivIterativePlugin_l96) begin
      _zz_decode_RS2 = ((memory_INSTRUCTION[13 : 12] == 2'b00) ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_accumulator[63 : 32]);
    end
    if(when_MulDivIterativePlugin_l128) begin
      _zz_decode_RS2 = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  always @(*) begin
    _zz_decode_RS2_1 = execute_REGFILE_WRITE_DATA;
    if(when_ShiftPlugins_l169) begin
      _zz_decode_RS2_1 = _zz_decode_RS2_3;
    end
    if(when_CsrPlugin_l1587) begin
      _zz_decode_RS2_1 = CsrPlugin_csrMapping_readDataSignal;
    end
  end

  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_execute_to_memory_PC = execute_PC;
  assign execute_SRC2_CTRL = _zz_execute_SRC2_CTRL;
  assign execute_SRC1_CTRL = _zz_execute_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_IS_CSR[4];
  assign decode_SRC_ADD_ZERO = _zz_decode_IS_CSR[20];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = _zz_execute_SRC2_4;
  assign execute_SRC1 = _zz_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_IS_CSR[11];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = (|{((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION) == 32'h00001073),{(_zz_decode_LEGAL_INSTRUCTION_1 == _zz_decode_LEGAL_INSTRUCTION_2),{_zz_decode_LEGAL_INSTRUCTION_3,{_zz_decode_LEGAL_INSTRUCTION_4,_zz_decode_LEGAL_INSTRUCTION_5}}}}}});
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusSimplePlugin_l566) begin
      _zz_decode_RS2_2 = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_ALIGNEMENT_FAULT = execute_to_memory_ALIGNEMENT_FAULT;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = (((dBus_cmd_payload_size == 2'b10) && (dBus_cmd_payload_address[1 : 0] != 2'b00)) || ((dBus_cmd_payload_size == 2'b01) && (dBus_cmd_payload_address[0 : 0] != 1'b0)));
  assign decode_FLUSH_ALL = _zz_decode_IS_CSR[0];
  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(when_IBusCachedPlugin_l245) begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  always @(*) begin
    _zz_execute_to_memory_FORMAL_PC_NEXT = execute_FORMAL_PC_NEXT;
    if(CsrPlugin_redoInterface_valid) begin
      _zz_execute_to_memory_FORMAL_PC_NEXT = CsrPlugin_redoInterface_payload;
    end
  end

  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  always @(*) begin
    _zz_decode_to_execute_FORMAL_PC_NEXT = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid) begin
      _zz_decode_to_execute_FORMAL_PC_NEXT = IBusCachedPlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_arbitration_haltItself = 1'b0;
  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_rescheduleLogic_rescheduleNext) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1527) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_when) begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusCachedPlugin_predictionJumpInterface_valid) begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(_zz_when) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l435) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_ShiftPlugins_l169) begin
      if(when_ShiftPlugins_l184) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(when_CsrPlugin_l1591) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_rescheduleLogic_rescheduleNext) begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l490) begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(when_MulDivIterativePlugin_l96) begin
      if(when_MulDivIterativePlugin_l97) begin
        memory_arbitration_haltItself = 1'b1;
      end
      if(when_MulDivIterativePlugin_l100) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l129) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(_zz_when_1) begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
    if(_zz_when_1) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(when_CsrPlugin_l1390) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l1272) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1390) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  assign IBusCachedPlugin_forceNoDecodeCond = 1'b0;
  always @(*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l242) begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  assign BranchPlugin_inDebugNoFetchFlag = 1'b0;
  always @(*) begin
    CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
    if(when_CsrPlugin_l1709) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_csrMapping_doForceFailCsr = 1'b0;
    if(execute_CsrPlugin_csr_3072) begin
      if(when_CsrPlugin_l1076) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
      if(when_CsrPlugin_l1077) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
    end
    if(execute_CsrPlugin_csr_3200) begin
      if(when_CsrPlugin_l1076_1) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
      if(when_CsrPlugin_l1077_1) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
    end
  end

  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  assign CsrPlugin_inWfi = 1'b0;
  assign CsrPlugin_thirdPartyWake = 1'b0;
  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1390) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1390) begin
      CsrPlugin_jumpInterface_payload = (((CsrPlugin_xtvec_mode == 2'b00) || CsrPlugin_hadException) ? {CsrPlugin_xtvec_base,2'b00} : {_zz_CsrPlugin_jumpInterface_payload,2'b00});
    end
    if(when_CsrPlugin_l1456) begin
      case(switch_CsrPlugin_l1460)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        2'b01 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_sepc;
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrPlugin_forceMachineWire = 1'b0;
  assign CsrPlugin_allowInterrupts = 1'b1;
  assign CsrPlugin_allowException = 1'b1;
  assign CsrPlugin_allowEbreakException = 1'b1;
  always @(*) begin
    CsrPlugin_xretAwayFromMachine = 1'b0;
    if(when_CsrPlugin_l1456) begin
      case(switch_CsrPlugin_l1460)
        2'b11 : begin
          if(when_CsrPlugin_l1468) begin
            CsrPlugin_xretAwayFromMachine = 1'b1;
          end
        end
        2'b01 : begin
          CsrPlugin_xretAwayFromMachine = 1'b1;
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusCachedPlugin_externalFlush = (|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}});
  assign IBusCachedPlugin_jump_pcLoad_valid = (|{CsrPlugin_redoInterface_valid,{CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,IBusCachedPlugin_predictionJumpInterface_valid}}});
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload = {IBusCachedPlugin_predictionJumpInterface_valid,{CsrPlugin_redoInterface_valid,{BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid}}};
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload & (~ _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1));
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_2 = _zz_IBusCachedPlugin_jump_pcLoad_payload_1[3];
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_3 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[1] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_4 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[2] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  always @(*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_output_fire = (IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready);
  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l133 = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate);
  assign when_Fetcher_l133_1 = ((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_IBusCachedPlugin_fetchPc_pc);
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  always @(*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l160 = (IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate));
  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch) begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt) begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_ready && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_valid;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_ready = IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy) begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_ready && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_ready = IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if(when_IBusCachedPlugin_l273) begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_ready && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_ready = IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_valid = IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready = ((1'b0 && (! IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid)) || IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid = _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_ready = IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if(when_Fetcher_l322) begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l242 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid);
  assign when_Fetcher_l322 = (! IBusCachedPlugin_pcValids_0);
  assign when_Fetcher_l331 = (! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready));
  assign when_Fetcher_l331_1 = (! (! IBusCachedPlugin_iBusRsp_stages_2_input_ready));
  assign when_Fetcher_l331_2 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l331_3 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l331_4 = (! writeBack_arbitration_isStuck);
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_iBusRsp_output_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusCachedPlugin_iBusRsp_output_valid;
    if(IBusCachedPlugin_forceNoDecodeCond) begin
      decode_arbitration_isValid = 1'b0;
    end
  end

  assign _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch = _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch[11];
  always @(*) begin
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[18] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[17] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[16] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[15] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[14] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[13] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[12] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[11] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[10] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[9] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[8] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[7] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[6] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[5] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[4] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[3] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[2] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[1] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[0] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  end

  always @(*) begin
    IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) || ((decode_BRANCH_CTRL == BranchCtrlEnum_B) && _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2[31]));
    if(_zz_6) begin
      IBusCachedPlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_2 = _zz__zz_2[19];
  always @(*) begin
    _zz_3[10] = _zz_2;
    _zz_3[9] = _zz_2;
    _zz_3[8] = _zz_2;
    _zz_3[7] = _zz_2;
    _zz_3[6] = _zz_2;
    _zz_3[5] = _zz_2;
    _zz_3[4] = _zz_2;
    _zz_3[3] = _zz_2;
    _zz_3[2] = _zz_2;
    _zz_3[1] = _zz_2;
    _zz_3[0] = _zz_2;
  end

  assign _zz_4 = _zz__zz_4[11];
  always @(*) begin
    _zz_5[18] = _zz_4;
    _zz_5[17] = _zz_4;
    _zz_5[16] = _zz_4;
    _zz_5[15] = _zz_4;
    _zz_5[14] = _zz_4;
    _zz_5[13] = _zz_4;
    _zz_5[12] = _zz_4;
    _zz_5[11] = _zz_4;
    _zz_5[10] = _zz_4;
    _zz_5[9] = _zz_4;
    _zz_5[8] = _zz_4;
    _zz_5[7] = _zz_4;
    _zz_5[6] = _zz_4;
    _zz_5[5] = _zz_4;
    _zz_5[4] = _zz_4;
    _zz_5[3] = _zz_4;
    _zz_5[2] = _zz_4;
    _zz_5[1] = _zz_4;
    _zz_5[0] = _zz_4;
  end

  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_JAL : begin
        _zz_6 = _zz__zz_6[1];
      end
      default : begin
        _zz_6 = _zz__zz_6_1[1];
      end
    endcase
  end

  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload = _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload[19];
  always @(*) begin
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[10] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[9] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[8] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[7] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[6] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[5] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[4] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[3] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[2] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[1] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[0] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
  end

  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_2 = _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2[11];
  always @(*) begin
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[18] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[17] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[16] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[15] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[14] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[13] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[12] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[11] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[10] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[9] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[8] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[7] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[6] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[5] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[4] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[3] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[2] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[1] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[0] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_IBusCachedPlugin_predictionJumpInterface_payload_1,{{{_zz_IBusCachedPlugin_predictionJumpInterface_payload_4,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_IBusCachedPlugin_predictionJumpInterface_payload_3,{{{_zz_IBusCachedPlugin_predictionJumpInterface_payload_5,_zz_IBusCachedPlugin_predictionJumpInterface_payload_6},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @(*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign IBusCachedPlugin_cache_io_cpu_prefetch_isValid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isValid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_1_input_ready || IBusCachedPlugin_externalFlush);
  assign IBusCachedPlugin_cache_io_cpu_decode_isValid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_decode_isStuck = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_cache_io_cpu_decode_isUser = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @(*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(when_IBusCachedPlugin_l245) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_cache_io_cpu_fill_valid = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_cache_io_cpu_fill_valid = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_2_input_payload[31 : 2],2'b00};
  assign when_IBusCachedPlugin_l245 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign when_IBusCachedPlugin_l250 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign when_IBusCachedPlugin_l256 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign when_IBusCachedPlugin_l262 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign when_IBusCachedPlugin_l273 = (IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt);
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign IBusCachedPlugin_cache_io_flush = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign _zz_dBus_cmd_valid = 1'b0;
  always @(*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT) begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_dBus_cmd_payload_data = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_dBus_cmd_payload_data = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_dBus_cmd_payload_data = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_dBus_cmd_payload_data;
  assign when_DBusSimplePlugin_l435 = ((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0001;
      end
      2'b01 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0011;
      end
      default : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_execute_DBusSimplePlugin_formalMask <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_mask = execute_DBusSimplePlugin_formalMask;
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign when_DBusSimplePlugin_l490 = (((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0));
  always @(*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    if(when_DBusSimplePlugin_l497) begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(memory_ALIGNEMENT_FAULT) begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(when_DBusSimplePlugin_l523) begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  always @(*) begin
    DBusSimplePlugin_memoryExceptionPort_payload_code = 4'bxxxx;
    if(when_DBusSimplePlugin_l497) begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = 4'b0101;
    end
    if(memory_ALIGNEMENT_FAULT) begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_DBusSimplePlugin_memoryExceptionPort_payload_code};
    end
  end

  assign DBusSimplePlugin_memoryExceptionPort_payload_badAddr = memory_REGFILE_WRITE_DATA;
  assign when_DBusSimplePlugin_l497 = ((dBus_rsp_ready && dBus_rsp_error) && (! memory_MEMORY_STORE));
  assign when_DBusSimplePlugin_l523 = (! ((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (1'b1 || (! memory_arbitration_isStuckByOthers))));
  always @(*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign switch_Misc_l245 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusSimplePlugin_rspFormated = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[31] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[30] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[29] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[28] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[27] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[26] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[25] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[24] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[23] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[22] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[21] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[20] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[19] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[18] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[17] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[16] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[15] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[14] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[13] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[12] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[11] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[10] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[9] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[8] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_writeBack_DBusSimplePlugin_rspFormated_2 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[31] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[30] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[29] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[28] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[27] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[26] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[25] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[24] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[23] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[22] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[21] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[20] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[19] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[18] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[17] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[16] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l245)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign when_DBusSimplePlugin_l566 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_decode_IS_CSR_1 = ((decode_INSTRUCTION & 32'h00001048) == 32'h00001008);
  assign _zz_decode_IS_CSR_2 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_IS_CSR_3 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_decode_IS_CSR_4 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_IS_CSR_5 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_IS_CSR_6 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_decode_IS_CSR_7 = ((decode_INSTRUCTION & 32'h00007000) == 32'h00001000);
  assign _zz_decode_IS_CSR_8 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00004000);
  assign _zz_decode_IS_CSR = {(|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR) == 32'h00000050)),{(|{_zz__zz_decode_IS_CSR_1,_zz__zz_decode_IS_CSR_2}),{(|{_zz__zz_decode_IS_CSR_3,_zz__zz_decode_IS_CSR_4}),{(|_zz__zz_decode_IS_CSR_6),{_zz__zz_decode_IS_CSR_8,{_zz__zz_decode_IS_CSR_11,_zz__zz_decode_IS_CSR_14}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_IS_CSR[3 : 2];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_IS_CSR[8 : 7];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_IS_CSR[10 : 9];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_IS_CSR[19 : 18];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_IS_CSR[22 : 21];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_IS_CSR[28 : 27];
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_IS_CSR[30 : 30];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h0);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = RegFilePlugin_regFile_spinal_port0;
  assign decode_RegFilePlugin_rs2Data = RegFilePlugin_regFile_spinal_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_10) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_10) begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2_2;
    if(_zz_10) begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      AluBitwiseCtrlEnum_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      AluCtrlEnum_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : begin
        _zz_execute_SRC1 = execute_RS1;
      end
      Src1CtrlEnum_PC_INCREMENT : begin
        _zz_execute_SRC1 = {29'd0, _zz__zz_execute_SRC1};
      end
      Src1CtrlEnum_IMU : begin
        _zz_execute_SRC1 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_execute_SRC1 = {27'd0, _zz__zz_execute_SRC1_1};
      end
    endcase
  end

  assign _zz_execute_SRC2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_SRC2_1[19] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[18] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[17] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[16] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[15] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[14] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[13] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[12] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[11] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[10] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[9] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[8] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[7] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[6] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[5] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[4] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[3] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[2] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[1] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[0] = _zz_execute_SRC2;
  end

  assign _zz_execute_SRC2_2 = _zz__zz_execute_SRC2_2[11];
  always @(*) begin
    _zz_execute_SRC2_3[19] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[18] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[17] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[16] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[15] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[14] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[13] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[12] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[11] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[10] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[9] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[8] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[7] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[6] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[5] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[4] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[3] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[2] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[1] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[0] = _zz_execute_SRC2_2;
  end

  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : begin
        _zz_execute_SRC2_4 = execute_RS2;
      end
      Src2CtrlEnum_IMI : begin
        _zz_execute_SRC2_4 = {_zz_execute_SRC2_1,execute_INSTRUCTION[31 : 20]};
      end
      Src2CtrlEnum_IMS : begin
        _zz_execute_SRC2_4 = {_zz_execute_SRC2_3,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_execute_SRC2_4 = _zz_execute_to_memory_PC;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != ShiftCtrlEnum_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == 4'b0000);
  assign when_ShiftPlugins_l169 = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != 5'h0));
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_SLL_1 : begin
        _zz_decode_RS2_3 = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_decode_RS2_3 = _zz__zz_decode_RS2_3;
      end
    endcase
  end

  assign when_ShiftPlugins_l175 = (! execute_arbitration_isStuckByOthers);
  assign when_ShiftPlugins_l184 = (! execute_LightShifterPlugin_done);
  assign memory_MulDivIterativePlugin_frontendOk = 1'b1;
  always @(*) begin
    memory_MulDivIterativePlugin_mul_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l96) begin
      if(when_MulDivIterativePlugin_l100) begin
        memory_MulDivIterativePlugin_mul_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_MulDivIterativePlugin_mul_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l110) begin
      memory_MulDivIterativePlugin_mul_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_mul_counter_value == 6'h20);
  assign memory_MulDivIterativePlugin_mul_counter_willOverflow = (memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc && memory_MulDivIterativePlugin_mul_counter_willIncrement);
  always @(*) begin
    if(memory_MulDivIterativePlugin_mul_counter_willOverflow) begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = (memory_MulDivIterativePlugin_mul_counter_value + _zz_memory_MulDivIterativePlugin_mul_counter_valueNext);
    end
    if(memory_MulDivIterativePlugin_mul_counter_willClear) begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = 6'h0;
    end
  end

  assign when_MulDivIterativePlugin_l96 = (memory_arbitration_isValid && memory_IS_MUL);
  assign when_MulDivIterativePlugin_l97 = ((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc));
  assign when_MulDivIterativePlugin_l100 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc));
  assign when_MulDivIterativePlugin_l110 = (! memory_arbitration_isStuck);
  always @(*) begin
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l162) begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == 6'h21);
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @(*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow) begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_memory_MulDivIterativePlugin_div_counter_valueNext);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear) begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign when_MulDivIterativePlugin_l126 = (memory_MulDivIterativePlugin_div_counter_value == 6'h20);
  assign when_MulDivIterativePlugin_l126_1 = (! memory_arbitration_isStuck);
  assign when_MulDivIterativePlugin_l128 = (memory_arbitration_isValid && memory_IS_DIV);
  assign when_MulDivIterativePlugin_l129 = ((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_div_done));
  assign when_MulDivIterativePlugin_l132 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_div_done));
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign memory_MulDivIterativePlugin_div_stage_0_remainderShifted = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31]};
  assign memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = (memory_MulDivIterativePlugin_div_stage_0_remainderShifted - _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator);
  assign memory_MulDivIterativePlugin_div_stage_0_outRemainder = ((! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder : _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1);
  assign memory_MulDivIterativePlugin_div_stage_0_outNumerator = _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator[31:0];
  assign when_MulDivIterativePlugin_l151 = (memory_MulDivIterativePlugin_div_counter_value == 6'h20);
  assign _zz_memory_MulDivIterativePlugin_div_result = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign when_MulDivIterativePlugin_l162 = (! memory_arbitration_isStuck);
  assign _zz_memory_MulDivIterativePlugin_rs2 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_memory_MulDivIterativePlugin_rs1 = ((execute_IS_MUL && _zz_memory_MulDivIterativePlugin_rs2) || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @(*) begin
    _zz_memory_MulDivIterativePlugin_rs1_1[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_memory_MulDivIterativePlugin_rs1_1[31 : 0] = execute_RS1;
  end

  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2_2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l245_1 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    case(switch_Misc_l245_1)
      3'b000 : begin
        _zz_execute_BRANCH_COND_RESULT = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_BranchPlugin_eq);
      end
      3'b101 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      3'b111 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b0;
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT_1 = _zz_execute_BRANCH_COND_RESULT;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_1[19] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[18] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[17] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[16] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[15] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[14] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[13] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[12] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[11] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[10] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[9] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[8] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[7] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[6] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[5] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[4] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[3] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[2] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[1] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[0] = _zz_execute_BranchPlugin_missAlignedTarget;
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget_2 = _zz__zz_execute_BranchPlugin_missAlignedTarget_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_3[10] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[9] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[8] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[7] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[6] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[5] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[4] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[3] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[2] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[1] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[0] = _zz_execute_BranchPlugin_missAlignedTarget_2;
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget_4 = _zz__zz_execute_BranchPlugin_missAlignedTarget_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_5[18] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[17] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[16] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[15] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[14] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[13] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[12] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[11] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[10] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[9] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[8] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[7] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[6] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[5] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[4] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[3] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[2] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[1] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[0] = _zz_execute_BranchPlugin_missAlignedTarget_4;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = (_zz__zz_execute_BranchPlugin_missAlignedTarget_6[1] ^ execute_RS1[1]);
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1[1];
      end
      default : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_execute_BranchPlugin_missAlignedTarget_6);
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[19] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[18] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[17] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[16] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[15] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[14] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[13] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[12] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[11] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_execute_BranchPlugin_branch_src2_1,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_execute_BranchPlugin_branch_src2_3,{{{_zz_execute_BranchPlugin_branch_src2_6,_zz_execute_BranchPlugin_branch_src2_7},_zz_execute_BranchPlugin_branch_src2_8},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_execute_BranchPlugin_branch_src2_5,{{{_zz_execute_BranchPlugin_branch_src2_9,_zz_execute_BranchPlugin_branch_src2_10},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED1) begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_execute_BranchPlugin_branch_src2_11};
        end
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = _zz__zz_execute_BranchPlugin_branch_src2_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign BranchPlugin_branchExceptionPort_valid = (memory_arbitration_isValid && (memory_BRANCH_DO && memory_BRANCH_CALC[1]));
  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @(*) begin
    CsrPlugin_privilege = _zz_CsrPlugin_privilege;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign CsrPlugin_medeleg_IAM = 1'b0;
  assign CsrPlugin_medeleg_IAF = 1'b0;
  assign CsrPlugin_medeleg_II = 1'b0;
  assign CsrPlugin_medeleg_BP = 1'b0;
  assign CsrPlugin_medeleg_LAM = 1'b0;
  assign CsrPlugin_medeleg_LAF = 1'b0;
  assign CsrPlugin_medeleg_SAM = 1'b0;
  assign CsrPlugin_medeleg_SAF = 1'b0;
  assign CsrPlugin_medeleg_EU = 1'b0;
  assign CsrPlugin_medeleg_ES = 1'b0;
  assign CsrPlugin_medeleg_IPF = 1'b0;
  assign CsrPlugin_medeleg_LPF = 1'b0;
  assign CsrPlugin_medeleg_SPF = 1'b0;
  assign CsrPlugin_mideleg_ST = 1'b0;
  assign CsrPlugin_mideleg_SE = 1'b0;
  assign CsrPlugin_mideleg_SS = 1'b0;
  assign CsrPlugin_mcounteren_IR = 1'b1;
  assign CsrPlugin_mcounteren_TM = 1'b1;
  assign CsrPlugin_scounteren_IR = 1'b1;
  assign CsrPlugin_scounteren_TM = 1'b1;
  assign CsrPlugin_sip_SEIP_OR = (CsrPlugin_sip_SEIP_SOFT || CsrPlugin_sip_SEIP_INPUT);
  always @(*) begin
    CsrPlugin_redoInterface_valid = 1'b0;
    if(CsrPlugin_rescheduleLogic_rescheduleNext) begin
      CsrPlugin_redoInterface_valid = 1'b1;
    end
  end

  assign CsrPlugin_redoInterface_payload = decode_PC;
  always @(*) begin
    CsrPlugin_rescheduleLogic_rescheduleNext = 1'b0;
    if(when_CsrPlugin_l1153) begin
      CsrPlugin_rescheduleLogic_rescheduleNext = 1'b1;
    end
    if(execute_CsrPlugin_csr_384) begin
      if(execute_CsrPlugin_writeInstruction) begin
        CsrPlugin_rescheduleLogic_rescheduleNext = 1'b1;
      end
    end
  end

  assign when_CsrPlugin_l1153 = (execute_arbitration_isValid && execute_RESCHEDULE_NEXT);
  assign _zz_when_CsrPlugin_l1302 = (CsrPlugin_sip_STIP && CsrPlugin_sie_STIE);
  assign _zz_when_CsrPlugin_l1302_1 = (CsrPlugin_sip_SSIP && CsrPlugin_sie_SSIE);
  assign _zz_when_CsrPlugin_l1302_2 = (CsrPlugin_sip_SEIP_OR && CsrPlugin_sie_SEIE);
  assign _zz_when_CsrPlugin_l1302_3 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l1302_4 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l1302_5 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
    case(CsrPlugin_exceptionPortCtrl_exceptionContext_code)
      4'b0000 : begin
        if(when_CsrPlugin_l1216) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0001 : begin
        if(when_CsrPlugin_l1216_1) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0010 : begin
        if(when_CsrPlugin_l1216_2) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0011 : begin
        if(when_CsrPlugin_l1216_3) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0100 : begin
        if(when_CsrPlugin_l1216_4) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0101 : begin
        if(when_CsrPlugin_l1216_5) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0110 : begin
        if(when_CsrPlugin_l1216_6) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0111 : begin
        if(when_CsrPlugin_l1216_7) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1000 : begin
        if(when_CsrPlugin_l1216_8) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1001 : begin
        if(when_CsrPlugin_l1216_9) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1100 : begin
        if(when_CsrPlugin_l1216_10) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1101 : begin
        if(when_CsrPlugin_l1216_11) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1111 : begin
        if(when_CsrPlugin_l1216_12) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_CsrPlugin_l1216 = ((1'b1 && CsrPlugin_medeleg_IAM) && (! 1'b0));
  assign when_CsrPlugin_l1216_1 = ((1'b1 && CsrPlugin_medeleg_IAF) && (! 1'b0));
  assign when_CsrPlugin_l1216_2 = ((1'b1 && CsrPlugin_medeleg_II) && (! 1'b0));
  assign when_CsrPlugin_l1216_3 = ((1'b1 && CsrPlugin_medeleg_BP) && (! 1'b0));
  assign when_CsrPlugin_l1216_4 = ((1'b1 && CsrPlugin_medeleg_LAM) && (! 1'b0));
  assign when_CsrPlugin_l1216_5 = ((1'b1 && CsrPlugin_medeleg_LAF) && (! 1'b0));
  assign when_CsrPlugin_l1216_6 = ((1'b1 && CsrPlugin_medeleg_SAM) && (! 1'b0));
  assign when_CsrPlugin_l1216_7 = ((1'b1 && CsrPlugin_medeleg_SAF) && (! 1'b0));
  assign when_CsrPlugin_l1216_8 = ((1'b1 && CsrPlugin_medeleg_EU) && (! 1'b0));
  assign when_CsrPlugin_l1216_9 = ((1'b1 && CsrPlugin_medeleg_ES) && (! 1'b0));
  assign when_CsrPlugin_l1216_10 = ((1'b1 && CsrPlugin_medeleg_IPF) && (! 1'b0));
  assign when_CsrPlugin_l1216_11 = ((1'b1 && CsrPlugin_medeleg_LPF) && (! 1'b0));
  assign when_CsrPlugin_l1216_12 = ((1'b1 && CsrPlugin_medeleg_SPF) && (! 1'b0));
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1[0];
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_2 = {BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid};
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3 = _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3[0];
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(execute_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(_zz_when_1) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign when_CsrPlugin_l1259 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l1259_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1259_2 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1259_3 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1272 = (|{CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}});
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign when_CsrPlugin_l1296 = ((CsrPlugin_sstatus_SIE && (CsrPlugin_privilege == 2'b01)) || (CsrPlugin_privilege < 2'b01));
  assign when_CsrPlugin_l1296_1 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l1302 = ((_zz_when_CsrPlugin_l1302 && (1'b1 && CsrPlugin_mideleg_ST)) && (! 1'b0));
  assign when_CsrPlugin_l1302_1 = ((_zz_when_CsrPlugin_l1302_1 && (1'b1 && CsrPlugin_mideleg_SS)) && (! 1'b0));
  assign when_CsrPlugin_l1302_2 = ((_zz_when_CsrPlugin_l1302_2 && (1'b1 && CsrPlugin_mideleg_SE)) && (! 1'b0));
  assign when_CsrPlugin_l1302_3 = ((_zz_when_CsrPlugin_l1302 && 1'b1) && (! (|CsrPlugin_mideleg_ST)));
  assign when_CsrPlugin_l1302_4 = ((_zz_when_CsrPlugin_l1302_1 && 1'b1) && (! (|CsrPlugin_mideleg_SS)));
  assign when_CsrPlugin_l1302_5 = ((_zz_when_CsrPlugin_l1302_2 && 1'b1) && (! (|CsrPlugin_mideleg_SE)));
  assign when_CsrPlugin_l1302_6 = ((_zz_when_CsrPlugin_l1302_3 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1302_7 = ((_zz_when_CsrPlugin_l1302_4 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1302_8 = ((_zz_when_CsrPlugin_l1302_5 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l1335 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1335_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1335_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1340 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(when_CsrPlugin_l1346) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign when_CsrPlugin_l1346 = (|{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}});
  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @(*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException) begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @(*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException) begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  assign CsrPlugin_trapCauseEbreakDebug = 1'b0;
  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b01 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_stvec_mode;
      end
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b01 : begin
        CsrPlugin_xtvec_base = CsrPlugin_stvec_base;
      end
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign CsrPlugin_trapEnterDebug = 1'b0;
  assign when_CsrPlugin_l1390 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1398 = (! CsrPlugin_trapEnterDebug);
  assign when_CsrPlugin_l1456 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET));
  assign switch_CsrPlugin_l1460 = writeBack_INSTRUCTION[29 : 28];
  assign when_CsrPlugin_l1468 = (CsrPlugin_mstatus_MPP < 2'b11);
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1527 = (|{(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == EnvCtrlEnum_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET))}});
  assign execute_CsrPlugin_blockedBySideEffects = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2816) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2944) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_3072) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3200) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_774) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_262) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_256) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_324) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_260) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_261) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_321) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_322) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_323) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_384) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_944) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_945) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_946) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_947) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_948) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_949) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_950) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_951) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_952) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_953) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_954) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_955) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_956) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_957) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_958) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_959) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_928) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_929) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_930) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_931) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1725) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1547) begin
      if(when_CsrPlugin_l1548) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  assign when_CsrPlugin_l1547 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET));
  assign when_CsrPlugin_l1548 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  always @(*) begin
    execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_readToWriteData[9 : 9] = CsrPlugin_sip_SEIP_SOFT;
    end
    if(execute_CsrPlugin_csr_324) begin
      execute_CsrPlugin_readToWriteData[9 : 9] = CsrPlugin_sip_SEIP_SOFT;
    end
  end

  assign switch_Misc_l245_2 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l245_2)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1587 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1591 = (execute_arbitration_isValid && (execute_IS_CSR || execute_RESCHEDULE_NEXT));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_1 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_1 = CsrPlugin_csrMapping_writeDataSignal[0];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_1 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_1 = CsrPlugin_csrMapping_writeDataSignal[1];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_1 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_1 = CsrPlugin_csrMapping_writeDataSignal[2];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_1 = _zz_when_PmpPlugin_l126;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_1 = CsrPlugin_csrMapping_writeDataSignal[7];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = _zz_CsrPlugin_csrMapping_readDataInit;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_2 = CsrPlugin_csrMapping_writeDataSignal[4 : 3];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = _zz_CsrPlugin_csrMapping_readDataInit_1;
    if(execute_CsrPlugin_csr_944) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_3 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126 = (! _zz_when_PmpPlugin_l126);
  assign _zz_PmpPlugin_ports_0_hits_0_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_1};
  assign _zz_PmpPlugin_ports_0_hits_0_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_0_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_0_5 = (_zz_PmpPlugin_ports_0_hits_0_3 ^ _zz__zz_PmpPlugin_ports_0_hits_0_5);
  assign _zz_PmpPlugin_ports_0_hits_0_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_0_3 & (~ _zz_PmpPlugin_ports_0_hits_0_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_0 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_2)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_0 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_2)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_0_1 = 36'h0;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_0_1 = _zz_PmpPlugin_ports_0_hits_0_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_0_1 = _zz_PmpPlugin_ports_0_hits_0_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_0_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_2)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_0_2 = _zz_PmpPlugin_ports_0_hits_0_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_0_2 = (_zz_PmpPlugin_ports_0_hits_0_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_0_2 = (_zz_PmpPlugin_ports_0_hits_0_6 + _zz__zz_PmpPlugin_ports_0_hits_0_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_0_2 = _zz_PmpPlugin_ports_0_hits_0_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_3 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_2;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_3 = CsrPlugin_csrMapping_writeDataSignal[8];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_3 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_2;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_3 = CsrPlugin_csrMapping_writeDataSignal[9];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_3 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_2;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_3 = CsrPlugin_csrMapping_writeDataSignal[10];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_3 = _zz_when_PmpPlugin_l126_2;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_3 = CsrPlugin_csrMapping_writeDataSignal[15];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_6 = _zz_CsrPlugin_csrMapping_readDataInit_4;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_6 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_7 = _zz_CsrPlugin_csrMapping_readDataInit_5;
    if(execute_CsrPlugin_csr_945) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_7 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_1 = (! _zz_when_PmpPlugin_l126_2);
  assign _zz_PmpPlugin_ports_0_hits_1_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_5};
  assign _zz_PmpPlugin_ports_0_hits_1_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_1_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_1_5 = (_zz_PmpPlugin_ports_0_hits_1_3 ^ _zz__zz_PmpPlugin_ports_0_hits_1_5);
  assign _zz_PmpPlugin_ports_0_hits_1_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_1_3 & (~ _zz_PmpPlugin_ports_0_hits_1_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_1 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_6)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_1 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_6)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_1_1 = _zz_PmpPlugin_ports_0_hits_0_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_1_1 = _zz_PmpPlugin_ports_0_hits_1_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_1_1 = _zz_PmpPlugin_ports_0_hits_1_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_1_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_6)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_1_2 = _zz_PmpPlugin_ports_0_hits_1_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_1_2 = (_zz_PmpPlugin_ports_0_hits_1_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_1_2 = (_zz_PmpPlugin_ports_0_hits_1_6 + _zz__zz_PmpPlugin_ports_0_hits_1_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_1_2 = _zz_PmpPlugin_ports_0_hits_1_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_5 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_4;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_5 = CsrPlugin_csrMapping_writeDataSignal[16];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_5 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_4;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_5 = CsrPlugin_csrMapping_writeDataSignal[17];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_5 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_4;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_5 = CsrPlugin_csrMapping_writeDataSignal[18];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_5 = _zz_when_PmpPlugin_l126_4;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_5 = CsrPlugin_csrMapping_writeDataSignal[23];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_10 = _zz_CsrPlugin_csrMapping_readDataInit_8;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_10 = CsrPlugin_csrMapping_writeDataSignal[20 : 19];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_11 = _zz_CsrPlugin_csrMapping_readDataInit_9;
    if(execute_CsrPlugin_csr_946) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_11 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_2 = (! _zz_when_PmpPlugin_l126_4);
  assign _zz_PmpPlugin_ports_0_hits_2_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_9};
  assign _zz_PmpPlugin_ports_0_hits_2_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_2_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_2_5 = (_zz_PmpPlugin_ports_0_hits_2_3 ^ _zz__zz_PmpPlugin_ports_0_hits_2_5);
  assign _zz_PmpPlugin_ports_0_hits_2_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_2_3 & (~ _zz_PmpPlugin_ports_0_hits_2_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_2 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_10)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_2 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_10)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_2_1 = _zz_PmpPlugin_ports_0_hits_1_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_2_1 = _zz_PmpPlugin_ports_0_hits_2_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_2_1 = _zz_PmpPlugin_ports_0_hits_2_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_2_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_10)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_2_2 = _zz_PmpPlugin_ports_0_hits_2_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_2_2 = (_zz_PmpPlugin_ports_0_hits_2_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_2_2 = (_zz_PmpPlugin_ports_0_hits_2_6 + _zz__zz_PmpPlugin_ports_0_hits_2_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_2_2 = _zz_PmpPlugin_ports_0_hits_2_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_7 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_6;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_7 = CsrPlugin_csrMapping_writeDataSignal[24];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_7 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_6;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_7 = CsrPlugin_csrMapping_writeDataSignal[25];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_7 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_6;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_7 = CsrPlugin_csrMapping_writeDataSignal[26];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_7 = _zz_when_PmpPlugin_l126_6;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_7 = CsrPlugin_csrMapping_writeDataSignal[31];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_14 = _zz_CsrPlugin_csrMapping_readDataInit_12;
    if(execute_CsrPlugin_csr_928) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_14 = CsrPlugin_csrMapping_writeDataSignal[28 : 27];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_15 = _zz_CsrPlugin_csrMapping_readDataInit_13;
    if(execute_CsrPlugin_csr_947) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_15 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_3 = (! _zz_when_PmpPlugin_l126_6);
  assign _zz_PmpPlugin_ports_0_hits_3_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_13};
  assign _zz_PmpPlugin_ports_0_hits_3_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_3_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_3_5 = (_zz_PmpPlugin_ports_0_hits_3_3 ^ _zz__zz_PmpPlugin_ports_0_hits_3_5);
  assign _zz_PmpPlugin_ports_0_hits_3_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_3_3 & (~ _zz_PmpPlugin_ports_0_hits_3_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_3 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_14)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_3 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_14)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_3_1 = _zz_PmpPlugin_ports_0_hits_2_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_3_1 = _zz_PmpPlugin_ports_0_hits_3_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_3_1 = _zz_PmpPlugin_ports_0_hits_3_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_3_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_14)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_3_2 = _zz_PmpPlugin_ports_0_hits_3_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_3_2 = (_zz_PmpPlugin_ports_0_hits_3_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_3_2 = (_zz_PmpPlugin_ports_0_hits_3_6 + _zz__zz_PmpPlugin_ports_0_hits_3_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_3_2 = _zz_PmpPlugin_ports_0_hits_3_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_9 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_8;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_9 = CsrPlugin_csrMapping_writeDataSignal[0];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_9 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_8;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_9 = CsrPlugin_csrMapping_writeDataSignal[1];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_9 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_8;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_9 = CsrPlugin_csrMapping_writeDataSignal[2];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_9 = _zz_when_PmpPlugin_l126_8;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_9 = CsrPlugin_csrMapping_writeDataSignal[7];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_18 = _zz_CsrPlugin_csrMapping_readDataInit_16;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_18 = CsrPlugin_csrMapping_writeDataSignal[4 : 3];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_19 = _zz_CsrPlugin_csrMapping_readDataInit_17;
    if(execute_CsrPlugin_csr_948) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_19 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_4 = (! _zz_when_PmpPlugin_l126_8);
  assign _zz_PmpPlugin_ports_0_hits_4_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_17};
  assign _zz_PmpPlugin_ports_0_hits_4_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_4_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_4_5 = (_zz_PmpPlugin_ports_0_hits_4_3 ^ _zz__zz_PmpPlugin_ports_0_hits_4_5);
  assign _zz_PmpPlugin_ports_0_hits_4_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_4_3 & (~ _zz_PmpPlugin_ports_0_hits_4_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_4 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_18)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_4 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_18)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_4_1 = _zz_PmpPlugin_ports_0_hits_3_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_4_1 = _zz_PmpPlugin_ports_0_hits_4_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_4_1 = _zz_PmpPlugin_ports_0_hits_4_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_4_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_18)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_4_2 = _zz_PmpPlugin_ports_0_hits_4_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_4_2 = (_zz_PmpPlugin_ports_0_hits_4_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_4_2 = (_zz_PmpPlugin_ports_0_hits_4_6 + _zz__zz_PmpPlugin_ports_0_hits_4_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_4_2 = _zz_PmpPlugin_ports_0_hits_4_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_11 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_10;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_11 = CsrPlugin_csrMapping_writeDataSignal[8];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_11 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_10;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_11 = CsrPlugin_csrMapping_writeDataSignal[9];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_11 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_10;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_11 = CsrPlugin_csrMapping_writeDataSignal[10];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_11 = _zz_when_PmpPlugin_l126_10;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_11 = CsrPlugin_csrMapping_writeDataSignal[15];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_22 = _zz_CsrPlugin_csrMapping_readDataInit_20;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_22 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_23 = _zz_CsrPlugin_csrMapping_readDataInit_21;
    if(execute_CsrPlugin_csr_949) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_23 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_5 = (! _zz_when_PmpPlugin_l126_10);
  assign _zz_PmpPlugin_ports_0_hits_5_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_21};
  assign _zz_PmpPlugin_ports_0_hits_5_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_5_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_5_5 = (_zz_PmpPlugin_ports_0_hits_5_3 ^ _zz__zz_PmpPlugin_ports_0_hits_5_5);
  assign _zz_PmpPlugin_ports_0_hits_5_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_5_3 & (~ _zz_PmpPlugin_ports_0_hits_5_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_5 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_22)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_5 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_22)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_5_1 = _zz_PmpPlugin_ports_0_hits_4_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_5_1 = _zz_PmpPlugin_ports_0_hits_5_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_5_1 = _zz_PmpPlugin_ports_0_hits_5_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_5_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_22)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_5_2 = _zz_PmpPlugin_ports_0_hits_5_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_5_2 = (_zz_PmpPlugin_ports_0_hits_5_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_5_2 = (_zz_PmpPlugin_ports_0_hits_5_6 + _zz__zz_PmpPlugin_ports_0_hits_5_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_5_2 = _zz_PmpPlugin_ports_0_hits_5_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_13 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_12;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_13 = CsrPlugin_csrMapping_writeDataSignal[16];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_13 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_12;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_13 = CsrPlugin_csrMapping_writeDataSignal[17];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_13 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_12;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_13 = CsrPlugin_csrMapping_writeDataSignal[18];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_13 = _zz_when_PmpPlugin_l126_12;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_13 = CsrPlugin_csrMapping_writeDataSignal[23];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_26 = _zz_CsrPlugin_csrMapping_readDataInit_24;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_26 = CsrPlugin_csrMapping_writeDataSignal[20 : 19];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_27 = _zz_CsrPlugin_csrMapping_readDataInit_25;
    if(execute_CsrPlugin_csr_950) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_27 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_6 = (! _zz_when_PmpPlugin_l126_12);
  assign _zz_PmpPlugin_ports_0_hits_6_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_25};
  assign _zz_PmpPlugin_ports_0_hits_6_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_6_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_6_5 = (_zz_PmpPlugin_ports_0_hits_6_3 ^ _zz__zz_PmpPlugin_ports_0_hits_6_5);
  assign _zz_PmpPlugin_ports_0_hits_6_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_6_3 & (~ _zz_PmpPlugin_ports_0_hits_6_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_6 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_26)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_6 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_26)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_6_1 = _zz_PmpPlugin_ports_0_hits_5_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_6_1 = _zz_PmpPlugin_ports_0_hits_6_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_6_1 = _zz_PmpPlugin_ports_0_hits_6_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_6_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_26)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_6_2 = _zz_PmpPlugin_ports_0_hits_6_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_6_2 = (_zz_PmpPlugin_ports_0_hits_6_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_6_2 = (_zz_PmpPlugin_ports_0_hits_6_6 + _zz__zz_PmpPlugin_ports_0_hits_6_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_6_2 = _zz_PmpPlugin_ports_0_hits_6_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_15 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_14;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_15 = CsrPlugin_csrMapping_writeDataSignal[24];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_15 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_14;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_15 = CsrPlugin_csrMapping_writeDataSignal[25];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_15 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_14;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_15 = CsrPlugin_csrMapping_writeDataSignal[26];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_15 = _zz_when_PmpPlugin_l126_14;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_15 = CsrPlugin_csrMapping_writeDataSignal[31];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_30 = _zz_CsrPlugin_csrMapping_readDataInit_28;
    if(execute_CsrPlugin_csr_929) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_30 = CsrPlugin_csrMapping_writeDataSignal[28 : 27];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_31 = _zz_CsrPlugin_csrMapping_readDataInit_29;
    if(execute_CsrPlugin_csr_951) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_31 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_7 = (! _zz_when_PmpPlugin_l126_14);
  assign _zz_PmpPlugin_ports_0_hits_7_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_29};
  assign _zz_PmpPlugin_ports_0_hits_7_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_7_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_7_5 = (_zz_PmpPlugin_ports_0_hits_7_3 ^ _zz__zz_PmpPlugin_ports_0_hits_7_5);
  assign _zz_PmpPlugin_ports_0_hits_7_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_7_3 & (~ _zz_PmpPlugin_ports_0_hits_7_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_7 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_30)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_7 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_30)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_7_1 = _zz_PmpPlugin_ports_0_hits_6_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_7_1 = _zz_PmpPlugin_ports_0_hits_7_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_7_1 = _zz_PmpPlugin_ports_0_hits_7_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_7_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_30)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_7_2 = _zz_PmpPlugin_ports_0_hits_7_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_7_2 = (_zz_PmpPlugin_ports_0_hits_7_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_7_2 = (_zz_PmpPlugin_ports_0_hits_7_6 + _zz__zz_PmpPlugin_ports_0_hits_7_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_7_2 = _zz_PmpPlugin_ports_0_hits_7_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_17 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_16;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_17 = CsrPlugin_csrMapping_writeDataSignal[0];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_17 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_16;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_17 = CsrPlugin_csrMapping_writeDataSignal[1];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_17 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_16;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_17 = CsrPlugin_csrMapping_writeDataSignal[2];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_17 = _zz_when_PmpPlugin_l126_16;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_17 = CsrPlugin_csrMapping_writeDataSignal[7];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_34 = _zz_CsrPlugin_csrMapping_readDataInit_32;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_34 = CsrPlugin_csrMapping_writeDataSignal[4 : 3];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_35 = _zz_CsrPlugin_csrMapping_readDataInit_33;
    if(execute_CsrPlugin_csr_952) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_35 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_8 = (! _zz_when_PmpPlugin_l126_16);
  assign _zz_PmpPlugin_ports_0_hits_8_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_33};
  assign _zz_PmpPlugin_ports_0_hits_8_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_8_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_8_5 = (_zz_PmpPlugin_ports_0_hits_8_3 ^ _zz__zz_PmpPlugin_ports_0_hits_8_5);
  assign _zz_PmpPlugin_ports_0_hits_8_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_8_3 & (~ _zz_PmpPlugin_ports_0_hits_8_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_8 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_34)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_8 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_34)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_8_1 = _zz_PmpPlugin_ports_0_hits_7_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_8_1 = _zz_PmpPlugin_ports_0_hits_8_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_8_1 = _zz_PmpPlugin_ports_0_hits_8_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_8_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_34)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_8_2 = _zz_PmpPlugin_ports_0_hits_8_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_8_2 = (_zz_PmpPlugin_ports_0_hits_8_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_8_2 = (_zz_PmpPlugin_ports_0_hits_8_6 + _zz__zz_PmpPlugin_ports_0_hits_8_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_8_2 = _zz_PmpPlugin_ports_0_hits_8_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_19 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_18;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_19 = CsrPlugin_csrMapping_writeDataSignal[8];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_19 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_18;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_19 = CsrPlugin_csrMapping_writeDataSignal[9];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_19 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_18;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_19 = CsrPlugin_csrMapping_writeDataSignal[10];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_19 = _zz_when_PmpPlugin_l126_18;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_19 = CsrPlugin_csrMapping_writeDataSignal[15];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_38 = _zz_CsrPlugin_csrMapping_readDataInit_36;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_38 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_39 = _zz_CsrPlugin_csrMapping_readDataInit_37;
    if(execute_CsrPlugin_csr_953) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_39 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_9 = (! _zz_when_PmpPlugin_l126_18);
  assign _zz_PmpPlugin_ports_0_hits_9_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_37};
  assign _zz_PmpPlugin_ports_0_hits_9_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_9_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_9_5 = (_zz_PmpPlugin_ports_0_hits_9_3 ^ _zz__zz_PmpPlugin_ports_0_hits_9_5);
  assign _zz_PmpPlugin_ports_0_hits_9_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_9_3 & (~ _zz_PmpPlugin_ports_0_hits_9_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_9 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_38)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_9 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_38)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_9_1 = _zz_PmpPlugin_ports_0_hits_8_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_9_1 = _zz_PmpPlugin_ports_0_hits_9_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_9_1 = _zz_PmpPlugin_ports_0_hits_9_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_9_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_38)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_9_2 = _zz_PmpPlugin_ports_0_hits_9_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_9_2 = (_zz_PmpPlugin_ports_0_hits_9_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_9_2 = (_zz_PmpPlugin_ports_0_hits_9_6 + _zz__zz_PmpPlugin_ports_0_hits_9_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_9_2 = _zz_PmpPlugin_ports_0_hits_9_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_21 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_20;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_21 = CsrPlugin_csrMapping_writeDataSignal[16];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_21 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_20;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_21 = CsrPlugin_csrMapping_writeDataSignal[17];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_21 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_20;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_21 = CsrPlugin_csrMapping_writeDataSignal[18];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_21 = _zz_when_PmpPlugin_l126_20;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_21 = CsrPlugin_csrMapping_writeDataSignal[23];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_42 = _zz_CsrPlugin_csrMapping_readDataInit_40;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_42 = CsrPlugin_csrMapping_writeDataSignal[20 : 19];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_43 = _zz_CsrPlugin_csrMapping_readDataInit_41;
    if(execute_CsrPlugin_csr_954) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_43 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_10 = (! _zz_when_PmpPlugin_l126_20);
  assign _zz_PmpPlugin_ports_0_hits_10_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_41};
  assign _zz_PmpPlugin_ports_0_hits_10_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_10_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_10_5 = (_zz_PmpPlugin_ports_0_hits_10_3 ^ _zz__zz_PmpPlugin_ports_0_hits_10_5);
  assign _zz_PmpPlugin_ports_0_hits_10_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_10_3 & (~ _zz_PmpPlugin_ports_0_hits_10_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_10 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_42)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_10 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_42)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_10_1 = _zz_PmpPlugin_ports_0_hits_9_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_10_1 = _zz_PmpPlugin_ports_0_hits_10_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_10_1 = _zz_PmpPlugin_ports_0_hits_10_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_10_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_42)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_10_2 = _zz_PmpPlugin_ports_0_hits_10_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_10_2 = (_zz_PmpPlugin_ports_0_hits_10_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_10_2 = (_zz_PmpPlugin_ports_0_hits_10_6 + _zz__zz_PmpPlugin_ports_0_hits_10_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_10_2 = _zz_PmpPlugin_ports_0_hits_10_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_23 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_22;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_23 = CsrPlugin_csrMapping_writeDataSignal[24];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_23 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_22;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_23 = CsrPlugin_csrMapping_writeDataSignal[25];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_23 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_22;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_23 = CsrPlugin_csrMapping_writeDataSignal[26];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_23 = _zz_when_PmpPlugin_l126_22;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_23 = CsrPlugin_csrMapping_writeDataSignal[31];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_46 = _zz_CsrPlugin_csrMapping_readDataInit_44;
    if(execute_CsrPlugin_csr_930) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_46 = CsrPlugin_csrMapping_writeDataSignal[28 : 27];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_47 = _zz_CsrPlugin_csrMapping_readDataInit_45;
    if(execute_CsrPlugin_csr_955) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_47 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_11 = (! _zz_when_PmpPlugin_l126_22);
  assign _zz_PmpPlugin_ports_0_hits_11_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_45};
  assign _zz_PmpPlugin_ports_0_hits_11_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_11_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_11_5 = (_zz_PmpPlugin_ports_0_hits_11_3 ^ _zz__zz_PmpPlugin_ports_0_hits_11_5);
  assign _zz_PmpPlugin_ports_0_hits_11_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_11_3 & (~ _zz_PmpPlugin_ports_0_hits_11_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_11 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_46)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_11 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_46)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_11_1 = _zz_PmpPlugin_ports_0_hits_10_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_11_1 = _zz_PmpPlugin_ports_0_hits_11_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_11_1 = _zz_PmpPlugin_ports_0_hits_11_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_11_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_46)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_11_2 = _zz_PmpPlugin_ports_0_hits_11_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_11_2 = (_zz_PmpPlugin_ports_0_hits_11_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_11_2 = (_zz_PmpPlugin_ports_0_hits_11_6 + _zz__zz_PmpPlugin_ports_0_hits_11_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_11_2 = _zz_PmpPlugin_ports_0_hits_11_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_25 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_24;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_25 = CsrPlugin_csrMapping_writeDataSignal[0];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_25 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_24;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_25 = CsrPlugin_csrMapping_writeDataSignal[1];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_25 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_24;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_25 = CsrPlugin_csrMapping_writeDataSignal[2];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_25 = _zz_when_PmpPlugin_l126_24;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_25 = CsrPlugin_csrMapping_writeDataSignal[7];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_50 = _zz_CsrPlugin_csrMapping_readDataInit_48;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_50 = CsrPlugin_csrMapping_writeDataSignal[4 : 3];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_51 = _zz_CsrPlugin_csrMapping_readDataInit_49;
    if(execute_CsrPlugin_csr_956) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_51 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_12 = (! _zz_when_PmpPlugin_l126_24);
  assign _zz_PmpPlugin_ports_0_hits_12_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_49};
  assign _zz_PmpPlugin_ports_0_hits_12_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_12_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_12_5 = (_zz_PmpPlugin_ports_0_hits_12_3 ^ _zz__zz_PmpPlugin_ports_0_hits_12_5);
  assign _zz_PmpPlugin_ports_0_hits_12_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_12_3 & (~ _zz_PmpPlugin_ports_0_hits_12_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_12 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_50)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_12 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_50)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_12_1 = _zz_PmpPlugin_ports_0_hits_11_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_12_1 = _zz_PmpPlugin_ports_0_hits_12_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_12_1 = _zz_PmpPlugin_ports_0_hits_12_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_12_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_50)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_12_2 = _zz_PmpPlugin_ports_0_hits_12_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_12_2 = (_zz_PmpPlugin_ports_0_hits_12_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_12_2 = (_zz_PmpPlugin_ports_0_hits_12_6 + _zz__zz_PmpPlugin_ports_0_hits_12_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_12_2 = _zz_PmpPlugin_ports_0_hits_12_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_27 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_26;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_27 = CsrPlugin_csrMapping_writeDataSignal[8];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_27 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_26;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_27 = CsrPlugin_csrMapping_writeDataSignal[9];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_27 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_26;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_27 = CsrPlugin_csrMapping_writeDataSignal[10];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_27 = _zz_when_PmpPlugin_l126_26;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_27 = CsrPlugin_csrMapping_writeDataSignal[15];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_54 = _zz_CsrPlugin_csrMapping_readDataInit_52;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_54 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_55 = _zz_CsrPlugin_csrMapping_readDataInit_53;
    if(execute_CsrPlugin_csr_957) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_55 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_13 = (! _zz_when_PmpPlugin_l126_26);
  assign _zz_PmpPlugin_ports_0_hits_13_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_53};
  assign _zz_PmpPlugin_ports_0_hits_13_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_13_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_13_5 = (_zz_PmpPlugin_ports_0_hits_13_3 ^ _zz__zz_PmpPlugin_ports_0_hits_13_5);
  assign _zz_PmpPlugin_ports_0_hits_13_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_13_3 & (~ _zz_PmpPlugin_ports_0_hits_13_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_13 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_54)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_13 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_54)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_13_1 = _zz_PmpPlugin_ports_0_hits_12_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_13_1 = _zz_PmpPlugin_ports_0_hits_13_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_13_1 = _zz_PmpPlugin_ports_0_hits_13_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_13_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_54)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_13_2 = _zz_PmpPlugin_ports_0_hits_13_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_13_2 = (_zz_PmpPlugin_ports_0_hits_13_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_13_2 = (_zz_PmpPlugin_ports_0_hits_13_6 + _zz__zz_PmpPlugin_ports_0_hits_13_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_13_2 = _zz_PmpPlugin_ports_0_hits_13_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_29 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_28;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_29 = CsrPlugin_csrMapping_writeDataSignal[16];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_29 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_28;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_29 = CsrPlugin_csrMapping_writeDataSignal[17];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_29 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_28;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_29 = CsrPlugin_csrMapping_writeDataSignal[18];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_29 = _zz_when_PmpPlugin_l126_28;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_29 = CsrPlugin_csrMapping_writeDataSignal[23];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_58 = _zz_CsrPlugin_csrMapping_readDataInit_56;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_58 = CsrPlugin_csrMapping_writeDataSignal[20 : 19];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_59 = _zz_CsrPlugin_csrMapping_readDataInit_57;
    if(execute_CsrPlugin_csr_958) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_59 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_14 = (! _zz_when_PmpPlugin_l126_28);
  assign _zz_PmpPlugin_ports_0_hits_14_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_57};
  assign _zz_PmpPlugin_ports_0_hits_14_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_14_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_14_5 = (_zz_PmpPlugin_ports_0_hits_14_3 ^ _zz__zz_PmpPlugin_ports_0_hits_14_5);
  assign _zz_PmpPlugin_ports_0_hits_14_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_14_3 & (~ _zz_PmpPlugin_ports_0_hits_14_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_14 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_58)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_14 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_58)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_14_1 = _zz_PmpPlugin_ports_0_hits_13_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_14_1 = _zz_PmpPlugin_ports_0_hits_14_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_14_1 = _zz_PmpPlugin_ports_0_hits_14_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_14_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_58)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_14_2 = _zz_PmpPlugin_ports_0_hits_14_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_14_2 = (_zz_PmpPlugin_ports_0_hits_14_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_14_2 = (_zz_PmpPlugin_ports_0_hits_14_6 + _zz__zz_PmpPlugin_ports_0_hits_14_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_14_2 = _zz_PmpPlugin_ports_0_hits_14_4;
      end
    endcase
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_31 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_30;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_31 = CsrPlugin_csrMapping_writeDataSignal[24];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_31 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_30;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_31 = CsrPlugin_csrMapping_writeDataSignal[25];
      end
    end
  end

  always @(*) begin
    _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_31 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_30;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_31 = CsrPlugin_csrMapping_writeDataSignal[26];
      end
    end
  end

  always @(*) begin
    _zz_when_PmpPlugin_l126_31 = _zz_when_PmpPlugin_l126_30;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_when_PmpPlugin_l126_31 = CsrPlugin_csrMapping_writeDataSignal[31];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_62 = _zz_CsrPlugin_csrMapping_readDataInit_60;
    if(execute_CsrPlugin_csr_931) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_62 = CsrPlugin_csrMapping_writeDataSignal[28 : 27];
      end
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_63 = _zz_CsrPlugin_csrMapping_readDataInit_61;
    if(execute_CsrPlugin_csr_959) begin
      if(execute_CsrPlugin_writeEnable) begin
        _zz_CsrPlugin_csrMapping_readDataInit_63 = CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  assign when_PmpPlugin_l126_15 = (! _zz_when_PmpPlugin_l126_30);
  assign _zz_PmpPlugin_ports_0_hits_15_3 = {2'b00,_zz_CsrPlugin_csrMapping_readDataInit_61};
  assign _zz_PmpPlugin_ports_0_hits_15_4 = ({2'd0,_zz_PmpPlugin_ports_0_hits_15_3} <<< 2'd2);
  assign _zz_PmpPlugin_ports_0_hits_15_5 = (_zz_PmpPlugin_ports_0_hits_15_3 ^ _zz__zz_PmpPlugin_ports_0_hits_15_5);
  assign _zz_PmpPlugin_ports_0_hits_15_6 = ({2'd0,(_zz_PmpPlugin_ports_0_hits_15_3 & (~ _zz_PmpPlugin_ports_0_hits_15_5))} <<< 2'd2);
  always @(*) begin
    _zz_PmpPlugin_ports_0_hits_15 = 1'b1;
    case(_zz_CsrPlugin_csrMapping_readDataInit_62)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_15 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_62)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_15_1 = _zz_PmpPlugin_ports_0_hits_14_2;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_15_1 = _zz_PmpPlugin_ports_0_hits_15_4;
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_15_1 = _zz_PmpPlugin_ports_0_hits_15_6;
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_15_1 = 36'h0;
      end
    endcase
  end

  always @(*) begin
    case(_zz_CsrPlugin_csrMapping_readDataInit_62)
      2'b01 : begin
        _zz_PmpPlugin_ports_0_hits_15_2 = _zz_PmpPlugin_ports_0_hits_15_4;
      end
      2'b10 : begin
        _zz_PmpPlugin_ports_0_hits_15_2 = (_zz_PmpPlugin_ports_0_hits_15_4 + 36'h000000004);
      end
      2'b11 : begin
        _zz_PmpPlugin_ports_0_hits_15_2 = (_zz_PmpPlugin_ports_0_hits_15_6 + _zz__zz_PmpPlugin_ports_0_hits_15_2);
      end
      default : begin
        _zz_PmpPlugin_ports_0_hits_15_2 = _zz_PmpPlugin_ports_0_hits_15_4;
      end
    endcase
  end

  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign PmpPlugin_ports_0_hits_0 = (((_zz_PmpPlugin_ports_0_hits_0 && (_zz_PmpPlugin_ports_0_hits_0_1 <= _zz_PmpPlugin_ports_0_hits_0_7)) && (_zz_PmpPlugin_ports_0_hits_0_8 < _zz_PmpPlugin_ports_0_hits_0_2)) && (_zz_when_PmpPlugin_l126 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_1 = (((_zz_PmpPlugin_ports_0_hits_1 && (_zz_PmpPlugin_ports_0_hits_1_1 <= _zz_PmpPlugin_ports_0_hits_1_7)) && (_zz_PmpPlugin_ports_0_hits_1_8 < _zz_PmpPlugin_ports_0_hits_1_2)) && (_zz_when_PmpPlugin_l126_2 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_2 = (((_zz_PmpPlugin_ports_0_hits_2 && (_zz_PmpPlugin_ports_0_hits_2_1 <= _zz_PmpPlugin_ports_0_hits_2_7)) && (_zz_PmpPlugin_ports_0_hits_2_8 < _zz_PmpPlugin_ports_0_hits_2_2)) && (_zz_when_PmpPlugin_l126_4 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_3 = (((_zz_PmpPlugin_ports_0_hits_3 && (_zz_PmpPlugin_ports_0_hits_3_1 <= _zz_PmpPlugin_ports_0_hits_3_7)) && (_zz_PmpPlugin_ports_0_hits_3_8 < _zz_PmpPlugin_ports_0_hits_3_2)) && (_zz_when_PmpPlugin_l126_6 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_4 = (((_zz_PmpPlugin_ports_0_hits_4 && (_zz_PmpPlugin_ports_0_hits_4_1 <= _zz_PmpPlugin_ports_0_hits_4_7)) && (_zz_PmpPlugin_ports_0_hits_4_8 < _zz_PmpPlugin_ports_0_hits_4_2)) && (_zz_when_PmpPlugin_l126_8 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_5 = (((_zz_PmpPlugin_ports_0_hits_5 && (_zz_PmpPlugin_ports_0_hits_5_1 <= _zz_PmpPlugin_ports_0_hits_5_7)) && (_zz_PmpPlugin_ports_0_hits_5_8 < _zz_PmpPlugin_ports_0_hits_5_2)) && (_zz_when_PmpPlugin_l126_10 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_6 = (((_zz_PmpPlugin_ports_0_hits_6 && (_zz_PmpPlugin_ports_0_hits_6_1 <= _zz_PmpPlugin_ports_0_hits_6_7)) && (_zz_PmpPlugin_ports_0_hits_6_8 < _zz_PmpPlugin_ports_0_hits_6_2)) && (_zz_when_PmpPlugin_l126_12 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_7 = (((_zz_PmpPlugin_ports_0_hits_7 && (_zz_PmpPlugin_ports_0_hits_7_1 <= _zz_PmpPlugin_ports_0_hits_7_7)) && (_zz_PmpPlugin_ports_0_hits_7_8 < _zz_PmpPlugin_ports_0_hits_7_2)) && (_zz_when_PmpPlugin_l126_14 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_8 = (((_zz_PmpPlugin_ports_0_hits_8 && (_zz_PmpPlugin_ports_0_hits_8_1 <= _zz_PmpPlugin_ports_0_hits_8_7)) && (_zz_PmpPlugin_ports_0_hits_8_8 < _zz_PmpPlugin_ports_0_hits_8_2)) && (_zz_when_PmpPlugin_l126_16 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_9 = (((_zz_PmpPlugin_ports_0_hits_9 && (_zz_PmpPlugin_ports_0_hits_9_1 <= _zz_PmpPlugin_ports_0_hits_9_7)) && (_zz_PmpPlugin_ports_0_hits_9_8 < _zz_PmpPlugin_ports_0_hits_9_2)) && (_zz_when_PmpPlugin_l126_18 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_10 = (((_zz_PmpPlugin_ports_0_hits_10 && (_zz_PmpPlugin_ports_0_hits_10_1 <= _zz_PmpPlugin_ports_0_hits_10_7)) && (_zz_PmpPlugin_ports_0_hits_10_8 < _zz_PmpPlugin_ports_0_hits_10_2)) && (_zz_when_PmpPlugin_l126_20 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_11 = (((_zz_PmpPlugin_ports_0_hits_11 && (_zz_PmpPlugin_ports_0_hits_11_1 <= _zz_PmpPlugin_ports_0_hits_11_7)) && (_zz_PmpPlugin_ports_0_hits_11_8 < _zz_PmpPlugin_ports_0_hits_11_2)) && (_zz_when_PmpPlugin_l126_22 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_12 = (((_zz_PmpPlugin_ports_0_hits_12 && (_zz_PmpPlugin_ports_0_hits_12_1 <= _zz_PmpPlugin_ports_0_hits_12_7)) && (_zz_PmpPlugin_ports_0_hits_12_8 < _zz_PmpPlugin_ports_0_hits_12_2)) && (_zz_when_PmpPlugin_l126_24 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_13 = (((_zz_PmpPlugin_ports_0_hits_13 && (_zz_PmpPlugin_ports_0_hits_13_1 <= _zz_PmpPlugin_ports_0_hits_13_7)) && (_zz_PmpPlugin_ports_0_hits_13_8 < _zz_PmpPlugin_ports_0_hits_13_2)) && (_zz_when_PmpPlugin_l126_26 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_14 = (((_zz_PmpPlugin_ports_0_hits_14 && (_zz_PmpPlugin_ports_0_hits_14_1 <= _zz_PmpPlugin_ports_0_hits_14_7)) && (_zz_PmpPlugin_ports_0_hits_14_8 < _zz_PmpPlugin_ports_0_hits_14_2)) && (_zz_when_PmpPlugin_l126_28 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_15 = (((_zz_PmpPlugin_ports_0_hits_15 && (_zz_PmpPlugin_ports_0_hits_15_1 <= _zz_PmpPlugin_ports_0_hits_15_7)) && (_zz_PmpPlugin_ports_0_hits_15_8 < _zz_PmpPlugin_ports_0_hits_15_2)) && (_zz_when_PmpPlugin_l126_30 || (! (CsrPlugin_privilege == 2'b11))));
  assign _zz_when_PmpPlugin_l250 = 5'h0;
  assign _zz_when_PmpPlugin_l250_1 = 5'h01;
  assign _zz_when_PmpPlugin_l250_2 = 5'h01;
  assign _zz_when_PmpPlugin_l250_3 = 5'h02;
  assign _zz_when_PmpPlugin_l250_4 = 5'h01;
  assign _zz_when_PmpPlugin_l250_5 = 5'h02;
  assign _zz_when_PmpPlugin_l250_6 = 5'h02;
  assign _zz_when_PmpPlugin_l250_7 = 5'h03;
  assign when_PmpPlugin_l250 = (_zz_when_PmpPlugin_l250_8 == 5'h0);
  always @(*) begin
    if(when_PmpPlugin_l250) begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = (CsrPlugin_privilege == 2'b11);
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_49;
    end
  end

  always @(*) begin
    if(when_PmpPlugin_l250) begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = (CsrPlugin_privilege == 2'b11);
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_49;
    end
  end

  always @(*) begin
    if(when_PmpPlugin_l250) begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = (CsrPlugin_privilege == 2'b11);
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_49;
    end
  end

  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_32 = {PmpPlugin_ports_0_hits_15,{PmpPlugin_ports_0_hits_14,{PmpPlugin_ports_0_hits_13,{PmpPlugin_ports_0_hits_12,{PmpPlugin_ports_0_hits_11,{PmpPlugin_ports_0_hits_10,{PmpPlugin_ports_0_hits_9,{PmpPlugin_ports_0_hits_8,{PmpPlugin_ports_0_hits_7,{PmpPlugin_ports_0_hits_6,{_zz__zz_IBusCachedPlugin_mmuBus_rsp_allowRead_32,_zz__zz_IBusCachedPlugin_mmuBus_rsp_allowRead_32_1}}}}}}}}}}};
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33 = (_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_32 & (~ _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33));
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_34 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[3];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_35 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[5];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_36 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[6];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_37 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[7];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_38 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[9];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_39 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[10];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_40 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[11];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_41 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[12];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_42 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[13];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_43 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[14];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_44 = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[15];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_45 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[1] || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_34) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_35) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_37) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_38) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_40) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_42) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_46 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[2] || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_34) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_36) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_37) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_39) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_40) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_43) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_47 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[4] || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_35) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_36) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_37) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_41) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_42) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_43) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_48 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowRead_33[8] || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_38) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_39) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_40) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_41) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_42) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_43) || _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_32 = {PmpPlugin_ports_0_hits_15,{PmpPlugin_ports_0_hits_14,{PmpPlugin_ports_0_hits_13,{PmpPlugin_ports_0_hits_12,{PmpPlugin_ports_0_hits_11,{PmpPlugin_ports_0_hits_10,{PmpPlugin_ports_0_hits_9,{PmpPlugin_ports_0_hits_8,{PmpPlugin_ports_0_hits_7,{PmpPlugin_ports_0_hits_6,{_zz__zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_32,_zz__zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_32_1}}}}}}}}}}};
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33 = (_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_32 & (~ _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33));
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_34 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[3];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_35 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[5];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_36 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[6];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_37 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[7];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_38 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[9];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_39 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[10];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_40 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[11];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_41 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[12];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_42 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[13];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_43 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[14];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_44 = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[15];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_45 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[1] || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_34) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_35) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_37) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_38) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_40) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_42) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_46 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[2] || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_34) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_36) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_37) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_39) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_40) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_43) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_47 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[4] || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_35) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_36) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_37) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_41) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_42) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_43) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_48 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_33[8] || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_38) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_39) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_40) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_41) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_42) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_43) || _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_32 = {PmpPlugin_ports_0_hits_15,{PmpPlugin_ports_0_hits_14,{PmpPlugin_ports_0_hits_13,{PmpPlugin_ports_0_hits_12,{PmpPlugin_ports_0_hits_11,{PmpPlugin_ports_0_hits_10,{PmpPlugin_ports_0_hits_9,{PmpPlugin_ports_0_hits_8,{PmpPlugin_ports_0_hits_7,{PmpPlugin_ports_0_hits_6,{_zz__zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_32,_zz__zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_32_1}}}}}}}}}}};
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33 = (_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_32 & (~ _zz__zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33));
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_34 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[3];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_35 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[5];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_36 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[6];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_37 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[7];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_38 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[9];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_39 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[10];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_40 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[11];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_41 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[12];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_42 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[13];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_43 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[14];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_44 = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[15];
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_45 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[1] || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_34) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_35) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_37) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_38) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_40) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_42) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_46 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[2] || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_34) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_36) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_37) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_39) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_40) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_43) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_47 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[4] || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_35) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_36) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_37) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_41) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_42) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_43) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_44);
  assign _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_48 = (((((((_zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_33[8] || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_38) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_39) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_40) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_41) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_42) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_43) || _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_44);
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111);
  assign IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = ((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack));
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_9 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_SRC1_CTRL_1 = decode_SRC1_CTRL;
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC1_CTRL = decode_to_execute_SRC1_CTRL;
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_12 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_14 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_15 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL_1 = decode_SRC2_CTRL;
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_16 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC2_CTRL = decode_to_execute_SRC2_CTRL;
  assign when_Pipeline_l124_17 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_24 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_25 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_26 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_27 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_28 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_29 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_30 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_32 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_33 = (! memory_arbitration_isStuck);
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL;
  assign when_Pipeline_l124_34 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_35 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_36 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_37 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_38 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign when_Pipeline_l124_39 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_40 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_41 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_42 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_43 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_44 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_45 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_46 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_47 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_48 = ((! memory_arbitration_isStuck) && (! execute_arbitration_isStuckByOthers));
  assign when_Pipeline_l124_49 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}}));
  assign execute_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,memory_arbitration_flushNext}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}}));
  assign memory_arbitration_isFlushed = ((|writeBack_arbitration_flushNext) || (|{writeBack_arbitration_flushIt,memory_arbitration_flushIt}));
  assign writeBack_arbitration_isFlushed = (1'b0 || (|writeBack_arbitration_flushIt));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign when_CsrPlugin_l1669 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_4 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_5 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_6 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_7 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_8 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_9 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_10 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_11 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_12 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_13 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_14 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_15 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_16 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_17 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_18 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_19 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_20 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_21 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_22 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_23 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_24 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_25 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_26 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_27 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_28 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_29 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_30 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_31 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_32 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_33 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_34 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_35 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_36 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_37 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_38 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_39 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_40 = (! execute_arbitration_isStuck);
  assign switch_CsrPlugin_l1031 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_64 = 32'h0;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit_64[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit_64[3 : 3] = CsrPlugin_mstatus_MIE;
      _zz_CsrPlugin_csrMapping_readDataInit_64[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_CsrPlugin_csrMapping_readDataInit_64[8 : 8] = CsrPlugin_sstatus_SPP;
      _zz_CsrPlugin_csrMapping_readDataInit_64[5 : 5] = CsrPlugin_sstatus_SPIE;
      _zz_CsrPlugin_csrMapping_readDataInit_64[1 : 1] = CsrPlugin_sstatus_SIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_65 = 32'h0;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_65[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_65[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_65[3 : 3] = CsrPlugin_mip_MSIP;
      _zz_CsrPlugin_csrMapping_readDataInit_65[5 : 5] = CsrPlugin_sip_STIP;
      _zz_CsrPlugin_csrMapping_readDataInit_65[1 : 1] = CsrPlugin_sip_SSIP;
      _zz_CsrPlugin_csrMapping_readDataInit_65[9 : 9] = CsrPlugin_sip_SEIP_OR;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_66 = 32'h0;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_66[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_66[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_66[3 : 3] = CsrPlugin_mie_MSIE;
      _zz_CsrPlugin_csrMapping_readDataInit_66[9 : 9] = CsrPlugin_sie_SEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_66[5 : 5] = CsrPlugin_sie_STIE;
      _zz_CsrPlugin_csrMapping_readDataInit_66[1 : 1] = CsrPlugin_sie_SSIE;
    end
  end

  assign when_CsrPlugin_l964 = (|{(CsrPlugin_csrMapping_writeDataSignal[1 : 0] == 2'b01),(CsrPlugin_csrMapping_writeDataSignal[1 : 0] == 2'b00)});
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_67 = 32'h0;
    if(execute_CsrPlugin_csr_773) begin
      _zz_CsrPlugin_csrMapping_readDataInit_67[31 : 2] = CsrPlugin_mtvec_base;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_68 = 32'h0;
    if(execute_CsrPlugin_csr_833) begin
      _zz_CsrPlugin_csrMapping_readDataInit_68[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_69 = 32'h0;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_69[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_69[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_70 = 32'h0;
    if(execute_CsrPlugin_csr_835) begin
      _zz_CsrPlugin_csrMapping_readDataInit_70[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_71 = 32'h0;
    if(execute_CsrPlugin_csr_2816) begin
      _zz_CsrPlugin_csrMapping_readDataInit_71[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_72 = 32'h0;
    if(execute_CsrPlugin_csr_2944) begin
      _zz_CsrPlugin_csrMapping_readDataInit_72[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  assign when_CsrPlugin_l1076 = ((CsrPlugin_privilege < 2'b11) && (! CsrPlugin_mcounteren_CY));
  assign when_CsrPlugin_l1077 = ((CsrPlugin_privilege < 2'b01) && (! CsrPlugin_scounteren_CY));
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_73 = 32'h0;
    if(execute_CsrPlugin_csr_3072) begin
      _zz_CsrPlugin_csrMapping_readDataInit_73[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  assign when_CsrPlugin_l1076_1 = ((CsrPlugin_privilege < 2'b11) && (! CsrPlugin_mcounteren_CY));
  assign when_CsrPlugin_l1077_1 = ((CsrPlugin_privilege < 2'b01) && (! CsrPlugin_scounteren_CY));
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_74 = 32'h0;
    if(execute_CsrPlugin_csr_3200) begin
      _zz_CsrPlugin_csrMapping_readDataInit_74[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_75 = 32'h0;
    if(execute_CsrPlugin_csr_774) begin
      _zz_CsrPlugin_csrMapping_readDataInit_75[0 : 0] = CsrPlugin_mcounteren_CY;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_76 = 32'h0;
    if(execute_CsrPlugin_csr_262) begin
      _zz_CsrPlugin_csrMapping_readDataInit_76[0 : 0] = CsrPlugin_scounteren_CY;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_77 = 32'h0;
    if(execute_CsrPlugin_csr_256) begin
      _zz_CsrPlugin_csrMapping_readDataInit_77[8 : 8] = CsrPlugin_sstatus_SPP;
      _zz_CsrPlugin_csrMapping_readDataInit_77[5 : 5] = CsrPlugin_sstatus_SPIE;
      _zz_CsrPlugin_csrMapping_readDataInit_77[1 : 1] = CsrPlugin_sstatus_SIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_78 = 32'h0;
    if(execute_CsrPlugin_csr_324) begin
      _zz_CsrPlugin_csrMapping_readDataInit_78[5 : 5] = CsrPlugin_sip_STIP;
      _zz_CsrPlugin_csrMapping_readDataInit_78[1 : 1] = CsrPlugin_sip_SSIP;
      _zz_CsrPlugin_csrMapping_readDataInit_78[9 : 9] = CsrPlugin_sip_SEIP_OR;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_79 = 32'h0;
    if(execute_CsrPlugin_csr_260) begin
      _zz_CsrPlugin_csrMapping_readDataInit_79[9 : 9] = CsrPlugin_sie_SEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_79[5 : 5] = CsrPlugin_sie_STIE;
      _zz_CsrPlugin_csrMapping_readDataInit_79[1 : 1] = CsrPlugin_sie_SSIE;
    end
  end

  assign when_CsrPlugin_l964_1 = (|{(CsrPlugin_csrMapping_writeDataSignal[1 : 0] == 2'b01),(CsrPlugin_csrMapping_writeDataSignal[1 : 0] == 2'b00)});
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_80 = 32'h0;
    if(execute_CsrPlugin_csr_261) begin
      _zz_CsrPlugin_csrMapping_readDataInit_80[31 : 2] = CsrPlugin_stvec_base;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_81 = 32'h0;
    if(execute_CsrPlugin_csr_321) begin
      _zz_CsrPlugin_csrMapping_readDataInit_81[31 : 0] = CsrPlugin_sepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_82 = 32'h0;
    if(execute_CsrPlugin_csr_322) begin
      _zz_CsrPlugin_csrMapping_readDataInit_82[31 : 31] = CsrPlugin_scause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_82[3 : 0] = CsrPlugin_scause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_83 = 32'h0;
    if(execute_CsrPlugin_csr_323) begin
      _zz_CsrPlugin_csrMapping_readDataInit_83[31 : 0] = CsrPlugin_stval;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_84 = 32'h0;
    if(execute_CsrPlugin_csr_384) begin
      _zz_CsrPlugin_csrMapping_readDataInit_84[31 : 31] = CsrPlugin_satp_MODE;
      _zz_CsrPlugin_csrMapping_readDataInit_84[30 : 22] = CsrPlugin_satp_ASID;
      _zz_CsrPlugin_csrMapping_readDataInit_84[21 : 0] = CsrPlugin_satp_PPN;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_85 = 32'h0;
    if(execute_CsrPlugin_csr_944) begin
      _zz_CsrPlugin_csrMapping_readDataInit_85[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_1;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_86 = 32'h0;
    if(execute_CsrPlugin_csr_945) begin
      _zz_CsrPlugin_csrMapping_readDataInit_86[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_5;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_87 = 32'h0;
    if(execute_CsrPlugin_csr_946) begin
      _zz_CsrPlugin_csrMapping_readDataInit_87[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_9;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_88 = 32'h0;
    if(execute_CsrPlugin_csr_947) begin
      _zz_CsrPlugin_csrMapping_readDataInit_88[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_13;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_89 = 32'h0;
    if(execute_CsrPlugin_csr_948) begin
      _zz_CsrPlugin_csrMapping_readDataInit_89[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_17;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_90 = 32'h0;
    if(execute_CsrPlugin_csr_949) begin
      _zz_CsrPlugin_csrMapping_readDataInit_90[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_21;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_91 = 32'h0;
    if(execute_CsrPlugin_csr_950) begin
      _zz_CsrPlugin_csrMapping_readDataInit_91[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_25;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_92 = 32'h0;
    if(execute_CsrPlugin_csr_951) begin
      _zz_CsrPlugin_csrMapping_readDataInit_92[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_29;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_93 = 32'h0;
    if(execute_CsrPlugin_csr_952) begin
      _zz_CsrPlugin_csrMapping_readDataInit_93[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_33;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_94 = 32'h0;
    if(execute_CsrPlugin_csr_953) begin
      _zz_CsrPlugin_csrMapping_readDataInit_94[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_37;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_95 = 32'h0;
    if(execute_CsrPlugin_csr_954) begin
      _zz_CsrPlugin_csrMapping_readDataInit_95[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_41;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_96 = 32'h0;
    if(execute_CsrPlugin_csr_955) begin
      _zz_CsrPlugin_csrMapping_readDataInit_96[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_45;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_97 = 32'h0;
    if(execute_CsrPlugin_csr_956) begin
      _zz_CsrPlugin_csrMapping_readDataInit_97[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_49;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_98 = 32'h0;
    if(execute_CsrPlugin_csr_957) begin
      _zz_CsrPlugin_csrMapping_readDataInit_98[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_53;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_99 = 32'h0;
    if(execute_CsrPlugin_csr_958) begin
      _zz_CsrPlugin_csrMapping_readDataInit_99[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_57;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_100 = 32'h0;
    if(execute_CsrPlugin_csr_959) begin
      _zz_CsrPlugin_csrMapping_readDataInit_100[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_61;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_101 = 32'h0;
    if(execute_CsrPlugin_csr_928) begin
      _zz_CsrPlugin_csrMapping_readDataInit_101[31 : 31] = _zz_when_PmpPlugin_l126_6;
      _zz_CsrPlugin_csrMapping_readDataInit_101[23 : 23] = _zz_when_PmpPlugin_l126_4;
      _zz_CsrPlugin_csrMapping_readDataInit_101[15 : 15] = _zz_when_PmpPlugin_l126_2;
      _zz_CsrPlugin_csrMapping_readDataInit_101[7 : 7] = _zz_when_PmpPlugin_l126;
      _zz_CsrPlugin_csrMapping_readDataInit_101[28 : 27] = _zz_CsrPlugin_csrMapping_readDataInit_12;
      _zz_CsrPlugin_csrMapping_readDataInit_101[26 : 26] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_6;
      _zz_CsrPlugin_csrMapping_readDataInit_101[25 : 25] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_6;
      _zz_CsrPlugin_csrMapping_readDataInit_101[24 : 24] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_6;
      _zz_CsrPlugin_csrMapping_readDataInit_101[20 : 19] = _zz_CsrPlugin_csrMapping_readDataInit_8;
      _zz_CsrPlugin_csrMapping_readDataInit_101[18 : 18] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_4;
      _zz_CsrPlugin_csrMapping_readDataInit_101[17 : 17] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_4;
      _zz_CsrPlugin_csrMapping_readDataInit_101[16 : 16] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_4;
      _zz_CsrPlugin_csrMapping_readDataInit_101[12 : 11] = _zz_CsrPlugin_csrMapping_readDataInit_4;
      _zz_CsrPlugin_csrMapping_readDataInit_101[10 : 10] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_2;
      _zz_CsrPlugin_csrMapping_readDataInit_101[9 : 9] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_2;
      _zz_CsrPlugin_csrMapping_readDataInit_101[8 : 8] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_2;
      _zz_CsrPlugin_csrMapping_readDataInit_101[4 : 3] = _zz_CsrPlugin_csrMapping_readDataInit;
      _zz_CsrPlugin_csrMapping_readDataInit_101[2 : 2] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute;
      _zz_CsrPlugin_csrMapping_readDataInit_101[1 : 1] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite;
      _zz_CsrPlugin_csrMapping_readDataInit_101[0 : 0] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_102 = 32'h0;
    if(execute_CsrPlugin_csr_929) begin
      _zz_CsrPlugin_csrMapping_readDataInit_102[31 : 31] = _zz_when_PmpPlugin_l126_14;
      _zz_CsrPlugin_csrMapping_readDataInit_102[23 : 23] = _zz_when_PmpPlugin_l126_12;
      _zz_CsrPlugin_csrMapping_readDataInit_102[15 : 15] = _zz_when_PmpPlugin_l126_10;
      _zz_CsrPlugin_csrMapping_readDataInit_102[7 : 7] = _zz_when_PmpPlugin_l126_8;
      _zz_CsrPlugin_csrMapping_readDataInit_102[28 : 27] = _zz_CsrPlugin_csrMapping_readDataInit_28;
      _zz_CsrPlugin_csrMapping_readDataInit_102[26 : 26] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_14;
      _zz_CsrPlugin_csrMapping_readDataInit_102[25 : 25] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_14;
      _zz_CsrPlugin_csrMapping_readDataInit_102[24 : 24] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_14;
      _zz_CsrPlugin_csrMapping_readDataInit_102[20 : 19] = _zz_CsrPlugin_csrMapping_readDataInit_24;
      _zz_CsrPlugin_csrMapping_readDataInit_102[18 : 18] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_12;
      _zz_CsrPlugin_csrMapping_readDataInit_102[17 : 17] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_12;
      _zz_CsrPlugin_csrMapping_readDataInit_102[16 : 16] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_12;
      _zz_CsrPlugin_csrMapping_readDataInit_102[12 : 11] = _zz_CsrPlugin_csrMapping_readDataInit_20;
      _zz_CsrPlugin_csrMapping_readDataInit_102[10 : 10] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_10;
      _zz_CsrPlugin_csrMapping_readDataInit_102[9 : 9] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_10;
      _zz_CsrPlugin_csrMapping_readDataInit_102[8 : 8] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_10;
      _zz_CsrPlugin_csrMapping_readDataInit_102[4 : 3] = _zz_CsrPlugin_csrMapping_readDataInit_16;
      _zz_CsrPlugin_csrMapping_readDataInit_102[2 : 2] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_8;
      _zz_CsrPlugin_csrMapping_readDataInit_102[1 : 1] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_8;
      _zz_CsrPlugin_csrMapping_readDataInit_102[0 : 0] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_8;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_103 = 32'h0;
    if(execute_CsrPlugin_csr_930) begin
      _zz_CsrPlugin_csrMapping_readDataInit_103[31 : 31] = _zz_when_PmpPlugin_l126_22;
      _zz_CsrPlugin_csrMapping_readDataInit_103[23 : 23] = _zz_when_PmpPlugin_l126_20;
      _zz_CsrPlugin_csrMapping_readDataInit_103[15 : 15] = _zz_when_PmpPlugin_l126_18;
      _zz_CsrPlugin_csrMapping_readDataInit_103[7 : 7] = _zz_when_PmpPlugin_l126_16;
      _zz_CsrPlugin_csrMapping_readDataInit_103[28 : 27] = _zz_CsrPlugin_csrMapping_readDataInit_44;
      _zz_CsrPlugin_csrMapping_readDataInit_103[26 : 26] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_22;
      _zz_CsrPlugin_csrMapping_readDataInit_103[25 : 25] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_22;
      _zz_CsrPlugin_csrMapping_readDataInit_103[24 : 24] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_22;
      _zz_CsrPlugin_csrMapping_readDataInit_103[20 : 19] = _zz_CsrPlugin_csrMapping_readDataInit_40;
      _zz_CsrPlugin_csrMapping_readDataInit_103[18 : 18] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_20;
      _zz_CsrPlugin_csrMapping_readDataInit_103[17 : 17] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_20;
      _zz_CsrPlugin_csrMapping_readDataInit_103[16 : 16] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_20;
      _zz_CsrPlugin_csrMapping_readDataInit_103[12 : 11] = _zz_CsrPlugin_csrMapping_readDataInit_36;
      _zz_CsrPlugin_csrMapping_readDataInit_103[10 : 10] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_18;
      _zz_CsrPlugin_csrMapping_readDataInit_103[9 : 9] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_18;
      _zz_CsrPlugin_csrMapping_readDataInit_103[8 : 8] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_18;
      _zz_CsrPlugin_csrMapping_readDataInit_103[4 : 3] = _zz_CsrPlugin_csrMapping_readDataInit_32;
      _zz_CsrPlugin_csrMapping_readDataInit_103[2 : 2] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_16;
      _zz_CsrPlugin_csrMapping_readDataInit_103[1 : 1] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_16;
      _zz_CsrPlugin_csrMapping_readDataInit_103[0 : 0] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_16;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_104 = 32'h0;
    if(execute_CsrPlugin_csr_931) begin
      _zz_CsrPlugin_csrMapping_readDataInit_104[31 : 31] = _zz_when_PmpPlugin_l126_30;
      _zz_CsrPlugin_csrMapping_readDataInit_104[23 : 23] = _zz_when_PmpPlugin_l126_28;
      _zz_CsrPlugin_csrMapping_readDataInit_104[15 : 15] = _zz_when_PmpPlugin_l126_26;
      _zz_CsrPlugin_csrMapping_readDataInit_104[7 : 7] = _zz_when_PmpPlugin_l126_24;
      _zz_CsrPlugin_csrMapping_readDataInit_104[28 : 27] = _zz_CsrPlugin_csrMapping_readDataInit_60;
      _zz_CsrPlugin_csrMapping_readDataInit_104[26 : 26] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_30;
      _zz_CsrPlugin_csrMapping_readDataInit_104[25 : 25] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_30;
      _zz_CsrPlugin_csrMapping_readDataInit_104[24 : 24] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_30;
      _zz_CsrPlugin_csrMapping_readDataInit_104[20 : 19] = _zz_CsrPlugin_csrMapping_readDataInit_56;
      _zz_CsrPlugin_csrMapping_readDataInit_104[18 : 18] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_28;
      _zz_CsrPlugin_csrMapping_readDataInit_104[17 : 17] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_28;
      _zz_CsrPlugin_csrMapping_readDataInit_104[16 : 16] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_28;
      _zz_CsrPlugin_csrMapping_readDataInit_104[12 : 11] = _zz_CsrPlugin_csrMapping_readDataInit_52;
      _zz_CsrPlugin_csrMapping_readDataInit_104[10 : 10] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_26;
      _zz_CsrPlugin_csrMapping_readDataInit_104[9 : 9] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_26;
      _zz_CsrPlugin_csrMapping_readDataInit_104[8 : 8] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_26;
      _zz_CsrPlugin_csrMapping_readDataInit_104[4 : 3] = _zz_CsrPlugin_csrMapping_readDataInit_48;
      _zz_CsrPlugin_csrMapping_readDataInit_104[2 : 2] = _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_24;
      _zz_CsrPlugin_csrMapping_readDataInit_104[1 : 1] = _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_24;
      _zz_CsrPlugin_csrMapping_readDataInit_104[0 : 0] = _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_24;
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = (((((_zz_CsrPlugin_csrMapping_readDataInit_105 | _zz_CsrPlugin_csrMapping_readDataInit_106) | (_zz_CsrPlugin_csrMapping_readDataInit_107 | _zz_CsrPlugin_csrMapping_readDataInit_108)) | ((_zz_CsrPlugin_csrMapping_readDataInit_109 | _zz_CsrPlugin_csrMapping_readDataInit_110) | (_zz_CsrPlugin_csrMapping_readDataInit_111 | _zz_CsrPlugin_csrMapping_readDataInit_112))) | (((_zz_CsrPlugin_csrMapping_readDataInit_113 | _zz_CsrPlugin_csrMapping_readDataInit_114) | (_zz_CsrPlugin_csrMapping_readDataInit_115 | _zz_CsrPlugin_csrMapping_readDataInit_116)) | ((_zz_CsrPlugin_csrMapping_readDataInit_117 | _zz_CsrPlugin_csrMapping_readDataInit_118) | (_zz_CsrPlugin_csrMapping_readDataInit_119 | _zz_CsrPlugin_csrMapping_readDataInit_120)))) | ((((_zz_CsrPlugin_csrMapping_readDataInit_96 | _zz_CsrPlugin_csrMapping_readDataInit_97) | (_zz_CsrPlugin_csrMapping_readDataInit_98 | _zz_CsrPlugin_csrMapping_readDataInit_99)) | ((_zz_CsrPlugin_csrMapping_readDataInit_100 | _zz_CsrPlugin_csrMapping_readDataInit_101) | (_zz_CsrPlugin_csrMapping_readDataInit_102 | _zz_CsrPlugin_csrMapping_readDataInit_103))) | _zz_CsrPlugin_csrMapping_readDataInit_104));
  assign _zz_when_CsrPlugin_l1709 = (execute_CsrPlugin_csrAddress & 12'hf60);
  assign when_CsrPlugin_l1709 = (((execute_arbitration_isValid && execute_IS_CSR) && (5'h03 <= execute_CsrPlugin_csrAddress[4 : 0])) && (((_zz_when_CsrPlugin_l1709 == 12'hb00) || (((_zz_when_CsrPlugin_l1709 == 12'hc00) && (! execute_CsrPlugin_writeInstruction)) && (CsrPlugin_privilege == 2'b11))) || ((execute_CsrPlugin_csrAddress & 12'hfe0) == 12'h320)));
  always @(*) begin
    when_CsrPlugin_l1719 = CsrPlugin_csrMapping_doForceFailCsr;
    if(when_CsrPlugin_l1717) begin
      when_CsrPlugin_l1719 = 1'b1;
    end
  end

  assign when_CsrPlugin_l1717 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1725 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  assign iBusWishbone_ADR = {_zz_iBusWishbone_ADR_1,_zz_iBusWishbone_ADR};
  assign iBusWishbone_CTI = ((_zz_iBusWishbone_ADR == 3'b111) ? 3'b111 : 3'b010);
  assign iBusWishbone_BTE = 2'b00;
  assign iBusWishbone_SEL = 4'b1111;
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  always @(*) begin
    iBusWishbone_CYC = 1'b0;
    if(when_InstructionCache_l240) begin
      iBusWishbone_CYC = 1'b1;
    end
  end

  always @(*) begin
    iBusWishbone_STB = 1'b0;
    if(when_InstructionCache_l240) begin
      iBusWishbone_STB = 1'b1;
    end
  end

  assign when_InstructionCache_l240 = (iBus_cmd_valid || (_zz_iBusWishbone_ADR != 3'b000));
  assign when_InstructionCache_l243 = (iBusWishbone_ACK || iBusWishbone_ERR);
  assign iBus_cmd_ready = (iBus_cmd_valid && (iBusWishbone_ACK || iBusWishbone_ERR));
  assign iBus_rsp_valid = _zz_iBus_rsp_valid;
  assign iBus_rsp_payload_data = iBusWishbone_DAT_MISO_regNext;
  assign iBus_rsp_payload_error = iBusWishbone_ERR_regNext;
  assign dBus_cmd_halfPipe_fire = (dBus_cmd_halfPipe_valid && dBus_cmd_halfPipe_ready);
  assign dBus_cmd_ready = (! dBus_cmd_rValid);
  assign dBus_cmd_halfPipe_valid = dBus_cmd_rValid;
  assign dBus_cmd_halfPipe_payload_wr = dBus_cmd_rData_wr;
  assign dBus_cmd_halfPipe_payload_mask = dBus_cmd_rData_mask;
  assign dBus_cmd_halfPipe_payload_address = dBus_cmd_rData_address;
  assign dBus_cmd_halfPipe_payload_data = dBus_cmd_rData_data;
  assign dBus_cmd_halfPipe_payload_size = dBus_cmd_rData_size;
  assign dBusWishbone_ADR = (dBus_cmd_halfPipe_payload_address >>> 2'd2);
  assign dBusWishbone_CTI = 3'b000;
  assign dBusWishbone_BTE = 2'b00;
  always @(*) begin
    case(dBus_cmd_halfPipe_payload_size)
      2'b00 : begin
        _zz_dBusWishbone_SEL = 4'b0001;
      end
      2'b01 : begin
        _zz_dBusWishbone_SEL = 4'b0011;
      end
      default : begin
        _zz_dBusWishbone_SEL = 4'b1111;
      end
    endcase
  end

  assign dBusWishbone_SEL = (_zz_dBusWishbone_SEL <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
  assign dBusWishbone_WE = dBus_cmd_halfPipe_payload_wr;
  assign dBusWishbone_DAT_MOSI = dBus_cmd_halfPipe_payload_data;
  assign dBus_cmd_halfPipe_ready = (dBus_cmd_halfPipe_valid && (dBusWishbone_ACK || dBusWishbone_ERR));
  assign dBusWishbone_CYC = dBus_cmd_halfPipe_valid;
  assign dBusWishbone_STB = dBus_cmd_halfPipe_valid;
  assign dBus_rsp_ready = ((dBus_cmd_halfPipe_valid && (! dBusWishbone_WE)) && (dBusWishbone_ACK || dBusWishbone_ERR));
  assign dBus_rsp_data = dBusWishbone_DAT_MISO;
  assign dBus_rsp_error = dBusWishbone_ERR;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_rspCounter <= 32'h0;
      _zz_10 <= 1'b1;
      execute_LightShifterPlugin_isActive <= 1'b0;
      memory_MulDivIterativePlugin_mul_counter_value <= 6'h0;
      memory_MulDivIterativePlugin_div_counter_value <= 6'h0;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      _zz_CsrPlugin_privilege <= 2'b11;
      CsrPlugin_mtvec_mode <= 2'b00;
      CsrPlugin_mtvec_base <= 30'h20000000;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_mcycle <= 64'h0;
      CsrPlugin_minstret <= 64'h0;
      CsrPlugin_mcounteren_CY <= 1'b1;
      CsrPlugin_scounteren_CY <= 1'b1;
      CsrPlugin_sstatus_SIE <= 1'b0;
      CsrPlugin_sstatus_SPIE <= 1'b0;
      CsrPlugin_sstatus_SPP <= 1'b1;
      CsrPlugin_sip_SEIP_SOFT <= 1'b0;
      CsrPlugin_sip_STIP <= 1'b0;
      CsrPlugin_sip_SSIP <= 1'b0;
      CsrPlugin_sie_SEIE <= 1'b0;
      CsrPlugin_sie_STIE <= 1'b0;
      CsrPlugin_sie_SSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      _zz_when_PmpPlugin_l126 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit <= 2'b00;
      _zz_when_PmpPlugin_l126_2 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_4 <= 2'b00;
      _zz_when_PmpPlugin_l126_4 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_8 <= 2'b00;
      _zz_when_PmpPlugin_l126_6 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_12 <= 2'b00;
      _zz_when_PmpPlugin_l126_8 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_16 <= 2'b00;
      _zz_when_PmpPlugin_l126_10 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_20 <= 2'b00;
      _zz_when_PmpPlugin_l126_12 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_24 <= 2'b00;
      _zz_when_PmpPlugin_l126_14 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_28 <= 2'b00;
      _zz_when_PmpPlugin_l126_16 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_32 <= 2'b00;
      _zz_when_PmpPlugin_l126_18 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_36 <= 2'b00;
      _zz_when_PmpPlugin_l126_20 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_40 <= 2'b00;
      _zz_when_PmpPlugin_l126_22 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_44 <= 2'b00;
      _zz_when_PmpPlugin_l126_24 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_48 <= 2'b00;
      _zz_when_PmpPlugin_l126_26 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_52 <= 2'b00;
      _zz_when_PmpPlugin_l126_28 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_56 <= 2'b00;
      _zz_when_PmpPlugin_l126_30 <= 1'b0;
      _zz_CsrPlugin_csrMapping_readDataInit_60 <= 2'b00;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_iBusWishbone_ADR <= 3'b000;
      _zz_iBus_rsp_valid <= 1'b0;
      dBus_cmd_rValid <= 1'b0;
    end else begin
      if(IBusCachedPlugin_fetchPc_correction) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_output_fire) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l133) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_output_fire) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l133_1) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l160) begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid <= (IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l331) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l331_1) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l331_2) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(when_Fetcher_l331_3) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(when_Fetcher_l331_4) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(iBus_rsp_valid) begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      _zz_10 <= 1'b0;
      if(when_ShiftPlugins_l169) begin
        if(when_ShiftPlugins_l175) begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done) begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt) begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      memory_MulDivIterativePlugin_mul_counter_value <= memory_MulDivIterativePlugin_mul_counter_valueNext;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
      if(writeBack_arbitration_isFiring) begin
        CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
      end
      if(when_CsrPlugin_l1259) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if(when_CsrPlugin_l1259_1) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if(when_CsrPlugin_l1259_2) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if(when_CsrPlugin_l1259_3) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l1296) begin
        if(when_CsrPlugin_l1302) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(when_CsrPlugin_l1296_1) begin
        if(when_CsrPlugin_l1302_3) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_4) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_5) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_6) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_7) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_8) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l1335) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l1335_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l1335_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l1340) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1390) begin
        if(when_CsrPlugin_l1398) begin
          _zz_CsrPlugin_privilege <= CsrPlugin_targetPrivilege;
          case(CsrPlugin_targetPrivilege)
            2'b01 : begin
              CsrPlugin_sstatus_SIE <= 1'b0;
              CsrPlugin_sstatus_SPIE <= CsrPlugin_sstatus_SIE;
              CsrPlugin_sstatus_SPP <= CsrPlugin_privilege[0 : 0];
            end
            2'b11 : begin
              CsrPlugin_mstatus_MIE <= 1'b0;
              CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
              CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
            end
            default : begin
            end
          endcase
        end
      end
      if(when_CsrPlugin_l1456) begin
        case(switch_CsrPlugin_l1460)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
            _zz_CsrPlugin_privilege <= CsrPlugin_mstatus_MPP;
          end
          2'b01 : begin
            CsrPlugin_sstatus_SPP <= 1'b0;
            CsrPlugin_sstatus_SIE <= CsrPlugin_sstatus_SPIE;
            CsrPlugin_sstatus_SPIE <= 1'b1;
            _zz_CsrPlugin_privilege <= {1'b0,CsrPlugin_sstatus_SPP};
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= ((|{_zz_when_CsrPlugin_l1302_5,{_zz_when_CsrPlugin_l1302_4,{_zz_when_CsrPlugin_l1302_3,{_zz_when_CsrPlugin_l1302_2,{_zz_when_CsrPlugin_l1302_1,_zz_when_CsrPlugin_l1302}}}}}) || CsrPlugin_thirdPartyWake);
      if(when_PmpPlugin_l126) begin
        _zz_when_PmpPlugin_l126 <= _zz_when_PmpPlugin_l126_1;
        _zz_CsrPlugin_csrMapping_readDataInit <= _zz_CsrPlugin_csrMapping_readDataInit_2;
      end
      if(when_PmpPlugin_l126_1) begin
        _zz_when_PmpPlugin_l126_2 <= _zz_when_PmpPlugin_l126_3;
        _zz_CsrPlugin_csrMapping_readDataInit_4 <= _zz_CsrPlugin_csrMapping_readDataInit_6;
      end
      if(when_PmpPlugin_l126_2) begin
        _zz_when_PmpPlugin_l126_4 <= _zz_when_PmpPlugin_l126_5;
        _zz_CsrPlugin_csrMapping_readDataInit_8 <= _zz_CsrPlugin_csrMapping_readDataInit_10;
      end
      if(when_PmpPlugin_l126_3) begin
        _zz_when_PmpPlugin_l126_6 <= _zz_when_PmpPlugin_l126_7;
        _zz_CsrPlugin_csrMapping_readDataInit_12 <= _zz_CsrPlugin_csrMapping_readDataInit_14;
      end
      if(when_PmpPlugin_l126_4) begin
        _zz_when_PmpPlugin_l126_8 <= _zz_when_PmpPlugin_l126_9;
        _zz_CsrPlugin_csrMapping_readDataInit_16 <= _zz_CsrPlugin_csrMapping_readDataInit_18;
      end
      if(when_PmpPlugin_l126_5) begin
        _zz_when_PmpPlugin_l126_10 <= _zz_when_PmpPlugin_l126_11;
        _zz_CsrPlugin_csrMapping_readDataInit_20 <= _zz_CsrPlugin_csrMapping_readDataInit_22;
      end
      if(when_PmpPlugin_l126_6) begin
        _zz_when_PmpPlugin_l126_12 <= _zz_when_PmpPlugin_l126_13;
        _zz_CsrPlugin_csrMapping_readDataInit_24 <= _zz_CsrPlugin_csrMapping_readDataInit_26;
      end
      if(when_PmpPlugin_l126_7) begin
        _zz_when_PmpPlugin_l126_14 <= _zz_when_PmpPlugin_l126_15;
        _zz_CsrPlugin_csrMapping_readDataInit_28 <= _zz_CsrPlugin_csrMapping_readDataInit_30;
      end
      if(when_PmpPlugin_l126_8) begin
        _zz_when_PmpPlugin_l126_16 <= _zz_when_PmpPlugin_l126_17;
        _zz_CsrPlugin_csrMapping_readDataInit_32 <= _zz_CsrPlugin_csrMapping_readDataInit_34;
      end
      if(when_PmpPlugin_l126_9) begin
        _zz_when_PmpPlugin_l126_18 <= _zz_when_PmpPlugin_l126_19;
        _zz_CsrPlugin_csrMapping_readDataInit_36 <= _zz_CsrPlugin_csrMapping_readDataInit_38;
      end
      if(when_PmpPlugin_l126_10) begin
        _zz_when_PmpPlugin_l126_20 <= _zz_when_PmpPlugin_l126_21;
        _zz_CsrPlugin_csrMapping_readDataInit_40 <= _zz_CsrPlugin_csrMapping_readDataInit_42;
      end
      if(when_PmpPlugin_l126_11) begin
        _zz_when_PmpPlugin_l126_22 <= _zz_when_PmpPlugin_l126_23;
        _zz_CsrPlugin_csrMapping_readDataInit_44 <= _zz_CsrPlugin_csrMapping_readDataInit_46;
      end
      if(when_PmpPlugin_l126_12) begin
        _zz_when_PmpPlugin_l126_24 <= _zz_when_PmpPlugin_l126_25;
        _zz_CsrPlugin_csrMapping_readDataInit_48 <= _zz_CsrPlugin_csrMapping_readDataInit_50;
      end
      if(when_PmpPlugin_l126_13) begin
        _zz_when_PmpPlugin_l126_26 <= _zz_when_PmpPlugin_l126_27;
        _zz_CsrPlugin_csrMapping_readDataInit_52 <= _zz_CsrPlugin_csrMapping_readDataInit_54;
      end
      if(when_PmpPlugin_l126_14) begin
        _zz_when_PmpPlugin_l126_28 <= _zz_when_PmpPlugin_l126_29;
        _zz_CsrPlugin_csrMapping_readDataInit_56 <= _zz_CsrPlugin_csrMapping_readDataInit_58;
      end
      if(when_PmpPlugin_l126_15) begin
        _zz_when_PmpPlugin_l126_30 <= _zz_when_PmpPlugin_l126_31;
        _zz_CsrPlugin_csrMapping_readDataInit_60 <= _zz_CsrPlugin_csrMapping_readDataInit_62;
      end
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          case(switch_CsrPlugin_l1031)
            2'b11 : begin
              CsrPlugin_mstatus_MPP <= 2'b11;
            end
            2'b01 : begin
              CsrPlugin_mstatus_MPP <= 2'b01;
            end
            2'b00 : begin
              CsrPlugin_mstatus_MPP <= 2'b00;
            end
            default : begin
            end
          endcase
          CsrPlugin_sstatus_SPP <= CsrPlugin_csrMapping_writeDataSignal[8 : 8];
          CsrPlugin_sstatus_SPIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sstatus_SIE <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_836) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sip_STIP <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sip_SSIP <= CsrPlugin_csrMapping_writeDataSignal[1];
          CsrPlugin_sip_SEIP_SOFT <= CsrPlugin_csrMapping_writeDataSignal[9];
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          CsrPlugin_sie_SEIE <= CsrPlugin_csrMapping_writeDataSignal[9];
          CsrPlugin_sie_STIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sie_SSIE <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_773) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mtvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
          if(when_CsrPlugin_l964) begin
            CsrPlugin_mtvec_mode <= CsrPlugin_csrMapping_writeDataSignal[1 : 0];
          end
        end
      end
      if(execute_CsrPlugin_csr_2816) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mcycle[31 : 0] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
      if(execute_CsrPlugin_csr_2944) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mcycle[63 : 32] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
      if(execute_CsrPlugin_csr_774) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mcounteren_CY <= CsrPlugin_csrMapping_writeDataSignal[0];
        end
      end
      if(execute_CsrPlugin_csr_262) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_scounteren_CY <= CsrPlugin_csrMapping_writeDataSignal[0];
        end
      end
      if(execute_CsrPlugin_csr_256) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sstatus_SPP <= CsrPlugin_csrMapping_writeDataSignal[8 : 8];
          CsrPlugin_sstatus_SPIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sstatus_SIE <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_324) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sip_STIP <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sip_SSIP <= CsrPlugin_csrMapping_writeDataSignal[1];
          CsrPlugin_sip_SEIP_SOFT <= CsrPlugin_csrMapping_writeDataSignal[9];
        end
      end
      if(execute_CsrPlugin_csr_260) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sie_SEIE <= CsrPlugin_csrMapping_writeDataSignal[9];
          CsrPlugin_sie_STIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sie_SSIE <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(when_InstructionCache_l240) begin
        if(when_InstructionCache_l243) begin
          _zz_iBusWishbone_ADR <= (_zz_iBusWishbone_ADR + 3'b001);
        end
      end
      _zz_iBus_rsp_valid <= (iBusWishbone_CYC && (iBusWishbone_ACK || iBusWishbone_ERR));
      if(dBus_cmd_valid) begin
        dBus_cmd_rValid <= 1'b1;
      end
      if(dBus_cmd_halfPipe_fire) begin
        dBus_cmd_rValid <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready) begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(when_ShiftPlugins_l169) begin
      if(when_ShiftPlugins_l175) begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - 5'h01);
      end
    end
    if(when_MulDivIterativePlugin_l96) begin
      if(when_MulDivIterativePlugin_l100) begin
        memory_MulDivIterativePlugin_rs2 <= (memory_MulDivIterativePlugin_rs2 >>> 1);
        memory_MulDivIterativePlugin_accumulator <= ({_zz_memory_MulDivIterativePlugin_accumulator,memory_MulDivIterativePlugin_accumulator[31 : 0]} >>> 1'd1);
      end
    end
    if(when_MulDivIterativePlugin_l126) begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if(when_MulDivIterativePlugin_l126_1) begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outNumerator;
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outRemainder;
        if(when_MulDivIterativePlugin_l151) begin
          memory_MulDivIterativePlugin_div_result <= _zz_memory_MulDivIterativePlugin_div_result_1[31:0];
        end
      end
    end
    if(when_MulDivIterativePlugin_l162) begin
      memory_MulDivIterativePlugin_accumulator <= 65'h0;
      memory_MulDivIterativePlugin_rs1 <= ((_zz_memory_MulDivIterativePlugin_rs1 ? (~ _zz_memory_MulDivIterativePlugin_rs1_1) : _zz_memory_MulDivIterativePlugin_rs1_1) + _zz_memory_MulDivIterativePlugin_rs1_2);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_memory_MulDivIterativePlugin_rs2 ? (~ execute_RS2) : execute_RS2) + _zz_memory_MulDivIterativePlugin_rs2_1);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_memory_MulDivIterativePlugin_rs1 ^ (_zz_memory_MulDivIterativePlugin_rs2 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_sip_SEIP_INPUT <= externalInterruptS;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(_zz_when_1) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3 ? DBusSimplePlugin_memoryExceptionPort_payload_code : BranchPlugin_branchExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3 ? DBusSimplePlugin_memoryExceptionPort_payload_badAddr : BranchPlugin_branchExceptionPort_payload_badAddr);
    end
    if(when_CsrPlugin_l1296) begin
      if(when_CsrPlugin_l1302) begin
        CsrPlugin_interrupt_code <= 4'b0101;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
      if(when_CsrPlugin_l1302_1) begin
        CsrPlugin_interrupt_code <= 4'b0001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
      if(when_CsrPlugin_l1302_2) begin
        CsrPlugin_interrupt_code <= 4'b1001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
    end
    if(when_CsrPlugin_l1296_1) begin
      if(when_CsrPlugin_l1302_3) begin
        CsrPlugin_interrupt_code <= 4'b0101;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_4) begin
        CsrPlugin_interrupt_code <= 4'b0001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_5) begin
        CsrPlugin_interrupt_code <= 4'b1001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_6) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_7) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_8) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1390) begin
      if(when_CsrPlugin_l1398) begin
        case(CsrPlugin_targetPrivilege)
          2'b01 : begin
            CsrPlugin_scause_interrupt <= (! CsrPlugin_hadException);
            CsrPlugin_scause_exceptionCode <= CsrPlugin_trapCause;
            CsrPlugin_sepc <= writeBack_PC;
            if(CsrPlugin_hadException) begin
              CsrPlugin_stval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
            end
          end
          2'b11 : begin
            CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
            CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
            CsrPlugin_mepc <= writeBack_PC;
            if(CsrPlugin_hadException) begin
              CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
            end
          end
          default : begin
          end
        endcase
      end
    end
    if(when_PmpPlugin_l126) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_1;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_1;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_1;
      _zz_CsrPlugin_csrMapping_readDataInit_1 <= _zz_CsrPlugin_csrMapping_readDataInit_3;
    end
    if(when_PmpPlugin_l126_1) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_2 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_3;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_2 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_3;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_2 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_3;
      _zz_CsrPlugin_csrMapping_readDataInit_5 <= _zz_CsrPlugin_csrMapping_readDataInit_7;
    end
    if(when_PmpPlugin_l126_2) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_4 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_5;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_4 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_5;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_4 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_5;
      _zz_CsrPlugin_csrMapping_readDataInit_9 <= _zz_CsrPlugin_csrMapping_readDataInit_11;
    end
    if(when_PmpPlugin_l126_3) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_6 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_7;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_6 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_7;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_6 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_7;
      _zz_CsrPlugin_csrMapping_readDataInit_13 <= _zz_CsrPlugin_csrMapping_readDataInit_15;
    end
    if(when_PmpPlugin_l126_4) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_8 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_9;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_8 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_9;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_8 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_9;
      _zz_CsrPlugin_csrMapping_readDataInit_17 <= _zz_CsrPlugin_csrMapping_readDataInit_19;
    end
    if(when_PmpPlugin_l126_5) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_10 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_11;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_10 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_11;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_10 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_11;
      _zz_CsrPlugin_csrMapping_readDataInit_21 <= _zz_CsrPlugin_csrMapping_readDataInit_23;
    end
    if(when_PmpPlugin_l126_6) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_12 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_13;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_12 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_13;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_12 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_13;
      _zz_CsrPlugin_csrMapping_readDataInit_25 <= _zz_CsrPlugin_csrMapping_readDataInit_27;
    end
    if(when_PmpPlugin_l126_7) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_14 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_15;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_14 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_15;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_14 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_15;
      _zz_CsrPlugin_csrMapping_readDataInit_29 <= _zz_CsrPlugin_csrMapping_readDataInit_31;
    end
    if(when_PmpPlugin_l126_8) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_16 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_17;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_16 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_17;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_16 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_17;
      _zz_CsrPlugin_csrMapping_readDataInit_33 <= _zz_CsrPlugin_csrMapping_readDataInit_35;
    end
    if(when_PmpPlugin_l126_9) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_18 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_19;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_18 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_19;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_18 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_19;
      _zz_CsrPlugin_csrMapping_readDataInit_37 <= _zz_CsrPlugin_csrMapping_readDataInit_39;
    end
    if(when_PmpPlugin_l126_10) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_20 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_21;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_20 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_21;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_20 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_21;
      _zz_CsrPlugin_csrMapping_readDataInit_41 <= _zz_CsrPlugin_csrMapping_readDataInit_43;
    end
    if(when_PmpPlugin_l126_11) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_22 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_23;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_22 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_23;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_22 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_23;
      _zz_CsrPlugin_csrMapping_readDataInit_45 <= _zz_CsrPlugin_csrMapping_readDataInit_47;
    end
    if(when_PmpPlugin_l126_12) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_24 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_25;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_24 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_25;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_24 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_25;
      _zz_CsrPlugin_csrMapping_readDataInit_49 <= _zz_CsrPlugin_csrMapping_readDataInit_51;
    end
    if(when_PmpPlugin_l126_13) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_26 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_27;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_26 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_27;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_26 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_27;
      _zz_CsrPlugin_csrMapping_readDataInit_53 <= _zz_CsrPlugin_csrMapping_readDataInit_55;
    end
    if(when_PmpPlugin_l126_14) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_28 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_29;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_28 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_29;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_28 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_29;
      _zz_CsrPlugin_csrMapping_readDataInit_57 <= _zz_CsrPlugin_csrMapping_readDataInit_59;
    end
    if(when_PmpPlugin_l126_15) begin
      _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_30 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowRead_31;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_30 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowWrite_31;
      _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_30 <= _zz_IBusCachedPlugin_mmuBus_rsp_allowExecute_31;
      _zz_CsrPlugin_csrMapping_readDataInit_61 <= _zz_CsrPlugin_csrMapping_readDataInit_63;
    end
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= decode_PC;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= _zz_execute_to_memory_PC;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_decode_to_execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_7) begin
      execute_to_memory_FORMAL_PC_NEXT <= _zz_execute_to_memory_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      decode_to_execute_RESCHEDULE_NEXT <= decode_RESCHEDULE_NEXT;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_SRC1_CTRL <= _zz_decode_to_execute_SRC1_CTRL;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_12) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_13) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_15) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_16) begin
      decode_to_execute_SRC2_CTRL <= _zz_decode_to_execute_SRC2_CTRL;
    end
    if(when_Pipeline_l124_17) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_18) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_19) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_20) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_21) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_22) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_23) begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if(when_Pipeline_l124_24) begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if(when_Pipeline_l124_25) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_26) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_27) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_28) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_29) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_30) begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if(when_Pipeline_l124_32) begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(when_Pipeline_l124_33) begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if(when_Pipeline_l124_34) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_35) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_36) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_37) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_38) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_39) begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if(when_Pipeline_l124_40) begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if(when_Pipeline_l124_41) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_42) begin
      decode_to_execute_PREDICTION_HAD_BRANCHED1 <= decode_PREDICTION_HAD_BRANCHED1;
    end
    if(when_Pipeline_l124_43) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_44) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_45) begin
      execute_to_memory_ALIGNEMENT_FAULT <= execute_ALIGNEMENT_FAULT;
    end
    if(when_Pipeline_l124_46) begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_47) begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_48) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_49) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_50) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_51) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_52) begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if(when_CsrPlugin_l1669) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1669_1) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1669_2) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1669_3) begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if(when_CsrPlugin_l1669_4) begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if(when_CsrPlugin_l1669_5) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(when_CsrPlugin_l1669_6) begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(when_CsrPlugin_l1669_7) begin
      execute_CsrPlugin_csr_2816 <= (decode_INSTRUCTION[31 : 20] == 12'hb00);
    end
    if(when_CsrPlugin_l1669_8) begin
      execute_CsrPlugin_csr_2944 <= (decode_INSTRUCTION[31 : 20] == 12'hb80);
    end
    if(when_CsrPlugin_l1669_9) begin
      execute_CsrPlugin_csr_3072 <= (decode_INSTRUCTION[31 : 20] == 12'hc00);
    end
    if(when_CsrPlugin_l1669_10) begin
      execute_CsrPlugin_csr_3200 <= (decode_INSTRUCTION[31 : 20] == 12'hc80);
    end
    if(when_CsrPlugin_l1669_11) begin
      execute_CsrPlugin_csr_774 <= (decode_INSTRUCTION[31 : 20] == 12'h306);
    end
    if(when_CsrPlugin_l1669_12) begin
      execute_CsrPlugin_csr_262 <= (decode_INSTRUCTION[31 : 20] == 12'h106);
    end
    if(when_CsrPlugin_l1669_13) begin
      execute_CsrPlugin_csr_256 <= (decode_INSTRUCTION[31 : 20] == 12'h100);
    end
    if(when_CsrPlugin_l1669_14) begin
      execute_CsrPlugin_csr_324 <= (decode_INSTRUCTION[31 : 20] == 12'h144);
    end
    if(when_CsrPlugin_l1669_15) begin
      execute_CsrPlugin_csr_260 <= (decode_INSTRUCTION[31 : 20] == 12'h104);
    end
    if(when_CsrPlugin_l1669_16) begin
      execute_CsrPlugin_csr_261 <= (decode_INSTRUCTION[31 : 20] == 12'h105);
    end
    if(when_CsrPlugin_l1669_17) begin
      execute_CsrPlugin_csr_321 <= (decode_INSTRUCTION[31 : 20] == 12'h141);
    end
    if(when_CsrPlugin_l1669_18) begin
      execute_CsrPlugin_csr_322 <= (decode_INSTRUCTION[31 : 20] == 12'h142);
    end
    if(when_CsrPlugin_l1669_19) begin
      execute_CsrPlugin_csr_323 <= (decode_INSTRUCTION[31 : 20] == 12'h143);
    end
    if(when_CsrPlugin_l1669_20) begin
      execute_CsrPlugin_csr_384 <= (decode_INSTRUCTION[31 : 20] == 12'h180);
    end
    if(when_CsrPlugin_l1669_21) begin
      execute_CsrPlugin_csr_944 <= (decode_INSTRUCTION[31 : 20] == 12'h3b0);
    end
    if(when_CsrPlugin_l1669_22) begin
      execute_CsrPlugin_csr_945 <= (decode_INSTRUCTION[31 : 20] == 12'h3b1);
    end
    if(when_CsrPlugin_l1669_23) begin
      execute_CsrPlugin_csr_946 <= (decode_INSTRUCTION[31 : 20] == 12'h3b2);
    end
    if(when_CsrPlugin_l1669_24) begin
      execute_CsrPlugin_csr_947 <= (decode_INSTRUCTION[31 : 20] == 12'h3b3);
    end
    if(when_CsrPlugin_l1669_25) begin
      execute_CsrPlugin_csr_948 <= (decode_INSTRUCTION[31 : 20] == 12'h3b4);
    end
    if(when_CsrPlugin_l1669_26) begin
      execute_CsrPlugin_csr_949 <= (decode_INSTRUCTION[31 : 20] == 12'h3b5);
    end
    if(when_CsrPlugin_l1669_27) begin
      execute_CsrPlugin_csr_950 <= (decode_INSTRUCTION[31 : 20] == 12'h3b6);
    end
    if(when_CsrPlugin_l1669_28) begin
      execute_CsrPlugin_csr_951 <= (decode_INSTRUCTION[31 : 20] == 12'h3b7);
    end
    if(when_CsrPlugin_l1669_29) begin
      execute_CsrPlugin_csr_952 <= (decode_INSTRUCTION[31 : 20] == 12'h3b8);
    end
    if(when_CsrPlugin_l1669_30) begin
      execute_CsrPlugin_csr_953 <= (decode_INSTRUCTION[31 : 20] == 12'h3b9);
    end
    if(when_CsrPlugin_l1669_31) begin
      execute_CsrPlugin_csr_954 <= (decode_INSTRUCTION[31 : 20] == 12'h3ba);
    end
    if(when_CsrPlugin_l1669_32) begin
      execute_CsrPlugin_csr_955 <= (decode_INSTRUCTION[31 : 20] == 12'h3bb);
    end
    if(when_CsrPlugin_l1669_33) begin
      execute_CsrPlugin_csr_956 <= (decode_INSTRUCTION[31 : 20] == 12'h3bc);
    end
    if(when_CsrPlugin_l1669_34) begin
      execute_CsrPlugin_csr_957 <= (decode_INSTRUCTION[31 : 20] == 12'h3bd);
    end
    if(when_CsrPlugin_l1669_35) begin
      execute_CsrPlugin_csr_958 <= (decode_INSTRUCTION[31 : 20] == 12'h3be);
    end
    if(when_CsrPlugin_l1669_36) begin
      execute_CsrPlugin_csr_959 <= (decode_INSTRUCTION[31 : 20] == 12'h3bf);
    end
    if(when_CsrPlugin_l1669_37) begin
      execute_CsrPlugin_csr_928 <= (decode_INSTRUCTION[31 : 20] == 12'h3a0);
    end
    if(when_CsrPlugin_l1669_38) begin
      execute_CsrPlugin_csr_929 <= (decode_INSTRUCTION[31 : 20] == 12'h3a1);
    end
    if(when_CsrPlugin_l1669_39) begin
      execute_CsrPlugin_csr_930 <= (decode_INSTRUCTION[31 : 20] == 12'h3a2);
    end
    if(when_CsrPlugin_l1669_40) begin
      execute_CsrPlugin_csr_931 <= (decode_INSTRUCTION[31 : 20] == 12'h3a3);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_261) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_stvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
        if(when_CsrPlugin_l964_1) begin
          CsrPlugin_stvec_mode <= CsrPlugin_csrMapping_writeDataSignal[1 : 0];
        end
      end
    end
    if(execute_CsrPlugin_csr_321) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_sepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_322) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_scause_interrupt <= CsrPlugin_csrMapping_writeDataSignal[31];
        CsrPlugin_scause_exceptionCode <= CsrPlugin_csrMapping_writeDataSignal[3 : 0];
      end
    end
    if(execute_CsrPlugin_csr_323) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_stval <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_384) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_satp_MODE <= CsrPlugin_csrMapping_writeDataSignal[31 : 31];
        CsrPlugin_satp_ASID <= CsrPlugin_csrMapping_writeDataSignal[30 : 22];
        CsrPlugin_satp_PPN <= CsrPlugin_csrMapping_writeDataSignal[21 : 0];
      end
    end
    iBusWishbone_DAT_MISO_regNext <= iBusWishbone_DAT_MISO;
    iBusWishbone_ERR_regNext <= iBusWishbone_ERR;
    if(dBus_cmd_ready) begin
      dBus_cmd_rData_wr <= dBus_cmd_payload_wr;
      dBus_cmd_rData_mask <= dBus_cmd_payload_mask;
      dBus_cmd_rData_address <= dBus_cmd_payload_address;
      dBus_cmd_rData_data <= dBus_cmd_payload_data;
      dBus_cmd_rData_size <= dBus_cmd_payload_size;
    end
  end


endmodule

module InstructionCache (
  input  wire          io_flush,
  input  wire          io_cpu_prefetch_isValid,
  output reg           io_cpu_prefetch_haltIt,
  input  wire [31:0]   io_cpu_prefetch_pc,
  input  wire          io_cpu_fetch_isValid,
  input  wire          io_cpu_fetch_isStuck,
  input  wire          io_cpu_fetch_isRemoved,
  input  wire [31:0]   io_cpu_fetch_pc,
  output wire [31:0]   io_cpu_fetch_data,
  input  wire [31:0]   io_cpu_fetch_mmuRsp_physicalAddress,
  input  wire          io_cpu_fetch_mmuRsp_isIoAccess,
  input  wire          io_cpu_fetch_mmuRsp_isPaging,
  input  wire          io_cpu_fetch_mmuRsp_allowRead,
  input  wire          io_cpu_fetch_mmuRsp_allowWrite,
  input  wire          io_cpu_fetch_mmuRsp_allowExecute,
  input  wire          io_cpu_fetch_mmuRsp_exception,
  input  wire          io_cpu_fetch_mmuRsp_refilling,
  input  wire          io_cpu_fetch_mmuRsp_bypassTranslation,
  output wire [31:0]   io_cpu_fetch_physicalAddress,
  input  wire          io_cpu_decode_isValid,
  input  wire          io_cpu_decode_isStuck,
  input  wire [31:0]   io_cpu_decode_pc,
  output wire [31:0]   io_cpu_decode_physicalAddress,
  output wire [31:0]   io_cpu_decode_data,
  output wire          io_cpu_decode_cacheMiss,
  output wire          io_cpu_decode_error,
  output wire          io_cpu_decode_mmuRefilling,
  output wire          io_cpu_decode_mmuException,
  input  wire          io_cpu_decode_isUser,
  input  wire          io_cpu_fill_valid,
  input  wire [31:0]   io_cpu_fill_payload,
  output wire          io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output wire [31:0]   io_mem_cmd_payload_address,
  output wire [2:0]    io_mem_cmd_payload_size,
  input  wire          io_mem_rsp_valid,
  input  wire [31:0]   io_mem_rsp_payload_data,
  input  wire          io_mem_rsp_payload_error,
  input  wire          clk,
  input  wire          reset
);

  reg        [31:0]   banks_0_spinal_port1;
  reg        [21:0]   ways_0_tags_spinal_port1;
  wire       [21:0]   _zz_ways_0_tags_port;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [7:0]    lineLoader_flushCounter;
  wire                when_InstructionCache_l339;
  reg                 _zz_when_InstructionCache_l343;
  wire                when_InstructionCache_l343;
  wire                when_InstructionCache_l352;
  reg                 lineLoader_cmdSent;
  wire                io_mem_cmd_fire;
  wire                when_Utils_l593;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg        [2:0]    lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                lineLoader_write_tag_0_valid;
  wire       [6:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [19:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [9:0]    lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire                when_InstructionCache_l402;
  wire       [9:0]    _zz_fetchStage_read_banksValue_0_dataMem;
  wire                _zz_fetchStage_read_banksValue_0_dataMem_1;
  wire       [31:0]   fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [6:0]    _zz_fetchStage_read_waysValues_0_tag_valid;
  wire                _zz_fetchStage_read_waysValues_0_tag_valid_1;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [19:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [21:0]   _zz_fetchStage_read_waysValues_0_tag_valid_2;
  wire                when_InstructionCache_l460;
  reg        [31:0]   decodeStage_mmuRsp_physicalAddress;
  reg                 decodeStage_mmuRsp_isIoAccess;
  reg                 decodeStage_mmuRsp_isPaging;
  reg                 decodeStage_mmuRsp_allowRead;
  reg                 decodeStage_mmuRsp_allowWrite;
  reg                 decodeStage_mmuRsp_allowExecute;
  reg                 decodeStage_mmuRsp_exception;
  reg                 decodeStage_mmuRsp_refilling;
  reg                 decodeStage_mmuRsp_bypassTranslation;
  wire                when_InstructionCache_l460_1;
  reg                 decodeStage_hit_tags_0_valid;
  reg                 decodeStage_hit_tags_0_error;
  reg        [19:0]   decodeStage_hit_tags_0_address;
  wire                decodeStage_hit_hits_0;
  wire                decodeStage_hit_valid;
  wire                when_InstructionCache_l460_2;
  reg        [31:0]   _zz_decodeStage_hit_data;
  wire       [31:0]   decodeStage_hit_data;
  reg [31:0] banks_0 [0:1023];
  reg [21:0] ways_0_tags [0:127];

  assign _zz_ways_0_tags_port = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @(posedge clk) begin
    if(_zz_1) begin
      banks_0[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @(posedge clk) begin
    if(_zz_fetchStage_read_banksValue_0_dataMem_1) begin
      banks_0_spinal_port1 <= banks_0[_zz_fetchStage_read_banksValue_0_dataMem];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  always @(posedge clk) begin
    if(_zz_fetchStage_read_waysValues_0_tag_valid_1) begin
      ways_0_tags_spinal_port1 <= ways_0_tags[_zz_fetchStage_read_waysValues_0_tag_valid];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(lineLoader_write_data_0_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(lineLoader_write_tag_0_valid) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid) begin
      if(when_InstructionCache_l402) begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @(*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(when_InstructionCache_l339) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(when_InstructionCache_l343) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign when_InstructionCache_l339 = (! lineLoader_flushCounter[7]);
  assign when_InstructionCache_l343 = (! _zz_when_InstructionCache_l343);
  assign when_InstructionCache_l352 = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign io_mem_cmd_fire = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],5'h0};
  assign io_mem_cmd_payload_size = 3'b101;
  assign when_Utils_l593 = (! lineLoader_valid);
  always @(*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if(when_Utils_l593) begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign lineLoader_write_tag_0_valid = ((1'b1 && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && 1'b1);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign when_InstructionCache_l402 = (lineLoader_wordIndex == 3'b111);
  assign _zz_fetchStage_read_banksValue_0_dataMem = io_cpu_prefetch_pc[11 : 2];
  assign _zz_fetchStage_read_banksValue_0_dataMem_1 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = banks_0_spinal_port1;
  assign fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
  assign _zz_fetchStage_read_waysValues_0_tag_valid = io_cpu_prefetch_pc[11 : 5];
  assign _zz_fetchStage_read_waysValues_0_tag_valid_1 = (! io_cpu_fetch_isStuck);
  assign _zz_fetchStage_read_waysValues_0_tag_valid_2 = ways_0_tags_spinal_port1;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_fetchStage_read_waysValues_0_tag_valid_2[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_fetchStage_read_waysValues_0_tag_valid_2[1];
  assign fetchStage_read_waysValues_0_tag_address = _zz_fetchStage_read_waysValues_0_tag_valid_2[21 : 2];
  assign io_cpu_fetch_data = fetchStage_read_banksValue_0_data;
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuRsp_physicalAddress;
  assign when_InstructionCache_l460 = (! io_cpu_decode_isStuck);
  assign when_InstructionCache_l460_1 = (! io_cpu_decode_isStuck);
  assign decodeStage_hit_hits_0 = (decodeStage_hit_tags_0_valid && (decodeStage_hit_tags_0_address == decodeStage_mmuRsp_physicalAddress[31 : 12]));
  assign decodeStage_hit_valid = (|decodeStage_hit_hits_0);
  assign when_InstructionCache_l460_2 = (! io_cpu_decode_isStuck);
  assign decodeStage_hit_data = _zz_decodeStage_hit_data;
  assign io_cpu_decode_data = decodeStage_hit_data;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = (decodeStage_hit_tags_0_error || ((! decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute))));
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = (((! decodeStage_mmuRsp_refilling) && decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= 3'b000;
    end else begin
      if(lineLoader_fire) begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire) begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid) begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush) begin
        lineLoader_flushPending <= 1'b1;
      end
      if(when_InstructionCache_l352) begin
        lineLoader_flushPending <= 1'b0;
      end
      if(io_mem_cmd_fire) begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire) begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid) begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + 3'b001);
        if(io_mem_rsp_payload_error) begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @(posedge clk) begin
    if(io_cpu_fill_valid) begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(when_InstructionCache_l339) begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 8'h01);
    end
    _zz_when_InstructionCache_l343 <= lineLoader_flushCounter[7];
    if(when_InstructionCache_l352) begin
      lineLoader_flushCounter <= 8'h0;
    end
    if(when_InstructionCache_l460) begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuRsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuRsp_isIoAccess;
      decodeStage_mmuRsp_isPaging <= io_cpu_fetch_mmuRsp_isPaging;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuRsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuRsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuRsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuRsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuRsp_refilling;
      decodeStage_mmuRsp_bypassTranslation <= io_cpu_fetch_mmuRsp_bypassTranslation;
    end
    if(when_InstructionCache_l460_1) begin
      decodeStage_hit_tags_0_valid <= fetchStage_read_waysValues_0_tag_valid;
      decodeStage_hit_tags_0_error <= fetchStage_read_waysValues_0_tag_error;
      decodeStage_hit_tags_0_address <= fetchStage_read_waysValues_0_tag_address;
    end
    if(when_InstructionCache_l460_2) begin
      _zz_decodeStage_hit_data <= fetchStage_read_banksValue_0_data;
    end
  end


endmodule
