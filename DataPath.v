module DataPath(
input clk
);
  
wire [31:0]PCResult, BranchResult, Mux_PC, PC_Mem,Mem_I, PCResult_1, Mem_I_1, WDATA, Dato1, Dato2, Sign_extend, PCResult_2, Dato1_1, Dato2_1, Sign_extend_1, Shift_left, Mux_alu , ALURes, BranchResult_1, ALURes_2, Dato2_2, MemRes, ALURes_1, MemRes_1, ALURes_3, Jump_Addres, Jump_Addres_1, Jump_Addres_2, Jump_Addres_3, MuxToPC;
wire [4:0]WREG3, Mux1, Mux2, WREG1, WREG2;
wire [2:0]AluOP, AluOP_1, Aluc;
wire PCSrc, RegWrite, MemtoReg, MemWrite, MemRead, Branch, ALUSrt, RegDst, RegWrite_BF3, RegWrite_BF1, MemtoReg_BF1, MemWrite_BF1, Jump, Jump2, Jump3;
wire MemRead_BF1, Branch_BF1, ALUSrt_1, RegDst_1, ZeroF, RegWrite_BF2, MemtoReg_BF2, MemWrite_BF2, MemRead_BF2, Branch_BF2, ZeroF_1, MemtoReg_BF3;

Mux2a1 PC_Src_Mux(
.MemReg(PCSrc),.Din(PCResult), .z(BranchResult_1),
.Dout(Mux_PC)
);
 
PC PC(
.PCNext(MuxToPC), .CLK(clk), 
.PCResult(PC_Mem)
);

ADD ADD_PC(
.Din(PC_Mem), .Din2(4),
.Dout(PCResult)
);

INSTRUCTION_MEM Memoria_de_instruccion(
.RA(PC_Mem[7:0]),
.DR(Mem_I)
);

IF_ID IFID(
.PCResult(PCResult), .Mem_I(Mem_I), .clk(clk),
.PCResult1(PCResult_1), .Mem_I1(Mem_I_1)
);

ShiftLeft_2 ShiftLeft(
.Din(Mem_I_1[25:0]),.PCadd(PCResult[31:28]),
.Dout(Jump_Addres)
);

UnidadControl Control(
.op(Mem_I_1[31:26]),
.MemToReg(MemtoReg), .MemToWrite(MemWrite), .ALUOP(AluOP), .regwrite(RegWrite), .MemToRead(MemRead), .Branch(Branch), .ALUSrt(ALUSrt), .RegDst(RegDst), .jump(Jump)
);

BR Registros(
.Regwrite(RegWrite_BF3), .Din(WDATA), .RA1(Mem_I_1[25:21]), .RA2(Mem_I_1[20:16]), .WA(WREG3),
.DR1(Dato1), .DR2(Dato2)
);

SIGN_EXTEND SIGN_EXTEND(
.Din(Mem_I_1[15:0]),
.Dout(Sign_extend)
);

ID_EX IDEX(
.clk(clk), .Regwrite(RegWrite), .MemToReg(MemtoReg), .MemWrite(MemWrite), .MemRead(MemRead), .Branch(Branch), .ALUSrt(ALUSrt), .RegDst(RegDst), .AluOP(AluOP), .PCResult_1(PCResult_1), .Dato1(Dato1), .Dato2(Dato2), .SignExtend(Sign_extend), .Rd(Mem_I_1[20:16]), .Shamt(Mem_I_1[15:11]), .Jump_Addres(Jump_Addres), .jump(Jump),
.Regwrite_1(RegWrite_BF1), .MemToReg_1(MemtoReg_BF1), .MemWrite_1(MemWrite_BF1), .MemRead_1(MemRead_BF1), .Branch_1(Branch_BF1), .ALUSrt_1(ALUSrt_1), .RegDst_1(RegDst_1), .AluOP_1(AluOP_1), .PCResult_1_1(PCResult_2), .Dato1_1(Dato1_1), .Dato2_1(Dato2_1), .SignExtend_1(Sign_extend_1), .Rd_1(Mux1), .Shamt_1(Mux2), .Jump_Addres_1(Jump_Addres_1), .jump2(Jump2)
);


SHIFT_LEFT2 ShiftLeft2(
.Din(Sign_extend_1),
.Dout(Shift_left)
);

ADD ADDER_SHIFT_PC(
.Din(PCResult_2), .Din2(Shift_left),
.Dout(BranchResult)
);

Mux2a1 ALU_Src_Mux(
.MemReg(ALUSrt_1), .Din(Dato2_1), .z(Sign_extend_1),
.Dout(Mux_alu)
); 

ALU ALU(
.AluCT(Aluc), .A(Dato1_1), .B(Mux_alu),
.z(ALURes_1), .zf(ZeroF)
);

ALU_CONTROL ALU_Control(
.ALUOp(AluOP_1), .FunCode(Sign_extend_1[5:0]),
.ALUCt(Aluc)
);

MUX2 Reg_Dst_Mux(
.MemReg(RegDst_1), .Din(Mux1), .z(Mux2),
.Dout(WREG1)
);

EX_MEM EXMEM(
.clk(clk), .RegWrite_BF1(RegWrite_BF1), .MemToReg_BF1(MemtoReg_BF1), .MemWrite_BF1(MemWrite_BF1), .MemRead_BF1(MemRead_BF1), .Branch_BF1(Branch_BF1), .ZeroF(ZeroF), .BranchResult(BranchResult), .ALURes(ALURes_1), .Dato2_1(Dato2_1), .WREG1(WREG1), .Jump_Addres_1(Jump_Addres_1), .jump2(Jump2),
.RegWrite_BF1_1(RegWrite_BF2), .MemToReg_BF1_1(MemtoReg_BF2), .MemWrite_BF1_1(MemWrite_BF2), .MemRead_BF1_1(MemRead_BF2), .Branch_BF1_1(Branch_BF2), .ZeroF_1(ZeroF_1), .BranchResult_1(BranchResult_1), .ALURes_1(ALURes_2), .Dato2_1_1(Dato2_2), .WREG1_1(WREG2), .Jump_Addres_2(Jump_Addres_2), .jump3(Jump3)
);

AND Branch_AND(
.Din(Branch_BF2), .Din2(ZeroF_1),
.Dout(PCSrc)
);

Mem Memoria_de_datos(
.enWR(MemWrite_BF2), .dataIn(Dato2_2), .dir(ALURes_2), .MemRead(MemRead_BF2),
.dataOut(MemRes)
);

MEM_WB MEMWB(
.clk(clk), .RegWrite_BF2(RegWrite_BF2), .MemToReg_BF2(MemtoReg_BF2), .MemRes(MemRes), .ALURes_2(ALURes_2), .WREG2(WREG2), .Jump_Addres_2(Jump_Addres_2), .jump3(Jump3),
.RegWrite_BF2_1(RegWrite_BF3), .MemToReg_BF2_1(MemtoReg_BF3), .MemRes_1(MemRes_1), .ALURes_2_1(ALURes_3), .WREG2_1(WREG3), .Jump_Addres_3(Jump_Addres_3), .jump4(Jump4)
);

Mux2a1 MemToReg_Mux(
.MemReg(MemtoReg_BF3), .Din(MemRes_1), .z(ALURes_3),
.Dout(WDATA)
);

Mux2a1 toPC(
.MemReg(Jump4), .Din(Mux_PC), .z(Jump_Addres_3),
.Dout(MuxToPC)
);


endmodule

