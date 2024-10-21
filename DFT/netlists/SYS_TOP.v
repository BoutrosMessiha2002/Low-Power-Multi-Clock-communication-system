/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Oct 21 17:28:20 2024
/////////////////////////////////////////////////////////////


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_7 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module Reset_sync_test_0 ( RST, CLK, sync_reset, test_si, test_se );
  input RST, CLK, test_si, test_se;
  output sync_reset;
  wire   \flops[0] , n3;

  SDFFRQX2M \flops_reg[0]  ( .D(1'b1), .SI(test_si), .SE(n3), .CK(CLK), .RN(
        RST), .Q(\flops[0] ) );
  SDFFRQX2M \flops_reg[1]  ( .D(\flops[0] ), .SI(\flops[0] ), .SE(n3), .CK(CLK), .RN(RST), .Q(sync_reset) );
  DLY1X1M U3 ( .A(test_se), .Y(n3) );
endmodule


module Reset_sync_test_1 ( RST, CLK, sync_reset, test_si, test_se );
  input RST, CLK, test_si, test_se;
  output sync_reset;
  wire   \flops[0] , n3;

  SDFFRQX2M \flops_reg[1]  ( .D(\flops[0] ), .SI(\flops[0] ), .SE(n3), .CK(CLK), .RN(RST), .Q(sync_reset) );
  SDFFRQX2M \flops_reg[0]  ( .D(1'b1), .SI(test_si), .SE(n3), .CK(CLK), .RN(
        RST), .Q(\flops[0] ) );
  DLY1X1M U3 ( .A(test_se), .Y(n3) );
endmodule


module Data_Sync_BUS_WIDTH8_test_1 ( CLK, RST, unsync_bus, bus_enable, 
        enable_pulse, sync_bus, test_si, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable, test_si, test_se;
  output enable_pulse;
  wire   n16, enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13,
         n14, n15, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34;
  wire   [1:0] flops;

  INVXLM U3 ( .A(n16), .Y(n10) );
  INVX4M U4 ( .A(n10), .Y(enable_pulse) );
  INVX4M U5 ( .A(n1), .Y(n15) );
  BUFX4M U6 ( .A(n1), .Y(n12) );
  INVX6M U7 ( .A(n14), .Y(n13) );
  INVX2M U8 ( .A(RST), .Y(n14) );
  NAND2BX2M U9 ( .AN(enable_flop), .B(flops[1]), .Y(n1) );
  AO22X1M U10 ( .A0(unsync_bus[1]), .A1(n15), .B0(n12), .B1(n31), .Y(n3) );
  AO22X1M U11 ( .A0(unsync_bus[4]), .A1(n15), .B0(n34), .B1(n12), .Y(n6) );
  AO22X1M U12 ( .A0(unsync_bus[0]), .A1(n15), .B0(n33), .B1(n12), .Y(n2) );
  AO22X1M U13 ( .A0(unsync_bus[6]), .A1(n15), .B0(n32), .B1(n12), .Y(n8) );
  AO22X1M U14 ( .A0(unsync_bus[5]), .A1(n15), .B0(n30), .B1(n12), .Y(n7) );
  AO22X1M U15 ( .A0(unsync_bus[2]), .A1(n15), .B0(sync_bus[2]), .B1(n12), .Y(
        n4) );
  AO22X1M U16 ( .A0(unsync_bus[7]), .A1(n15), .B0(sync_bus[7]), .B1(n12), .Y(
        n9) );
  AO22X1M U17 ( .A0(unsync_bus[3]), .A1(n15), .B0(sync_bus[3]), .B1(n12), .Y(
        n5) );
  SDFFRQX2M \flops_reg[1]  ( .D(flops[0]), .SI(flops[0]), .SE(n27), .CK(CLK), 
        .RN(n13), .Q(flops[1]) );
  DLY1X1M U18 ( .A(n23), .Y(n19) );
  DLY1X1M U19 ( .A(n23), .Y(n20) );
  DLY1X1M U20 ( .A(n25), .Y(n21) );
  DLY1X1M U21 ( .A(n25), .Y(n22) );
  DLY1X1M U22 ( .A(test_se), .Y(n23) );
  DLY1X1M U23 ( .A(n19), .Y(n24) );
  DLY1X1M U24 ( .A(n19), .Y(n25) );
  DLY1X1M U25 ( .A(n20), .Y(n26) );
  DLY1X1M U26 ( .A(n24), .Y(n27) );
  DLY1X1M U27 ( .A(n24), .Y(n28) );
  DLY1X1M U28 ( .A(n20), .Y(n29) );
  DLY1X1M U29 ( .A(sync_bus[5]), .Y(n30) );
  DLY1X1M U30 ( .A(sync_bus[1]), .Y(n31) );
  DLY1X1M U31 ( .A(sync_bus[6]), .Y(n32) );
  DLY1X1M U32 ( .A(sync_bus[0]), .Y(n33) );
  DLY1X1M U33 ( .A(sync_bus[4]), .Y(n34) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(n5), .SI(sync_bus[2]), .SE(n29), .CK(CLK), 
        .RN(n13), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[1]  ( .D(n3), .SI(n33), .SE(n29), .CK(CLK), .RN(n13), 
        .Q(sync_bus[1]) );
  SDFFRQX2M \flops_reg[0]  ( .D(bus_enable), .SI(enable_pulse), .SE(n26), .CK(
        CLK), .RN(n13), .Q(flops[0]) );
  SDFFRQX2M enable_flop_reg ( .D(flops[1]), .SI(test_si), .SE(n26), .CK(CLK), 
        .RN(n13), .Q(enable_flop) );
  SDFFRQX2M \sync_bus_reg[7]  ( .D(n9), .SI(n32), .SE(n22), .CK(CLK), .RN(n13), 
        .Q(sync_bus[7]) );
  SDFFRQX2M \sync_bus_reg[6]  ( .D(n8), .SI(n30), .SE(n21), .CK(CLK), .RN(n13), 
        .Q(sync_bus[6]) );
  SDFFRQX2M \sync_bus_reg[5]  ( .D(n7), .SI(n34), .SE(n22), .CK(CLK), .RN(n13), 
        .Q(sync_bus[5]) );
  SDFFRQX2M \sync_bus_reg[4]  ( .D(n6), .SI(sync_bus[3]), .SE(n21), .CK(CLK), 
        .RN(n13), .Q(sync_bus[4]) );
  SDFFRQX2M \sync_bus_reg[2]  ( .D(n4), .SI(n31), .SE(n28), .CK(CLK), .RN(n13), 
        .Q(sync_bus[2]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(n2), .SI(flops[1]), .SE(n28), .CK(CLK), 
        .RN(n13), .Q(sync_bus[0]) );
  SDFFRQX2M enable_pulse_reg ( .D(n15), .SI(enable_flop), .SE(n27), .CK(CLK), 
        .RN(n13), .Q(n16) );
endmodule


module B2G_encoder_0 ( binary, gray );
  input [3:0] binary;
  output [3:0] gray;


  CLKXOR2X2M U3 ( .A(binary[2]), .B(binary[1]), .Y(gray[1]) );
  CLKXOR2X2M U4 ( .A(binary[3]), .B(binary[2]), .Y(gray[2]) );
  CLKXOR2X2M U5 ( .A(binary[1]), .B(binary[0]), .Y(gray[0]) );
  BUFX2M U6 ( .A(binary[3]), .Y(gray[3]) );
endmodule


module B2G_encoder_1 ( binary, gray );
  input [3:0] binary;
  output [3:0] gray;
  wire   n2;

  CLKXOR2X2M U3 ( .A(binary[2]), .B(n2), .Y(gray[1]) );
  CLKXOR2X2M U4 ( .A(binary[3]), .B(binary[2]), .Y(gray[2]) );
  CLKXOR2X2M U5 ( .A(n2), .B(binary[0]), .Y(gray[0]) );
  BUFX2M U6 ( .A(binary[3]), .Y(gray[3]) );
  DLY1X1M U7 ( .A(binary[1]), .Y(n2) );
endmodule


module FIFO_RD_test_1 ( rinc, rclk, rrst_n, rq2_wptr, rptr_gray, rempty, raddr, 
        rptr, test_si, test_se );
  input [3:0] rq2_wptr;
  input [3:0] rptr_gray;
  output [2:0] raddr;
  output [3:0] rptr;
  input rinc, rclk, rrst_n, test_si, test_se;
  output rempty;
  wire   n22, n23, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n16, n21, n26, n27;

  INVXLM U3 ( .A(n23), .Y(n14) );
  INVX2M U4 ( .A(n14), .Y(rptr[0]) );
  INVXLM U5 ( .A(n22), .Y(n16) );
  INVX4M U6 ( .A(n16), .Y(rptr[2]) );
  BUFX2M U7 ( .A(rrst_n), .Y(n21) );
  INVX2M U8 ( .A(n1), .Y(rempty) );
  XNOR2X2M U9 ( .A(rq2_wptr[0]), .B(rptr_gray[0]), .Y(n7) );
  NOR2BX2M U10 ( .AN(rptr[0]), .B(n5), .Y(n4) );
  CLKXOR2X2M U11 ( .A(rptr[3]), .B(n2), .Y(n10) );
  NOR2BX2M U12 ( .AN(rptr[2]), .B(n3), .Y(n2) );
  NAND2X2M U13 ( .A(rptr[1]), .B(n4), .Y(n3) );
  CLKXOR2X2M U14 ( .A(rptr[1]), .B(n4), .Y(n12) );
  XNOR2X2M U15 ( .A(rptr[2]), .B(n3), .Y(n11) );
  NAND4X2M U16 ( .A(n6), .B(n7), .C(n8), .D(n9), .Y(n1) );
  XNOR2X2M U17 ( .A(rq2_wptr[3]), .B(rptr_gray[3]), .Y(n8) );
  XNOR2X2M U18 ( .A(rq2_wptr[2]), .B(rptr_gray[2]), .Y(n9) );
  XNOR2X2M U19 ( .A(rq2_wptr[1]), .B(rptr_gray[1]), .Y(n6) );
  NAND2X2M U20 ( .A(rinc), .B(n1), .Y(n5) );
  XNOR2X2M U21 ( .A(rptr[0]), .B(n5), .Y(n13) );
  BUFX4M U22 ( .A(rptr[2]), .Y(raddr[2]) );
  BUFX2M U23 ( .A(rptr[1]), .Y(raddr[1]) );
  BUFX2M U24 ( .A(rptr[0]), .Y(raddr[0]) );
  DLY1X1M U25 ( .A(test_se), .Y(n26) );
  DLY1X1M U26 ( .A(test_se), .Y(n27) );
  SDFFRQX2M \rptr_reg[3]  ( .D(n10), .SI(n22), .SE(n27), .CK(rclk), .RN(n21), 
        .Q(rptr[3]) );
  SDFFRQX2M \rptr_reg[2]  ( .D(n11), .SI(raddr[1]), .SE(n26), .CK(rclk), .RN(
        n21), .Q(n22) );
  SDFFRQX2M \rptr_reg[1]  ( .D(n12), .SI(raddr[0]), .SE(n27), .CK(rclk), .RN(
        n21), .Q(rptr[1]) );
  SDFFRQX2M \rptr_reg[0]  ( .D(n13), .SI(test_si), .SE(n26), .CK(rclk), .RN(
        n21), .Q(n23) );
endmodule


module FIFO_WR_test_1 ( winc, wclk, wrst_n, wq2_rptr, wptr_gray, wfull, waddr, 
        wptr, wclken, test_si2, test_si1, test_so1, test_se );
  input [3:0] wq2_rptr;
  input [3:0] wptr_gray;
  output [2:0] waddr;
  output [3:0] wptr;
  input winc, wclk, wrst_n, test_si2, test_si1, test_se;
  output wfull, wclken, test_so1;
  wire   n22, n23, n24, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14,
         n16, n21, n28, n29, n31, n32;

  INVXLM U3 ( .A(n24), .Y(n12) );
  INVX2M U4 ( .A(n12), .Y(wptr[0]) );
  INVXLM U5 ( .A(n22), .Y(n14) );
  INVX4M U6 ( .A(n14), .Y(wptr[2]) );
  INVXLM U7 ( .A(n32), .Y(n16) );
  INVX4M U8 ( .A(n16), .Y(wptr[1]) );
  BUFX2M U9 ( .A(wrst_n), .Y(n21) );
  NOR2BX4M U10 ( .AN(winc), .B(wfull), .Y(wclken) );
  XNOR2X2M U11 ( .A(wq2_rptr[0]), .B(wptr_gray[0]), .Y(n4) );
  CLKXOR2X2M U12 ( .A(wptr[3]), .B(n1), .Y(n8) );
  NOR2BX2M U13 ( .AN(wptr[2]), .B(n2), .Y(n1) );
  AND4X2M U14 ( .A(n4), .B(n5), .C(n6), .D(n7), .Y(wfull) );
  CLKXOR2X2M U15 ( .A(wq2_rptr[3]), .B(wptr_gray[3]), .Y(n7) );
  CLKXOR2X2M U16 ( .A(wq2_rptr[2]), .B(wptr_gray[2]), .Y(n6) );
  XNOR2X2M U17 ( .A(wq2_rptr[1]), .B(wptr_gray[1]), .Y(n5) );
  NAND2X2M U18 ( .A(wptr[1]), .B(n3), .Y(n2) );
  CLKXOR2X2M U19 ( .A(wptr[1]), .B(n3), .Y(n10) );
  XNOR2X2M U20 ( .A(wptr[2]), .B(n2), .Y(n9) );
  AND2X2M U21 ( .A(wptr[0]), .B(wclken), .Y(n3) );
  CLKXOR2X2M U22 ( .A(wptr[0]), .B(wclken), .Y(n11) );
  BUFX2M U23 ( .A(wptr[2]), .Y(waddr[2]) );
  BUFX4M U24 ( .A(wptr[1]), .Y(waddr[1]) );
  BUFX4M U25 ( .A(wptr[0]), .Y(waddr[0]) );
  SDFFRQX2M \wptr_reg[3]  ( .D(n8), .SI(waddr[2]), .SE(n29), .CK(wclk), .RN(
        n21), .Q(wptr[3]) );
  DLY1X1M U26 ( .A(test_se), .Y(n28) );
  DLY1X1M U27 ( .A(test_se), .Y(n29) );
  INVXLM U29 ( .A(n23), .Y(n31) );
  INVXLM U30 ( .A(n31), .Y(n32) );
  SDFFRQX2M \wptr_reg[2]  ( .D(n9), .SI(test_si2), .SE(n28), .CK(wclk), .RN(
        n21), .Q(n22) );
  SDFFRQX2M \wptr_reg[1]  ( .D(n10), .SI(waddr[0]), .SE(n29), .CK(wclk), .RN(
        n21), .Q(n23) );
  SDFFRQX2M \wptr_reg[0]  ( .D(n11), .SI(test_si1), .SE(n28), .CK(wclk), .RN(
        n21), .Q(n24) );
  BUFX2M U28 ( .A(n23), .Y(test_so1) );
endmodule


module FIFO_MEM_CTRL_test_1 ( wdata, wclken, waddr, wclk, raddr, rdata, wfull, 
        RST, test_si, test_so, test_se );
  input [7:0] wdata;
  input [2:0] waddr;
  input [2:0] raddr;
  output [7:0] rdata;
  input wclken, wclk, wfull, RST, test_si, test_se;
  output test_so;
  wire   N10, N11, N12, \write_reg[7][7] , \write_reg[7][6] ,
         \write_reg[7][5] , \write_reg[7][4] , \write_reg[7][3] ,
         \write_reg[7][2] , \write_reg[7][1] , \write_reg[7][0] ,
         \write_reg[6][7] , \write_reg[6][6] , \write_reg[6][5] ,
         \write_reg[6][4] , \write_reg[6][3] , \write_reg[6][2] ,
         \write_reg[6][1] , \write_reg[6][0] , \write_reg[5][7] ,
         \write_reg[5][6] , \write_reg[5][5] , \write_reg[5][4] ,
         \write_reg[5][3] , \write_reg[5][2] , \write_reg[5][1] ,
         \write_reg[5][0] , \write_reg[4][7] , \write_reg[4][6] ,
         \write_reg[4][5] , \write_reg[4][4] , \write_reg[4][3] ,
         \write_reg[4][2] , \write_reg[4][1] , \write_reg[4][0] ,
         \write_reg[3][7] , \write_reg[3][6] , \write_reg[3][5] ,
         \write_reg[3][4] , \write_reg[3][3] , \write_reg[3][2] ,
         \write_reg[3][1] , \write_reg[3][0] , \write_reg[2][7] ,
         \write_reg[2][6] , \write_reg[2][5] , \write_reg[2][4] ,
         \write_reg[2][3] , \write_reg[2][2] , \write_reg[2][1] ,
         \write_reg[2][0] , \write_reg[1][7] , \write_reg[1][6] ,
         \write_reg[1][5] , \write_reg[1][4] , \write_reg[1][3] ,
         \write_reg[1][2] , \write_reg[1][1] , \write_reg[1][0] ,
         \write_reg[0][7] , \write_reg[0][6] , \write_reg[0][5] ,
         \write_reg[0][4] , \write_reg[0][3] , \write_reg[0][2] ,
         \write_reg[0][1] , \write_reg[0][0] , n12, n17, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13,
         n14, n15, n16, n18, n19, n20, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign test_so = \write_reg[7][7] ;

  NOR2BX4M U2 ( .AN(wclken), .B(waddr[2]), .Y(n12) );
  INVX2M U3 ( .A(waddr[1]), .Y(n130) );
  INVX2M U4 ( .A(waddr[0]), .Y(n129) );
  BUFX6M U5 ( .A(n120), .Y(n117) );
  BUFX6M U6 ( .A(n119), .Y(n116) );
  BUFX6M U7 ( .A(n119), .Y(n115) );
  BUFX6M U8 ( .A(n120), .Y(n114) );
  BUFX6M U9 ( .A(RST), .Y(n113) );
  BUFX2M U10 ( .A(n119), .Y(n118) );
  INVX4M U11 ( .A(n2), .Y(n104) );
  INVX4M U12 ( .A(n2), .Y(n103) );
  INVX4M U13 ( .A(n1), .Y(n112) );
  INVX4M U14 ( .A(n1), .Y(n111) );
  BUFX2M U15 ( .A(n120), .Y(n119) );
  INVX4M U16 ( .A(n8), .Y(n110) );
  INVX4M U17 ( .A(n8), .Y(n109) );
  INVX4M U18 ( .A(n7), .Y(n108) );
  INVX4M U19 ( .A(n7), .Y(n107) );
  INVX4M U20 ( .A(n5), .Y(n106) );
  INVX4M U21 ( .A(n5), .Y(n105) );
  INVX4M U22 ( .A(n4), .Y(n98) );
  INVX4M U23 ( .A(n4), .Y(n97) );
  INVX4M U24 ( .A(n6), .Y(n102) );
  INVX4M U25 ( .A(n6), .Y(n101) );
  INVX4M U26 ( .A(n3), .Y(n100) );
  INVX4M U27 ( .A(n3), .Y(n99) );
  AND3X2M U28 ( .A(n129), .B(n130), .C(n12), .Y(n1) );
  AND3X2M U29 ( .A(n129), .B(n130), .C(n17), .Y(n2) );
  BUFX2M U30 ( .A(RST), .Y(n120) );
  AND2X2M U31 ( .A(waddr[2]), .B(wclken), .Y(n17) );
  AND3X2M U32 ( .A(waddr[1]), .B(n129), .C(n17), .Y(n3) );
  AND3X2M U33 ( .A(waddr[1]), .B(waddr[0]), .C(n17), .Y(n4) );
  AND3X2M U34 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n5) );
  AND3X2M U35 ( .A(waddr[0]), .B(n130), .C(n17), .Y(n6) );
  AND3X2M U36 ( .A(n12), .B(n129), .C(waddr[1]), .Y(n7) );
  AND3X2M U37 ( .A(n12), .B(n130), .C(waddr[0]), .Y(n8) );
  INVX6M U38 ( .A(n93), .Y(n92) );
  INVX6M U39 ( .A(n93), .Y(n91) );
  INVX4M U40 ( .A(n96), .Y(n95) );
  INVX4M U41 ( .A(n96), .Y(n94) );
  INVX4M U42 ( .A(wdata[0]), .Y(n121) );
  INVX4M U43 ( .A(wdata[1]), .Y(n122) );
  INVX4M U44 ( .A(wdata[2]), .Y(n123) );
  INVX4M U45 ( .A(wdata[3]), .Y(n124) );
  INVX4M U46 ( .A(wdata[4]), .Y(n125) );
  INVX4M U47 ( .A(wdata[5]), .Y(n126) );
  INVX4M U48 ( .A(wdata[6]), .Y(n127) );
  INVX4M U49 ( .A(wdata[7]), .Y(n128) );
  OAI2BB2X1M U50 ( .B0(n121), .B1(n110), .A0N(\write_reg[1][0] ), .A1N(n110), 
        .Y(n29) );
  OAI2BB2X1M U51 ( .B0(n122), .B1(n109), .A0N(\write_reg[1][1] ), .A1N(n109), 
        .Y(n30) );
  OAI2BB2X1M U52 ( .B0(n123), .B1(n110), .A0N(\write_reg[1][2] ), .A1N(n110), 
        .Y(n31) );
  OAI2BB2X1M U53 ( .B0(n124), .B1(n109), .A0N(\write_reg[1][3] ), .A1N(n109), 
        .Y(n32) );
  OAI2BB2X1M U54 ( .B0(n125), .B1(n110), .A0N(\write_reg[1][4] ), .A1N(n110), 
        .Y(n33) );
  OAI2BB2X1M U55 ( .B0(n126), .B1(n109), .A0N(\write_reg[1][5] ), .A1N(n109), 
        .Y(n34) );
  OAI2BB2X1M U56 ( .B0(n127), .B1(n110), .A0N(\write_reg[1][6] ), .A1N(n110), 
        .Y(n35) );
  OAI2BB2X1M U57 ( .B0(n128), .B1(n109), .A0N(\write_reg[1][7] ), .A1N(n109), 
        .Y(n36) );
  OAI2BB2X1M U58 ( .B0(n121), .B1(n108), .A0N(\write_reg[2][0] ), .A1N(n108), 
        .Y(n37) );
  OAI2BB2X1M U59 ( .B0(n122), .B1(n107), .A0N(\write_reg[2][1] ), .A1N(n107), 
        .Y(n38) );
  OAI2BB2X1M U60 ( .B0(n123), .B1(n108), .A0N(\write_reg[2][2] ), .A1N(n108), 
        .Y(n39) );
  OAI2BB2X1M U61 ( .B0(n124), .B1(n107), .A0N(\write_reg[2][3] ), .A1N(n107), 
        .Y(n40) );
  OAI2BB2X1M U62 ( .B0(n125), .B1(n108), .A0N(\write_reg[2][4] ), .A1N(n108), 
        .Y(n41) );
  OAI2BB2X1M U63 ( .B0(n126), .B1(n107), .A0N(\write_reg[2][5] ), .A1N(n107), 
        .Y(n42) );
  OAI2BB2X1M U64 ( .B0(n127), .B1(n108), .A0N(\write_reg[2][6] ), .A1N(n108), 
        .Y(n43) );
  OAI2BB2X1M U65 ( .B0(n128), .B1(n107), .A0N(\write_reg[2][7] ), .A1N(n107), 
        .Y(n44) );
  OAI2BB2X1M U66 ( .B0(n121), .B1(n106), .A0N(\write_reg[3][0] ), .A1N(n106), 
        .Y(n45) );
  OAI2BB2X1M U67 ( .B0(n122), .B1(n105), .A0N(\write_reg[3][1] ), .A1N(n105), 
        .Y(n46) );
  OAI2BB2X1M U68 ( .B0(n123), .B1(n106), .A0N(\write_reg[3][2] ), .A1N(n106), 
        .Y(n47) );
  OAI2BB2X1M U69 ( .B0(n124), .B1(n105), .A0N(\write_reg[3][3] ), .A1N(n105), 
        .Y(n48) );
  OAI2BB2X1M U70 ( .B0(n125), .B1(n106), .A0N(\write_reg[3][4] ), .A1N(n106), 
        .Y(n49) );
  OAI2BB2X1M U71 ( .B0(n126), .B1(n105), .A0N(\write_reg[3][5] ), .A1N(n105), 
        .Y(n50) );
  OAI2BB2X1M U72 ( .B0(n127), .B1(n106), .A0N(\write_reg[3][6] ), .A1N(n106), 
        .Y(n51) );
  OAI2BB2X1M U73 ( .B0(n128), .B1(n105), .A0N(\write_reg[3][7] ), .A1N(n105), 
        .Y(n52) );
  OAI2BB2X1M U74 ( .B0(n121), .B1(n104), .A0N(\write_reg[4][0] ), .A1N(n104), 
        .Y(n53) );
  OAI2BB2X1M U75 ( .B0(n122), .B1(n103), .A0N(\write_reg[4][1] ), .A1N(n103), 
        .Y(n54) );
  OAI2BB2X1M U76 ( .B0(n123), .B1(n104), .A0N(\write_reg[4][2] ), .A1N(n104), 
        .Y(n55) );
  OAI2BB2X1M U77 ( .B0(n124), .B1(n103), .A0N(\write_reg[4][3] ), .A1N(n103), 
        .Y(n56) );
  OAI2BB2X1M U78 ( .B0(n125), .B1(n104), .A0N(\write_reg[4][4] ), .A1N(n104), 
        .Y(n57) );
  OAI2BB2X1M U79 ( .B0(n126), .B1(n103), .A0N(\write_reg[4][5] ), .A1N(n103), 
        .Y(n58) );
  OAI2BB2X1M U80 ( .B0(n127), .B1(n104), .A0N(\write_reg[4][6] ), .A1N(n104), 
        .Y(n59) );
  OAI2BB2X1M U81 ( .B0(n128), .B1(n103), .A0N(\write_reg[4][7] ), .A1N(n103), 
        .Y(n60) );
  OAI2BB2X1M U82 ( .B0(n121), .B1(n102), .A0N(\write_reg[5][0] ), .A1N(n102), 
        .Y(n61) );
  OAI2BB2X1M U83 ( .B0(n122), .B1(n101), .A0N(\write_reg[5][1] ), .A1N(n101), 
        .Y(n62) );
  OAI2BB2X1M U84 ( .B0(n123), .B1(n102), .A0N(\write_reg[5][2] ), .A1N(n102), 
        .Y(n63) );
  OAI2BB2X1M U85 ( .B0(n124), .B1(n101), .A0N(\write_reg[5][3] ), .A1N(n101), 
        .Y(n64) );
  OAI2BB2X1M U86 ( .B0(n125), .B1(n102), .A0N(\write_reg[5][4] ), .A1N(n102), 
        .Y(n65) );
  OAI2BB2X1M U87 ( .B0(n126), .B1(n101), .A0N(\write_reg[5][5] ), .A1N(n101), 
        .Y(n66) );
  OAI2BB2X1M U88 ( .B0(n127), .B1(n102), .A0N(\write_reg[5][6] ), .A1N(n102), 
        .Y(n67) );
  OAI2BB2X1M U89 ( .B0(n128), .B1(n101), .A0N(\write_reg[5][7] ), .A1N(n101), 
        .Y(n68) );
  OAI2BB2X1M U90 ( .B0(n121), .B1(n100), .A0N(\write_reg[6][0] ), .A1N(n100), 
        .Y(n69) );
  OAI2BB2X1M U91 ( .B0(n122), .B1(n99), .A0N(\write_reg[6][1] ), .A1N(n99), 
        .Y(n70) );
  OAI2BB2X1M U92 ( .B0(n123), .B1(n100), .A0N(\write_reg[6][2] ), .A1N(n100), 
        .Y(n71) );
  OAI2BB2X1M U93 ( .B0(n124), .B1(n99), .A0N(\write_reg[6][3] ), .A1N(n99), 
        .Y(n72) );
  OAI2BB2X1M U94 ( .B0(n125), .B1(n100), .A0N(\write_reg[6][4] ), .A1N(n100), 
        .Y(n73) );
  OAI2BB2X1M U95 ( .B0(n126), .B1(n99), .A0N(\write_reg[6][5] ), .A1N(n99), 
        .Y(n74) );
  OAI2BB2X1M U96 ( .B0(n127), .B1(n100), .A0N(\write_reg[6][6] ), .A1N(n100), 
        .Y(n75) );
  OAI2BB2X1M U97 ( .B0(n128), .B1(n99), .A0N(\write_reg[6][7] ), .A1N(n99), 
        .Y(n76) );
  OAI2BB2X1M U98 ( .B0(n121), .B1(n98), .A0N(\write_reg[7][0] ), .A1N(n98), 
        .Y(n77) );
  OAI2BB2X1M U99 ( .B0(n122), .B1(n97), .A0N(\write_reg[7][1] ), .A1N(n97), 
        .Y(n78) );
  OAI2BB2X1M U100 ( .B0(n123), .B1(n98), .A0N(\write_reg[7][2] ), .A1N(n98), 
        .Y(n79) );
  OAI2BB2X1M U101 ( .B0(n124), .B1(n97), .A0N(\write_reg[7][3] ), .A1N(n97), 
        .Y(n80) );
  OAI2BB2X1M U102 ( .B0(n125), .B1(n98), .A0N(\write_reg[7][4] ), .A1N(n98), 
        .Y(n81) );
  OAI2BB2X1M U103 ( .B0(n126), .B1(n97), .A0N(\write_reg[7][5] ), .A1N(n97), 
        .Y(n82) );
  OAI2BB2X1M U104 ( .B0(n127), .B1(n98), .A0N(\write_reg[7][6] ), .A1N(n98), 
        .Y(n83) );
  OAI2BB2X1M U105 ( .B0(n128), .B1(n97), .A0N(\write_reg[7][7] ), .A1N(n97), 
        .Y(n84) );
  OAI2BB2X1M U106 ( .B0(n112), .B1(n121), .A0N(\write_reg[0][0] ), .A1N(n112), 
        .Y(n21) );
  OAI2BB2X1M U107 ( .B0(n111), .B1(n122), .A0N(\write_reg[0][1] ), .A1N(n111), 
        .Y(n22) );
  OAI2BB2X1M U108 ( .B0(n112), .B1(n123), .A0N(\write_reg[0][2] ), .A1N(n112), 
        .Y(n23) );
  OAI2BB2X1M U109 ( .B0(n111), .B1(n124), .A0N(\write_reg[0][3] ), .A1N(n111), 
        .Y(n24) );
  OAI2BB2X1M U110 ( .B0(n112), .B1(n125), .A0N(\write_reg[0][4] ), .A1N(n112), 
        .Y(n25) );
  OAI2BB2X1M U111 ( .B0(n111), .B1(n126), .A0N(\write_reg[0][5] ), .A1N(n111), 
        .Y(n26) );
  OAI2BB2X1M U112 ( .B0(n112), .B1(n127), .A0N(\write_reg[0][6] ), .A1N(n112), 
        .Y(n27) );
  OAI2BB2X1M U113 ( .B0(n111), .B1(n128), .A0N(\write_reg[0][7] ), .A1N(n111), 
        .Y(n28) );
  MX2X2M U114 ( .A(n10), .B(n9), .S0(N12), .Y(rdata[0]) );
  MX4X1M U115 ( .A(\write_reg[4][0] ), .B(\write_reg[5][0] ), .C(
        \write_reg[6][0] ), .D(\write_reg[7][0] ), .S0(n91), .S1(n94), .Y(n9)
         );
  MX4X1M U116 ( .A(\write_reg[0][0] ), .B(\write_reg[1][0] ), .C(
        \write_reg[2][0] ), .D(\write_reg[3][0] ), .S0(n92), .S1(n95), .Y(n10)
         );
  MX2X2M U117 ( .A(n13), .B(n11), .S0(N12), .Y(rdata[1]) );
  MX4X1M U118 ( .A(\write_reg[4][1] ), .B(\write_reg[5][1] ), .C(
        \write_reg[6][1] ), .D(\write_reg[7][1] ), .S0(n91), .S1(n94), .Y(n11)
         );
  MX4X1M U119 ( .A(\write_reg[0][1] ), .B(\write_reg[1][1] ), .C(
        \write_reg[2][1] ), .D(\write_reg[3][1] ), .S0(n92), .S1(n95), .Y(n13)
         );
  MX2X2M U120 ( .A(n15), .B(n14), .S0(N12), .Y(rdata[2]) );
  MX4X1M U121 ( .A(\write_reg[4][2] ), .B(\write_reg[5][2] ), .C(
        \write_reg[6][2] ), .D(\write_reg[7][2] ), .S0(n91), .S1(n94), .Y(n14)
         );
  MX4X1M U122 ( .A(\write_reg[0][2] ), .B(\write_reg[1][2] ), .C(
        \write_reg[2][2] ), .D(\write_reg[3][2] ), .S0(n92), .S1(n95), .Y(n15)
         );
  MX2X2M U123 ( .A(n18), .B(n16), .S0(N12), .Y(rdata[3]) );
  MX4X1M U124 ( .A(\write_reg[4][3] ), .B(\write_reg[5][3] ), .C(
        \write_reg[6][3] ), .D(\write_reg[7][3] ), .S0(n91), .S1(n94), .Y(n16)
         );
  MX4X1M U125 ( .A(\write_reg[0][3] ), .B(\write_reg[1][3] ), .C(
        \write_reg[2][3] ), .D(\write_reg[3][3] ), .S0(n92), .S1(n95), .Y(n18)
         );
  MX2X2M U126 ( .A(n20), .B(n19), .S0(N12), .Y(rdata[4]) );
  MX4X1M U127 ( .A(\write_reg[4][4] ), .B(\write_reg[5][4] ), .C(
        \write_reg[6][4] ), .D(\write_reg[7][4] ), .S0(n91), .S1(n94), .Y(n19)
         );
  MX4X1M U128 ( .A(\write_reg[0][4] ), .B(\write_reg[1][4] ), .C(
        \write_reg[2][4] ), .D(\write_reg[3][4] ), .S0(n92), .S1(n95), .Y(n20)
         );
  MX2X2M U129 ( .A(n86), .B(n85), .S0(N12), .Y(rdata[5]) );
  MX4X1M U130 ( .A(\write_reg[4][5] ), .B(\write_reg[5][5] ), .C(
        \write_reg[6][5] ), .D(\write_reg[7][5] ), .S0(n91), .S1(n94), .Y(n85)
         );
  MX4X1M U131 ( .A(\write_reg[0][5] ), .B(\write_reg[1][5] ), .C(
        \write_reg[2][5] ), .D(\write_reg[3][5] ), .S0(n92), .S1(n95), .Y(n86)
         );
  MX2X2M U132 ( .A(n88), .B(n87), .S0(N12), .Y(rdata[6]) );
  MX4X1M U133 ( .A(\write_reg[4][6] ), .B(\write_reg[5][6] ), .C(
        \write_reg[6][6] ), .D(\write_reg[7][6] ), .S0(n91), .S1(n94), .Y(n87)
         );
  MX4X1M U134 ( .A(\write_reg[0][6] ), .B(\write_reg[1][6] ), .C(
        \write_reg[2][6] ), .D(\write_reg[3][6] ), .S0(n92), .S1(n95), .Y(n88)
         );
  MX2X2M U135 ( .A(n90), .B(n89), .S0(N12), .Y(rdata[7]) );
  MX4X1M U136 ( .A(\write_reg[4][7] ), .B(\write_reg[5][7] ), .C(
        \write_reg[6][7] ), .D(\write_reg[7][7] ), .S0(n91), .S1(n94), .Y(n89)
         );
  MX4X1M U137 ( .A(\write_reg[0][7] ), .B(\write_reg[1][7] ), .C(
        \write_reg[2][7] ), .D(\write_reg[3][7] ), .S0(n92), .S1(n95), .Y(n90)
         );
  INVX2M U138 ( .A(N11), .Y(n96) );
  INVX2M U139 ( .A(N10), .Y(n93) );
  SDFFRQX2M \write_reg_reg[5][7]  ( .D(n68), .SI(\write_reg[5][6] ), .SE(n150), 
        .CK(wclk), .RN(n114), .Q(\write_reg[5][7] ) );
  SDFFRQX2M \write_reg_reg[5][6]  ( .D(n67), .SI(\write_reg[5][5] ), .SE(n160), 
        .CK(wclk), .RN(n114), .Q(\write_reg[5][6] ) );
  SDFFRQX2M \write_reg_reg[5][5]  ( .D(n66), .SI(\write_reg[5][4] ), .SE(n160), 
        .CK(wclk), .RN(n114), .Q(\write_reg[5][5] ) );
  SDFFRQX2M \write_reg_reg[5][4]  ( .D(n65), .SI(\write_reg[5][3] ), .SE(n187), 
        .CK(wclk), .RN(n114), .Q(\write_reg[5][4] ) );
  SDFFRQX2M \write_reg_reg[5][3]  ( .D(n64), .SI(\write_reg[5][2] ), .SE(n149), 
        .CK(wclk), .RN(n114), .Q(\write_reg[5][3] ) );
  SDFFRQX2M \write_reg_reg[5][2]  ( .D(n63), .SI(\write_reg[5][1] ), .SE(n149), 
        .CK(wclk), .RN(n114), .Q(\write_reg[5][2] ) );
  SDFFRQX2M \write_reg_reg[5][1]  ( .D(n62), .SI(\write_reg[5][0] ), .SE(n159), 
        .CK(wclk), .RN(n114), .Q(\write_reg[5][1] ) );
  SDFFRQX2M \write_reg_reg[5][0]  ( .D(n61), .SI(\write_reg[4][7] ), .SE(n159), 
        .CK(wclk), .RN(n114), .Q(\write_reg[5][0] ) );
  SDFFRQX2M \write_reg_reg[1][7]  ( .D(n36), .SI(\write_reg[1][6] ), .SE(n154), 
        .CK(wclk), .RN(n117), .Q(\write_reg[1][7] ) );
  SDFFRQX2M \write_reg_reg[1][6]  ( .D(n35), .SI(\write_reg[1][5] ), .SE(n175), 
        .CK(wclk), .RN(n117), .Q(\write_reg[1][6] ) );
  SDFFRQX2M \write_reg_reg[1][5]  ( .D(n34), .SI(\write_reg[1][4] ), .SE(n172), 
        .CK(wclk), .RN(n117), .Q(\write_reg[1][5] ) );
  SDFFRQX2M \write_reg_reg[1][4]  ( .D(n33), .SI(\write_reg[1][3] ), .SE(n143), 
        .CK(wclk), .RN(n117), .Q(\write_reg[1][4] ) );
  SDFFRQX2M \write_reg_reg[1][3]  ( .D(n32), .SI(\write_reg[1][2] ), .SE(n140), 
        .CK(wclk), .RN(n117), .Q(\write_reg[1][3] ) );
  SDFFRQX2M \write_reg_reg[1][1]  ( .D(n30), .SI(\write_reg[1][0] ), .SE(n141), 
        .CK(wclk), .RN(n117), .Q(\write_reg[1][1] ) );
  SDFFRQX2M \write_reg_reg[1][0]  ( .D(n29), .SI(\write_reg[0][7] ), .SE(n142), 
        .CK(wclk), .RN(n117), .Q(\write_reg[1][0] ) );
  SDFFRQX2M \write_reg_reg[7][7]  ( .D(n84), .SI(\write_reg[7][6] ), .SE(n163), 
        .CK(wclk), .RN(n113), .Q(\write_reg[7][7] ) );
  SDFFRQX2M \write_reg_reg[7][6]  ( .D(n83), .SI(\write_reg[7][5] ), .SE(n163), 
        .CK(wclk), .RN(n113), .Q(\write_reg[7][6] ) );
  SDFFRQX2M \write_reg_reg[7][5]  ( .D(n82), .SI(\write_reg[7][4] ), .SE(n194), 
        .CK(wclk), .RN(n113), .Q(\write_reg[7][5] ) );
  SDFFRQX2M \write_reg_reg[7][4]  ( .D(n81), .SI(\write_reg[7][3] ), .SE(n153), 
        .CK(wclk), .RN(n113), .Q(\write_reg[7][4] ) );
  SDFFRQX2M \write_reg_reg[7][3]  ( .D(n80), .SI(\write_reg[7][2] ), .SE(n153), 
        .CK(wclk), .RN(n113), .Q(\write_reg[7][3] ) );
  SDFFRQX2M \write_reg_reg[7][2]  ( .D(n79), .SI(\write_reg[7][1] ), .SE(n152), 
        .CK(wclk), .RN(n113), .Q(\write_reg[7][2] ) );
  SDFFRQX2M \write_reg_reg[7][1]  ( .D(n78), .SI(\write_reg[7][0] ), .SE(n152), 
        .CK(wclk), .RN(n113), .Q(\write_reg[7][1] ) );
  SDFFRQX2M \write_reg_reg[7][0]  ( .D(n77), .SI(\write_reg[6][7] ), .SE(n162), 
        .CK(wclk), .RN(n113), .Q(\write_reg[7][0] ) );
  SDFFRQX2M \write_reg_reg[3][7]  ( .D(n52), .SI(\write_reg[3][6] ), .SE(n157), 
        .CK(wclk), .RN(n115), .Q(\write_reg[3][7] ) );
  SDFFRQX2M \write_reg_reg[3][6]  ( .D(n51), .SI(\write_reg[3][5] ), .SE(n157), 
        .CK(wclk), .RN(n115), .Q(\write_reg[3][6] ) );
  SDFFRQX2M \write_reg_reg[3][5]  ( .D(n50), .SI(\write_reg[3][4] ), .SE(n181), 
        .CK(wclk), .RN(n115), .Q(\write_reg[3][5] ) );
  SDFFRQX2M \write_reg_reg[3][4]  ( .D(n49), .SI(\write_reg[3][3] ), .SE(n146), 
        .CK(wclk), .RN(n115), .Q(\write_reg[3][4] ) );
  SDFFRQX2M \write_reg_reg[3][3]  ( .D(n48), .SI(\write_reg[3][2] ), .SE(n146), 
        .CK(wclk), .RN(n116), .Q(\write_reg[3][3] ) );
  SDFFRQX2M \write_reg_reg[3][2]  ( .D(n47), .SI(\write_reg[3][1] ), .SE(n156), 
        .CK(wclk), .RN(n116), .Q(\write_reg[3][2] ) );
  SDFFRQX2M \write_reg_reg[3][1]  ( .D(n46), .SI(\write_reg[3][0] ), .SE(n156), 
        .CK(wclk), .RN(n116), .Q(\write_reg[3][1] ) );
  SDFFRQX2M \write_reg_reg[3][0]  ( .D(n45), .SI(\write_reg[2][7] ), .SE(n179), 
        .CK(wclk), .RN(n116), .Q(\write_reg[3][0] ) );
  SDFFRQX2M \write_reg_reg[6][7]  ( .D(n76), .SI(\write_reg[6][6] ), .SE(n162), 
        .CK(wclk), .RN(n113), .Q(\write_reg[6][7] ) );
  SDFFRQX2M \write_reg_reg[6][6]  ( .D(n75), .SI(\write_reg[6][5] ), .SE(n191), 
        .CK(wclk), .RN(n113), .Q(\write_reg[6][6] ) );
  SDFFRQX2M \write_reg_reg[6][5]  ( .D(n74), .SI(\write_reg[6][4] ), .SE(n151), 
        .CK(wclk), .RN(n113), .Q(\write_reg[6][5] ) );
  SDFFRQX2M \write_reg_reg[6][4]  ( .D(n73), .SI(\write_reg[6][3] ), .SE(n151), 
        .CK(wclk), .RN(n113), .Q(\write_reg[6][4] ) );
  SDFFRQX2M \write_reg_reg[6][3]  ( .D(n72), .SI(\write_reg[6][2] ), .SE(n161), 
        .CK(wclk), .RN(n114), .Q(\write_reg[6][3] ) );
  SDFFRQX2M \write_reg_reg[6][2]  ( .D(n71), .SI(\write_reg[6][1] ), .SE(n161), 
        .CK(wclk), .RN(n114), .Q(\write_reg[6][2] ) );
  SDFFRQX2M \write_reg_reg[6][1]  ( .D(n70), .SI(\write_reg[6][0] ), .SE(n189), 
        .CK(wclk), .RN(n114), .Q(\write_reg[6][1] ) );
  SDFFRQX2M \write_reg_reg[6][0]  ( .D(n69), .SI(\write_reg[5][7] ), .SE(n150), 
        .CK(wclk), .RN(n114), .Q(\write_reg[6][0] ) );
  SDFFRQX2M \write_reg_reg[2][7]  ( .D(n44), .SI(\write_reg[2][6] ), .SE(n145), 
        .CK(wclk), .RN(n116), .Q(\write_reg[2][7] ) );
  SDFFRQX2M \write_reg_reg[2][6]  ( .D(n43), .SI(\write_reg[2][5] ), .SE(n145), 
        .CK(wclk), .RN(n116), .Q(\write_reg[2][6] ) );
  SDFFRQX2M \write_reg_reg[2][5]  ( .D(n42), .SI(\write_reg[2][4] ), .SE(n155), 
        .CK(wclk), .RN(n116), .Q(\write_reg[2][5] ) );
  SDFFRQX2M \write_reg_reg[2][4]  ( .D(n41), .SI(\write_reg[2][3] ), .SE(n155), 
        .CK(wclk), .RN(n116), .Q(\write_reg[2][4] ) );
  SDFFRQX2M \write_reg_reg[2][3]  ( .D(n40), .SI(\write_reg[2][2] ), .SE(n177), 
        .CK(wclk), .RN(n116), .Q(\write_reg[2][3] ) );
  SDFFRQX2M \write_reg_reg[2][2]  ( .D(n39), .SI(\write_reg[2][1] ), .SE(n144), 
        .CK(wclk), .RN(n116), .Q(\write_reg[2][2] ) );
  SDFFRQX2M \write_reg_reg[2][1]  ( .D(n38), .SI(\write_reg[2][0] ), .SE(n144), 
        .CK(wclk), .RN(n116), .Q(\write_reg[2][1] ) );
  SDFFRQX2M \write_reg_reg[2][0]  ( .D(n37), .SI(\write_reg[1][7] ), .SE(n154), 
        .CK(wclk), .RN(n116), .Q(\write_reg[2][0] ) );
  SDFFRQX2M \write_reg_reg[4][7]  ( .D(n60), .SI(\write_reg[4][6] ), .SE(n185), 
        .CK(wclk), .RN(n115), .Q(\write_reg[4][7] ) );
  SDFFRQX2M \write_reg_reg[4][6]  ( .D(n59), .SI(\write_reg[4][5] ), .SE(n148), 
        .CK(wclk), .RN(n115), .Q(\write_reg[4][6] ) );
  SDFFRQX2M \write_reg_reg[4][5]  ( .D(n58), .SI(\write_reg[4][4] ), .SE(n148), 
        .CK(wclk), .RN(n115), .Q(\write_reg[4][5] ) );
  SDFFRQX2M \write_reg_reg[4][4]  ( .D(n57), .SI(\write_reg[4][3] ), .SE(n158), 
        .CK(wclk), .RN(n115), .Q(\write_reg[4][4] ) );
  SDFFRQX2M \write_reg_reg[4][3]  ( .D(n56), .SI(\write_reg[4][2] ), .SE(n158), 
        .CK(wclk), .RN(n115), .Q(\write_reg[4][3] ) );
  SDFFRQX2M \write_reg_reg[4][2]  ( .D(n55), .SI(\write_reg[4][1] ), .SE(n183), 
        .CK(wclk), .RN(n115), .Q(\write_reg[4][2] ) );
  SDFFRQX2M \write_reg_reg[4][1]  ( .D(n54), .SI(\write_reg[4][0] ), .SE(n147), 
        .CK(wclk), .RN(n115), .Q(\write_reg[4][1] ) );
  SDFFRQX2M \write_reg_reg[4][0]  ( .D(n53), .SI(\write_reg[3][7] ), .SE(n147), 
        .CK(wclk), .RN(n115), .Q(\write_reg[4][0] ) );
  SDFFRQX2M \write_reg_reg[0][7]  ( .D(n28), .SI(\write_reg[0][6] ), .SE(n141), 
        .CK(wclk), .RN(n117), .Q(\write_reg[0][7] ) );
  SDFFRQX2M \write_reg_reg[0][6]  ( .D(n27), .SI(\write_reg[0][5] ), .SE(n143), 
        .CK(wclk), .RN(n117), .Q(\write_reg[0][6] ) );
  SDFFRQX2M \write_reg_reg[0][5]  ( .D(n26), .SI(\write_reg[0][4] ), .SE(n142), 
        .CK(wclk), .RN(n117), .Q(\write_reg[0][5] ) );
  SDFFRQX2M \write_reg_reg[0][4]  ( .D(n25), .SI(\write_reg[0][3] ), .SE(n137), 
        .CK(wclk), .RN(n117), .Q(\write_reg[0][4] ) );
  SDFFRQX2M \write_reg_reg[0][3]  ( .D(n24), .SI(\write_reg[0][2] ), .SE(n139), 
        .CK(wclk), .RN(n118), .Q(\write_reg[0][3] ) );
  SDFFRQX2M \write_reg_reg[0][1]  ( .D(n22), .SI(\write_reg[0][0] ), .SE(n139), 
        .CK(wclk), .RN(n118), .Q(\write_reg[0][1] ) );
  SDFFRQX2M \write_reg_reg[0][0]  ( .D(n21), .SI(test_si), .SE(n140), .CK(wclk), .RN(n118), .Q(\write_reg[0][0] ) );
  DLY1X1M U140 ( .A(n164), .Y(n133) );
  DLY1X1M U141 ( .A(n165), .Y(n134) );
  DLY1X1M U142 ( .A(n166), .Y(n135) );
  DLY1X1M U143 ( .A(test_se), .Y(n136) );
  DLY1X1M U144 ( .A(n170), .Y(n137) );
  DLY1X1M U145 ( .A(n173), .Y(n138) );
  DLY1X1M U146 ( .A(n168), .Y(n139) );
  DLY1X1M U147 ( .A(n169), .Y(n140) );
  DLY1X1M U148 ( .A(n171), .Y(n141) );
  DLY1X1M U149 ( .A(n135), .Y(n142) );
  DLY1X1M U150 ( .A(n174), .Y(n143) );
  DLY1X1M U151 ( .A(n176), .Y(n144) );
  DLY1X1M U152 ( .A(n178), .Y(n145) );
  DLY1X1M U153 ( .A(n180), .Y(n146) );
  DLY1X1M U154 ( .A(n182), .Y(n147) );
  DLY1X1M U155 ( .A(n184), .Y(n148) );
  DLY1X1M U156 ( .A(n186), .Y(n149) );
  DLY1X1M U157 ( .A(n188), .Y(n150) );
  DLY1X1M U158 ( .A(n190), .Y(n151) );
  DLY1X1M U159 ( .A(n192), .Y(n152) );
  DLY1X1M U160 ( .A(n193), .Y(n153) );
  DLY1X1M U161 ( .A(n175), .Y(n154) );
  DLY1X1M U162 ( .A(n177), .Y(n155) );
  DLY1X1M U163 ( .A(n179), .Y(n156) );
  DLY1X1M U164 ( .A(n181), .Y(n157) );
  DLY1X1M U165 ( .A(n183), .Y(n158) );
  DLY1X1M U166 ( .A(n185), .Y(n159) );
  DLY1X1M U167 ( .A(n187), .Y(n160) );
  DLY1X1M U168 ( .A(n189), .Y(n161) );
  DLY1X1M U169 ( .A(n191), .Y(n162) );
  DLY1X1M U170 ( .A(n194), .Y(n163) );
  DLY1X1M U171 ( .A(test_se), .Y(n164) );
  DLY1X1M U172 ( .A(n136), .Y(n165) );
  DLY1X1M U173 ( .A(n136), .Y(n166) );
  DLY1X1M U174 ( .A(n166), .Y(n167) );
  DLY1X1M U175 ( .A(n134), .Y(n168) );
  DLY1X1M U176 ( .A(n133), .Y(n169) );
  DLY1X1M U177 ( .A(n165), .Y(n170) );
  DLY1X1M U178 ( .A(n133), .Y(n171) );
  DLY1X1M U179 ( .A(n135), .Y(n172) );
  DLY1X1M U180 ( .A(n164), .Y(n173) );
  DLY1X1M U181 ( .A(n134), .Y(n174) );
  DLY1X1M U182 ( .A(n137), .Y(n175) );
  DLY1X1M U183 ( .A(n172), .Y(n176) );
  DLY1X1M U184 ( .A(n176), .Y(n177) );
  DLY1X1M U185 ( .A(n174), .Y(n178) );
  DLY1X1M U186 ( .A(n178), .Y(n179) );
  DLY1X1M U187 ( .A(n168), .Y(n180) );
  DLY1X1M U188 ( .A(n180), .Y(n181) );
  DLY1X1M U189 ( .A(n170), .Y(n182) );
  DLY1X1M U190 ( .A(n182), .Y(n183) );
  DLY1X1M U191 ( .A(n171), .Y(n184) );
  DLY1X1M U192 ( .A(n184), .Y(n185) );
  DLY1X1M U193 ( .A(n167), .Y(n186) );
  DLY1X1M U194 ( .A(n186), .Y(n187) );
  DLY1X1M U195 ( .A(n169), .Y(n188) );
  DLY1X1M U196 ( .A(n188), .Y(n189) );
  DLY1X1M U197 ( .A(n138), .Y(n190) );
  DLY1X1M U198 ( .A(n190), .Y(n191) );
  DLY1X1M U199 ( .A(n173), .Y(n192) );
  DLY1X1M U200 ( .A(n192), .Y(n193) );
  DLY1X1M U201 ( .A(n193), .Y(n194) );
  SDFFRQX2M \write_reg_reg[1][2]  ( .D(n31), .SI(\write_reg[1][1] ), .SE(n138), 
        .CK(wclk), .RN(n117), .Q(\write_reg[1][2] ) );
  SDFFRQX2M \write_reg_reg[0][2]  ( .D(n23), .SI(\write_reg[0][1] ), .SE(n167), 
        .CK(wclk), .RN(n118), .Q(\write_reg[0][2] ) );
endmodule


module DF_SYNC_test_1 ( CLK, RST, ASYNC, SYNC, test_si, test_se );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST, test_si, test_se;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] , n1, n2, n5, n6, n7, n8, n9, n10, n11;

  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
  SDFFRQX2M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .SI(\sync_reg[3][0] ), 
        .SE(n7), .CK(CLK), .RN(n1), .Q(SYNC[3]) );
  SDFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .SI(\sync_reg[2][0] ), 
        .SE(n11), .CK(CLK), .RN(n1), .Q(SYNC[2]) );
  SDFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .SI(\sync_reg[1][0] ), 
        .SE(n6), .CK(CLK), .RN(n1), .Q(SYNC[1]) );
  SDFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .SI(\sync_reg[0][0] ), 
        .SE(n10), .CK(CLK), .RN(n1), .Q(SYNC[0]) );
  SDFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .SI(SYNC[2]), .SE(n6), .CK(
        CLK), .RN(n1), .Q(\sync_reg[3][0] ) );
  SDFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .SI(SYNC[1]), .SE(n7), .CK(
        CLK), .RN(n1), .Q(\sync_reg[2][0] ) );
  SDFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .SI(SYNC[0]), .SE(n11), .CK(
        CLK), .RN(n1), .Q(\sync_reg[1][0] ) );
  DLY1X1M U5 ( .A(n8), .Y(n5) );
  DLY1X1M U6 ( .A(n9), .Y(n6) );
  DLY1X1M U7 ( .A(n10), .Y(n7) );
  DLY1X1M U8 ( .A(test_se), .Y(n8) );
  DLY1X1M U9 ( .A(n8), .Y(n9) );
  DLY1X1M U10 ( .A(n5), .Y(n10) );
  DLY1X1M U11 ( .A(n5), .Y(n11) );
  SDFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .SI(test_si), .SE(n9), .CK(
        CLK), .RN(n1), .Q(\sync_reg[0][0] ) );
endmodule


module DF_SYNC_test_0 ( CLK, RST, ASYNC, SYNC, test_si, test_se );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST, test_si, test_se;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] , n1, n2, n5, n6, n7, n8, n9, n10, n11;

  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
  SDFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .SI(\sync_reg[1][0] ), 
        .SE(n6), .CK(CLK), .RN(n1), .Q(SYNC[1]) );
  SDFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .SI(\sync_reg[0][0] ), 
        .SE(n10), .CK(CLK), .RN(n1), .Q(SYNC[0]) );
  SDFFRQX2M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .SI(\sync_reg[3][0] ), 
        .SE(n7), .CK(CLK), .RN(n1), .Q(SYNC[3]) );
  SDFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .SI(\sync_reg[2][0] ), 
        .SE(n11), .CK(CLK), .RN(n1), .Q(SYNC[2]) );
  SDFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .SI(SYNC[2]), .SE(n6), .CK(
        CLK), .RN(n1), .Q(\sync_reg[3][0] ) );
  SDFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .SI(SYNC[1]), .SE(n7), .CK(
        CLK), .RN(n1), .Q(\sync_reg[2][0] ) );
  SDFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .SI(SYNC[0]), .SE(n11), .CK(
        CLK), .RN(n1), .Q(\sync_reg[1][0] ) );
  SDFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .SI(test_si), .SE(n9), .CK(
        CLK), .RN(n1), .Q(\sync_reg[0][0] ) );
  DLY1X1M U5 ( .A(n8), .Y(n5) );
  DLY1X1M U6 ( .A(n9), .Y(n6) );
  DLY1X1M U7 ( .A(n10), .Y(n7) );
  DLY1X1M U8 ( .A(test_se), .Y(n8) );
  DLY1X1M U9 ( .A(n8), .Y(n9) );
  DLY1X1M U10 ( .A(n5), .Y(n10) );
  DLY1X1M U11 ( .A(n5), .Y(n11) );
endmodule


module FIFO_top_test_1 ( wdata, winc, wclk, wrst_n, rclk, rrst_n, rinc, rdata, 
        rempty, wfull, test_si2, test_si1, test_so2, test_so1, test_se );
  input [7:0] wdata;
  output [7:0] rdata;
  input winc, wclk, wrst_n, rclk, rrst_n, rinc, test_si2, test_si1, test_se;
  output rempty, wfull, test_so2, test_so1;
  wire   wclken, n1, n2, n3, n4, n6, n10, n11, n12, n13, n14, n15, n16;
  wire   [3:0] wptr;
  wire   [3:0] wptr_gray;
  wire   [3:0] rptr;
  wire   [3:0] rptr_gray;
  wire   [2:0] raddr;
  wire   [3:0] rq2_wptr;
  wire   [2:0] waddr;
  wire   [3:0] wq2_rptr;
  assign test_so2 = wptr[3];

  INVX2M U1 ( .A(n4), .Y(n3) );
  INVX2M U2 ( .A(wrst_n), .Y(n4) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rrst_n), .Y(n2) );
  DLY1X1M U5 ( .A(test_se), .Y(n10) );
  DLY1X1M U6 ( .A(n10), .Y(n11) );
  DLY1X1M U7 ( .A(n10), .Y(n12) );
  DLY1X1M U8 ( .A(n11), .Y(n13) );
  DLY1X1M U9 ( .A(n12), .Y(n14) );
  DLY1X1M U10 ( .A(n11), .Y(n15) );
  DLY1X1M U11 ( .A(n12), .Y(n16) );
  B2G_encoder_0 encoder1 ( .binary(wptr), .gray(wptr_gray) );
  B2G_encoder_1 encoder2 ( .binary(rptr), .gray(rptr_gray) );
  FIFO_RD_test_1 U_FIFO_RD ( .rinc(rinc), .rclk(rclk), .rrst_n(n1), .rq2_wptr(
        rq2_wptr), .rptr_gray(rptr_gray), .rempty(rempty), .raddr(raddr), 
        .rptr(rptr), .test_si(n6), .test_se(n15) );
  FIFO_WR_test_1 U_FIFO_WR ( .winc(winc), .wclk(wclk), .wrst_n(n3), .wq2_rptr(
        wq2_rptr), .wptr_gray(wptr_gray), .wfull(wfull), .waddr(waddr), .wptr(
        wptr), .wclken(wclken), .test_si2(test_si2), .test_si1(rptr[3]), 
        .test_so1(test_so1), .test_se(n14) );
  FIFO_MEM_CTRL_test_1 U_FIFO_MEM_CTRL ( .wdata(wdata), .wclken(wclken), 
        .waddr(waddr), .wclk(wclk), .raddr(raddr), .rdata(rdata), .wfull(wfull), .RST(n3), .test_si(wq2_rptr[3]), .test_so(n6), .test_se(n13) );
  DF_SYNC_test_1 U_DF_SYNC_RD ( .CLK(rclk), .RST(n1), .ASYNC(wptr_gray), 
        .SYNC(rq2_wptr), .test_si(test_si1), .test_se(n16) );
  DF_SYNC_test_0 U_DF_SYNC_WR ( .CLK(wclk), .RST(n3), .ASYNC(rptr_gray), 
        .SYNC(wq2_rptr), .test_si(rq2_wptr[3]), .test_se(n16) );
endmodule


module PULSE_GEN_test_1 ( clk, rst, lvl_sig, pulse_sig, test_si, test_so, 
        test_se );
  input clk, rst, lvl_sig, test_si, test_se;
  output pulse_sig, test_so;
  wire   pls_flop, rcv_flop, n3;
  assign test_so = rcv_flop;

  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
  DLY1X1M U4 ( .A(test_se), .Y(n3) );
  SDFFRQX2M rcv_flop_reg ( .D(lvl_sig), .SI(pls_flop), .SE(n3), .CK(clk), .RN(
        rst), .Q(rcv_flop) );
  SDFFRQX2M pls_flop_reg ( .D(rcv_flop), .SI(test_si), .SE(n3), .CK(clk), .RN(
        rst), .Q(pls_flop) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_test_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  NOR4X2M U3 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n31) );
  NOR2X4M U4 ( .A(n5), .B(i_div_ratio[4]), .Y(n6) );
  AND3X4M U5 ( .A(n12), .B(n13), .C(N2), .Y(n11) );
  NAND4X2M U6 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n15) );
  OR2X2M U7 ( .A(n4), .B(i_div_ratio[3]), .Y(n5) );
  AO22XLM U8 ( .A0(n64), .A1(n1), .B0(N22), .B1(n11), .Y(n19) );
  AO22XLM U9 ( .A0(n1), .A1(n73), .B0(N16), .B1(n11), .Y(n25) );
  AO22XLM U10 ( .A0(n69), .A1(n1), .B0(N17), .B1(n11), .Y(n24) );
  AO22XLM U11 ( .A0(n1), .A1(n68), .B0(N18), .B1(n11), .Y(n23) );
  AO22XLM U12 ( .A0(n65), .A1(n1), .B0(N19), .B1(n11), .Y(n22) );
  AO22XLM U13 ( .A0(n66), .A1(n1), .B0(N20), .B1(n11), .Y(n21) );
  AO22XLM U14 ( .A0(n67), .A1(n1), .B0(N21), .B1(n11), .Y(n20) );
  OAI2BB1XLM U15 ( .A0N(n4), .A1N(i_div_ratio[3]), .B0(n5), .Y(
        edge_flip_half[2]) );
  INVX4M U16 ( .A(n3), .Y(n2) );
  INVX2M U17 ( .A(i_rst), .Y(n3) );
  OR2X2M U18 ( .A(i_div_ratio[2]), .B(n56), .Y(n4) );
  INVX2M U19 ( .A(i_div_ratio[5]), .Y(n9) );
  CLKBUFX6M U20 ( .A(n10), .Y(n1) );
  OAI21X2M U21 ( .A0(n44), .A1(n45), .B0(i_clk_en), .Y(n10) );
  MX2XLM U22 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  CLKINVX1M U23 ( .A(n57), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U24 ( .A0N(n58), .A1N(i_div_ratio[2]), .B0(n4), .Y(
        edge_flip_half[1]) );
  AO21XLM U25 ( .A0(n5), .A1(i_div_ratio[4]), .B0(n6), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U26 ( .A(n6), .B(n9), .Y(n7) );
  OAI21X1M U27 ( .A0(n6), .A1(n9), .B0(n7), .Y(edge_flip_half[4]) );
  XNOR2X1M U28 ( .A(i_div_ratio[6]), .B(n7), .Y(edge_flip_half[5]) );
  NOR2X1M U29 ( .A(i_div_ratio[6]), .B(n7), .Y(n8) );
  CLKXOR2X2M U30 ( .A(i_div_ratio[7]), .B(n8), .Y(edge_flip_half[6]) );
  CLKXOR2X2M U31 ( .A(div_clk), .B(n14), .Y(n18) );
  AOI21X1M U32 ( .A0(n13), .A1(n12), .B0(n1), .Y(n14) );
  OR2X1M U33 ( .A(n15), .B(i_div_ratio[0]), .Y(n12) );
  XNOR2X1M U34 ( .A(odd_edge_tog), .B(n16), .Y(n17) );
  OR2X1M U35 ( .A(n13), .B(n1), .Y(n16) );
  CLKNAND2X2M U36 ( .A(n26), .B(i_div_ratio[0]), .Y(n13) );
  MXI2X1M U37 ( .A(n27), .B(n15), .S0(odd_edge_tog), .Y(n26) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n35) );
  CLKXOR2X2M U39 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n34) );
  CLKXOR2X2M U40 ( .A(edge_flip_half[0]), .B(n71), .Y(n33) );
  CLKXOR2X2M U41 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n32) );
  XNOR2X1M U42 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n30) );
  XNOR2X1M U43 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n29) );
  XNOR2X1M U44 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n28) );
  NAND4X1M U45 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n27) );
  NOR4X1M U46 ( .A(n40), .B(n41), .C(n42), .D(n43), .Y(n39) );
  CLKXOR2X2M U47 ( .A(n50), .B(count[2]), .Y(n43) );
  CLKXOR2X2M U48 ( .A(n49), .B(count[1]), .Y(n42) );
  CLKXOR2X2M U49 ( .A(n70), .B(n56), .Y(n41) );
  CLKXOR2X2M U50 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n40) );
  XNOR2X1M U51 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n38) );
  XNOR2X1M U52 ( .A(count[5]), .B(n48), .Y(n37) );
  XNOR2X1M U53 ( .A(count[3]), .B(n51), .Y(n36) );
  CLKINVX1M U54 ( .A(n1), .Y(N2) );
  OR3X1M U55 ( .A(n49), .B(n50), .C(n57), .Y(n45) );
  OR4X1M U56 ( .A(n51), .B(i_div_ratio[5]), .C(n48), .D(i_div_ratio[7]), .Y(
        n44) );
  SDFFSQX2M odd_edge_tog_reg ( .D(n17), .SI(div_clk), .SE(n62), .CK(i_ref_clk), 
        .SN(n2), .Q(odd_edge_tog) );
  DLY1X1M U57 ( .A(i_div_ratio[6]), .Y(n48) );
  DLY1X1M U58 ( .A(i_div_ratio[2]), .Y(n49) );
  DLY1X1M U59 ( .A(i_div_ratio[3]), .Y(n50) );
  DLY1X1M U60 ( .A(i_div_ratio[4]), .Y(n51) );
  DLY1X1M U61 ( .A(n59), .Y(n52) );
  DLY1X1M U62 ( .A(n60), .Y(n53) );
  DLY1X1M U63 ( .A(n61), .Y(n54) );
  DLY1X1M U64 ( .A(n62), .Y(n55) );
  DLY1X1M U65 ( .A(i_div_ratio[1]), .Y(n56) );
  DLY1X1M U66 ( .A(i_div_ratio[1]), .Y(n57) );
  DLY1X1M U67 ( .A(i_div_ratio[1]), .Y(n58) );
  DLY1X1M U68 ( .A(test_se), .Y(n59) );
  DLY1X1M U69 ( .A(n52), .Y(n60) );
  DLY1X1M U70 ( .A(n52), .Y(n61) );
  DLY1X1M U71 ( .A(n59), .Y(n62) );
  DLY1X1M U73 ( .A(count[6]), .Y(n64) );
  DLY1X1M U74 ( .A(count[3]), .Y(n65) );
  DLY1X1M U75 ( .A(count[4]), .Y(n66) );
  DLY1X1M U76 ( .A(count[5]), .Y(n67) );
  DLY1X1M U77 ( .A(count[2]), .Y(n68) );
  DLY1X1M U78 ( .A(count[1]), .Y(n69) );
  DLY1X1M U79 ( .A(count[0]), .Y(n70) );
  DLY1X1M U80 ( .A(count[0]), .Y(n71) );
  DLY1X1M U81 ( .A(count[0]), .Y(n72) );
  DLY1X1M U82 ( .A(n70), .Y(n73) );
  ClkDiv_0_DW01_inc_0 add_49 ( .A({count[6:1], n72}), .SUM({N22, N21, N20, N19, 
        N18, N17, N16}) );
  SDFFRQX2M \count_reg[1]  ( .D(n24), .SI(n73), .SE(n61), .CK(i_ref_clk), .RN(
        i_rst), .Q(count[1]) );
  SDFFRQX2M \count_reg[0]  ( .D(n25), .SI(test_si), .SE(n60), .CK(i_ref_clk), 
        .RN(n2), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n20), .SI(n66), .SE(n55), .CK(i_ref_clk), .RN(
        n2), .Q(count[5]) );
  SDFFRQX2M \count_reg[2]  ( .D(n23), .SI(n69), .SE(n55), .CK(i_ref_clk), .RN(
        n2), .Q(count[2]) );
  SDFFRQX2M div_clk_reg ( .D(n18), .SI(n64), .SE(n54), .CK(i_ref_clk), .RN(n2), 
        .Q(div_clk) );
  SDFFRQX2M \count_reg[6]  ( .D(n19), .SI(n67), .SE(n53), .CK(i_ref_clk), .RN(
        n2), .Q(count[6]) );
  SDFFRQX2M \count_reg[4]  ( .D(n21), .SI(n65), .SE(n54), .CK(i_ref_clk), .RN(
        n2), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n22), .SI(n68), .SE(n53), .CK(i_ref_clk), .RN(
        n2), .Q(count[3]) );
endmodule


module CLKDIV_MUX_WIDTH8 ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  CLKINVX2M U12 ( .A(IN[2]), .Y(n15) );
  NAND3X1M U13 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  CLKINVX1M U14 ( .A(IN[1]), .Y(n16) );
  NAND4BX2M U16 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX2M U17 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  INVX2M U18 ( .A(IN[5]), .Y(n14) );
  NOR4X6M U19 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  INVX2M U20 ( .A(IN[0]), .Y(n17) );
  OAI211X4M U21 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NOR4X2M U22 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  NAND2X2M U23 ( .A(n7), .B(n6), .Y(n9) );
  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  NOR3X12M U11 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X8M U15 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_test_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  NOR4X2M U3 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n31) );
  NOR2X4M U4 ( .A(n5), .B(i_div_ratio[4]), .Y(n6) );
  AND3X4M U5 ( .A(n12), .B(n13), .C(N2), .Y(n11) );
  OR2X2M U6 ( .A(n4), .B(i_div_ratio[3]), .Y(n5) );
  OAI2BB1XLM U7 ( .A0N(n4), .A1N(i_div_ratio[3]), .B0(n5), .Y(
        edge_flip_half[2]) );
  NAND4X2M U8 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n15) );
  AO22XLM U9 ( .A0(n65), .A1(n1), .B0(N22), .B1(n11), .Y(n52) );
  AO22XLM U10 ( .A0(n1), .A1(n74), .B0(N16), .B1(n11), .Y(n46) );
  AO22XLM U11 ( .A0(n69), .A1(n1), .B0(N17), .B1(n11), .Y(n47) );
  AO22XLM U12 ( .A0(n70), .A1(n1), .B0(N18), .B1(n11), .Y(n48) );
  AO22XLM U13 ( .A0(n1), .A1(n67), .B0(N19), .B1(n11), .Y(n49) );
  AO22XLM U14 ( .A0(n1), .A1(n68), .B0(N20), .B1(n11), .Y(n50) );
  AO22XLM U15 ( .A0(n66), .A1(n1), .B0(N21), .B1(n11), .Y(n51) );
  INVX4M U16 ( .A(n3), .Y(n2) );
  INVX2M U18 ( .A(i_rst), .Y(n3) );
  CLKBUFX6M U19 ( .A(n10), .Y(n1) );
  OAI21X2M U20 ( .A0(n44), .A1(n45), .B0(i_clk_en), .Y(n10) );
  MX2XLM U21 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  INVX2M U22 ( .A(i_div_ratio[5]), .Y(n9) );
  CLKINVX1M U23 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  AO21XLM U25 ( .A0(n5), .A1(i_div_ratio[4]), .B0(n6), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U26 ( .A(n6), .B(n9), .Y(n7) );
  OAI21X1M U27 ( .A0(n6), .A1(n9), .B0(n7), .Y(edge_flip_half[4]) );
  XNOR2X1M U28 ( .A(i_div_ratio[6]), .B(n7), .Y(edge_flip_half[5]) );
  NOR2X1M U29 ( .A(i_div_ratio[6]), .B(n7), .Y(n8) );
  CLKXOR2X2M U30 ( .A(i_div_ratio[7]), .B(n8), .Y(edge_flip_half[6]) );
  CLKXOR2X2M U31 ( .A(div_clk), .B(n14), .Y(n53) );
  AOI21X1M U32 ( .A0(n13), .A1(n12), .B0(n1), .Y(n14) );
  OR2X1M U33 ( .A(n15), .B(i_div_ratio[0]), .Y(n12) );
  XNOR2X1M U34 ( .A(odd_edge_tog), .B(n16), .Y(n54) );
  OR2X1M U35 ( .A(n13), .B(n1), .Y(n16) );
  CLKNAND2X2M U36 ( .A(n26), .B(i_div_ratio[0]), .Y(n13) );
  MXI2X1M U37 ( .A(n27), .B(n15), .S0(odd_edge_tog), .Y(n26) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n35) );
  CLKXOR2X2M U39 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n34) );
  CLKXOR2X2M U40 ( .A(edge_flip_half[0]), .B(n72), .Y(n33) );
  CLKXOR2X2M U41 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n32) );
  XNOR2X1M U42 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n30) );
  XNOR2X1M U43 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n29) );
  XNOR2X1M U44 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n28) );
  NAND4X1M U45 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n27) );
  NOR4X1M U46 ( .A(n40), .B(n41), .C(n42), .D(n43), .Y(n39) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n43) );
  CLKXOR2X2M U48 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n42) );
  CLKXOR2X2M U49 ( .A(i_div_ratio[1]), .B(n71), .Y(n41) );
  CLKXOR2X2M U50 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n40) );
  XNOR2X1M U51 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n38) );
  XNOR2X1M U52 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n37) );
  XNOR2X1M U53 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n36) );
  CLKINVX1M U54 ( .A(n1), .Y(N2) );
  OR3X1M U55 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), .Y(
        n45) );
  OR4X1M U56 ( .A(i_div_ratio[4]), .B(i_div_ratio[5]), .C(i_div_ratio[6]), .D(
        i_div_ratio[7]), .Y(n44) );
  SDFFRQX2M div_clk_reg ( .D(n53), .SI(n65), .SE(n59), .CK(i_ref_clk), .RN(n2), 
        .Q(div_clk) );
  SDFFSQX2M odd_edge_tog_reg ( .D(n54), .SI(div_clk), .SE(n64), .CK(i_ref_clk), 
        .SN(n2), .Q(odd_edge_tog) );
  SDFFRQX2M \count_reg[6]  ( .D(n52), .SI(n66), .SE(n58), .CK(i_ref_clk), .RN(
        n2), .Q(count[6]) );
  SDFFRQX2M \count_reg[0]  ( .D(n46), .SI(test_si), .SE(n62), .CK(i_ref_clk), 
        .RN(n2), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n51), .SI(n68), .SE(n60), .CK(i_ref_clk), .RN(
        n2), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n50), .SI(n67), .SE(n59), .CK(i_ref_clk), .RN(
        n2), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n49), .SI(n70), .SE(n58), .CK(i_ref_clk), .RN(
        n2), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n48), .SI(n69), .SE(n60), .CK(i_ref_clk), .RN(
        n2), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n47), .SI(n74), .SE(n63), .CK(i_ref_clk), .RN(
        i_rst), .Q(count[1]) );
  DLY1X1M U57 ( .A(n61), .Y(n57) );
  DLY1X1M U58 ( .A(n62), .Y(n58) );
  DLY1X1M U59 ( .A(n63), .Y(n59) );
  DLY1X1M U60 ( .A(n64), .Y(n60) );
  DLY1X1M U61 ( .A(test_se), .Y(n61) );
  DLY1X1M U62 ( .A(n57), .Y(n62) );
  DLY1X1M U63 ( .A(n57), .Y(n63) );
  DLY1X1M U64 ( .A(n61), .Y(n64) );
  DLY1X1M U65 ( .A(count[6]), .Y(n65) );
  DLY1X1M U66 ( .A(count[5]), .Y(n66) );
  DLY1X1M U67 ( .A(count[3]), .Y(n67) );
  DLY1X1M U68 ( .A(count[4]), .Y(n68) );
  DLY1X1M U69 ( .A(count[1]), .Y(n69) );
  DLY1X1M U70 ( .A(count[2]), .Y(n70) );
  DLY1X1M U71 ( .A(count[0]), .Y(n71) );
  DLY1X1M U72 ( .A(count[0]), .Y(n72) );
  DLY1X1M U73 ( .A(count[0]), .Y(n73) );
  DLY1X1M U74 ( .A(n71), .Y(n74) );
  ClkDiv_1_DW01_inc_0 add_49 ( .A({count[6:1], n73}), .SUM({N22, N21, N20, N19, 
        N18, N17, N16}) );
  OR2X2M U17 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n4) );
  OAI2BB1XLM U24 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n4), .Y(
        edge_flip_half[1]) );
endmodule


module TX_FSM_test_1 ( ser_done, PAR_EN, Data_Valid, CLK, RST, ser_en, busy, 
        mux_sel, test_si, test_so, test_se );
  output [1:0] mux_sel;
  input ser_done, PAR_EN, Data_Valid, CLK, RST, test_si, test_se;
  output ser_en, busy, test_so;
  wire   \next_state[2] , busy_c, n6, n7, n8, n9, n10, n11, n1, n2, n3, n4,
         n13, n14, n15, n16, n18, n19, n20, n21, n22, n24, n25, n5, n12;
  wire   [2:0] current_state;

  AOI31X2M U3 ( .A0(Data_Valid), .A1(n24), .A2(test_so), .B0(ser_en), .Y(n10)
         );
  NAND2X2M U4 ( .A(PAR_EN), .B(n9), .Y(n6) );
  INVX2M U5 ( .A(n11), .Y(ser_en) );
  INVX2M U6 ( .A(n10), .Y(n1) );
  NAND2X2M U7 ( .A(n9), .B(n7), .Y(n11) );
  NAND2X2M U8 ( .A(n6), .B(n10), .Y(busy_c) );
  NAND2X2M U9 ( .A(n11), .B(n6), .Y(mux_sel[1]) );
  NOR2X2M U10 ( .A(n6), .B(n7), .Y(\next_state[2] ) );
  NAND2X2M U11 ( .A(ser_done), .B(current_state[1]), .Y(n7) );
  OAI221X1M U12 ( .A0(n21), .A1(n7), .B0(n12), .B1(Data_Valid), .C0(n4), .Y(
        mux_sel[0]) );
  NOR2X4M U13 ( .A(n3), .B(current_state[2]), .Y(n9) );
  INVX2M U14 ( .A(n8), .Y(n2) );
  AOI31X2M U15 ( .A0(current_state[2]), .A1(n22), .A2(current_state[1]), .B0(
        n9), .Y(n8) );
  DLY1X1M U16 ( .A(test_se), .Y(n15) );
  DLY1X1M U17 ( .A(test_se), .Y(n16) );
  DLY1X1M U18 ( .A(n4), .Y(test_so) );
  DLY1X1M U19 ( .A(n20), .Y(n18) );
  DLY1X1M U20 ( .A(n12), .Y(n19) );
  INVXLM U21 ( .A(n25), .Y(n20) );
  INVXLM U22 ( .A(n18), .Y(n21) );
  INVXLM U23 ( .A(n18), .Y(n22) );
  INVXLM U25 ( .A(n19), .Y(n24) );
  INVXLM U26 ( .A(n19), .Y(n25) );
  SDFFRX1M \current_state_reg[1]  ( .D(n2), .SI(n12), .SE(n15), .CK(CLK), .RN(
        RST), .Q(current_state[1]), .QN(n14) );
  SDFFRX1M \current_state_reg[2]  ( .D(\next_state[2] ), .SI(n14), .SE(n16), 
        .CK(CLK), .RN(RST), .Q(current_state[2]), .QN(n4) );
  SDFFRX1M \current_state_reg[0]  ( .D(n1), .SI(n13), .SE(n16), .CK(CLK), .RN(
        RST), .Q(current_state[0]), .QN(n3) );
  SDFFRX1M busy_reg ( .D(busy_c), .SI(test_si), .SE(n15), .CK(CLK), .RN(RST), 
        .Q(busy), .QN(n13) );
  INVXLM U24 ( .A(current_state[0]), .Y(n5) );
  INVX2M U27 ( .A(n5), .Y(n12) );
endmodule


module MUX_test_1 ( mux_sel, ser_data, par_bit, CLK, RST, TX_OUT, test_si, 
        test_se );
  input [1:0] mux_sel;
  input ser_data, par_bit, CLK, RST, test_si, test_se;
  output TX_OUT;
  wire   n6, mux_out, n2, n3, n1, n4;

  OAI21X2M U3 ( .A0(n2), .A1(n1), .B0(n3), .Y(mux_out) );
  NOR2BX2M U4 ( .AN(mux_sel[1]), .B(par_bit), .Y(n2) );
  NAND3X2M U5 ( .A(mux_sel[1]), .B(n1), .C(ser_data), .Y(n3) );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n1) );
  SDFFRQX2M TX_OUT_reg ( .D(mux_out), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n6) );
  INVXLM U7 ( .A(n6), .Y(n4) );
  INVX8M U8 ( .A(n4), .Y(TX_OUT) );
endmodule


module Parity_calc_test_1 ( P_DATA, Data_Valid, PAR_TYP, PAR_EN, CLK, RST, 
        par_bit, busy, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input Data_Valid, PAR_TYP, PAR_EN, CLK, RST, busy, test_si, test_se;
  output par_bit, test_so;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n2, n16,
         n17, n18, n21, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36;
  wire   [7:0] par_data;

  INVX4M U2 ( .A(n2), .Y(n16) );
  INVX4M U3 ( .A(n2), .Y(n17) );
  INVX2M U4 ( .A(Data_Valid), .Y(n2) );
  XNOR2X2M U5 ( .A(par_data[2]), .B(par_data[3]), .Y(n5) );
  OAI2BB2X1M U6 ( .B0(n1), .B1(n18), .A0N(par_bit), .A1N(n18), .Y(n7) );
  INVX2M U7 ( .A(PAR_EN), .Y(n18) );
  XOR3XLM U8 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U9 ( .A(par_data[1]), .B(par_data[0]), .C(n5), .Y(n4) );
  XOR3XLM U10 ( .A(par_data[5]), .B(par_data[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U11 ( .A(par_data[7]), .B(par_data[6]), .Y(n6) );
  AO2B2X2M U12 ( .B0(P_DATA[0]), .B1(n16), .A0(par_data[0]), .A1N(n16), .Y(n8)
         );
  AO2B2X2M U13 ( .B0(P_DATA[1]), .B1(n17), .A0(par_data[1]), .A1N(n17), .Y(n9)
         );
  AO2B2X2M U14 ( .B0(P_DATA[2]), .B1(n16), .A0(par_data[2]), .A1N(n16), .Y(n10) );
  AO2B2X2M U15 ( .B0(P_DATA[3]), .B1(n17), .A0(par_data[3]), .A1N(n17), .Y(n11) );
  AO2B2X2M U16 ( .B0(P_DATA[4]), .B1(n16), .A0(par_data[4]), .A1N(n16), .Y(n12) );
  AO2B2X2M U17 ( .B0(P_DATA[5]), .B1(n17), .A0(par_data[5]), .A1N(n17), .Y(n13) );
  AO2B2X2M U18 ( .B0(P_DATA[6]), .B1(n16), .A0(par_data[6]), .A1N(n16), .Y(n14) );
  AO2B2X2M U19 ( .B0(P_DATA[7]), .B1(n17), .A0(par_data[7]), .A1N(n17), .Y(n15) );
  DLY1X1M U20 ( .A(test_se), .Y(n30) );
  DLY1X1M U21 ( .A(n34), .Y(n31) );
  DLY1X1M U22 ( .A(n35), .Y(n32) );
  DLY1X1M U23 ( .A(n36), .Y(n33) );
  DLY1X1M U24 ( .A(n30), .Y(n34) );
  DLY1X1M U25 ( .A(n30), .Y(n35) );
  DLY1X1M U26 ( .A(test_se), .Y(n36) );
  SDFFRX1M \par_data_reg[6]  ( .D(n14), .SI(n28), .SE(n32), .CK(CLK), .RN(RST), 
        .Q(par_data[6]), .QN(n29) );
  SDFFRX1M \par_data_reg[5]  ( .D(n13), .SI(n26), .SE(n31), .CK(CLK), .RN(RST), 
        .Q(par_data[5]), .QN(n28) );
  SDFFRX1M \par_data_reg[1]  ( .D(n9), .SI(n25), .SE(n36), .CK(CLK), .RN(RST), 
        .Q(par_data[1]), .QN(n27) );
  SDFFRX1M \par_data_reg[4]  ( .D(n12), .SI(n23), .SE(n33), .CK(CLK), .RN(RST), 
        .Q(par_data[4]), .QN(n26) );
  SDFFRX1M \par_data_reg[0]  ( .D(n8), .SI(n21), .SE(n35), .CK(CLK), .RN(RST), 
        .Q(par_data[0]), .QN(n25) );
  SDFFRX1M \par_data_reg[2]  ( .D(n10), .SI(n27), .SE(n31), .CK(CLK), .RN(RST), 
        .Q(par_data[2]), .QN(n24) );
  SDFFRX1M \par_data_reg[3]  ( .D(n11), .SI(n24), .SE(n32), .CK(CLK), .RN(RST), 
        .Q(par_data[3]), .QN(n23) );
  SDFFRX1M \par_data_reg[7]  ( .D(n15), .SI(n29), .SE(n33), .CK(CLK), .RN(RST), 
        .Q(par_data[7]), .QN(test_so) );
  SDFFRX1M par_bit_reg ( .D(n7), .SI(test_si), .SE(n34), .CK(CLK), .RN(RST), 
        .Q(par_bit), .QN(n21) );
endmodule


module Serializer_test_1 ( P_DATA, Data_Valid, ser_en, CLK, RST, busy, 
        ser_done, ser_data, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input Data_Valid, ser_en, CLK, RST, busy, test_si, test_se;
  output ser_done, ser_data, test_so;
  wire   N24, N25, N26, N27, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n1,
         n2, n3, n28, n29, n30, n33, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n31, n32;
  wire   [7:1] data;
  wire   [3:0] count;

  AOI32X1M U3 ( .A0(n59), .A1(n55), .A2(n54), .B0(n29), .B1(count[2]), .Y(n19)
         );
  OAI2BB2X4M U4 ( .B0(n55), .B1(n18), .A0N(count[1]), .A1N(n32), .Y(n4) );
  CLKBUFX6M U5 ( .A(n9), .Y(n1) );
  INVX4M U6 ( .A(ser_en), .Y(n28) );
  INVX6M U7 ( .A(n3), .Y(n2) );
  INVX2M U8 ( .A(RST), .Y(n3) );
  NOR2X8M U9 ( .A(n28), .B(n1), .Y(n8) );
  NOR2X8M U10 ( .A(n1), .B(n8), .Y(n6) );
  CLKXOR2X2M U11 ( .A(n18), .B(n30), .Y(n5) );
  NOR2X2M U12 ( .A(n18), .B(n28), .Y(N25) );
  CLKXOR2X2M U13 ( .A(n58), .B(n29), .Y(n18) );
  NOR3BX2M U14 ( .AN(count[3]), .B(n4), .C(n5), .Y(ser_done) );
  OAI2BB1X2M U15 ( .A0N(ser_data), .A1N(n6), .B0(n7), .Y(n20) );
  AOI22X1M U16 ( .A0(data[1]), .A1(n8), .B0(P_DATA[0]), .B1(n1), .Y(n7) );
  OAI2BB1X2M U17 ( .A0N(data[1]), .A1N(n6), .B0(n15), .Y(n27) );
  AOI22X1M U18 ( .A0(data[2]), .A1(n8), .B0(P_DATA[1]), .B1(n1), .Y(n15) );
  OAI2BB1X2M U19 ( .A0N(n6), .A1N(data[2]), .B0(n14), .Y(n26) );
  AOI22X1M U20 ( .A0(data[3]), .A1(n8), .B0(P_DATA[2]), .B1(n1), .Y(n14) );
  OAI2BB1X2M U21 ( .A0N(n6), .A1N(data[3]), .B0(n13), .Y(n25) );
  AOI22X1M U22 ( .A0(data[4]), .A1(n8), .B0(P_DATA[3]), .B1(n1), .Y(n13) );
  OAI2BB1X2M U23 ( .A0N(n6), .A1N(data[4]), .B0(n12), .Y(n24) );
  AOI22X1M U24 ( .A0(data[5]), .A1(n8), .B0(P_DATA[4]), .B1(n1), .Y(n12) );
  OAI2BB1X2M U25 ( .A0N(n6), .A1N(data[5]), .B0(n11), .Y(n23) );
  AOI22X1M U26 ( .A0(data[6]), .A1(n8), .B0(P_DATA[5]), .B1(n1), .Y(n11) );
  OAI2BB1X2M U27 ( .A0N(n6), .A1N(data[6]), .B0(n10), .Y(n22) );
  AOI22X1M U28 ( .A0(data[7]), .A1(n8), .B0(P_DATA[6]), .B1(n1), .Y(n10) );
  AO22X1M U29 ( .A0(n6), .A1(data[7]), .B0(P_DATA[7]), .B1(n1), .Y(n21) );
  NOR2X2M U30 ( .A(n28), .B(n32), .Y(N24) );
  OAI2BB2X1M U31 ( .B0(n19), .B1(n28), .A0N(n53), .A1N(N24), .Y(N26) );
  NOR2X2M U32 ( .A(n16), .B(n28), .Y(N27) );
  CLKXOR2X2M U33 ( .A(n17), .B(count[3]), .Y(n16) );
  NAND2X2M U34 ( .A(n5), .B(n4), .Y(n17) );
  NOR2BX2M U35 ( .AN(Data_Valid), .B(busy), .Y(n9) );
  SDFFRX1M \count_reg[3]  ( .D(N27), .SI(n53), .SE(n52), .CK(CLK), .RN(n2), 
        .Q(count[3]), .QN(n42) );
  DLY1X1M U36 ( .A(n47), .Y(n43) );
  DLY1X1M U37 ( .A(n48), .Y(n44) );
  DLY1X1M U38 ( .A(n48), .Y(n45) );
  DLY1X1M U39 ( .A(n47), .Y(n46) );
  DLY1X1M U40 ( .A(test_se), .Y(n47) );
  DLY1X1M U41 ( .A(test_se), .Y(n48) );
  DLY1X1M U42 ( .A(n44), .Y(n49) );
  DLY1X1M U43 ( .A(n43), .Y(n50) );
  DLY1X1M U44 ( .A(n44), .Y(n51) );
  DLY1X1M U45 ( .A(n43), .Y(n52) );
  DLY1X1M U46 ( .A(count[2]), .Y(n53) );
  DLY1X1M U47 ( .A(count[1]), .Y(n54) );
  DLY1X1M U48 ( .A(n30), .Y(n55) );
  DLY1X1M U49 ( .A(n57), .Y(n56) );
  INVXLM U50 ( .A(n32), .Y(n57) );
  INVXLM U51 ( .A(n56), .Y(n58) );
  INVXLM U52 ( .A(n56), .Y(n59) );
  SDFFRX1M \count_reg[1]  ( .D(N25), .SI(n33), .SE(n52), .CK(CLK), .RN(n2), 
        .Q(count[1]), .QN(n29) );
  SDFFRX1M \count_reg[0]  ( .D(N24), .SI(test_si), .SE(n51), .CK(CLK), .RN(n2), 
        .Q(count[0]), .QN(n33) );
  SDFFRX1M \count_reg[2]  ( .D(N26), .SI(n54), .SE(n51), .CK(CLK), .RN(n2), 
        .Q(count[2]), .QN(n30) );
  SDFFRX1M \data_reg[6]  ( .D(n22), .SI(n40), .SE(n45), .CK(CLK), .RN(n2), .Q(
        data[6]), .QN(n41) );
  SDFFRX1M \data_reg[5]  ( .D(n23), .SI(n39), .SE(n46), .CK(CLK), .RN(n2), .Q(
        data[5]), .QN(n40) );
  SDFFRX1M \data_reg[4]  ( .D(n24), .SI(n38), .SE(n45), .CK(CLK), .RN(n2), .Q(
        data[4]), .QN(n39) );
  SDFFRX1M \data_reg[3]  ( .D(n25), .SI(n37), .SE(n50), .CK(CLK), .RN(n2), .Q(
        data[3]), .QN(n38) );
  SDFFRX1M \data_reg[2]  ( .D(n26), .SI(n36), .SE(n49), .CK(CLK), .RN(n2), .Q(
        data[2]), .QN(n37) );
  SDFFRX1M \data_reg[1]  ( .D(n27), .SI(n35), .SE(n50), .CK(CLK), .RN(n2), .Q(
        data[1]), .QN(n36) );
  SDFFRX1M \data_reg[0]  ( .D(n20), .SI(n42), .SE(n49), .CK(CLK), .RN(n2), .Q(
        ser_data), .QN(n35) );
  SDFFRX1M \data_reg[7]  ( .D(n21), .SI(n41), .SE(n46), .CK(CLK), .RN(n2), .Q(
        data[7]), .QN(test_so) );
  INVXLM U53 ( .A(count[0]), .Y(n31) );
  INVX2M U54 ( .A(n31), .Y(n32) );
endmodule


module UART_TX_top_test_1 ( P_DATA, PAR_EN, Data_Valid, PAR_TYP, CLK, RST, 
        TX_OUT, busy, test_si, test_se );
  input [7:0] P_DATA;
  input PAR_EN, Data_Valid, PAR_TYP, CLK, RST, test_si, test_se;
  output TX_OUT, busy;
  wire   ser_en, ser_done, ser_data, par_bit, n1, n2, n3, n4, n5, n6, n7, n10,
         n11, n12, n13, n14, n15, n16;
  wire   [1:0] mux_sel;

  INVX6M U1 ( .A(n4), .Y(n2) );
  CLKINVX1M U2 ( .A(n4), .Y(n1) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(RST), .Y(n4) );
  DLY1X1M U5 ( .A(PAR_EN), .Y(n10) );
  DLY1X1M U6 ( .A(n15), .Y(n11) );
  DLY1X1M U7 ( .A(test_se), .Y(n12) );
  DLY1X1M U8 ( .A(n12), .Y(n13) );
  DLY1X1M U9 ( .A(n11), .Y(n14) );
  DLY1X1M U10 ( .A(n12), .Y(n15) );
  DLY1X1M U11 ( .A(n11), .Y(n16) );
  TX_FSM_test_1 U_FSM ( .ser_done(ser_done), .PAR_EN(n10), .Data_Valid(
        Data_Valid), .CLK(CLK), .RST(n2), .ser_en(ser_en), .busy(busy), 
        .mux_sel(mux_sel), .test_si(test_si), .test_so(n7), .test_se(n16) );
  MUX_test_1 U_MUX ( .mux_sel(mux_sel), .ser_data(ser_data), .par_bit(par_bit), 
        .CLK(CLK), .RST(n3), .TX_OUT(TX_OUT), .test_si(n5), .test_se(n15) );
  Parity_calc_test_1 U_PARITY_CALC ( .P_DATA(P_DATA), .Data_Valid(Data_Valid), 
        .PAR_TYP(PAR_TYP), .PAR_EN(n10), .CLK(CLK), .RST(n2), .par_bit(par_bit), .busy(busy), .test_si(n7), .test_so(n6), .test_se(n14) );
  Serializer_test_1 U_SERIALIZER ( .P_DATA(P_DATA), .Data_Valid(Data_Valid), 
        .ser_en(ser_en), .CLK(CLK), .RST(n1), .busy(busy), .ser_done(ser_done), 
        .ser_data(ser_data), .test_si(n6), .test_so(n5), .test_se(n13) );
endmodule


module FSM_test_1 ( RX_IN, PAR_EN, edge_cnt, bit_cnt, par_err, strt_glitch, 
        stp_err, CLK, RST, prescale, dat_samp_en, enable, par_chk_en, 
        strt_chk_en, stp_chk_en, deser_en, data_valid, from_parity, test_si, 
        test_so, test_se );
  input [5:0] edge_cnt;
  input [3:0] bit_cnt;
  input [5:0] prescale;
  input RX_IN, PAR_EN, par_err, strt_glitch, stp_err, CLK, RST, test_si,
         test_se;
  output dat_samp_en, enable, par_chk_en, strt_chk_en, stp_chk_en, deser_en,
         data_valid, from_parity, test_so;
  wire   delay_parity, error_detected, N42, N43, N44, N45, N46, N47, N48, N49,
         data_valid_c, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n50, n51, n52, n53, n54, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = error_detected;

  OAI33X2M U3 ( .A0(n44), .A1(prescale[5]), .A2(n57), .B0(n45), .B1(n25), .B2(
        n51), .Y(n42) );
  NOR4X1M U4 ( .A(prescale[2]), .B(prescale[1]), .C(prescale[0]), .D(
        edge_cnt[5]), .Y(n43) );
  NOR2X2M U5 ( .A(n8), .B(prescale[5]), .Y(N48) );
  NOR2BX2M U6 ( .AN(N42), .B(n70), .Y(n9) );
  NOR2BX2M U7 ( .AN(n70), .B(N42), .Y(n10) );
  INVX2M U8 ( .A(prescale[0]), .Y(N42) );
  OAI32X2M U9 ( .A0(n21), .A1(delay_parity), .A2(n35), .B0(N49), .B1(n30), .Y(
        n34) );
  INVX2M U10 ( .A(N49), .Y(n19) );
  NOR4X6M U11 ( .A(n17), .B(n16), .C(n15), .D(n14), .Y(N49) );
  OAI21X1M U12 ( .A0(n28), .A1(n19), .B0(n20), .Y(next_state[1]) );
  OR2X2M U13 ( .A(n7), .B(prescale[4]), .Y(n8) );
  OR2X2M U14 ( .A(n6), .B(prescale[3]), .Y(n7) );
  OR2X2M U15 ( .A(n5), .B(prescale[2]), .Y(n6) );
  OAI2BB1XLM U16 ( .A0N(n7), .A1N(prescale[4]), .B0(n8), .Y(N46) );
  OAI2BB1XLM U17 ( .A0N(n6), .A1N(prescale[3]), .B0(n7), .Y(N45) );
  OAI2BB1XLM U18 ( .A0N(n5), .A1N(prescale[2]), .B0(n6), .Y(N44) );
  NOR4BX1M U19 ( .AN(n39), .B(error_detected), .C(n46), .D(n37), .Y(
        data_valid_c) );
  INVX2M U20 ( .A(current_state[2]), .Y(n26) );
  NAND2X2M U21 ( .A(n18), .B(n20), .Y(dat_samp_en) );
  INVX4M U22 ( .A(n2), .Y(n1) );
  INVX2M U23 ( .A(RST), .Y(n2) );
  NOR2X2M U24 ( .A(n31), .B(n35), .Y(deser_en) );
  INVX2M U25 ( .A(n47), .Y(n20) );
  OAI211X1M U26 ( .A0(N49), .A1(n30), .B0(n35), .C0(n32), .Y(n47) );
  NAND4X2M U27 ( .A(n41), .B(n35), .C(n32), .D(n30), .Y(enable) );
  INVX2M U28 ( .A(n48), .Y(n18) );
  OAI31X2M U29 ( .A0(n19), .A1(RX_IN), .A2(n30), .B0(n41), .Y(n48) );
  OAI21X2M U30 ( .A0(n36), .A1(n35), .B0(n18), .Y(next_state[0]) );
  NOR2X2M U31 ( .A(n30), .B(n31), .Y(stp_chk_en) );
  OA21X2M U32 ( .A0(RX_IN), .A1(n40), .B0(n28), .Y(n41) );
  NAND3X2M U33 ( .A(n50), .B(n26), .C(n27), .Y(n40) );
  INVX6M U34 ( .A(n4), .Y(n3) );
  INVX2M U35 ( .A(CLK), .Y(n4) );
  INVX2M U36 ( .A(n32), .Y(from_parity) );
  OR2X2M U37 ( .A(prescale[1]), .B(prescale[0]), .Y(n5) );
  NAND3BX2M U38 ( .AN(bit_cnt[2]), .B(bit_cnt[3]), .C(N49), .Y(n37) );
  NOR3X4M U39 ( .A(n65), .B(n62), .C(n37), .Y(n36) );
  AOI33X2M U40 ( .A0(n24), .A1(n52), .A2(prescale[3]), .B0(n67), .B1(n53), 
        .B2(prescale[4]), .Y(n44) );
  INVX2M U41 ( .A(n68), .Y(n24) );
  NOR3X4M U42 ( .A(strt_glitch), .B(stp_err), .C(par_err), .Y(n39) );
  NOR2X2M U43 ( .A(n28), .B(n29), .Y(strt_chk_en) );
  AOI33X2M U44 ( .A0(n54), .A1(n23), .A2(n61), .B0(n60), .B1(n22), .B2(n66), 
        .Y(n46) );
  INVX2M U45 ( .A(PAR_EN), .Y(n54) );
  INVX2M U46 ( .A(n66), .Y(n23) );
  NAND3X4M U47 ( .A(n27), .B(n26), .C(n73), .Y(n32) );
  NAND3X4M U48 ( .A(current_state[0]), .B(n26), .C(current_state[1]), .Y(n35)
         );
  NAND3X4M U49 ( .A(current_state[1]), .B(n27), .C(current_state[2]), .Y(n30)
         );
  OAI21BX1M U50 ( .A0(n32), .A1(n19), .B0N(n34), .Y(next_state[2]) );
  INVX2M U51 ( .A(n36), .Y(n21) );
  NAND2X2M U52 ( .A(n69), .B(n33), .Y(n31) );
  INVX2M U53 ( .A(prescale[3]), .Y(n53) );
  INVX2M U54 ( .A(prescale[4]), .Y(n52) );
  NAND3X4M U55 ( .A(n50), .B(n26), .C(current_state[0]), .Y(n28) );
  INVXLM U56 ( .A(n61), .Y(n22) );
  NAND2BX2M U57 ( .AN(n69), .B(n33), .Y(n29) );
  OAI2B1X2M U58 ( .A1N(error_detected), .A0(n38), .B0(n39), .Y(n49) );
  OAI2B2X1M U59 ( .A1N(RX_IN), .A0(n40), .B0(RX_IN), .B1(n28), .Y(n38) );
  INVX2M U60 ( .A(current_state[0]), .Y(n27) );
  AND4X2M U61 ( .A(n64), .B(n42), .C(edge_cnt[2]), .D(n43), .Y(n33) );
  INVX2M U62 ( .A(edge_cnt[4]), .Y(n25) );
  INVX2M U63 ( .A(prescale[5]), .Y(n51) );
  INVX2M U64 ( .A(current_state[1]), .Y(n50) );
  NAND3X2M U65 ( .A(n53), .B(n52), .C(n67), .Y(n45) );
  NOR2X2M U66 ( .A(n29), .B(n32), .Y(par_chk_en) );
  OAI2BB1X1M U67 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n5), .Y(N43) );
  AO21XLM U68 ( .A0(n8), .A1(prescale[5]), .B0(N48), .Y(N47) );
  OAI2B2X1M U69 ( .A1N(n63), .A0(n9), .B0(N43), .B1(n9), .Y(n13) );
  XNOR2X1M U70 ( .A(N47), .B(edge_cnt[5]), .Y(n12) );
  OAI2B2X1M U71 ( .A1N(N43), .A0(n10), .B0(n63), .B1(n10), .Y(n11) );
  NAND4BX1M U72 ( .AN(N48), .B(n13), .C(n12), .D(n11), .Y(n17) );
  CLKXOR2X2M U73 ( .A(N46), .B(edge_cnt[4]), .Y(n16) );
  CLKXOR2X2M U74 ( .A(N44), .B(edge_cnt[2]), .Y(n15) );
  CLKXOR2X2M U75 ( .A(N45), .B(n68), .Y(n14) );
  SDFFRQX2M delay_parity_reg ( .D(PAR_EN), .SI(data_valid), .SE(n59), .CK(n3), 
        .RN(n1), .Q(delay_parity) );
  SDFFRQX2M error_detected_reg ( .D(n49), .SI(delay_parity), .SE(n59), .CK(n3), 
        .RN(n1), .Q(error_detected) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(n71), .CK(n3), .RN(n1), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(n72), 
        .CK(n3), .RN(n1), .Q(current_state[0]) );
  SDFFRQX2M data_valid_reg ( .D(data_valid_c), .SI(current_state[2]), .SE(n71), 
        .CK(n3), .RN(n1), .Q(data_valid) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(n72), .CK(n3), .RN(n1), .Q(current_state[1]) );
  INVXLM U76 ( .A(n25), .Y(n57) );
  DLY1X1M U77 ( .A(test_se), .Y(n58) );
  DLY1X1M U78 ( .A(test_se), .Y(n59) );
  INVXLM U79 ( .A(n54), .Y(n60) );
  DLY1X1M U80 ( .A(n65), .Y(n61) );
  INVXLM U81 ( .A(n23), .Y(n62) );
  DLY1X1M U82 ( .A(edge_cnt[1]), .Y(n63) );
  DLY1X1M U83 ( .A(edge_cnt[1]), .Y(n64) );
  DLY1X1M U84 ( .A(bit_cnt[0]), .Y(n65) );
  DLY1X1M U85 ( .A(bit_cnt[1]), .Y(n66) );
  DLY1X1M U86 ( .A(edge_cnt[3]), .Y(n67) );
  DLY1X1M U87 ( .A(edge_cnt[3]), .Y(n68) );
  DLY1X1M U88 ( .A(edge_cnt[0]), .Y(n69) );
  DLY1X1M U89 ( .A(edge_cnt[0]), .Y(n70) );
  DLY1X1M U90 ( .A(n58), .Y(n71) );
  DLY1X1M U91 ( .A(n58), .Y(n72) );
  INVXLM U92 ( .A(n50), .Y(n73) );
endmodule


module edge_bit_counter_test_1 ( enable, CLK, RST, bit_cnt, edge_cnt, prescale, 
        PAR_EN, from_parity, test_si, test_se );
  output [3:0] bit_cnt;
  output [5:0] edge_cnt;
  input [5:0] prescale;
  input enable, CLK, RST, PAR_EN, from_parity, test_si, test_se;
  wire   n154, n155, n156, n157, n158, n159, n160, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, N18, N19, N20, N21, n6, n8, n9, n11, n13, n14,
         n17, n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         \add_23/carry[5] , \add_23/carry[4] , \add_23/carry[3] ,
         \add_23/carry[2] , n1, n2, n3, n4, n5, n7, n10, n12, n15, n16, n18,
         n21, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n130, n131, n132, n134, n135, n136, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153;

  NOR2BX2M U3 ( .AN(N14), .B(n94), .Y(n15) );
  NOR2X2M U4 ( .A(n12), .B(prescale[5]), .Y(N20) );
  NOR4X4M U5 ( .A(n36), .B(n35), .C(n34), .D(n33), .Y(N21) );
  NOR2BX2M U6 ( .AN(n85), .B(N14), .Y(n16) );
  INVX2M U7 ( .A(prescale[0]), .Y(N14) );
  OR2X2M U8 ( .A(n10), .B(prescale[4]), .Y(n12) );
  OR2X2M U9 ( .A(n7), .B(prescale[3]), .Y(n10) );
  OR2X2M U10 ( .A(n5), .B(prescale[2]), .Y(n7) );
  OAI2BB1XLM U11 ( .A0N(n10), .A1N(prescale[4]), .B0(n12), .Y(N18) );
  OAI2BB1XLM U12 ( .A0N(n7), .A1N(prescale[3]), .B0(n10), .Y(N17) );
  OAI2BB1XLM U13 ( .A0N(n5), .A1N(prescale[2]), .B0(n7), .Y(N16) );
  INVX4M U14 ( .A(enable), .Y(n43) );
  INVX2M U15 ( .A(n14), .Y(n37) );
  INVX6M U16 ( .A(n2), .Y(n1) );
  INVX2M U17 ( .A(RST), .Y(n2) );
  NOR2X6M U18 ( .A(n43), .B(N21), .Y(n6) );
  NAND2X2M U19 ( .A(N21), .B(enable), .Y(n14) );
  AOI21X2M U20 ( .A0(n40), .A1(n13), .B0(n14), .Y(n9) );
  CLKXOR2X2M U21 ( .A(n42), .B(n8), .Y(n28) );
  INVX2M U22 ( .A(n13), .Y(n39) );
  CLKINVX12M U23 ( .A(n4), .Y(n3) );
  INVX2M U24 ( .A(CLK), .Y(n4) );
  OR2X2M U25 ( .A(prescale[1]), .B(prescale[0]), .Y(n5) );
  OAI211X4M U26 ( .A0(n156), .A1(n155), .B0(n126), .C0(n20), .Y(n13) );
  AOI221X2M U27 ( .A0(PAR_EN), .A1(n120), .B0(n97), .B1(n44), .C0(n61), .Y(n20) );
  INVX2M U28 ( .A(PAR_EN), .Y(n44) );
  OAI32X2M U29 ( .A0(n14), .A1(n151), .A2(n39), .B0(n37), .B1(n40), .Y(n30) );
  OAI32X2M U30 ( .A0(n8), .A1(n127), .A2(n42), .B0(n17), .B1(n38), .Y(n31) );
  INVX2M U31 ( .A(n126), .Y(n38) );
  NOR2BX2M U32 ( .AN(n9), .B(n19), .Y(n17) );
  AOI21X2M U33 ( .A0(n154), .A1(n149), .B0(n39), .Y(n19) );
  NAND3X2M U34 ( .A(n100), .B(n37), .C(n103), .Y(n8) );
  INVX2M U35 ( .A(n106), .Y(n40) );
  OAI21X2M U36 ( .A0(n9), .A1(n41), .B0(n11), .Y(n29) );
  NAND4X1M U37 ( .A(n107), .B(n37), .C(n13), .D(n41), .Y(n11) );
  CLKINVX1M U38 ( .A(n104), .Y(n41) );
  INVX2M U39 ( .A(n154), .Y(n42) );
  ADDHX1M U40 ( .A(\add_23/carry[3] ), .B(n158), .CO(\add_23/carry[4] ), .S(
        N11) );
  ADDHX1M U41 ( .A(n159), .B(n160), .CO(\add_23/carry[2] ), .S(N9) );
  ADDHX1M U42 ( .A(n109), .B(\add_23/carry[2] ), .CO(\add_23/carry[3] ), .S(
        N10) );
  AO22X1M U43 ( .A0(n86), .A1(n43), .B0(N8), .B1(n6), .Y(n27) );
  AO22X1M U44 ( .A0(n43), .A1(n65), .B0(N11), .B1(n6), .Y(n24) );
  AO22X1M U45 ( .A0(n51), .A1(n43), .B0(N9), .B1(n6), .Y(n26) );
  AO22X1M U46 ( .A0(n52), .A1(n43), .B0(N12), .B1(n6), .Y(n23) );
  ADDHX1M U47 ( .A(n112), .B(\add_23/carry[4] ), .CO(\add_23/carry[5] ), .S(
        N12) );
  AO22X1M U48 ( .A0(n53), .A1(n43), .B0(N10), .B1(n6), .Y(n25) );
  AO22X1M U49 ( .A0(n43), .A1(n157), .B0(N13), .B1(n6), .Y(n22) );
  CLKINVX1M U50 ( .A(n54), .Y(N8) );
  CLKXOR2X2M U51 ( .A(\add_23/carry[5] ), .B(n157), .Y(N13) );
  OAI2BB1X1M U52 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n5), .Y(N15) );
  AO21XLM U53 ( .A0(n12), .A1(prescale[5]), .B0(N20), .Y(N19) );
  OAI2B2X1M U54 ( .A1N(n89), .A0(n15), .B0(N15), .B1(n15), .Y(n32) );
  XNOR2X1M U55 ( .A(n157), .B(N19), .Y(n21) );
  OAI2B2X1M U56 ( .A1N(N15), .A0(n16), .B0(n88), .B1(n16), .Y(n18) );
  NAND4BX1M U57 ( .AN(N20), .B(n32), .C(n21), .D(n18), .Y(n36) );
  CLKXOR2X2M U58 ( .A(N18), .B(n113), .Y(n35) );
  CLKXOR2X2M U59 ( .A(N16), .B(n110), .Y(n34) );
  CLKXOR2X2M U60 ( .A(N17), .B(n91), .Y(n33) );
  SDFFRHQX1M \edge_cnt_reg[0]  ( .D(n27), .SI(n127), .SE(n59), .CK(n3), .RN(n1), .Q(n160) );
  SDFFRHQX1M \bit_cnt_reg[0]  ( .D(n30), .SI(test_si), .SE(n57), .CK(n3), .RN(
        n1), .Q(n156) );
  SDFFRHQX1M \bit_cnt_reg[1]  ( .D(n29), .SI(n66), .SE(n57), .CK(n3), .RN(n1), 
        .Q(n155) );
  SDFFRHQX1M \edge_cnt_reg[1]  ( .D(n26), .SI(n54), .SE(n58), .CK(n3), .RN(n1), 
        .Q(n159) );
  SDFFRHQX1M \edge_cnt_reg[3]  ( .D(n24), .SI(n53), .SE(n60), .CK(n3), .RN(n1), 
        .Q(n158) );
  SDFFRQX2M \bit_cnt_reg[3]  ( .D(n31), .SI(n154), .SE(n49), .CK(n3), .RN(n1), 
        .Q(bit_cnt[3]) );
  SDFFRQX2M \edge_cnt_reg[5]  ( .D(n22), .SI(n52), .SE(n49), .CK(n3), .RN(n1), 
        .Q(n157) );
  SDFFRQX2M \bit_cnt_reg[2]  ( .D(n28), .SI(n64), .SE(n50), .CK(n3), .RN(n1), 
        .Q(n154) );
  SDFFRQX2M \edge_cnt_reg[2]  ( .D(n25), .SI(n51), .SE(n60), .CK(n3), .RN(n1), 
        .Q(edge_cnt[2]) );
  SDFFRQX2M \edge_cnt_reg[4]  ( .D(n23), .SI(n65), .SE(n50), .CK(n3), .RN(n1), 
        .Q(edge_cnt[4]) );
  DLY1X1M U61 ( .A(n157), .Y(edge_cnt[5]) );
  INVXLM U62 ( .A(n38), .Y(n48) );
  DLY1X1M U63 ( .A(n58), .Y(n49) );
  DLY1X1M U64 ( .A(n59), .Y(n50) );
  DLY1X1M U65 ( .A(n115), .Y(n51) );
  DLY1X1M U66 ( .A(n136), .Y(n52) );
  DLY1X1M U67 ( .A(n132), .Y(n53) );
  DLY1X1M U68 ( .A(n121), .Y(n54) );
  DLY1X1M U69 ( .A(test_se), .Y(n55) );
  DLY1X1M U70 ( .A(test_se), .Y(n56) );
  DLY1X1M U71 ( .A(n56), .Y(n57) );
  DLY1X1M U72 ( .A(n55), .Y(n58) );
  DLY1X1M U73 ( .A(n56), .Y(n59) );
  DLY1X1M U74 ( .A(n55), .Y(n60) );
  INVXLM U75 ( .A(n42), .Y(n61) );
  DLY1X1M U76 ( .A(n158), .Y(n62) );
  DLY1X1M U77 ( .A(n155), .Y(n63) );
  DLY1X1M U78 ( .A(n147), .Y(n64) );
  DLY1X1M U79 ( .A(n143), .Y(n65) );
  DLY1X1M U80 ( .A(n124), .Y(n66) );
  DLY1X1M U81 ( .A(n84), .Y(n67) );
  DLY1X1M U82 ( .A(n87), .Y(n68) );
  DLY1X1M U83 ( .A(n90), .Y(n69) );
  DLY1X1M U84 ( .A(n93), .Y(n70) );
  DLY1X1M U85 ( .A(n96), .Y(n71) );
  DLY1X1M U86 ( .A(n99), .Y(n72) );
  DLY1X1M U87 ( .A(n102), .Y(n73) );
  DLY1X1M U88 ( .A(n105), .Y(n74) );
  DLY1X1M U89 ( .A(n108), .Y(n75) );
  DLY1X1M U90 ( .A(n111), .Y(n76) );
  DLY1X1M U91 ( .A(n114), .Y(n77) );
  DLY1X1M U92 ( .A(n117), .Y(n78) );
  DLY1X1M U93 ( .A(n122), .Y(n79) );
  DLY1X1M U94 ( .A(n130), .Y(n80) );
  DLY1X1M U95 ( .A(n134), .Y(n81) );
  DLY1X1M U96 ( .A(n144), .Y(n82) );
  DLY1X1M U97 ( .A(n150), .Y(n83) );
  INVXLM U98 ( .A(n146), .Y(n84) );
  INVXLM U99 ( .A(n67), .Y(n85) );
  INVXLM U100 ( .A(n67), .Y(n86) );
  INVXLM U101 ( .A(n116), .Y(n87) );
  INVXLM U102 ( .A(n68), .Y(n88) );
  INVXLM U103 ( .A(n68), .Y(n89) );
  INVXLM U104 ( .A(n142), .Y(n90) );
  INVXLM U105 ( .A(n69), .Y(n91) );
  INVXLM U106 ( .A(n69), .Y(n92) );
  INVXLM U107 ( .A(n145), .Y(n93) );
  INVXLM U108 ( .A(n70), .Y(n94) );
  INVXLM U109 ( .A(n70), .Y(n95) );
  INVXLM U110 ( .A(n64), .Y(n96) );
  INVXLM U111 ( .A(n71), .Y(n97) );
  INVXLM U112 ( .A(n71), .Y(n98) );
  INVXLM U113 ( .A(n153), .Y(n99) );
  INVXLM U114 ( .A(n72), .Y(n100) );
  INVXLM U115 ( .A(n72), .Y(n101) );
  INVXLM U116 ( .A(n148), .Y(n102) );
  INVXLM U117 ( .A(n73), .Y(n103) );
  INVXLM U118 ( .A(n73), .Y(n104) );
  INVXLM U119 ( .A(n152), .Y(n105) );
  INVXLM U120 ( .A(n74), .Y(n106) );
  INVXLM U121 ( .A(n74), .Y(n107) );
  INVXLM U122 ( .A(n131), .Y(n108) );
  INVXLM U123 ( .A(n75), .Y(n109) );
  INVXLM U124 ( .A(n75), .Y(n110) );
  INVXLM U125 ( .A(n135), .Y(n111) );
  INVXLM U126 ( .A(n76), .Y(n112) );
  INVXLM U127 ( .A(n76), .Y(n113) );
  INVXLM U128 ( .A(n141), .Y(n114) );
  INVXLM U129 ( .A(n77), .Y(n115) );
  INVXLM U130 ( .A(n77), .Y(n116) );
  INVXLM U131 ( .A(n159), .Y(n117) );
  INVXLM U132 ( .A(n62), .Y(n118) );
  INVXLM U133 ( .A(n62), .Y(n119) );
  INVXLM U134 ( .A(n40), .Y(n120) );
  INVXLM U135 ( .A(n82), .Y(n121) );
  INVXLM U136 ( .A(n63), .Y(n122) );
  INVXLM U137 ( .A(n63), .Y(n123) );
  INVXLM U138 ( .A(n83), .Y(n124) );
  INVXLM U139 ( .A(n66), .Y(n125) );
  DLY1X1M U140 ( .A(bit_cnt[3]), .Y(n126) );
  DLY1X1M U141 ( .A(n48), .Y(n127) );
  DLY1X1M U142 ( .A(n154), .Y(bit_cnt[2]) );
  DLY1X1M U143 ( .A(n140), .Y(edge_cnt[1]) );
  INVXLM U144 ( .A(edge_cnt[2]), .Y(n130) );
  INVXLM U145 ( .A(n80), .Y(n131) );
  INVXLM U146 ( .A(n80), .Y(n132) );
  DLY1X1M U147 ( .A(n95), .Y(edge_cnt[0]) );
  INVXLM U148 ( .A(edge_cnt[4]), .Y(n134) );
  INVXLM U149 ( .A(n81), .Y(n135) );
  INVXLM U150 ( .A(n81), .Y(n136) );
  DLY1X1M U151 ( .A(n92), .Y(edge_cnt[3]) );
  DLY1X1M U152 ( .A(n101), .Y(bit_cnt[0]) );
  DLY1X1M U153 ( .A(n98), .Y(bit_cnt[1]) );
  INVXLM U154 ( .A(n78), .Y(n140) );
  INVXLM U155 ( .A(n78), .Y(n141) );
  INVXLM U156 ( .A(n119), .Y(n142) );
  INVXLM U157 ( .A(n118), .Y(n143) );
  INVXLM U158 ( .A(n160), .Y(n144) );
  INVXLM U159 ( .A(n82), .Y(n145) );
  INVXLM U160 ( .A(N8), .Y(n146) );
  INVXLM U161 ( .A(n79), .Y(n147) );
  INVXLM U162 ( .A(n123), .Y(n148) );
  INVXLM U163 ( .A(n79), .Y(n149) );
  INVXLM U164 ( .A(n156), .Y(n150) );
  INVXLM U165 ( .A(n83), .Y(n151) );
  INVXLM U166 ( .A(n125), .Y(n152) );
  INVXLM U167 ( .A(n40), .Y(n153) );
endmodule


module data_sampling_test_1 ( dat_samp_en, edge_cnt, RX_IN, CLK, RST, prescale, 
        sampled_bit, test_si, test_so, test_se );
  input [5:0] edge_cnt;
  input [5:0] prescale;
  input dat_samp_en, RX_IN, CLK, RST, test_si, test_se;
  output sampled_bit, test_so;
  wire   complete_sample_flag, n1, n2, n3, n4, n5, n9, n10, n11, n13, n15, n17,
         n18, n19, n20, n21, n22, n25, n26, n27, n28, n29, n34, n35, n36, n37,
         n38, n6, n7, n8, n12, n14, n16, n23, n24, n30, n31, n32, n39, n40,
         n41, n42, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n62;
  wire   [2:0] test_bits;

  NOR3X6M U3 ( .A(prescale[2]), .B(prescale[1]), .C(prescale[0]), .Y(n29) );
  NOR2X2M U4 ( .A(n23), .B(n11), .Y(n25) );
  INVX2M U5 ( .A(n49), .Y(n23) );
  INVX2M U6 ( .A(dat_samp_en), .Y(n14) );
  INVX2M U7 ( .A(n25), .Y(n16) );
  INVX4M U8 ( .A(n7), .Y(n6) );
  INVX2M U9 ( .A(RST), .Y(n7) );
  AOI21X2M U10 ( .A0(n39), .A1(n23), .B0(n30), .Y(n22) );
  INVX2M U11 ( .A(RX_IN), .Y(n42) );
  INVX2M U12 ( .A(n17), .Y(n39) );
  INVX6M U13 ( .A(n12), .Y(n8) );
  INVX2M U14 ( .A(CLK), .Y(n12) );
  NAND4X2M U15 ( .A(n53), .B(dat_samp_en), .C(n26), .D(n27), .Y(n1) );
  NOR2X2M U16 ( .A(edge_cnt[5]), .B(n47), .Y(n26) );
  OAI22X2M U17 ( .A0(n21), .A1(n24), .B0(n55), .B1(n28), .Y(n27) );
  AOI32X1M U18 ( .A0(n39), .A1(n23), .A2(n46), .B0(n25), .B1(n30), .Y(n28) );
  NAND4X2M U19 ( .A(prescale[3]), .B(n29), .C(n40), .D(n32), .Y(n11) );
  NAND4X2M U20 ( .A(prescale[4]), .B(n29), .C(n41), .D(n32), .Y(n15) );
  NAND4X2M U21 ( .A(prescale[5]), .B(n29), .C(n41), .D(n40), .Y(n17) );
  INVX2M U22 ( .A(n52), .Y(n30) );
  INVX2M U23 ( .A(prescale[3]), .Y(n41) );
  INVX2M U24 ( .A(prescale[4]), .Y(n40) );
  INVX2M U25 ( .A(n56), .Y(n24) );
  INVX2M U26 ( .A(prescale[5]), .Y(n32) );
  OAI2BB2X1M U27 ( .B0(n42), .B1(n18), .A0N(n18), .A1N(test_bits[1]), .Y(n37)
         );
  NAND4BX2M U28 ( .AN(n47), .B(n31), .C(n19), .D(n20), .Y(n18) );
  AOI31X2M U29 ( .A0(n24), .A1(n30), .A2(n16), .B0(n48), .Y(n19) );
  AOI211X2M U30 ( .A0(n55), .A1(n21), .B0(n14), .C0(n22), .Y(n20) );
  OAI2BB2X1M U31 ( .B0(n42), .B1(n1), .A0N(n1), .A1N(n60), .Y(n38) );
  OAI2BB2X1M U32 ( .B0(n5), .B1(n42), .A0N(n5), .A1N(test_bits[0]), .Y(n36) );
  NAND4X2M U33 ( .A(n30), .B(n31), .C(n9), .D(n10), .Y(n5) );
  AOI32X1M U34 ( .A0(n15), .A1(n24), .A2(n49), .B0(n56), .B1(n17), .Y(n9) );
  AOI211X2M U35 ( .A0(n11), .A1(n23), .B0(n13), .C0(n14), .Y(n10) );
  OAI2BB2X1M U36 ( .B0(n2), .B1(n3), .A0N(sampled_bit), .A1N(n3), .Y(n35) );
  NAND2X2M U37 ( .A(complete_sample_flag), .B(dat_samp_en), .Y(n3) );
  AOI21X2M U38 ( .A0(test_bits[0]), .A1(n59), .B0(n4), .Y(n2) );
  OA21X2M U39 ( .A0(test_bits[0]), .A1(test_so), .B0(test_bits[1]), .Y(n4) );
  INVX2M U40 ( .A(edge_cnt[5]), .Y(n31) );
  NAND2X2M U41 ( .A(n54), .B(n48), .Y(n13) );
  NAND2BX2M U42 ( .AN(complete_sample_flag), .B(n1), .Y(n34) );
  OR3X2M U43 ( .A(n15), .B(n50), .C(n46), .Y(n21) );
  SDFFRQX2M \test_bits_reg[1]  ( .D(n37), .SI(test_bits[0]), .SE(n45), .CK(n8), 
        .RN(n6), .Q(test_bits[1]) );
  SDFFRQX2M complete_sample_flag_reg ( .D(n34), .SI(test_si), .SE(n58), .CK(n8), .RN(n6), .Q(complete_sample_flag) );
  SDFFRQX2M \test_bits_reg[0]  ( .D(n36), .SI(sampled_bit), .SE(n58), .CK(n8), 
        .RN(n6), .Q(test_bits[0]) );
  SDFFRQX2M sampled_bit_reg ( .D(n35), .SI(complete_sample_flag), .SE(n45), 
        .CK(n8), .RN(n6), .Q(sampled_bit) );
  SDFFRX1M \test_bits_reg[2]  ( .D(n38), .SI(test_bits[1]), .SE(n57), .CK(n8), 
        .RN(n6), .Q(test_so), .QN(n62) );
  DLY1X1M U44 ( .A(n57), .Y(n45) );
  DLY1X1M U45 ( .A(n52), .Y(n46) );
  DLY1X1M U46 ( .A(n54), .Y(n47) );
  DLY1X1M U47 ( .A(n53), .Y(n48) );
  DLY1X1M U48 ( .A(n50), .Y(n49) );
  DLY1X1M U49 ( .A(edge_cnt[2]), .Y(n50) );
  INVXLM U50 ( .A(n24), .Y(n51) );
  DLY1X1M U51 ( .A(edge_cnt[4]), .Y(n52) );
  DLY1X1M U52 ( .A(edge_cnt[0]), .Y(n53) );
  DLY1X1M U53 ( .A(edge_cnt[1]), .Y(n54) );
  DLY1X1M U54 ( .A(n51), .Y(n55) );
  DLY1X1M U55 ( .A(edge_cnt[3]), .Y(n56) );
  DLY1X1M U56 ( .A(test_se), .Y(n57) );
  DLY1X1M U57 ( .A(test_se), .Y(n58) );
  INVXLM U58 ( .A(n62), .Y(n59) );
  INVXLM U59 ( .A(n62), .Y(n60) );
endmodule


module deserializer_test_1 ( deser_en, sampled_bit, CLK, RST, P_DATA, bit_cnt, 
        PAR_EN, test_si, test_se );
  output [7:0] P_DATA;
  input [3:0] bit_cnt;
  input deser_en, sampled_bit, CLK, RST, PAR_EN, test_si, test_se;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n1, n2, n3, n4, n25, n26, n27, n28, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50;

  AND2X2M U2 ( .A(n6), .B(n38), .Y(n11) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
  INVX8M U5 ( .A(n4), .Y(n3) );
  INVX2M U6 ( .A(CLK), .Y(n4) );
  INVX4M U7 ( .A(sampled_bit), .Y(n25) );
  INVX2M U8 ( .A(n40), .Y(n26) );
  INVX2M U9 ( .A(n42), .Y(n27) );
  NOR2BX4M U10 ( .AN(deser_en), .B(bit_cnt[3]), .Y(n6) );
  AND3X2M U11 ( .A(n6), .B(n28), .C(n43), .Y(n8) );
  OAI2BB2X1M U12 ( .B0(n25), .B1(n7), .A0N(P_DATA[1]), .A1N(n7), .Y(n18) );
  NAND2X2M U13 ( .A(n8), .B(n26), .Y(n7) );
  OAI2BB2X1M U14 ( .B0(n25), .B1(n9), .A0N(P_DATA[2]), .A1N(n9), .Y(n19) );
  NAND2X2M U15 ( .A(n8), .B(n41), .Y(n9) );
  OAI2BB2X1M U16 ( .B0(n25), .B1(n10), .A0N(P_DATA[3]), .A1N(n10), .Y(n20) );
  NAND3X2M U17 ( .A(n26), .B(n27), .C(n11), .Y(n10) );
  OAI2BB2X1M U18 ( .B0(n25), .B1(n50), .A0N(P_DATA[4]), .A1N(n12), .Y(n21) );
  NAND3X1M U19 ( .A(n37), .B(n27), .C(n11), .Y(n12) );
  OAI2BB2X1M U20 ( .B0(n25), .B1(n13), .A0N(P_DATA[5]), .A1N(n13), .Y(n22) );
  NAND3X2M U21 ( .A(n42), .B(n26), .C(n11), .Y(n13) );
  OAI2BB2X1M U22 ( .B0(n25), .B1(n48), .A0N(P_DATA[6]), .A1N(n14), .Y(n23) );
  NAND3X1M U23 ( .A(n34), .B(n37), .C(n11), .Y(n14) );
  OAI2BB2X1M U24 ( .B0(n25), .B1(n15), .A0N(P_DATA[7]), .A1N(n15), .Y(n24) );
  NAND4X2M U25 ( .A(bit_cnt[3]), .B(deser_en), .C(n16), .D(n26), .Y(n15) );
  NOR2X1M U26 ( .A(n39), .B(n43), .Y(n16) );
  OAI2BB2X1M U27 ( .B0(n5), .B1(n25), .A0N(P_DATA[0]), .A1N(n5), .Y(n17) );
  NAND4X2M U28 ( .A(n40), .B(n6), .C(n27), .D(n28), .Y(n5) );
  INVX2M U29 ( .A(n38), .Y(n28) );
  SDFFRQX2M \P_DATA_reg[6]  ( .D(n23), .SI(P_DATA[5]), .SE(n35), .CK(n3), .RN(
        n1), .Q(P_DATA[6]) );
  SDFFRQX2M \P_DATA_reg[1]  ( .D(n18), .SI(P_DATA[0]), .SE(n45), .CK(n3), .RN(
        n1), .Q(P_DATA[1]) );
  SDFFRQX2M \P_DATA_reg[5]  ( .D(n22), .SI(P_DATA[4]), .SE(n46), .CK(n3), .RN(
        n1), .Q(P_DATA[5]) );
  SDFFRQX2M \P_DATA_reg[0]  ( .D(n17), .SI(test_si), .SE(n44), .CK(n3), .RN(n1), .Q(P_DATA[0]) );
  SDFFRQX2M \P_DATA_reg[4]  ( .D(n21), .SI(P_DATA[3]), .SE(n36), .CK(n3), .RN(
        n1), .Q(P_DATA[4]) );
  SDFFRQX2M \P_DATA_reg[2]  ( .D(n19), .SI(P_DATA[1]), .SE(n46), .CK(n3), .RN(
        n1), .Q(P_DATA[2]) );
  SDFFRQX2M \P_DATA_reg[7]  ( .D(n24), .SI(P_DATA[6]), .SE(n36), .CK(n3), .RN(
        n1), .Q(P_DATA[7]) );
  SDFFRQX2M \P_DATA_reg[3]  ( .D(n20), .SI(P_DATA[2]), .SE(n35), .CK(n3), .RN(
        n1), .Q(P_DATA[3]) );
  DLY1X1M U30 ( .A(bit_cnt[0]), .Y(n31) );
  DLY1X1M U31 ( .A(bit_cnt[1]), .Y(n32) );
  DLY1X1M U32 ( .A(test_se), .Y(n33) );
  INVXLM U33 ( .A(n27), .Y(n34) );
  DLY1X1M U34 ( .A(n44), .Y(n35) );
  DLY1X1M U35 ( .A(n45), .Y(n36) );
  DLY1X1M U36 ( .A(n41), .Y(n37) );
  DLY1X1M U37 ( .A(n39), .Y(n38) );
  DLY1X1M U38 ( .A(bit_cnt[2]), .Y(n39) );
  DLY1X1M U39 ( .A(n31), .Y(n40) );
  DLY1X1M U40 ( .A(n31), .Y(n41) );
  DLY1X1M U41 ( .A(n32), .Y(n42) );
  DLY1X1M U42 ( .A(n32), .Y(n43) );
  DLY1X1M U43 ( .A(n33), .Y(n44) );
  DLY1X1M U44 ( .A(n33), .Y(n45) );
  DLY1X1M U45 ( .A(test_se), .Y(n46) );
  INVXLM U46 ( .A(n14), .Y(n47) );
  INVXLM U47 ( .A(n47), .Y(n48) );
  INVXLM U48 ( .A(n12), .Y(n49) );
  INVXLM U49 ( .A(n49), .Y(n50) );
endmodule


module parity_check_test_1 ( par_chk_en, sampled_bit, PAR_TYP, CLK, RST, 
        P_DATA, par_err, test_si, test_se );
  input [7:0] P_DATA;
  input par_chk_en, sampled_bit, PAR_TYP, CLK, RST, test_si, test_se;
  output par_err;
  wire   N13, n1, n2, n3, n4, n5, n6;

  XNOR2X2M U3 ( .A(P_DATA[2]), .B(PAR_TYP), .Y(n4) );
  XNOR2X2M U4 ( .A(P_DATA[4]), .B(P_DATA[3]), .Y(n6) );
  XOR3XLM U5 ( .A(P_DATA[6]), .B(P_DATA[5]), .C(n5), .Y(n3) );
  XNOR2X2M U6 ( .A(sampled_bit), .B(P_DATA[7]), .Y(n5) );
  NOR2BX2M U7 ( .AN(par_chk_en), .B(n1), .Y(N13) );
  XOR3XLM U8 ( .A(n2), .B(n3), .C(n4), .Y(n1) );
  XOR3XLM U9 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n6), .Y(n2) );
  SDFFRQX2M par_err_reg ( .D(N13), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(par_err) );
endmodule


module strt_check ( strt_chk_en, sampled_bit, strt_glitch, CLK, RST );
  input strt_chk_en, sampled_bit, CLK, RST;
  output strt_glitch;


  AND2X2M U2 ( .A(strt_chk_en), .B(sampled_bit), .Y(strt_glitch) );
endmodule


module stop_check ( stp_chk_en, sampled_bit, stp_err, CLK, RST );
  input stp_chk_en, sampled_bit, CLK, RST;
  output stp_err;


  NOR2BX2M U2 ( .AN(stp_chk_en), .B(sampled_bit), .Y(stp_err) );
endmodule


module UART_RX_top_test_1 ( RX_IN, PAR_EN, PAR_TYP, prescale, CLK, RST, 
        data_valid, P_DATA, test_si, test_so, test_se );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYP, CLK, RST, test_si, test_se;
  output data_valid, test_so;
  wire   dat_samp_en, enable, par_chk_en, par_err, strt_chk_en, strt_glitch,
         stp_chk_en, stp_err, deser_en, from_parity, sampled_bit, n1, n2, n3,
         n4, n5, n6, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;
  assign test_so = par_err;

  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX6M U2 ( .A(n4), .Y(n3) );
  INVX2M U3 ( .A(RST), .Y(n2) );
  INVX2M U4 ( .A(CLK), .Y(n4) );
  DLY1X1M U5 ( .A(edge_cnt[0]), .Y(n9) );
  DLY1X1M U6 ( .A(edge_cnt[0]), .Y(n10) );
  DLY1X1M U7 ( .A(edge_cnt[1]), .Y(n11) );
  DLY1X1M U8 ( .A(edge_cnt[1]), .Y(n12) );
  DLY1X1M U9 ( .A(edge_cnt[3]), .Y(n13) );
  DLY1X1M U10 ( .A(edge_cnt[3]), .Y(n14) );
  DLY1X1M U11 ( .A(n28), .Y(n15) );
  DLY1X1M U12 ( .A(n28), .Y(n16) );
  DLY1X1M U13 ( .A(n21), .Y(n17) );
  DLY1X1M U14 ( .A(PAR_EN), .Y(n18) );
  DLY1X1M U15 ( .A(sampled_bit), .Y(n19) );
  DLY1X1M U16 ( .A(sampled_bit), .Y(n20) );
  DLY1X1M U17 ( .A(edge_cnt[5]), .Y(n21) );
  DLY1X1M U18 ( .A(edge_cnt[5]), .Y(n22) );
  DLY1X1M U19 ( .A(n18), .Y(n23) );
  DLY1X1M U20 ( .A(n18), .Y(n24) );
  DLY1X1M U21 ( .A(test_se), .Y(n25) );
  DLY1X1M U22 ( .A(n25), .Y(n26) );
  DLY1X1M U23 ( .A(n25), .Y(n27) );
  DLY1X1M U24 ( .A(n27), .Y(n28) );
  DLY1X1M U25 ( .A(n26), .Y(n29) );
  DLY1X1M U26 ( .A(n27), .Y(n30) );
  DLY1X1M U27 ( .A(n26), .Y(n31) );
  FSM_test_1 U_FSM ( .RX_IN(RX_IN), .PAR_EN(n24), .edge_cnt({n17, edge_cnt[4], 
        n14, edge_cnt[2], n12, n10}), .bit_cnt(bit_cnt), .par_err(par_err), 
        .strt_glitch(strt_glitch), .stp_err(stp_err), .CLK(n3), .RST(n1), 
        .prescale(prescale), .dat_samp_en(dat_samp_en), .enable(enable), 
        .par_chk_en(par_chk_en), .strt_chk_en(strt_chk_en), .stp_chk_en(
        stp_chk_en), .deser_en(deser_en), .data_valid(data_valid), 
        .from_parity(from_parity), .test_si(test_si), .test_so(n6), .test_se(
        n30) );
  edge_bit_counter_test_1 U_edge_bit_counter ( .enable(enable), .CLK(n3), 
        .RST(n1), .bit_cnt(bit_cnt), .edge_cnt(edge_cnt), .prescale(prescale), 
        .PAR_EN(n23), .from_parity(from_parity), .test_si(P_DATA[7]), 
        .test_se(n15) );
  data_sampling_test_1 U_data_sampling ( .dat_samp_en(dat_samp_en), .edge_cnt(
        {n22, edge_cnt[4], n13, edge_cnt[2], n11, n9}), .RX_IN(RX_IN), .CLK(n3), .RST(n1), .prescale(prescale), .sampled_bit(sampled_bit), .test_si(n6), 
        .test_so(n5), .test_se(n31) );
  deserializer_test_1 U_deserializer ( .deser_en(deser_en), .sampled_bit(n19), 
        .CLK(n3), .RST(n1), .P_DATA(P_DATA), .bit_cnt(bit_cnt), .PAR_EN(n23), 
        .test_si(n5), .test_se(n29) );
  parity_check_test_1 U_parity_check ( .par_chk_en(par_chk_en), .sampled_bit(
        n19), .PAR_TYP(PAR_TYP), .CLK(n3), .RST(n1), .P_DATA(P_DATA), 
        .par_err(par_err), .test_si(n21), .test_se(n16) );
  strt_check U_strt_check ( .strt_chk_en(strt_chk_en), .sampled_bit(n20), 
        .strt_glitch(strt_glitch), .CLK(n3), .RST(n1) );
  stop_check U_stop_check ( .stp_chk_en(stp_chk_en), .sampled_bit(n20), 
        .stp_err(stp_err), .CLK(n3), .RST(n1) );
endmodule


module sys_ctrl_test_1 ( CLK, RST, ALU_OUT, OUT_Valid, FIFO_FULL, ALU_FUN, 
        ALU_EN, CLK_EN, Address, WrEn, RdEn, WrData, RdData, RdData_Valid, 
        RX_P_DATA, RX_D_VLD, TX_P_DATA, TX_D_VLD, clk_div_en, test_si, test_so, 
        test_se );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  input [7:0] RdData;
  input [7:0] RX_P_DATA;
  output [7:0] TX_P_DATA;
  input CLK, RST, OUT_Valid, FIFO_FULL, RdData_Valid, RX_D_VLD, test_si,
         test_se;
  output ALU_EN, CLK_EN, WrEn, RdEn, TX_D_VLD, clk_div_en, test_so;
  wire   n15, n16, n17, n18, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n3, n4, n6, n7, n8, n9, n10, n11, n12, n13, n14, n19,
         n21, n22, n23, n24, n25, n26, n82, n83, n84, n85, n86, n87, n88, n89,
         n92, n93, n95, n96, n97, n98, n99, n100, n101, n102, n103, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142;
  wire   [3:0] current_state;
  wire   [3:0] next_state;

  NOR2X12M U73 ( .A(n77), .B(n15), .Y(Address[3]) );
  NOR2X12M U74 ( .A(n77), .B(n16), .Y(Address[2]) );
  NOR2X8M U5 ( .A(n86), .B(n21), .Y(ALU_FUN[2]) );
  OAI2B11X2M U6 ( .A1N(n33), .A0(n23), .B0(n45), .C0(n46), .Y(n40) );
  NAND2X2M U7 ( .A(n75), .B(n21), .Y(ALU_EN) );
  NAND3X2M U8 ( .A(n121), .B(n76), .C(n4), .Y(n35) );
  INVXLM U9 ( .A(current_state[3]), .Y(n3) );
  INVX4M U10 ( .A(n3), .Y(n4) );
  NOR2X6M U11 ( .A(n88), .B(n21), .Y(ALU_FUN[0]) );
  NOR2X4M U12 ( .A(n87), .B(n21), .Y(ALU_FUN[1]) );
  NOR2X2M U13 ( .A(n14), .B(n32), .Y(n75) );
  NOR2X4M U14 ( .A(n82), .B(current_state[1]), .Y(n76) );
  NAND3X2M U15 ( .A(n76), .B(n25), .C(n137), .Y(n36) );
  NOR2X4M U16 ( .A(n26), .B(n4), .Y(n63) );
  INVX2M U17 ( .A(n4), .Y(n25) );
  INVX2M U18 ( .A(RX_P_DATA[3]), .Y(n85) );
  NAND3X2M U19 ( .A(n76), .B(n115), .C(n4), .Y(n34) );
  NOR4X4M U20 ( .A(n26), .B(n25), .C(n82), .D(n125), .Y(n32) );
  INVX2M U21 ( .A(RX_P_DATA[2]), .Y(n86) );
  INVX4M U22 ( .A(n31), .Y(n21) );
  CLKBUFX6M U23 ( .A(n66), .Y(n6) );
  NOR2X2M U24 ( .A(n38), .B(n41), .Y(n66) );
  INVX2M U25 ( .A(n62), .Y(n11) );
  NOR2X4M U26 ( .A(n89), .B(n36), .Y(n31) );
  NAND2X2M U27 ( .A(n31), .B(n85), .Y(ALU_FUN[3]) );
  AND3X4M U28 ( .A(n52), .B(n41), .C(n35), .Y(n77) );
  NAND3X2M U29 ( .A(n76), .B(n25), .C(n129), .Y(n41) );
  NOR2X8M U30 ( .A(n33), .B(n23), .Y(n67) );
  NAND4X2M U31 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(next_state[2]) );
  AOI211X2M U32 ( .A0(n19), .A1(n38), .B0(n39), .C0(n40), .Y(n37) );
  INVX2M U33 ( .A(n41), .Y(n19) );
  NAND4X2M U34 ( .A(n47), .B(n48), .C(n88), .D(n84), .Y(n45) );
  OAI21BX1M U35 ( .A0(n75), .A1(n33), .B0N(n6), .Y(TX_D_VLD) );
  NOR2X2M U36 ( .A(n12), .B(n88), .Y(WrData[0]) );
  NOR2X2M U37 ( .A(n12), .B(n87), .Y(WrData[1]) );
  NOR2X2M U38 ( .A(n12), .B(n86), .Y(WrData[2]) );
  NOR2X2M U39 ( .A(n12), .B(n85), .Y(WrData[3]) );
  NOR2X2M U40 ( .A(n12), .B(n84), .Y(WrData[4]) );
  NOR2X2M U41 ( .A(n12), .B(n83), .Y(WrData[7]) );
  INVX4M U42 ( .A(WrEn), .Y(n12) );
  INVX2M U43 ( .A(n32), .Y(n23) );
  INVX2M U44 ( .A(n51), .Y(n22) );
  INVX2M U45 ( .A(n34), .Y(n14) );
  BUFX4M U46 ( .A(n50), .Y(n7) );
  NOR2X2M U47 ( .A(n33), .B(n34), .Y(n50) );
  INVX2M U48 ( .A(n46), .Y(n13) );
  OR2X2M U49 ( .A(FIFO_FULL), .B(n10), .Y(n38) );
  NOR4X4M U50 ( .A(n26), .B(n25), .C(n128), .D(n82), .Y(n30) );
  AND3X2M U51 ( .A(n61), .B(n112), .C(n26), .Y(n47) );
  NAND2X4M U52 ( .A(n27), .B(n59), .Y(n62) );
  NAND3X4M U53 ( .A(n130), .B(n82), .C(n63), .Y(n27) );
  OAI211X2M U54 ( .A0(n89), .A1(n27), .B0(n28), .C0(n29), .Y(next_state[3]) );
  AOI211X2M U55 ( .A0(n30), .A1(n89), .B0(n31), .C0(n14), .Y(n29) );
  AOI22X1M U56 ( .A0(n32), .A1(n33), .B0(RdEn), .B1(n10), .Y(n28) );
  INVX2M U57 ( .A(n35), .Y(RdEn) );
  INVX2M U58 ( .A(n59), .Y(n24) );
  INVX4M U59 ( .A(n9), .Y(n8) );
  INVX2M U60 ( .A(RST), .Y(n9) );
  INVX4M U61 ( .A(current_state[2]), .Y(n82) );
  INVX4M U62 ( .A(RX_D_VLD), .Y(n89) );
  INVX4M U63 ( .A(RX_P_DATA[0]), .Y(n88) );
  INVX2M U64 ( .A(RX_P_DATA[1]), .Y(n87) );
  INVX4M U65 ( .A(current_state[1]), .Y(n26) );
  NAND3X2M U66 ( .A(n124), .B(n82), .C(n63), .Y(n52) );
  OAI22X1M U67 ( .A0(n89), .A1(n51), .B0(n77), .B1(n18), .Y(Address[0]) );
  OAI2BB1X2M U68 ( .A0N(ALU_OUT[0]), .A1N(n7), .B0(n74), .Y(TX_P_DATA[0]) );
  AOI22X1M U69 ( .A0(RdData[0]), .A1(n6), .B0(ALU_OUT[8]), .B1(n67), .Y(n74)
         );
  OAI2BB1X2M U70 ( .A0N(ALU_OUT[1]), .A1N(n7), .B0(n73), .Y(TX_P_DATA[1]) );
  AOI22X1M U71 ( .A0(RdData[1]), .A1(n6), .B0(ALU_OUT[9]), .B1(n67), .Y(n73)
         );
  OAI2BB1X2M U72 ( .A0N(ALU_OUT[2]), .A1N(n7), .B0(n72), .Y(TX_P_DATA[2]) );
  AOI22X1M U75 ( .A0(RdData[2]), .A1(n6), .B0(ALU_OUT[10]), .B1(n67), .Y(n72)
         );
  OAI2BB1X2M U76 ( .A0N(ALU_OUT[3]), .A1N(n7), .B0(n71), .Y(TX_P_DATA[3]) );
  AOI22X1M U77 ( .A0(RdData[3]), .A1(n6), .B0(ALU_OUT[11]), .B1(n67), .Y(n71)
         );
  OAI2BB1X2M U78 ( .A0N(ALU_OUT[4]), .A1N(n7), .B0(n70), .Y(TX_P_DATA[4]) );
  AOI22X1M U79 ( .A0(RdData[4]), .A1(n6), .B0(ALU_OUT[12]), .B1(n67), .Y(n70)
         );
  OAI2BB1X2M U80 ( .A0N(ALU_OUT[5]), .A1N(n7), .B0(n69), .Y(TX_P_DATA[5]) );
  AOI22X1M U81 ( .A0(RdData[5]), .A1(n6), .B0(ALU_OUT[13]), .B1(n67), .Y(n69)
         );
  OAI2BB1X2M U82 ( .A0N(ALU_OUT[6]), .A1N(n7), .B0(n68), .Y(TX_P_DATA[6]) );
  AOI22X1M U83 ( .A0(RdData[6]), .A1(n6), .B0(ALU_OUT[14]), .B1(n67), .Y(n68)
         );
  OAI2BB1X2M U84 ( .A0N(ALU_OUT[7]), .A1N(n7), .B0(n65), .Y(TX_P_DATA[7]) );
  AOI22X1M U85 ( .A0(RdData[7]), .A1(n6), .B0(ALU_OUT[15]), .B1(n67), .Y(n65)
         );
  NAND2BX4M U86 ( .AN(FIFO_FULL), .B(OUT_Valid), .Y(n33) );
  NAND3X2M U87 ( .A(n63), .B(current_state[2]), .C(n103), .Y(n51) );
  NAND2X4M U88 ( .A(n52), .B(n64), .Y(WrEn) );
  OAI21X2M U89 ( .A0(n22), .A1(n13), .B0(RX_D_VLD), .Y(n64) );
  NAND3X2M U90 ( .A(current_state[2]), .B(n127), .C(n63), .Y(n46) );
  NOR2X2M U91 ( .A(n77), .B(n17), .Y(Address[1]) );
  OAI211X4M U92 ( .A0(n89), .A1(n27), .B0(n56), .C0(n57), .Y(n39) );
  NOR2X2M U93 ( .A(n30), .B(n22), .Y(n57) );
  NAND4X2M U94 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n47), .D(n48), .Y(n56)
         );
  OAI2B11X2M U95 ( .A1N(n42), .A0(RX_D_VLD), .B0(n43), .C0(n44), .Y(
        next_state[1]) );
  NAND4BX1M U96 ( .AN(n30), .B(n27), .C(n51), .D(n52), .Y(n42) );
  AOI31X2M U97 ( .A0(RX_P_DATA[4]), .A1(RX_P_DATA[0]), .A2(n49), .B0(n7), .Y(
        n43) );
  AOI21X2M U98 ( .A0(n24), .A1(RX_D_VLD), .B0(n40), .Y(n44) );
  NOR2X4M U99 ( .A(current_state[2]), .B(n4), .Y(n61) );
  OAI22X1M U100 ( .A0(n11), .A1(n88), .B0(n62), .B1(n18), .Y(n78) );
  OAI22X1M U101 ( .A0(n11), .A1(n87), .B0(n62), .B1(n17), .Y(n79) );
  OAI22X1M U102 ( .A0(n11), .A1(n86), .B0(n62), .B1(n16), .Y(n80) );
  OAI22X1M U103 ( .A0(n11), .A1(n85), .B0(n62), .B1(n15), .Y(n81) );
  AND2X2M U104 ( .A(RX_P_DATA[5]), .B(WrEn), .Y(WrData[5]) );
  AND2X2M U105 ( .A(RX_P_DATA[6]), .B(WrEn), .Y(WrData[6]) );
  OAI211X2M U106 ( .A0(RX_D_VLD), .A1(n53), .B0(n54), .C0(n55), .Y(
        next_state[0]) );
  AOI21BX2M U107 ( .A0(n61), .A1(n122), .B0N(n36), .Y(n53) );
  AOI31X2M U108 ( .A0(n88), .A1(n84), .A2(n49), .B0(n24), .Y(n54) );
  AOI221X2M U109 ( .A0(n13), .A1(RX_D_VLD), .B0(RdEn), .B1(n10), .C0(n39), .Y(
        n55) );
  INVX2M U110 ( .A(RdData_Valid), .Y(n10) );
  AND4X2M U111 ( .A(RX_P_DATA[1]), .B(n47), .C(RX_P_DATA[5]), .D(n60), .Y(n49)
         );
  NOR4X2M U112 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[2]), .C(n85), .D(n83), .Y(n60)
         );
  NAND3X2M U113 ( .A(n119), .B(n26), .C(n61), .Y(n59) );
  AND4X2M U114 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[3]), .C(RX_P_DATA[7]), .D(n58), 
        .Y(n48) );
  NOR3X2M U115 ( .A(n86), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n58) );
  INVX2M U116 ( .A(RX_P_DATA[4]), .Y(n84) );
  INVX2M U117 ( .A(RX_P_DATA[7]), .Y(n83) );
  BUFX2M U118 ( .A(ALU_EN), .Y(CLK_EN) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n113), .SE(n102), 
        .CK(CLK), .RN(n8), .Q(current_state[1]) );
  DLY1X1M U119 ( .A(n99), .Y(n96) );
  DLY1X1M U120 ( .A(n100), .Y(n97) );
  DLY1X1M U121 ( .A(n101), .Y(n98) );
  DLY1X1M U122 ( .A(test_se), .Y(n99) );
  DLY1X1M U123 ( .A(n99), .Y(n100) );
  DLY1X1M U124 ( .A(n96), .Y(n101) );
  DLY1X1M U125 ( .A(n96), .Y(n102) );
  DLY1X1M U126 ( .A(current_state[0]), .Y(n103) );
  DLY1X1M U128 ( .A(n111), .Y(n105) );
  DLY1X1M U129 ( .A(n114), .Y(n106) );
  DLY1X1M U130 ( .A(n117), .Y(n107) );
  DLY1X1M U131 ( .A(n120), .Y(n108) );
  DLY1X1M U132 ( .A(n123), .Y(n109) );
  DLY1X1M U133 ( .A(n126), .Y(n110) );
  INVXLM U134 ( .A(n131), .Y(n111) );
  INVXLM U135 ( .A(n105), .Y(n112) );
  INVXLM U136 ( .A(n105), .Y(n113) );
  INVXLM U137 ( .A(n141), .Y(n114) );
  INVXLM U138 ( .A(n106), .Y(n115) );
  INVXLM U139 ( .A(n106), .Y(n116) );
  INVXLM U140 ( .A(n135), .Y(n117) );
  INVXLM U141 ( .A(n107), .Y(n118) );
  INVXLM U142 ( .A(n107), .Y(n119) );
  INVXLM U143 ( .A(n136), .Y(n120) );
  INVXLM U144 ( .A(n108), .Y(n121) );
  INVXLM U145 ( .A(n108), .Y(n122) );
  INVXLM U146 ( .A(n140), .Y(n123) );
  INVXLM U147 ( .A(n109), .Y(n124) );
  INVXLM U148 ( .A(n109), .Y(n125) );
  INVXLM U149 ( .A(n142), .Y(n126) );
  INVXLM U150 ( .A(n110), .Y(n127) );
  INVXLM U151 ( .A(n110), .Y(n128) );
  DLY1X1M U153 ( .A(n138), .Y(n139) );
  INVXLM U154 ( .A(n139), .Y(n130) );
  INVXLM U155 ( .A(n139), .Y(n131) );
  INVXLM U157 ( .A(n103), .Y(n133) );
  INVXLM U158 ( .A(n129), .Y(n134) );
  INVXLM U159 ( .A(n129), .Y(n135) );
  INVXLM U160 ( .A(n132), .Y(n136) );
  INVXLM U161 ( .A(n129), .Y(n137) );
  INVXLM U162 ( .A(n116), .Y(n138) );
  INVXLM U163 ( .A(n133), .Y(n140) );
  INVXLM U164 ( .A(n134), .Y(n141) );
  INVXLM U165 ( .A(n118), .Y(n142) );
  SDFFRX1M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(n100), 
        .CK(CLK), .RN(RST), .Q(current_state[0]), .QN(n132) );
  SDFFRX1M \stored_addr_reg[0]  ( .D(n78), .SI(n4), .SE(n101), .CK(CLK), .RN(
        n8), .Q(n95), .QN(n18) );
  SDFFRX1M \stored_addr_reg[1]  ( .D(n79), .SI(n95), .SE(n102), .CK(CLK), .RN(
        n8), .Q(n92), .QN(n17) );
  SDFFRX1M \stored_addr_reg[2]  ( .D(n80), .SI(n92), .SE(n97), .CK(CLK), .RN(
        n8), .Q(n93), .QN(n16) );
  SDFFRX1M \stored_addr_reg[3]  ( .D(n81), .SI(n93), .SE(n98), .CK(CLK), .RN(
        n8), .Q(test_so), .QN(n15) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(n26), .SE(n97), 
        .CK(CLK), .RN(n8), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .SI(n82), .SE(n98), 
        .CK(CLK), .RN(n8), .Q(current_state[3]) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  BUFX2M U127 ( .A(n132), .Y(n129) );
endmodule


module RegFile_WIDTH8_ADDR4_test_1 ( CLK, RST, WrEn, RdEn, Address, WrData, 
        RdData, RdData_VLD, REG0, REG1, REG2, REG3, test_si3, test_si2, 
        test_si1, test_so3, test_so2, test_so1, test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn, test_si3, test_si2, test_si1, test_se;
  output RdData_VLD, test_so3, test_so2, test_so1;
  wire   N11, N12, N13, N14, n286, n459, \regArr[15][7] , \regArr[15][6] ,
         \regArr[15][5] , \regArr[15][4] , \regArr[15][3] , \regArr[15][2] ,
         \regArr[15][1] , \regArr[15][0] , \regArr[14][7] , \regArr[14][6] ,
         \regArr[14][5] , \regArr[14][4] , \regArr[14][3] , \regArr[14][2] ,
         \regArr[14][1] , \regArr[14][0] , \regArr[13][7] , \regArr[13][6] ,
         \regArr[13][5] , \regArr[13][4] , \regArr[13][3] , \regArr[13][2] ,
         \regArr[13][1] , \regArr[13][0] , \regArr[12][7] , \regArr[12][6] ,
         \regArr[12][5] , \regArr[12][4] , \regArr[12][3] , \regArr[12][2] ,
         \regArr[12][1] , \regArr[12][0] , \regArr[11][7] , \regArr[11][6] ,
         \regArr[11][5] , \regArr[11][4] , \regArr[11][3] , \regArr[11][2] ,
         \regArr[11][1] , \regArr[11][0] , \regArr[10][7] , \regArr[10][6] ,
         \regArr[10][5] , \regArr[10][4] , \regArr[10][3] , \regArr[10][2] ,
         \regArr[10][1] , \regArr[10][0] , \regArr[9][7] , \regArr[9][6] ,
         \regArr[9][5] , \regArr[9][4] , \regArr[9][3] , \regArr[9][2] ,
         \regArr[9][1] , \regArr[9][0] , \regArr[8][7] , \regArr[8][6] ,
         \regArr[8][5] , \regArr[8][4] , \regArr[8][3] , \regArr[8][2] ,
         \regArr[8][1] , \regArr[8][0] , \regArr[7][7] , \regArr[7][6] ,
         \regArr[7][5] , \regArr[7][4] , \regArr[7][3] , \regArr[7][2] ,
         \regArr[7][1] , \regArr[7][0] , \regArr[6][7] , \regArr[6][6] ,
         \regArr[6][5] , \regArr[6][4] , \regArr[6][3] , \regArr[6][2] ,
         \regArr[6][1] , \regArr[6][0] , \regArr[5][7] , \regArr[5][6] ,
         \regArr[5][5] , \regArr[5][4] , \regArr[5][3] , \regArr[5][2] ,
         \regArr[5][1] , \regArr[5][0] , \regArr[4][7] , \regArr[4][6] ,
         \regArr[4][5] , \regArr[4][4] , \regArr[4][3] , \regArr[4][2] ,
         \regArr[4][1] , \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42,
         N43, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n299, n293, n292, n291, n296, n290, n300,
         n182, n184, n301, n298, n297, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n294, n295, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n1, n3, n4, n5, n7, n9, n11, n178, n180, n183,
         n186, n288;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];
  assign test_so3 = \regArr[15][7] ;
  assign test_so2 = \regArr[13][2] ;

  MX4XLM U4 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(n453), .S0(n226), .S1(
        n221), .Y(n207) );
  MX4XLM U11 ( .A(REG0[3]), .B(n455), .C(n4), .D(n450), .S0(n226), .S1(n220), 
        .Y(n203) );
  INVXLM U12 ( .A(n286), .Y(n182) );
  INVX8M U13 ( .A(n182), .Y(REG2[7]) );
  NOR2BX4M U18 ( .AN(n27), .B(n260), .Y(n16) );
  NOR2BX2M U19 ( .AN(n13), .B(N14), .Y(n27) );
  NOR2BX4M U20 ( .AN(n38), .B(n261), .Y(n32) );
  NOR2BX4M U21 ( .AN(n27), .B(n261), .Y(n18) );
  NOR2X4M U22 ( .A(n263), .B(N13), .Y(n20) );
  NOR2X4M U23 ( .A(n262), .B(N13), .Y(n15) );
  NOR2BX4M U24 ( .AN(N13), .B(n262), .Y(n23) );
  NOR2BX4M U25 ( .AN(N13), .B(n263), .Y(n26) );
  INVX2M U26 ( .A(N11), .Y(n261) );
  INVX2M U27 ( .A(N12), .Y(n263) );
  INVX8M U28 ( .A(WrData[5]), .Y(n284) );
  INVX8M U29 ( .A(WrData[6]), .Y(n285) );
  CLKBUFX8M U30 ( .A(n224), .Y(n226) );
  CLKBUFX6M U31 ( .A(n224), .Y(n225) );
  CLKBUFX8M U32 ( .A(n262), .Y(n220) );
  CLKBUFX8M U33 ( .A(n275), .Y(n265) );
  CLKBUFX8M U34 ( .A(n275), .Y(n266) );
  CLKBUFX8M U35 ( .A(n275), .Y(n267) );
  CLKBUFX8M U36 ( .A(n276), .Y(n268) );
  CLKBUFX8M U37 ( .A(n275), .Y(n269) );
  CLKBUFX8M U38 ( .A(RST), .Y(n270) );
  CLKBUFX8M U39 ( .A(n274), .Y(n271) );
  CLKBUFX8M U40 ( .A(n274), .Y(n272) );
  CLKBUFX8M U41 ( .A(n274), .Y(n264) );
  BUFX4M U42 ( .A(n274), .Y(n273) );
  BUFX2M U43 ( .A(n222), .Y(n223) );
  BUFX4M U44 ( .A(n29), .Y(n242) );
  BUFX4M U45 ( .A(n31), .Y(n240) );
  BUFX4M U46 ( .A(n33), .Y(n238) );
  BUFX4M U47 ( .A(n34), .Y(n236) );
  BUFX4M U48 ( .A(n19), .Y(n254) );
  BUFX4M U49 ( .A(n21), .Y(n252) );
  BUFX4M U50 ( .A(n22), .Y(n250) );
  BUFX4M U51 ( .A(n24), .Y(n248) );
  BUFX4M U52 ( .A(n25), .Y(n246) );
  BUFX4M U53 ( .A(n28), .Y(n244) );
  BUFX4M U54 ( .A(n35), .Y(n234) );
  BUFX4M U55 ( .A(n36), .Y(n232) );
  BUFX4M U56 ( .A(n37), .Y(n230) );
  BUFX4M U57 ( .A(n39), .Y(n228) );
  BUFX4M U58 ( .A(n29), .Y(n241) );
  BUFX4M U59 ( .A(n31), .Y(n239) );
  BUFX4M U60 ( .A(n33), .Y(n237) );
  BUFX4M U61 ( .A(n34), .Y(n235) );
  BUFX4M U62 ( .A(n22), .Y(n249) );
  BUFX4M U63 ( .A(n24), .Y(n247) );
  BUFX4M U64 ( .A(n25), .Y(n245) );
  BUFX4M U65 ( .A(n28), .Y(n243) );
  BUFX4M U66 ( .A(n35), .Y(n233) );
  BUFX4M U67 ( .A(n36), .Y(n231) );
  BUFX4M U68 ( .A(n37), .Y(n229) );
  BUFX4M U69 ( .A(n39), .Y(n227) );
  BUFX2M U70 ( .A(n222), .Y(n224) );
  CLKBUFX8M U71 ( .A(n262), .Y(n221) );
  BUFX4M U72 ( .A(n17), .Y(n256) );
  BUFX4M U73 ( .A(n14), .Y(n258) );
  BUFX4M U74 ( .A(n17), .Y(n255) );
  BUFX4M U75 ( .A(n19), .Y(n253) );
  BUFX4M U76 ( .A(n21), .Y(n251) );
  BUFX4M U77 ( .A(n14), .Y(n257) );
  INVX4M U78 ( .A(n259), .Y(n277) );
  BUFX2M U79 ( .A(n276), .Y(n275) );
  BUFX2M U80 ( .A(n276), .Y(n274) );
  NOR2BX4M U81 ( .AN(n38), .B(n260), .Y(n30) );
  NAND2X2M U82 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U83 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U84 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U85 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U86 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U87 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U88 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U89 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U90 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U91 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U92 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U93 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U94 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U95 ( .A(n20), .B(n18), .Y(n21) );
  BUFX2M U96 ( .A(n260), .Y(n222) );
  NAND2X2M U97 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U98 ( .A(n15), .B(n16), .Y(n14) );
  BUFX4M U99 ( .A(n12), .Y(n259) );
  AND2X2M U100 ( .A(N14), .B(n13), .Y(n38) );
  INVX2M U101 ( .A(n261), .Y(n260) );
  INVX8M U102 ( .A(WrData[0]), .Y(n283) );
  INVX8M U103 ( .A(WrData[1]), .Y(n282) );
  INVX8M U104 ( .A(WrData[2]), .Y(n281) );
  INVX8M U105 ( .A(WrData[3]), .Y(n280) );
  INVX8M U106 ( .A(WrData[4]), .Y(n279) );
  INVX8M U107 ( .A(WrData[7]), .Y(n278) );
  NOR2BX4M U108 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  INVX2M U109 ( .A(n263), .Y(n262) );
  NAND2BX2M U110 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  BUFX2M U111 ( .A(RST), .Y(n276) );
  OAI2BB2X1M U112 ( .B0(n284), .B1(n249), .A0N(\regArr[4][5] ), .A1N(n250), 
        .Y(n86) );
  OAI2BB2X1M U113 ( .B0(n285), .B1(n249), .A0N(\regArr[4][6] ), .A1N(n250), 
        .Y(n87) );
  OAI2BB2X1M U114 ( .B0(n284), .B1(n247), .A0N(\regArr[5][5] ), .A1N(n248), 
        .Y(n94) );
  OAI2BB2X1M U115 ( .B0(n285), .B1(n247), .A0N(\regArr[5][6] ), .A1N(n248), 
        .Y(n95) );
  OAI2BB2X1M U116 ( .B0(n284), .B1(n245), .A0N(\regArr[6][5] ), .A1N(n246), 
        .Y(n102) );
  OAI2BB2X1M U117 ( .B0(n285), .B1(n245), .A0N(\regArr[6][6] ), .A1N(n246), 
        .Y(n103) );
  OAI2BB2X1M U118 ( .B0(n284), .B1(n243), .A0N(\regArr[7][5] ), .A1N(n244), 
        .Y(n110) );
  OAI2BB2X1M U119 ( .B0(n285), .B1(n243), .A0N(\regArr[7][6] ), .A1N(n244), 
        .Y(n111) );
  OAI2BB2X1M U120 ( .B0(n284), .B1(n241), .A0N(\regArr[8][5] ), .A1N(n242), 
        .Y(n118) );
  OAI2BB2X1M U121 ( .B0(n285), .B1(n241), .A0N(\regArr[8][6] ), .A1N(n242), 
        .Y(n119) );
  OAI2BB2X1M U122 ( .B0(n284), .B1(n239), .A0N(\regArr[9][5] ), .A1N(n240), 
        .Y(n126) );
  OAI2BB2X1M U123 ( .B0(n285), .B1(n239), .A0N(\regArr[9][6] ), .A1N(n240), 
        .Y(n127) );
  OAI2BB2X1M U124 ( .B0(n284), .B1(n237), .A0N(\regArr[10][5] ), .A1N(n238), 
        .Y(n134) );
  OAI2BB2X1M U125 ( .B0(n285), .B1(n237), .A0N(\regArr[10][6] ), .A1N(n238), 
        .Y(n135) );
  OAI2BB2X1M U126 ( .B0(n284), .B1(n235), .A0N(\regArr[11][5] ), .A1N(n236), 
        .Y(n142) );
  OAI2BB2X1M U127 ( .B0(n285), .B1(n235), .A0N(\regArr[11][6] ), .A1N(n236), 
        .Y(n143) );
  OAI2BB2X1M U128 ( .B0(n284), .B1(n233), .A0N(\regArr[12][5] ), .A1N(n234), 
        .Y(n150) );
  OAI2BB2X1M U129 ( .B0(n285), .B1(n233), .A0N(\regArr[12][6] ), .A1N(n234), 
        .Y(n151) );
  OAI2BB2X1M U130 ( .B0(n284), .B1(n231), .A0N(\regArr[13][5] ), .A1N(n232), 
        .Y(n158) );
  OAI2BB2X1M U131 ( .B0(n285), .B1(n231), .A0N(\regArr[13][6] ), .A1N(n232), 
        .Y(n159) );
  OAI2BB2X1M U132 ( .B0(n284), .B1(n229), .A0N(\regArr[14][5] ), .A1N(n230), 
        .Y(n166) );
  OAI2BB2X1M U133 ( .B0(n285), .B1(n229), .A0N(\regArr[14][6] ), .A1N(n230), 
        .Y(n167) );
  OAI2BB2X1M U134 ( .B0(n284), .B1(n227), .A0N(\regArr[15][5] ), .A1N(n228), 
        .Y(n174) );
  OAI2BB2X1M U135 ( .B0(n285), .B1(n227), .A0N(\regArr[15][6] ), .A1N(n228), 
        .Y(n175) );
  OAI2BB2X1M U136 ( .B0(n283), .B1(n250), .A0N(\regArr[4][0] ), .A1N(n250), 
        .Y(n81) );
  OAI2BB2X1M U137 ( .B0(n282), .B1(n249), .A0N(\regArr[4][1] ), .A1N(n250), 
        .Y(n82) );
  OAI2BB2X1M U138 ( .B0(n281), .B1(n249), .A0N(\regArr[4][2] ), .A1N(n250), 
        .Y(n83) );
  OAI2BB2X1M U139 ( .B0(n280), .B1(n249), .A0N(\regArr[4][3] ), .A1N(n250), 
        .Y(n84) );
  OAI2BB2X1M U140 ( .B0(n279), .B1(n249), .A0N(\regArr[4][4] ), .A1N(n250), 
        .Y(n85) );
  OAI2BB2X1M U141 ( .B0(n278), .B1(n249), .A0N(\regArr[4][7] ), .A1N(n250), 
        .Y(n88) );
  OAI2BB2X1M U142 ( .B0(n283), .B1(n248), .A0N(\regArr[5][0] ), .A1N(n248), 
        .Y(n89) );
  OAI2BB2X1M U143 ( .B0(n282), .B1(n247), .A0N(\regArr[5][1] ), .A1N(n248), 
        .Y(n90) );
  OAI2BB2X1M U144 ( .B0(n281), .B1(n247), .A0N(\regArr[5][2] ), .A1N(n248), 
        .Y(n91) );
  OAI2BB2X1M U145 ( .B0(n280), .B1(n247), .A0N(\regArr[5][3] ), .A1N(n248), 
        .Y(n92) );
  OAI2BB2X1M U146 ( .B0(n279), .B1(n247), .A0N(\regArr[5][4] ), .A1N(n248), 
        .Y(n93) );
  OAI2BB2X1M U147 ( .B0(n278), .B1(n247), .A0N(\regArr[5][7] ), .A1N(n248), 
        .Y(n96) );
  OAI2BB2X1M U148 ( .B0(n283), .B1(n246), .A0N(\regArr[6][0] ), .A1N(n246), 
        .Y(n97) );
  OAI2BB2X1M U149 ( .B0(n282), .B1(n245), .A0N(\regArr[6][1] ), .A1N(n246), 
        .Y(n98) );
  OAI2BB2X1M U150 ( .B0(n281), .B1(n245), .A0N(\regArr[6][2] ), .A1N(n246), 
        .Y(n99) );
  OAI2BB2X1M U151 ( .B0(n280), .B1(n245), .A0N(\regArr[6][3] ), .A1N(n246), 
        .Y(n100) );
  OAI2BB2X1M U152 ( .B0(n279), .B1(n245), .A0N(\regArr[6][4] ), .A1N(n246), 
        .Y(n101) );
  OAI2BB2X1M U153 ( .B0(n278), .B1(n245), .A0N(\regArr[6][7] ), .A1N(n246), 
        .Y(n104) );
  OAI2BB2X1M U154 ( .B0(n283), .B1(n244), .A0N(\regArr[7][0] ), .A1N(n244), 
        .Y(n105) );
  OAI2BB2X1M U155 ( .B0(n282), .B1(n243), .A0N(\regArr[7][1] ), .A1N(n244), 
        .Y(n106) );
  OAI2BB2X1M U156 ( .B0(n281), .B1(n243), .A0N(\regArr[7][2] ), .A1N(n244), 
        .Y(n107) );
  OAI2BB2X1M U157 ( .B0(n280), .B1(n243), .A0N(\regArr[7][3] ), .A1N(n244), 
        .Y(n108) );
  OAI2BB2X1M U158 ( .B0(n279), .B1(n243), .A0N(\regArr[7][4] ), .A1N(n244), 
        .Y(n109) );
  OAI2BB2X1M U159 ( .B0(n278), .B1(n243), .A0N(\regArr[7][7] ), .A1N(n244), 
        .Y(n112) );
  OAI2BB2X1M U160 ( .B0(n283), .B1(n242), .A0N(\regArr[8][0] ), .A1N(n242), 
        .Y(n113) );
  OAI2BB2X1M U161 ( .B0(n282), .B1(n241), .A0N(\regArr[8][1] ), .A1N(n242), 
        .Y(n114) );
  OAI2BB2X1M U162 ( .B0(n281), .B1(n241), .A0N(\regArr[8][2] ), .A1N(n242), 
        .Y(n115) );
  OAI2BB2X1M U163 ( .B0(n280), .B1(n241), .A0N(\regArr[8][3] ), .A1N(n242), 
        .Y(n116) );
  OAI2BB2X1M U164 ( .B0(n279), .B1(n241), .A0N(\regArr[8][4] ), .A1N(n242), 
        .Y(n117) );
  OAI2BB2X1M U165 ( .B0(n278), .B1(n241), .A0N(\regArr[8][7] ), .A1N(n242), 
        .Y(n120) );
  OAI2BB2X1M U166 ( .B0(n283), .B1(n240), .A0N(\regArr[9][0] ), .A1N(n240), 
        .Y(n121) );
  OAI2BB2X1M U167 ( .B0(n282), .B1(n239), .A0N(\regArr[9][1] ), .A1N(n240), 
        .Y(n122) );
  OAI2BB2X1M U168 ( .B0(n281), .B1(n239), .A0N(\regArr[9][2] ), .A1N(n240), 
        .Y(n123) );
  OAI2BB2X1M U169 ( .B0(n280), .B1(n239), .A0N(\regArr[9][3] ), .A1N(n240), 
        .Y(n124) );
  OAI2BB2X1M U170 ( .B0(n279), .B1(n239), .A0N(\regArr[9][4] ), .A1N(n240), 
        .Y(n125) );
  OAI2BB2X1M U171 ( .B0(n278), .B1(n239), .A0N(\regArr[9][7] ), .A1N(n240), 
        .Y(n128) );
  OAI2BB2X1M U172 ( .B0(n283), .B1(n238), .A0N(\regArr[10][0] ), .A1N(n238), 
        .Y(n129) );
  OAI2BB2X1M U173 ( .B0(n282), .B1(n237), .A0N(\regArr[10][1] ), .A1N(n238), 
        .Y(n130) );
  OAI2BB2X1M U174 ( .B0(n281), .B1(n237), .A0N(\regArr[10][2] ), .A1N(n238), 
        .Y(n131) );
  OAI2BB2X1M U175 ( .B0(n280), .B1(n237), .A0N(\regArr[10][3] ), .A1N(n238), 
        .Y(n132) );
  OAI2BB2X1M U176 ( .B0(n279), .B1(n237), .A0N(\regArr[10][4] ), .A1N(n238), 
        .Y(n133) );
  OAI2BB2X1M U177 ( .B0(n278), .B1(n237), .A0N(\regArr[10][7] ), .A1N(n238), 
        .Y(n136) );
  OAI2BB2X1M U178 ( .B0(n283), .B1(n236), .A0N(\regArr[11][0] ), .A1N(n236), 
        .Y(n137) );
  OAI2BB2X1M U179 ( .B0(n282), .B1(n235), .A0N(\regArr[11][1] ), .A1N(n236), 
        .Y(n138) );
  OAI2BB2X1M U180 ( .B0(n281), .B1(n235), .A0N(\regArr[11][2] ), .A1N(n236), 
        .Y(n139) );
  OAI2BB2X1M U181 ( .B0(n280), .B1(n235), .A0N(\regArr[11][3] ), .A1N(n236), 
        .Y(n140) );
  OAI2BB2X1M U182 ( .B0(n279), .B1(n235), .A0N(\regArr[11][4] ), .A1N(n236), 
        .Y(n141) );
  OAI2BB2X1M U183 ( .B0(n278), .B1(n235), .A0N(\regArr[11][7] ), .A1N(n236), 
        .Y(n144) );
  OAI2BB2X1M U184 ( .B0(n283), .B1(n234), .A0N(\regArr[12][0] ), .A1N(n234), 
        .Y(n145) );
  OAI2BB2X1M U185 ( .B0(n282), .B1(n233), .A0N(\regArr[12][1] ), .A1N(n234), 
        .Y(n146) );
  OAI2BB2X1M U186 ( .B0(n281), .B1(n233), .A0N(\regArr[12][2] ), .A1N(n234), 
        .Y(n147) );
  OAI2BB2X1M U187 ( .B0(n280), .B1(n233), .A0N(\regArr[12][3] ), .A1N(n234), 
        .Y(n148) );
  OAI2BB2X1M U188 ( .B0(n279), .B1(n233), .A0N(\regArr[12][4] ), .A1N(n234), 
        .Y(n149) );
  OAI2BB2X1M U189 ( .B0(n278), .B1(n233), .A0N(\regArr[12][7] ), .A1N(n234), 
        .Y(n152) );
  OAI2BB2X1M U190 ( .B0(n283), .B1(n232), .A0N(\regArr[13][0] ), .A1N(n232), 
        .Y(n153) );
  OAI2BB2X1M U191 ( .B0(n282), .B1(n231), .A0N(\regArr[13][1] ), .A1N(n232), 
        .Y(n154) );
  OAI2BB2X1M U192 ( .B0(n281), .B1(n231), .A0N(\regArr[13][2] ), .A1N(n232), 
        .Y(n155) );
  OAI2BB2X1M U193 ( .B0(n280), .B1(n231), .A0N(\regArr[13][3] ), .A1N(n232), 
        .Y(n156) );
  OAI2BB2X1M U194 ( .B0(n279), .B1(n231), .A0N(\regArr[13][4] ), .A1N(n232), 
        .Y(n157) );
  OAI2BB2X1M U195 ( .B0(n278), .B1(n231), .A0N(\regArr[13][7] ), .A1N(n232), 
        .Y(n160) );
  OAI2BB2X1M U196 ( .B0(n283), .B1(n230), .A0N(\regArr[14][0] ), .A1N(n230), 
        .Y(n161) );
  OAI2BB2X1M U197 ( .B0(n282), .B1(n229), .A0N(\regArr[14][1] ), .A1N(n230), 
        .Y(n162) );
  OAI2BB2X1M U198 ( .B0(n281), .B1(n229), .A0N(\regArr[14][2] ), .A1N(n230), 
        .Y(n163) );
  OAI2BB2X1M U199 ( .B0(n280), .B1(n229), .A0N(\regArr[14][3] ), .A1N(n230), 
        .Y(n164) );
  OAI2BB2X1M U200 ( .B0(n279), .B1(n229), .A0N(\regArr[14][4] ), .A1N(n230), 
        .Y(n165) );
  OAI2BB2X1M U201 ( .B0(n278), .B1(n229), .A0N(\regArr[14][7] ), .A1N(n230), 
        .Y(n168) );
  OAI2BB2X1M U202 ( .B0(n283), .B1(n228), .A0N(\regArr[15][0] ), .A1N(n228), 
        .Y(n169) );
  OAI2BB2X1M U203 ( .B0(n282), .B1(n227), .A0N(\regArr[15][1] ), .A1N(n228), 
        .Y(n170) );
  OAI2BB2X1M U204 ( .B0(n281), .B1(n227), .A0N(\regArr[15][2] ), .A1N(n228), 
        .Y(n171) );
  OAI2BB2X1M U205 ( .B0(n280), .B1(n227), .A0N(\regArr[15][3] ), .A1N(n228), 
        .Y(n172) );
  OAI2BB2X1M U206 ( .B0(n279), .B1(n227), .A0N(\regArr[15][4] ), .A1N(n228), 
        .Y(n173) );
  OAI2BB2X1M U207 ( .B0(n278), .B1(n227), .A0N(\regArr[15][7] ), .A1N(n228), 
        .Y(n176) );
  OAI2BB2X1M U208 ( .B0(n284), .B1(n251), .A0N(n448), .A1N(n252), .Y(n78) );
  OAI2BB2X1M U209 ( .B0(n283), .B1(n254), .A0N(REG2[0]), .A1N(n254), .Y(n65)
         );
  OAI2BB2X1M U210 ( .B0(n278), .B1(n253), .A0N(REG2[7]), .A1N(n254), .Y(n72)
         );
  AO22X1M U211 ( .A0(N43), .A1(n277), .B0(RdData[0]), .B1(n259), .Y(n40) );
  MX4XLM U212 ( .A(n191), .B(n189), .C(n190), .D(n188), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U213 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n225), 
        .S1(N12), .Y(n191) );
  MX4X1M U214 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(n225), .S1(n220), .Y(n189) );
  AO22X1M U215 ( .A0(N42), .A1(n277), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4XLM U216 ( .A(n195), .B(n193), .C(n194), .D(n192), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U217 ( .A(REG0[1]), .B(REG1[1]), .C(n459), .D(n454), .S0(n225), .S1(
        n220), .Y(n195) );
  MX4X1M U218 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(n225), .S1(N12), .Y(n193) );
  AO22X1M U219 ( .A0(N41), .A1(n277), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4XLM U220 ( .A(n199), .B(n197), .C(n198), .D(n196), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U221 ( .A(REG0[2]), .B(n456), .C(REG2[2]), .D(n452), .S0(n226), .S1(
        n220), .Y(n199) );
  MX4X1M U222 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n226), .S1(n220), .Y(n197) );
  AO22X1M U223 ( .A0(N40), .A1(n277), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4XLM U224 ( .A(n203), .B(n201), .C(n202), .D(n200), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U225 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n226), .S1(n220), .Y(n201) );
  AO22X1M U226 ( .A0(N39), .A1(n277), .B0(RdData[4]), .B1(n259), .Y(n44) );
  MX4XLM U227 ( .A(n207), .B(n205), .C(n206), .D(n204), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U228 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n226), .S1(n220), .Y(n205) );
  AO22X1M U229 ( .A0(N38), .A1(n277), .B0(RdData[5]), .B1(n259), .Y(n45) );
  MX4XLM U230 ( .A(n211), .B(n209), .C(n210), .D(n208), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U231 ( .A(REG0[5]), .B(REG1[5]), .C(test_so1), .D(REG3[5]), .S0(n222), 
        .S1(n221), .Y(n211) );
  MX4X1M U232 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(N11), .S1(n221), .Y(n209) );
  AO22X1M U233 ( .A0(N37), .A1(n277), .B0(RdData[6]), .B1(n259), .Y(n46) );
  MX4XLM U234 ( .A(n215), .B(n213), .C(n214), .D(n212), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U235 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(n451), .S0(n222), 
        .S1(n221), .Y(n215) );
  MX4X1M U236 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(N11), .S1(n221), .Y(n213) );
  AO22X1M U237 ( .A0(N36), .A1(n277), .B0(RdData[7]), .B1(n259), .Y(n47) );
  MX4XLM U238 ( .A(n219), .B(n217), .C(n218), .D(n216), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U239 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(n442), .S0(n224), 
        .S1(n221), .Y(n219) );
  MX4X1M U240 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(N11), .S1(n221), .Y(n217) );
  MX4X1M U241 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n226), .S1(n220), .Y(n198) );
  MX4X1M U242 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n226), .S1(n220), .Y(n202) );
  MX4X1M U243 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n226), .S1(n220), .Y(n206) );
  MX4X1M U244 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n225), .S1(n221), .Y(n210) );
  MX4X1M U245 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n226), .S1(n221), .Y(n214) );
  MX4X1M U246 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n260), .S1(n221), .Y(n218) );
  MX4X1M U247 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n226), .S1(n220), .Y(n196) );
  MX4X1M U248 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n226), .S1(n220), .Y(n200) );
  MX4X1M U249 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n226), .S1(n220), .Y(n204) );
  MX4X1M U250 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n223), .S1(n221), .Y(n208) );
  MX4X1M U251 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n223), .S1(n221), .Y(n212) );
  MX4X1M U252 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n223), .S1(n221), .Y(n216) );
  MX4X1M U253 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(n225), .S1(n221), .Y(n190) );
  MX4X1M U254 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n225), .S1(n220), .Y(n194) );
  MX4X1M U255 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n225), .S1(n221), .Y(n188) );
  MX4X1M U256 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n225), .S1(n220), .Y(n192) );
  OAI2BB2X1M U257 ( .B0(n257), .B1(n284), .A0N(REG0[5]), .A1N(n258), .Y(n54)
         );
  OAI2BB2X1M U258 ( .B0(n257), .B1(n285), .A0N(REG0[6]), .A1N(n258), .Y(n55)
         );
  OAI2BB2X1M U259 ( .B0(n284), .B1(n255), .A0N(REG1[5]), .A1N(n256), .Y(n62)
         );
  OAI2BB2X1M U260 ( .B0(n285), .B1(n255), .A0N(REG1[6]), .A1N(n256), .Y(n63)
         );
  OAI2BB2X1M U261 ( .B0(n284), .B1(n253), .A0N(test_so1), .A1N(n254), .Y(n70)
         );
  OAI2BB2X1M U262 ( .B0(n285), .B1(n253), .A0N(REG2[6]), .A1N(n254), .Y(n71)
         );
  OAI2BB2X1M U263 ( .B0(n285), .B1(n251), .A0N(n445), .A1N(n252), .Y(n79) );
  OAI2BB2X1M U264 ( .B0(n258), .B1(n283), .A0N(REG0[0]), .A1N(n258), .Y(n49)
         );
  OAI2BB2X1M U265 ( .B0(n257), .B1(n282), .A0N(REG0[1]), .A1N(n258), .Y(n50)
         );
  OAI2BB2X1M U266 ( .B0(n257), .B1(n281), .A0N(REG0[2]), .A1N(n258), .Y(n51)
         );
  OAI2BB2X1M U267 ( .B0(n257), .B1(n280), .A0N(REG0[3]), .A1N(n258), .Y(n52)
         );
  OAI2BB2X1M U268 ( .B0(n257), .B1(n279), .A0N(REG0[4]), .A1N(n258), .Y(n53)
         );
  OAI2BB2X1M U269 ( .B0(n257), .B1(n278), .A0N(REG0[7]), .A1N(n258), .Y(n56)
         );
  OAI2BB2X1M U270 ( .B0(n283), .B1(n256), .A0N(REG1[0]), .A1N(n256), .Y(n57)
         );
  OAI2BB2X1M U271 ( .B0(n282), .B1(n255), .A0N(REG1[1]), .A1N(n256), .Y(n58)
         );
  OAI2BB2X1M U272 ( .B0(n281), .B1(n255), .A0N(n456), .A1N(n256), .Y(n59) );
  OAI2BB2X1M U273 ( .B0(n280), .B1(n255), .A0N(n455), .A1N(n256), .Y(n60) );
  OAI2BB2X1M U274 ( .B0(n279), .B1(n255), .A0N(REG1[4]), .A1N(n256), .Y(n61)
         );
  OAI2BB2X1M U275 ( .B0(n278), .B1(n255), .A0N(REG1[7]), .A1N(n256), .Y(n64)
         );
  OAI2BB2X1M U276 ( .B0(n282), .B1(n253), .A0N(n459), .A1N(n254), .Y(n66) );
  OAI2BB2X1M U277 ( .B0(n281), .B1(n253), .A0N(REG2[2]), .A1N(n254), .Y(n67)
         );
  OAI2BB2X1M U278 ( .B0(n280), .B1(n253), .A0N(n4), .A1N(n254), .Y(n68) );
  OAI2BB2X1M U279 ( .B0(n279), .B1(n253), .A0N(REG2[4]), .A1N(n254), .Y(n69)
         );
  OAI2BB2X1M U280 ( .B0(n283), .B1(n252), .A0N(n440), .A1N(n252), .Y(n73) );
  OAI2BB2X1M U281 ( .B0(n282), .B1(n251), .A0N(n447), .A1N(n252), .Y(n74) );
  OAI2BB2X1M U282 ( .B0(n281), .B1(n251), .A0N(n446), .A1N(n252), .Y(n75) );
  OAI2BB2X1M U283 ( .B0(n280), .B1(n251), .A0N(n443), .A1N(n252), .Y(n76) );
  OAI2BB2X1M U284 ( .B0(n279), .B1(n251), .A0N(n444), .A1N(n252), .Y(n77) );
  OAI2BB2X1M U285 ( .B0(n278), .B1(n251), .A0N(n449), .A1N(n252), .Y(n80) );
  OAI2BB1X2M U286 ( .A0N(RdData_VLD), .A1N(n13), .B0(n259), .Y(n48) );
  SDFFRQX2M \regArr_reg[9][7]  ( .D(n128), .SI(\regArr[9][6] ), .SE(n362), 
        .CK(CLK), .RN(n269), .Q(\regArr[9][7] ) );
  SDFFRQX2M \regArr_reg[9][6]  ( .D(n127), .SI(\regArr[9][5] ), .SE(n362), 
        .CK(CLK), .RN(n269), .Q(\regArr[9][6] ) );
  SDFFRQX2M \regArr_reg[9][5]  ( .D(n126), .SI(\regArr[9][4] ), .SE(n418), 
        .CK(CLK), .RN(n269), .Q(\regArr[9][5] ) );
  SDFFRQX2M \regArr_reg[9][4]  ( .D(n125), .SI(\regArr[9][3] ), .SE(n334), 
        .CK(CLK), .RN(n269), .Q(\regArr[9][4] ) );
  SDFFRQX2M \regArr_reg[9][3]  ( .D(n124), .SI(\regArr[9][2] ), .SE(n334), 
        .CK(CLK), .RN(n269), .Q(\regArr[9][3] ) );
  SDFFRQX2M \regArr_reg[9][0]  ( .D(n121), .SI(\regArr[8][7] ), .SE(n361), 
        .CK(CLK), .RN(n269), .Q(\regArr[9][0] ) );
  SDFFRQX2M \regArr_reg[5][7]  ( .D(n96), .SI(\regArr[5][6] ), .SE(n326), .CK(
        CLK), .RN(n267), .Q(\regArr[5][7] ) );
  SDFFRQX2M \regArr_reg[5][6]  ( .D(n95), .SI(\regArr[5][5] ), .SE(n325), .CK(
        CLK), .RN(n267), .Q(\regArr[5][6] ) );
  SDFFRQX2M \regArr_reg[5][5]  ( .D(n94), .SI(\regArr[5][4] ), .SE(n325), .CK(
        CLK), .RN(n267), .Q(\regArr[5][5] ) );
  SDFFRQX2M \regArr_reg[5][4]  ( .D(n93), .SI(\regArr[5][3] ), .SE(n357), .CK(
        CLK), .RN(n267), .Q(\regArr[5][4] ) );
  SDFFRQX2M \regArr_reg[5][3]  ( .D(n92), .SI(\regArr[5][2] ), .SE(n357), .CK(
        CLK), .RN(n267), .Q(\regArr[5][3] ) );
  SDFFRQX2M \regArr_reg[5][2]  ( .D(n91), .SI(\regArr[5][1] ), .SE(n403), .CK(
        CLK), .RN(n266), .Q(\regArr[5][2] ) );
  SDFFRQX2M \regArr_reg[5][1]  ( .D(n90), .SI(\regArr[5][0] ), .SE(n324), .CK(
        CLK), .RN(n266), .Q(\regArr[5][1] ) );
  SDFFRQX2M \regArr_reg[5][0]  ( .D(n89), .SI(\regArr[4][7] ), .SE(n324), .CK(
        CLK), .RN(n266), .Q(\regArr[5][0] ) );
  SDFFRQX2M \regArr_reg[15][0]  ( .D(n169), .SI(\regArr[14][7] ), .SE(n352), 
        .CK(CLK), .RN(n273), .Q(\regArr[15][0] ) );
  SDFFRQX2M \regArr_reg[11][0]  ( .D(n137), .SI(\regArr[10][7] ), .SE(n337), 
        .CK(CLK), .RN(n270), .Q(\regArr[11][0] ) );
  SDFFRQX2M \regArr_reg[7][7]  ( .D(n112), .SI(\regArr[7][6] ), .SE(n412), 
        .CK(CLK), .RN(n268), .Q(\regArr[7][7] ) );
  SDFFRQX2M \regArr_reg[7][6]  ( .D(n111), .SI(\regArr[7][5] ), .SE(n330), 
        .CK(CLK), .RN(n268), .Q(\regArr[7][6] ) );
  SDFFRQX2M \regArr_reg[7][5]  ( .D(n110), .SI(\regArr[7][4] ), .SE(n330), 
        .CK(CLK), .RN(n268), .Q(\regArr[7][5] ) );
  SDFFRQX2M \regArr_reg[7][4]  ( .D(n109), .SI(\regArr[7][3] ), .SE(n329), 
        .CK(CLK), .RN(n268), .Q(\regArr[7][4] ) );
  SDFFRQX2M \regArr_reg[7][3]  ( .D(n108), .SI(\regArr[7][2] ), .SE(n329), 
        .CK(CLK), .RN(n268), .Q(\regArr[7][3] ) );
  SDFFRQX2M \regArr_reg[7][2]  ( .D(n107), .SI(\regArr[7][1] ), .SE(n359), 
        .CK(CLK), .RN(n268), .Q(\regArr[7][2] ) );
  SDFFRQX2M \regArr_reg[7][1]  ( .D(n106), .SI(\regArr[7][0] ), .SE(n359), 
        .CK(CLK), .RN(n268), .Q(\regArr[7][1] ) );
  SDFFRQX2M \regArr_reg[7][0]  ( .D(n105), .SI(\regArr[6][7] ), .SE(n409), 
        .CK(CLK), .RN(n268), .Q(\regArr[7][0] ) );
  SDFFRQX2M \regArr_reg[14][0]  ( .D(n161), .SI(\regArr[13][7] ), .SE(n317), 
        .CK(CLK), .RN(n272), .Q(\regArr[14][0] ) );
  SDFFRQX2M \regArr_reg[10][0]  ( .D(n129), .SI(\regArr[9][7] ), .SE(n335), 
        .CK(CLK), .RN(n269), .Q(\regArr[10][0] ) );
  SDFFRQX2M \regArr_reg[6][7]  ( .D(n104), .SI(\regArr[6][6] ), .SE(n328), 
        .CK(CLK), .RN(n267), .Q(\regArr[6][7] ) );
  SDFFRQX2M \regArr_reg[6][6]  ( .D(n103), .SI(\regArr[6][5] ), .SE(n328), 
        .CK(CLK), .RN(n267), .Q(\regArr[6][6] ) );
  SDFFRQX2M \regArr_reg[6][5]  ( .D(n102), .SI(\regArr[6][4] ), .SE(n327), 
        .CK(CLK), .RN(n267), .Q(\regArr[6][5] ) );
  SDFFRQX2M \regArr_reg[6][4]  ( .D(n101), .SI(\regArr[6][3] ), .SE(n327), 
        .CK(CLK), .RN(n267), .Q(\regArr[6][4] ) );
  SDFFRQX2M \regArr_reg[6][3]  ( .D(n100), .SI(\regArr[6][2] ), .SE(n358), 
        .CK(CLK), .RN(n267), .Q(\regArr[6][3] ) );
  SDFFRQX2M \regArr_reg[6][2]  ( .D(n99), .SI(\regArr[6][1] ), .SE(n358), .CK(
        CLK), .RN(n267), .Q(\regArr[6][2] ) );
  SDFFRQX2M \regArr_reg[6][1]  ( .D(n98), .SI(\regArr[6][0] ), .SE(n406), .CK(
        CLK), .RN(n267), .Q(\regArr[6][1] ) );
  SDFFRQX2M \regArr_reg[6][0]  ( .D(n97), .SI(\regArr[5][7] ), .SE(n326), .CK(
        CLK), .RN(n267), .Q(\regArr[6][0] ) );
  SDFFRQX2M \regArr_reg[12][0]  ( .D(n145), .SI(\regArr[11][7] ), .SE(n340), 
        .CK(CLK), .RN(n271), .Q(\regArr[12][0] ) );
  SDFFRQX2M \regArr_reg[8][7]  ( .D(n120), .SI(\regArr[8][6] ), .SE(n361), 
        .CK(CLK), .RN(n269), .Q(\regArr[8][7] ) );
  SDFFRQX2M \regArr_reg[8][6]  ( .D(n119), .SI(\regArr[8][5] ), .SE(n415), 
        .CK(CLK), .RN(n269), .Q(\regArr[8][6] ) );
  SDFFRQX2M \regArr_reg[8][5]  ( .D(n118), .SI(\regArr[8][4] ), .SE(n332), 
        .CK(CLK), .RN(n269), .Q(\regArr[8][5] ) );
  SDFFRQX2M \regArr_reg[8][4]  ( .D(n117), .SI(\regArr[8][3] ), .SE(n332), 
        .CK(CLK), .RN(n269), .Q(\regArr[8][4] ) );
  SDFFRQX2M \regArr_reg[8][3]  ( .D(n116), .SI(\regArr[8][2] ), .SE(n331), 
        .CK(CLK), .RN(n268), .Q(\regArr[8][3] ) );
  SDFFRQX2M \regArr_reg[8][2]  ( .D(n115), .SI(\regArr[8][1] ), .SE(n331), 
        .CK(CLK), .RN(n268), .Q(\regArr[8][2] ) );
  SDFFRQX2M \regArr_reg[8][1]  ( .D(n114), .SI(\regArr[8][0] ), .SE(n360), 
        .CK(CLK), .RN(n268), .Q(\regArr[8][1] ) );
  SDFFRQX2M \regArr_reg[8][0]  ( .D(n113), .SI(\regArr[7][7] ), .SE(n360), 
        .CK(CLK), .RN(n268), .Q(\regArr[8][0] ) );
  SDFFRQX2M \regArr_reg[4][7]  ( .D(n88), .SI(\regArr[4][6] ), .SE(n323), .CK(
        CLK), .RN(n266), .Q(\regArr[4][7] ) );
  SDFFRQX2M \regArr_reg[4][6]  ( .D(n87), .SI(\regArr[4][5] ), .SE(n323), .CK(
        CLK), .RN(n266), .Q(\regArr[4][6] ) );
  SDFFRQX2M \regArr_reg[4][5]  ( .D(n86), .SI(\regArr[4][4] ), .SE(n356), .CK(
        CLK), .RN(n266), .Q(\regArr[4][5] ) );
  SDFFRQX2M \regArr_reg[4][4]  ( .D(n85), .SI(\regArr[4][3] ), .SE(n356), .CK(
        CLK), .RN(n266), .Q(\regArr[4][4] ) );
  SDFFRQX2M \regArr_reg[4][3]  ( .D(n84), .SI(\regArr[4][2] ), .SE(n400), .CK(
        CLK), .RN(n266), .Q(\regArr[4][3] ) );
  SDFFRQX2M \regArr_reg[4][2]  ( .D(n83), .SI(\regArr[4][1] ), .SE(n322), .CK(
        CLK), .RN(n266), .Q(\regArr[4][2] ) );
  SDFFRQX2M \regArr_reg[4][1]  ( .D(n82), .SI(\regArr[4][0] ), .SE(n322), .CK(
        CLK), .RN(n266), .Q(\regArr[4][1] ) );
  SDFFRQX2M \regArr_reg[4][0]  ( .D(n81), .SI(n449), .SE(n355), .CK(CLK), .RN(
        n266), .Q(\regArr[4][0] ) );
  SDFFRQX2M \regArr_reg[2][1]  ( .D(n66), .SI(REG2[0]), .SE(n348), .CK(CLK), 
        .RN(n265), .Q(n459) );
  SDFFRQX2M \RdData_reg[7]  ( .D(n47), .SI(RdData[6]), .SE(n345), .CK(CLK), 
        .RN(n264), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n46), .SI(RdData[5]), .SE(n367), .CK(CLK), 
        .RN(n271), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n45), .SI(RdData[4]), .SE(n367), .CK(CLK), 
        .RN(n267), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n44), .SI(RdData[3]), .SE(n433), .CK(CLK), 
        .RN(n269), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n43), .SI(RdData[2]), .SE(n344), .CK(CLK), 
        .RN(n268), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n42), .SI(RdData[1]), .SE(n344), .CK(CLK), 
        .RN(n270), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n41), .SI(RdData[0]), .SE(n343), .CK(CLK), 
        .RN(n265), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n40), .SI(RdData_VLD), .SE(n343), .CK(CLK), 
        .RN(n268), .Q(RdData[0]) );
  SDFFRQX2M \regArr_reg[3][0]  ( .D(n73), .SI(REG2[7]), .SE(n396), .CK(CLK), 
        .RN(n265), .Q(REG3[0]) );
  SDFFRQX2M \regArr_reg[3][7]  ( .D(n80), .SI(n445), .SE(n355), .CK(CLK), .RN(
        n266), .Q(REG3[7]) );
  SDFFRQX2M \regArr_reg[3][6]  ( .D(n79), .SI(n448), .SE(n398), .CK(CLK), .RN(
        n266), .Q(REG3[6]) );
  SDFFSQX2M \regArr_reg[3][5]  ( .D(n78), .SI(n444), .SE(n370), .CK(CLK), .SN(
        n266), .Q(REG3[5]) );
  SDFFRQX2M \regArr_reg[3][4]  ( .D(n77), .SI(n443), .SE(n321), .CK(CLK), .RN(
        n265), .Q(REG3[4]) );
  SDFFRQX2M \regArr_reg[0][0]  ( .D(n49), .SI(RdData[7]), .SE(n345), .CK(CLK), 
        .RN(n273), .Q(REG0[0]) );
  SDFFRQX2M \regArr_reg[0][2]  ( .D(n51), .SI(REG0[1]), .SE(n346), .CK(CLK), 
        .RN(n264), .Q(REG0[2]) );
  SDFFRQX2M \regArr_reg[0][1]  ( .D(n50), .SI(REG0[0]), .SE(n346), .CK(CLK), 
        .RN(n276), .Q(REG0[1]) );
  SDFFRQX2M \regArr_reg[3][3]  ( .D(n76), .SI(n446), .SE(n321), .CK(CLK), .RN(
        n265), .Q(REG3[3]) );
  SDFFRQX2M \regArr_reg[3][2]  ( .D(n75), .SI(n447), .SE(n354), .CK(CLK), .RN(
        n265), .Q(REG3[2]) );
  SDFFRQX2M \regArr_reg[3][1]  ( .D(n74), .SI(n440), .SE(n354), .CK(CLK), .RN(
        n265), .Q(REG3[1]) );
  SDFFRQX2M \regArr_reg[0][3]  ( .D(n52), .SI(REG0[2]), .SE(n436), .CK(CLK), 
        .RN(n264), .Q(REG0[3]) );
  SDFFRQX2M \regArr_reg[0][4]  ( .D(n53), .SI(REG0[3]), .SE(n368), .CK(CLK), 
        .RN(n264), .Q(REG0[4]) );
  SDFFRQX2M \regArr_reg[0][5]  ( .D(n54), .SI(REG0[4]), .SE(n368), .CK(CLK), 
        .RN(n264), .Q(REG0[5]) );
  SDFFRQX2M \regArr_reg[0][6]  ( .D(n55), .SI(REG0[5]), .SE(n347), .CK(CLK), 
        .RN(n264), .Q(REG0[6]) );
  SDFFRQX2M \regArr_reg[0][7]  ( .D(n56), .SI(REG0[6]), .SE(n347), .CK(CLK), 
        .RN(n264), .Q(REG0[7]) );
  SDFFRQX2M \regArr_reg[1][6]  ( .D(n63), .SI(REG1[5]), .SE(n348), .CK(CLK), 
        .RN(n265), .Q(REG1[6]) );
  SDFFSQX2M \regArr_reg[2][7]  ( .D(n72), .SI(REG2[6]), .SE(n439), .CK(CLK), 
        .SN(RST), .Q(n286) );
  SDFFRQX2M RdData_VLD_reg ( .D(n48), .SI(test_si1), .SE(n366), .CK(CLK), .RN(
        n264), .Q(RdData_VLD) );
  SDFFRQX2M \regArr_reg[15][7]  ( .D(n176), .SI(\regArr[15][6] ), .SE(n320), 
        .CK(CLK), .RN(RST), .Q(\regArr[15][7] ) );
  SDFFRQX2M \regArr_reg[15][6]  ( .D(n175), .SI(\regArr[15][5] ), .SE(n320), 
        .CK(CLK), .RN(n273), .Q(\regArr[15][6] ) );
  SDFFRQX2M \regArr_reg[15][5]  ( .D(n174), .SI(\regArr[15][4] ), .SE(n353), 
        .CK(CLK), .RN(n273), .Q(\regArr[15][5] ) );
  SDFFRQX2M \regArr_reg[15][4]  ( .D(n173), .SI(\regArr[15][3] ), .SE(n353), 
        .CK(CLK), .RN(n273), .Q(\regArr[15][4] ) );
  SDFFRQX2M \regArr_reg[15][3]  ( .D(n172), .SI(\regArr[15][2] ), .SE(n394), 
        .CK(CLK), .RN(n273), .Q(\regArr[15][3] ) );
  SDFFRQX2M \regArr_reg[15][2]  ( .D(n171), .SI(\regArr[15][1] ), .SE(n319), 
        .CK(CLK), .RN(n273), .Q(\regArr[15][2] ) );
  SDFFRQX2M \regArr_reg[15][1]  ( .D(n170), .SI(\regArr[15][0] ), .SE(n319), 
        .CK(CLK), .RN(n273), .Q(\regArr[15][1] ) );
  SDFFRQX2M \regArr_reg[14][7]  ( .D(n168), .SI(\regArr[14][6] ), .SE(n352), 
        .CK(CLK), .RN(n272), .Q(\regArr[14][7] ) );
  SDFFRQX2M \regArr_reg[14][6]  ( .D(n167), .SI(\regArr[14][5] ), .SE(n392), 
        .CK(CLK), .RN(n272), .Q(\regArr[14][6] ) );
  SDFFRQX2M \regArr_reg[14][5]  ( .D(n166), .SI(\regArr[14][4] ), .SE(n318), 
        .CK(CLK), .RN(n272), .Q(\regArr[14][5] ) );
  SDFFRQX2M \regArr_reg[14][4]  ( .D(n165), .SI(\regArr[14][3] ), .SE(n318), 
        .CK(CLK), .RN(n272), .Q(\regArr[14][4] ) );
  SDFFRQX2M \regArr_reg[14][3]  ( .D(n164), .SI(\regArr[14][2] ), .SE(n351), 
        .CK(CLK), .RN(n272), .Q(\regArr[14][3] ) );
  SDFFRQX2M \regArr_reg[14][2]  ( .D(n163), .SI(\regArr[14][1] ), .SE(n351), 
        .CK(CLK), .RN(n272), .Q(\regArr[14][2] ) );
  SDFFRQX2M \regArr_reg[14][1]  ( .D(n162), .SI(\regArr[14][0] ), .SE(n390), 
        .CK(CLK), .RN(n272), .Q(\regArr[14][1] ) );
  SDFFRQX2M \regArr_reg[13][7]  ( .D(n160), .SI(\regArr[13][6] ), .SE(n317), 
        .CK(CLK), .RN(n272), .Q(\regArr[13][7] ) );
  SDFFRQX2M \regArr_reg[13][6]  ( .D(n159), .SI(\regArr[13][5] ), .SE(n350), 
        .CK(CLK), .RN(n272), .Q(\regArr[13][6] ) );
  SDFFRQX2M \regArr_reg[13][5]  ( .D(n158), .SI(\regArr[13][4] ), .SE(n350), 
        .CK(CLK), .RN(n272), .Q(\regArr[13][5] ) );
  SDFFRQX2M \regArr_reg[13][4]  ( .D(n157), .SI(\regArr[13][3] ), .SE(n388), 
        .CK(CLK), .RN(n272), .Q(\regArr[13][4] ) );
  SDFFRQX2M \regArr_reg[13][2]  ( .D(n155), .SI(\regArr[13][1] ), .SE(n366), 
        .CK(CLK), .RN(n271), .Q(\regArr[13][2] ) );
  SDFFRQX2M \regArr_reg[12][4]  ( .D(n149), .SI(\regArr[12][3] ), .SE(n365), 
        .CK(CLK), .RN(n271), .Q(\regArr[12][4] ) );
  SDFFRQX2M \regArr_reg[12][3]  ( .D(n148), .SI(\regArr[12][2] ), .SE(n365), 
        .CK(CLK), .RN(n271), .Q(\regArr[12][3] ) );
  SDFFRQX2M \regArr_reg[12][2]  ( .D(n147), .SI(\regArr[12][1] ), .SE(n427), 
        .CK(CLK), .RN(n271), .Q(\regArr[12][2] ) );
  SDFFRQX2M \regArr_reg[12][1]  ( .D(n146), .SI(\regArr[12][0] ), .SE(n340), 
        .CK(CLK), .RN(n271), .Q(\regArr[12][1] ) );
  SDFFRQX2M \regArr_reg[11][7]  ( .D(n144), .SI(\regArr[11][6] ), .SE(n339), 
        .CK(CLK), .RN(n271), .Q(\regArr[11][7] ) );
  SDFFRQX2M \regArr_reg[11][6]  ( .D(n143), .SI(\regArr[11][5] ), .SE(n339), 
        .CK(CLK), .RN(n271), .Q(\regArr[11][6] ) );
  SDFFRQX2M \regArr_reg[11][5]  ( .D(n142), .SI(\regArr[11][4] ), .SE(n364), 
        .CK(CLK), .RN(n270), .Q(\regArr[11][5] ) );
  SDFFRQX2M \regArr_reg[11][4]  ( .D(n141), .SI(\regArr[11][3] ), .SE(n364), 
        .CK(CLK), .RN(n270), .Q(\regArr[11][4] ) );
  SDFFRQX2M \regArr_reg[11][3]  ( .D(n140), .SI(\regArr[11][2] ), .SE(n424), 
        .CK(CLK), .RN(n270), .Q(\regArr[11][3] ) );
  SDFFRQX2M \regArr_reg[11][2]  ( .D(n139), .SI(\regArr[11][1] ), .SE(n338), 
        .CK(CLK), .RN(n270), .Q(\regArr[11][2] ) );
  SDFFRQX2M \regArr_reg[11][1]  ( .D(n138), .SI(\regArr[11][0] ), .SE(n338), 
        .CK(CLK), .RN(n270), .Q(\regArr[11][1] ) );
  SDFFRQX2M \regArr_reg[10][7]  ( .D(n136), .SI(\regArr[10][6] ), .SE(n337), 
        .CK(CLK), .RN(n270), .Q(\regArr[10][7] ) );
  SDFFRQX2M \regArr_reg[10][6]  ( .D(n135), .SI(\regArr[10][5] ), .SE(n363), 
        .CK(CLK), .RN(n270), .Q(\regArr[10][6] ) );
  SDFFRQX2M \regArr_reg[10][5]  ( .D(n134), .SI(\regArr[10][4] ), .SE(n363), 
        .CK(CLK), .RN(n270), .Q(\regArr[10][5] ) );
  SDFFRQX2M \regArr_reg[10][4]  ( .D(n133), .SI(\regArr[10][3] ), .SE(n421), 
        .CK(CLK), .RN(n270), .Q(\regArr[10][4] ) );
  SDFFRQX2M \regArr_reg[10][3]  ( .D(n132), .SI(\regArr[10][2] ), .SE(n336), 
        .CK(CLK), .RN(n270), .Q(\regArr[10][3] ) );
  SDFFRQX2M \regArr_reg[10][2]  ( .D(n131), .SI(\regArr[10][1] ), .SE(n336), 
        .CK(CLK), .RN(n270), .Q(\regArr[10][2] ) );
  SDFFRQX2M \regArr_reg[10][1]  ( .D(n130), .SI(\regArr[10][0] ), .SE(n335), 
        .CK(CLK), .RN(n270), .Q(\regArr[10][1] ) );
  SDFFSQX2M \regArr_reg[2][0]  ( .D(n65), .SI(REG1[7]), .SE(n370), .CK(CLK), 
        .SN(n272), .Q(REG2[0]) );
  DLY1X1M U287 ( .A(n371), .Y(n304) );
  DLY1X1M U288 ( .A(n376), .Y(n305) );
  DLY1X1M U289 ( .A(n377), .Y(n306) );
  DLY1X1M U290 ( .A(n378), .Y(n307) );
  DLY1X1M U291 ( .A(n380), .Y(n308) );
  DLY1X1M U292 ( .A(n381), .Y(n309) );
  DLY1X1M U293 ( .A(n386), .Y(n310) );
  DLY1X1M U294 ( .A(n387), .Y(n311) );
  DLY1X1M U295 ( .A(n372), .Y(n312) );
  DLY1X1M U296 ( .A(n373), .Y(n313) );
  DLY1X1M U297 ( .A(n374), .Y(n314) );
  DLY1X1M U298 ( .A(n304), .Y(n315) );
  DLY1X1M U299 ( .A(n385), .Y(n316) );
  DLY1X1M U300 ( .A(n389), .Y(n317) );
  DLY1X1M U301 ( .A(n391), .Y(n318) );
  DLY1X1M U302 ( .A(n393), .Y(n319) );
  DLY1X1M U303 ( .A(n395), .Y(n320) );
  DLY1X1M U304 ( .A(n397), .Y(n321) );
  DLY1X1M U305 ( .A(n399), .Y(n322) );
  DLY1X1M U306 ( .A(n401), .Y(n323) );
  DLY1X1M U307 ( .A(n402), .Y(n324) );
  DLY1X1M U308 ( .A(n404), .Y(n325) );
  DLY1X1M U309 ( .A(n405), .Y(n326) );
  DLY1X1M U310 ( .A(n407), .Y(n327) );
  DLY1X1M U311 ( .A(n408), .Y(n328) );
  DLY1X1M U312 ( .A(n410), .Y(n329) );
  DLY1X1M U313 ( .A(n411), .Y(n330) );
  DLY1X1M U314 ( .A(n413), .Y(n331) );
  DLY1X1M U315 ( .A(n414), .Y(n332) );
  DLY1X1M U316 ( .A(n416), .Y(n333) );
  DLY1X1M U317 ( .A(n417), .Y(n334) );
  DLY1X1M U318 ( .A(n419), .Y(n335) );
  DLY1X1M U319 ( .A(n420), .Y(n336) );
  DLY1X1M U320 ( .A(n422), .Y(n337) );
  DLY1X1M U321 ( .A(n423), .Y(n338) );
  DLY1X1M U322 ( .A(n425), .Y(n339) );
  DLY1X1M U323 ( .A(n426), .Y(n340) );
  DLY1X1M U324 ( .A(n428), .Y(n341) );
  DLY1X1M U325 ( .A(n429), .Y(n342) );
  DLY1X1M U326 ( .A(n431), .Y(n343) );
  DLY1X1M U327 ( .A(n432), .Y(n344) );
  DLY1X1M U328 ( .A(n434), .Y(n345) );
  DLY1X1M U329 ( .A(n435), .Y(n346) );
  DLY1X1M U330 ( .A(n437), .Y(n347) );
  DLY1X1M U331 ( .A(n438), .Y(n348) );
  DLY1X1M U332 ( .A(n383), .Y(n349) );
  DLY1X1M U333 ( .A(n388), .Y(n350) );
  DLY1X1M U334 ( .A(n390), .Y(n351) );
  DLY1X1M U335 ( .A(n392), .Y(n352) );
  DLY1X1M U336 ( .A(n394), .Y(n353) );
  DLY1X1M U337 ( .A(n396), .Y(n354) );
  DLY1X1M U338 ( .A(n398), .Y(n355) );
  DLY1X1M U339 ( .A(n400), .Y(n356) );
  DLY1X1M U340 ( .A(n403), .Y(n357) );
  DLY1X1M U341 ( .A(n406), .Y(n358) );
  DLY1X1M U342 ( .A(n409), .Y(n359) );
  DLY1X1M U343 ( .A(n412), .Y(n360) );
  DLY1X1M U344 ( .A(n415), .Y(n361) );
  DLY1X1M U345 ( .A(n418), .Y(n362) );
  DLY1X1M U346 ( .A(n421), .Y(n363) );
  DLY1X1M U347 ( .A(n424), .Y(n364) );
  DLY1X1M U348 ( .A(n427), .Y(n365) );
  DLY1X1M U349 ( .A(n430), .Y(n366) );
  DLY1X1M U350 ( .A(n433), .Y(n367) );
  DLY1X1M U351 ( .A(n436), .Y(n368) );
  DLY1X1M U352 ( .A(n384), .Y(n369) );
  DLY1X1M U353 ( .A(n439), .Y(n370) );
  DLY1X1M U354 ( .A(n305), .Y(n371) );
  DLY1X1M U355 ( .A(n378), .Y(n372) );
  DLY1X1M U356 ( .A(n377), .Y(n373) );
  DLY1X1M U357 ( .A(n307), .Y(n374) );
  DLY1X1M U358 ( .A(n307), .Y(n375) );
  DLY1X1M U359 ( .A(test_se), .Y(n376) );
  DLY1X1M U360 ( .A(n305), .Y(n377) );
  DLY1X1M U361 ( .A(n376), .Y(n378) );
  DLY1X1M U362 ( .A(n304), .Y(n379) );
  DLY1X1M U363 ( .A(n306), .Y(n380) );
  DLY1X1M U364 ( .A(n306), .Y(n381) );
  DLY1X1M U365 ( .A(n371), .Y(n382) );
  DLY1X1M U366 ( .A(n309), .Y(n383) );
  DLY1X1M U367 ( .A(n383), .Y(n384) );
  DLY1X1M U368 ( .A(n374), .Y(n385) );
  DLY1X1M U369 ( .A(n382), .Y(n386) );
  DLY1X1M U370 ( .A(n373), .Y(n387) );
  DLY1X1M U371 ( .A(n311), .Y(n388) );
  DLY1X1M U372 ( .A(n385), .Y(n389) );
  DLY1X1M U373 ( .A(n389), .Y(n390) );
  DLY1X1M U374 ( .A(n316), .Y(n391) );
  DLY1X1M U375 ( .A(n391), .Y(n392) );
  DLY1X1M U376 ( .A(n386), .Y(n393) );
  DLY1X1M U377 ( .A(n393), .Y(n394) );
  DLY1X1M U378 ( .A(n310), .Y(n395) );
  DLY1X1M U379 ( .A(n395), .Y(n396) );
  DLY1X1M U380 ( .A(n310), .Y(n397) );
  DLY1X1M U381 ( .A(n397), .Y(n398) );
  DLY1X1M U382 ( .A(n387), .Y(n399) );
  DLY1X1M U383 ( .A(n399), .Y(n400) );
  DLY1X1M U384 ( .A(n308), .Y(n401) );
  DLY1X1M U385 ( .A(n401), .Y(n402) );
  DLY1X1M U386 ( .A(n402), .Y(n403) );
  DLY1X1M U387 ( .A(n309), .Y(n404) );
  DLY1X1M U388 ( .A(n404), .Y(n405) );
  DLY1X1M U389 ( .A(n405), .Y(n406) );
  DLY1X1M U390 ( .A(n314), .Y(n407) );
  DLY1X1M U391 ( .A(n407), .Y(n408) );
  DLY1X1M U392 ( .A(n408), .Y(n409) );
  DLY1X1M U393 ( .A(n315), .Y(n410) );
  DLY1X1M U394 ( .A(n410), .Y(n411) );
  DLY1X1M U395 ( .A(n411), .Y(n412) );
  DLY1X1M U396 ( .A(n380), .Y(n413) );
  DLY1X1M U397 ( .A(n413), .Y(n414) );
  DLY1X1M U398 ( .A(n414), .Y(n415) );
  DLY1X1M U399 ( .A(n382), .Y(n416) );
  DLY1X1M U400 ( .A(n416), .Y(n417) );
  DLY1X1M U401 ( .A(n417), .Y(n418) );
  DLY1X1M U402 ( .A(n379), .Y(n419) );
  DLY1X1M U403 ( .A(n419), .Y(n420) );
  DLY1X1M U404 ( .A(n420), .Y(n421) );
  DLY1X1M U405 ( .A(n312), .Y(n422) );
  DLY1X1M U406 ( .A(n422), .Y(n423) );
  DLY1X1M U407 ( .A(n423), .Y(n424) );
  DLY1X1M U408 ( .A(n308), .Y(n425) );
  DLY1X1M U409 ( .A(n425), .Y(n426) );
  DLY1X1M U410 ( .A(n426), .Y(n427) );
  DLY1X1M U411 ( .A(n372), .Y(n428) );
  DLY1X1M U412 ( .A(n428), .Y(n429) );
  DLY1X1M U413 ( .A(n429), .Y(n430) );
  DLY1X1M U414 ( .A(n375), .Y(n431) );
  DLY1X1M U415 ( .A(n431), .Y(n432) );
  DLY1X1M U416 ( .A(n432), .Y(n433) );
  DLY1X1M U417 ( .A(n313), .Y(n434) );
  DLY1X1M U418 ( .A(n434), .Y(n435) );
  DLY1X1M U419 ( .A(n435), .Y(n436) );
  DLY1X1M U420 ( .A(n381), .Y(n437) );
  DLY1X1M U421 ( .A(n437), .Y(n438) );
  DLY1X1M U422 ( .A(n438), .Y(n439) );
  DLY1X1M U423 ( .A(REG3[0]), .Y(n440) );
  DLY1X1M U424 ( .A(n459), .Y(REG2[1]) );
  DLY1X1M U425 ( .A(REG3[7]), .Y(n442) );
  DLY1X1M U426 ( .A(n450), .Y(n443) );
  DLY1X1M U427 ( .A(n453), .Y(n444) );
  DLY1X1M U428 ( .A(n451), .Y(n445) );
  DLY1X1M U429 ( .A(n452), .Y(n446) );
  DLY1X1M U430 ( .A(n454), .Y(n447) );
  DLY1X1M U431 ( .A(REG3[5]), .Y(n448) );
  DLY1X1M U432 ( .A(n442), .Y(n449) );
  DLY1X1M U433 ( .A(REG3[3]), .Y(n450) );
  DLY1X1M U434 ( .A(REG3[6]), .Y(n451) );
  DLY1X1M U435 ( .A(REG3[2]), .Y(n452) );
  DLY1X1M U436 ( .A(REG3[4]), .Y(n453) );
  DLY1X1M U437 ( .A(REG3[1]), .Y(n454) );
  SDFFRX1M \regArr_reg[2][6]  ( .D(n71), .SI(test_si2), .SE(n312), .CK(CLK), 
        .RN(n265), .Q(n297) );
  SDFFRX1M \regArr_reg[1][0]  ( .D(n57), .SI(REG0[7]), .SE(n375), .CK(CLK), 
        .RN(n264), .Q(n296) );
  SDFFRX1M \regArr_reg[1][4]  ( .D(n61), .SI(n294), .SE(n314), .CK(CLK), .RN(
        n264), .Q(n292) );
  SDFFRX1M \regArr_reg[1][3]  ( .D(n60), .SI(n295), .SE(n315), .CK(CLK), .RN(
        n264), .Q(REG1[3]), .QN(n294) );
  SDFFRX1M \regArr_reg[1][2]  ( .D(n59), .SI(REG1[1]), .SE(n379), .CK(CLK), 
        .RN(n264), .Q(REG1[2]), .QN(n295) );
  SDFFRX1M \regArr_reg[1][1]  ( .D(n58), .SI(REG1[0]), .SE(n313), .CK(CLK), 
        .RN(n264), .Q(n293) );
  SDFFRX1M \regArr_reg[2][5]  ( .D(n70), .SI(REG2[4]), .SE(n316), .CK(CLK), 
        .RN(n265), .Q(n298) );
  SDFFRX1M \regArr_reg[2][2]  ( .D(n67), .SI(n459), .SE(n384), .CK(CLK), .RN(
        n265), .Q(n301), .QN(n184) );
  SDFFRX1M \regArr_reg[1][7]  ( .D(n64), .SI(REG1[6]), .SE(n349), .CK(CLK), 
        .RN(n264), .Q(n290) );
  SDFFRX1M \regArr_reg[1][5]  ( .D(n62), .SI(REG1[4]), .SE(n349), .CK(CLK), 
        .RN(n265), .Q(n291) );
  SDFFRX1M \regArr_reg[2][3]  ( .D(n68), .SI(n184), .SE(n369), .CK(CLK), .RN(
        n265), .Q(n300), .QN(n180) );
  SDFFRQX2M \regArr_reg[12][6]  ( .D(n151), .SI(\regArr[12][5] ), .SE(n341), 
        .CK(CLK), .RN(n271), .Q(\regArr[12][6] ) );
  SDFFRQX2M \regArr_reg[12][5]  ( .D(n150), .SI(\regArr[12][4] ), .SE(n341), 
        .CK(CLK), .RN(n271), .Q(\regArr[12][5] ) );
  SDFFRQX2M \regArr_reg[13][3]  ( .D(n156), .SI(test_si3), .SE(n311), .CK(CLK), 
        .RN(n272), .Q(\regArr[13][3] ) );
  SDFFRQX2M \regArr_reg[13][1]  ( .D(n154), .SI(\regArr[13][0] ), .SE(n430), 
        .CK(CLK), .RN(n271), .Q(\regArr[13][1] ) );
  SDFFRQX2M \regArr_reg[13][0]  ( .D(n153), .SI(\regArr[12][7] ), .SE(n342), 
        .CK(CLK), .RN(n271), .Q(\regArr[13][0] ) );
  SDFFRQX2M \regArr_reg[12][7]  ( .D(n152), .SI(\regArr[12][6] ), .SE(n342), 
        .CK(CLK), .RN(n271), .Q(\regArr[12][7] ) );
  SDFFRQX2M \regArr_reg[9][2]  ( .D(n123), .SI(\regArr[9][1] ), .SE(n333), 
        .CK(CLK), .RN(n269), .Q(\regArr[9][2] ) );
  SDFFRQX2M \regArr_reg[9][1]  ( .D(n122), .SI(\regArr[9][0] ), .SE(n333), 
        .CK(CLK), .RN(n269), .Q(\regArr[9][1] ) );
  SDFFRX1M \regArr_reg[2][4]  ( .D(n69), .SI(n4), .SE(n369), .CK(CLK), .RN(
        n265), .Q(n299) );
  INVXLM U3 ( .A(n299), .Y(n1) );
  INVX6M U5 ( .A(n1), .Y(REG2[4]) );
  INVXLM U6 ( .A(n300), .Y(n3) );
  INVX2M U7 ( .A(n3), .Y(n4) );
  BUFX2M U8 ( .A(REG1[2]), .Y(n456) );
  BUFX2M U9 ( .A(REG1[3]), .Y(n455) );
  INVXLM U10 ( .A(n292), .Y(n5) );
  INVX6M U14 ( .A(n5), .Y(REG1[4]) );
  INVXLM U15 ( .A(n293), .Y(n7) );
  INVX6M U16 ( .A(n7), .Y(REG1[1]) );
  INVXLM U17 ( .A(n291), .Y(n9) );
  INVX6M U438 ( .A(n9), .Y(REG1[5]) );
  INVXLM U439 ( .A(n290), .Y(n11) );
  INVX6M U440 ( .A(n11), .Y(REG1[7]) );
  INVXLM U441 ( .A(n296), .Y(n178) );
  INVX6M U442 ( .A(n178), .Y(REG1[0]) );
  INVX6M U443 ( .A(n180), .Y(REG2[3]) );
  INVXLM U444 ( .A(n301), .Y(n183) );
  INVX8M U445 ( .A(n183), .Y(REG2[2]) );
  CLKINVX1M U446 ( .A(n298), .Y(n186) );
  INVX6M U447 ( .A(n186), .Y(REG2[5]) );
  INVX2M U448 ( .A(n186), .Y(test_so1) );
  INVXLM U449 ( .A(n297), .Y(n288) );
  INVX8M U450 ( .A(n288), .Y(REG2[6]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n3), .CI(
        \u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n5), .CI(
        \u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n4), .CI(
        \u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n6), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n7), .CI(
        \u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n2), .CI(
        \u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n1), .CI(
        \u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n4), .CI(
        \u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n3), .CI(
        \u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n3), .CI(
        \u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n4), .CI(
        \u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n4), .CI(
        \u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n6), .CI(
        \u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n5), .CI(
        \u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n5), .CI(
        \u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n5), .CI(
        \u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n5), .CI(
        \u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n6), .CI(
        \u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n6), .CI(
        \u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n6), .CI(
        \u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n6), .CI(
        \u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n7), .CI(
        \u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n7), .CI(
        \u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n7), .CI(
        \u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n7), .CI(
        \u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n7), .CI(
        \u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n7), .CI(
        \u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n2), .CI(
        \u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX8M U1 ( .A(b[0]), .Y(n8) );
  CLKINVX3M U2 ( .A(b[3]), .Y(n5) );
  CLKINVX4M U3 ( .A(b[2]), .Y(n6) );
  NOR2X4M U4 ( .A(b[6]), .B(b[7]), .Y(n11) );
  AND3X4M U5 ( .A(n11), .B(n3), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  CLKAND2X4M U6 ( .A(\u_div/CryTmp[4][4] ), .B(n10), .Y(quotient[4]) );
  CLKAND2X4M U7 ( .A(\u_div/CryTmp[2][6] ), .B(n11), .Y(quotient[2]) );
  CLKAND2X4M U8 ( .A(\u_div/CryTmp[1][7] ), .B(n1), .Y(quotient[1]) );
  AND2X2M U9 ( .A(\u_div/CryTmp[5][3] ), .B(n9), .Y(quotient[5]) );
  MX2X1M U10 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  MX2X1M U11 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  MX2X1M U12 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  MX2X1M U13 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  MX2X1M U14 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  MX2X1M U15 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  MX2X1M U16 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  MX2X1M U17 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  MX2X1M U18 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  MX2X1M U19 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  MX2X1M U20 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  MX2X1M U21 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  MX2X1M U22 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  MX2X1M U23 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  AND3X2M U24 ( .A(n9), .B(n6), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X2M U25 ( .A(n10), .B(n5), .Y(n9) );
  INVX4M U26 ( .A(b[1]), .Y(n7) );
  OR2X2M U27 ( .A(a[7]), .B(n8), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U28 ( .A(n8), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U29 ( .A(n8), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U30 ( .A(n8), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U31 ( .A(n8), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U32 ( .A(n8), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U33 ( .A(n8), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  OR2X2M U34 ( .A(a[5]), .B(n8), .Y(\u_div/CryTmp[5][1] ) );
  OR2X2M U35 ( .A(a[4]), .B(n8), .Y(\u_div/CryTmp[4][1] ) );
  OR2X2M U36 ( .A(a[3]), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  OR2X2M U37 ( .A(a[2]), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  OR2X2M U38 ( .A(a[1]), .B(n8), .Y(\u_div/CryTmp[1][1] ) );
  NAND2BX2M U39 ( .AN(a[0]), .B(b[0]), .Y(\u_div/CryTmp[0][1] ) );
  OR2X2M U40 ( .A(a[6]), .B(n8), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U41 ( .A(b[6]), .Y(n2) );
  XNOR2X2M U42 ( .A(n8), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX4M U43 ( .A(b[4]), .Y(n4) );
  INVX4M U44 ( .A(b[5]), .Y(n3) );
  INVX2M U45 ( .A(b[7]), .Y(n1) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U48 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U50 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U56 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U58 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U59 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U60 ( .A(\u_div/CryTmp[7][1] ), .B(n9), .C(n7), .D(n6), .Y(
        quotient[7]) );
  AND3X1M U61 ( .A(n11), .B(n4), .C(n3), .Y(n10) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVXLM U1 ( .A(B[3]), .Y(n5) );
  INVXLM U2 ( .A(B[2]), .Y(n6) );
  INVX2M U3 ( .A(B[6]), .Y(n2) );
  XNOR2X2M U4 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U5 ( .A(B[0]), .Y(n8) );
  INVX2M U6 ( .A(B[1]), .Y(n7) );
  OR2X2M U7 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  INVX2M U8 ( .A(B[4]), .Y(n4) );
  INVX2M U9 ( .A(B[5]), .Y(n3) );
  INVX2M U10 ( .A(B[7]), .Y(n1) );
  CLKINVX1M U11 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26;

  OAI21BX4M U2 ( .A0(n19), .A1(n20), .B0N(n21), .Y(n17) );
  AOI2BB1X2M U3 ( .A0N(n8), .A1N(n11), .B0(n10), .Y(n24) );
  NOR2X2M U4 ( .A(B[8]), .B(A[8]), .Y(n14) );
  NOR2X2M U5 ( .A(B[9]), .B(A[9]), .Y(n11) );
  NOR2X2M U6 ( .A(B[10]), .B(A[10]), .Y(n23) );
  NOR2X2M U7 ( .A(B[11]), .B(A[11]), .Y(n19) );
  CLKXOR2X2M U8 ( .A(B[13]), .B(n16), .Y(SUM[13]) );
  NAND2X2M U9 ( .A(A[7]), .B(B[7]), .Y(n13) );
  CLKXOR2X2M U10 ( .A(A[7]), .B(B[7]), .Y(SUM[7]) );
  INVX2M U11 ( .A(A[6]), .Y(n7) );
  INVX2M U12 ( .A(n7), .Y(SUM[6]) );
  BUFX2M U13 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U14 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U15 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U16 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U17 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U18 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U19 ( .A(n8), .B(n9), .Y(SUM[9]) );
  NOR2X1M U20 ( .A(n10), .B(n11), .Y(n9) );
  CLKXOR2X2M U21 ( .A(n12), .B(n13), .Y(SUM[8]) );
  NAND2BX1M U22 ( .AN(n14), .B(n15), .Y(n12) );
  OAI2BB1X1M U23 ( .A0N(n17), .A1N(A[12]), .B0(n18), .Y(n16) );
  OAI21X1M U24 ( .A0(A[12]), .A1(n17), .B0(B[12]), .Y(n18) );
  XOR3XLM U25 ( .A(B[12]), .B(A[12]), .C(n17), .Y(SUM[12]) );
  XNOR2X1M U26 ( .A(n20), .B(n22), .Y(SUM[11]) );
  NOR2X1M U27 ( .A(n21), .B(n19), .Y(n22) );
  AND2X1M U28 ( .A(B[11]), .B(A[11]), .Y(n21) );
  OA21X1M U29 ( .A0(n23), .A1(n24), .B0(n25), .Y(n20) );
  CLKXOR2X2M U30 ( .A(n26), .B(n24), .Y(SUM[10]) );
  AND2X1M U31 ( .A(B[9]), .B(A[9]), .Y(n10) );
  OA21X1M U32 ( .A0(n13), .A1(n14), .B0(n15), .Y(n8) );
  CLKNAND2X2M U33 ( .A(B[8]), .B(A[8]), .Y(n15) );
  NAND2BX1M U34 ( .AN(n23), .B(n25), .Y(n26) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n25) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n7), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n6), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n5), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  CLKINVX4M U10 ( .A(B[3]), .Y(n21) );
  CLKINVX4M U11 ( .A(B[2]), .Y(n22) );
  NOR2X2M U12 ( .A(n18), .B(n32), .Y(\ab[0][6] ) );
  NOR2X2M U13 ( .A(n18), .B(n31), .Y(\ab[1][6] ) );
  NOR2X2M U14 ( .A(n19), .B(n32), .Y(\ab[0][5] ) );
  NOR2X2M U15 ( .A(n20), .B(n32), .Y(\ab[0][4] ) );
  NOR2X2M U16 ( .A(n21), .B(n32), .Y(\ab[0][3] ) );
  NOR2X2M U17 ( .A(n20), .B(n31), .Y(\ab[1][4] ) );
  NOR2X2M U18 ( .A(n21), .B(n31), .Y(\ab[1][3] ) );
  NOR2X2M U19 ( .A(n22), .B(n31), .Y(\ab[1][2] ) );
  CLKXOR2X2M U20 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  NOR2X2M U21 ( .A(n17), .B(n32), .Y(\ab[0][7] ) );
  NOR2X2M U22 ( .A(n22), .B(n32), .Y(\ab[0][2] ) );
  NOR2X2M U23 ( .A(n23), .B(n32), .Y(\ab[0][1] ) );
  NOR2X2M U24 ( .A(n19), .B(n31), .Y(\ab[1][5] ) );
  NOR2X2M U25 ( .A(n23), .B(n31), .Y(\ab[1][1] ) );
  NOR2X2M U26 ( .A(n24), .B(n31), .Y(\ab[1][0] ) );
  NOR2X2M U27 ( .A(n25), .B(n17), .Y(\ab[7][7] ) );
  CLKXOR2X2M U28 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U29 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U30 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  INVX4M U31 ( .A(A[1]), .Y(n31) );
  AND2X2M U32 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U33 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  INVX4M U34 ( .A(A[2]), .Y(n30) );
  AND2X2M U35 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  CLKXOR2X2M U36 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U37 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX4M U38 ( .A(A[3]), .Y(n29) );
  INVX4M U39 ( .A(A[4]), .Y(n28) );
  INVX4M U40 ( .A(A[5]), .Y(n27) );
  AND2X2M U41 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U42 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  INVX4M U43 ( .A(A[7]), .Y(n25) );
  INVX4M U44 ( .A(A[6]), .Y(n26) );
  CLKXOR2X2M U45 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U46 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U47 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  XOR2X1M U48 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  INVX4M U49 ( .A(B[6]), .Y(n18) );
  INVX4M U50 ( .A(A[0]), .Y(n32) );
  XOR2X1M U51 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1M U52 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2X1M U53 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  XOR2X1M U54 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2X1M U55 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  INVX4M U56 ( .A(B[7]), .Y(n17) );
  INVX4M U57 ( .A(B[4]), .Y(n20) );
  INVX4M U58 ( .A(B[5]), .Y(n19) );
  INVX4M U59 ( .A(B[0]), .Y(n24) );
  INVX4M U60 ( .A(B[1]), .Y(n23) );
  NOR2X1M U62 ( .A(n25), .B(n18), .Y(\ab[7][6] ) );
  NOR2X1M U63 ( .A(n25), .B(n19), .Y(\ab[7][5] ) );
  NOR2X1M U64 ( .A(n25), .B(n20), .Y(\ab[7][4] ) );
  NOR2X1M U65 ( .A(n25), .B(n21), .Y(\ab[7][3] ) );
  NOR2X1M U66 ( .A(n25), .B(n22), .Y(\ab[7][2] ) );
  NOR2X1M U67 ( .A(n25), .B(n23), .Y(\ab[7][1] ) );
  NOR2X1M U68 ( .A(n25), .B(n24), .Y(\ab[7][0] ) );
  NOR2X1M U69 ( .A(n17), .B(n26), .Y(\ab[6][7] ) );
  NOR2X1M U70 ( .A(n18), .B(n26), .Y(\ab[6][6] ) );
  NOR2X1M U71 ( .A(n19), .B(n26), .Y(\ab[6][5] ) );
  NOR2X1M U72 ( .A(n20), .B(n26), .Y(\ab[6][4] ) );
  NOR2X1M U73 ( .A(n21), .B(n26), .Y(\ab[6][3] ) );
  NOR2X1M U74 ( .A(n22), .B(n26), .Y(\ab[6][2] ) );
  NOR2X1M U75 ( .A(n23), .B(n26), .Y(\ab[6][1] ) );
  NOR2X1M U76 ( .A(n24), .B(n26), .Y(\ab[6][0] ) );
  NOR2X1M U77 ( .A(n17), .B(n27), .Y(\ab[5][7] ) );
  NOR2X1M U78 ( .A(n18), .B(n27), .Y(\ab[5][6] ) );
  NOR2X1M U79 ( .A(n19), .B(n27), .Y(\ab[5][5] ) );
  NOR2X1M U80 ( .A(n20), .B(n27), .Y(\ab[5][4] ) );
  NOR2X1M U81 ( .A(n21), .B(n27), .Y(\ab[5][3] ) );
  NOR2X1M U82 ( .A(n22), .B(n27), .Y(\ab[5][2] ) );
  NOR2X1M U83 ( .A(n23), .B(n27), .Y(\ab[5][1] ) );
  NOR2X1M U84 ( .A(n24), .B(n27), .Y(\ab[5][0] ) );
  NOR2X1M U85 ( .A(n17), .B(n28), .Y(\ab[4][7] ) );
  NOR2X1M U86 ( .A(n18), .B(n28), .Y(\ab[4][6] ) );
  NOR2X1M U87 ( .A(n19), .B(n28), .Y(\ab[4][5] ) );
  NOR2X1M U88 ( .A(n20), .B(n28), .Y(\ab[4][4] ) );
  NOR2X1M U89 ( .A(n21), .B(n28), .Y(\ab[4][3] ) );
  NOR2X1M U90 ( .A(n22), .B(n28), .Y(\ab[4][2] ) );
  NOR2X1M U91 ( .A(n23), .B(n28), .Y(\ab[4][1] ) );
  NOR2X1M U92 ( .A(n24), .B(n28), .Y(\ab[4][0] ) );
  NOR2X1M U93 ( .A(n17), .B(n29), .Y(\ab[3][7] ) );
  NOR2X1M U94 ( .A(n18), .B(n29), .Y(\ab[3][6] ) );
  NOR2X1M U95 ( .A(n19), .B(n29), .Y(\ab[3][5] ) );
  NOR2X1M U96 ( .A(n20), .B(n29), .Y(\ab[3][4] ) );
  NOR2X1M U97 ( .A(n21), .B(n29), .Y(\ab[3][3] ) );
  NOR2X1M U98 ( .A(n22), .B(n29), .Y(\ab[3][2] ) );
  NOR2X1M U99 ( .A(n23), .B(n29), .Y(\ab[3][1] ) );
  NOR2X1M U100 ( .A(n24), .B(n29), .Y(\ab[3][0] ) );
  NOR2X1M U101 ( .A(n17), .B(n30), .Y(\ab[2][7] ) );
  NOR2X1M U102 ( .A(n18), .B(n30), .Y(\ab[2][6] ) );
  NOR2X1M U103 ( .A(n19), .B(n30), .Y(\ab[2][5] ) );
  NOR2X1M U104 ( .A(n20), .B(n30), .Y(\ab[2][4] ) );
  NOR2X1M U105 ( .A(n21), .B(n30), .Y(\ab[2][3] ) );
  NOR2X1M U106 ( .A(n22), .B(n30), .Y(\ab[2][2] ) );
  NOR2X1M U107 ( .A(n23), .B(n30), .Y(\ab[2][1] ) );
  NOR2X1M U108 ( .A(n24), .B(n30), .Y(\ab[2][0] ) );
  NOR2X1M U109 ( .A(n17), .B(n31), .Y(\ab[1][7] ) );
  NOR2X1M U110 ( .A(n24), .B(n32), .Y(PRODUCT[0]) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , 
        \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , 
        \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n12, 
        n11, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_test_1 ( A, B, EN, ALU_FUN, CLK, RST, 
        ALU_OUT, OUT_VALID, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST, test_si, test_se;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n41, n42, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n185, n186, n188, n189, n190, n191, n192, n193, n194;
  wire   [15:0] ALU_OUT_Comb;

  OAI2BB1X4M U77 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  OR2X2M U3 ( .A(n107), .B(n167), .Y(n3) );
  AOI2B1X1M U4 ( .A1N(n142), .A0(n141), .B0(n140), .Y(n143) );
  INVX2M U7 ( .A(n143), .Y(N158) );
  NAND2X2M U8 ( .A(n99), .B(n105), .Y(n4) );
  INVX2M U9 ( .A(n186), .Y(n148) );
  INVX2M U10 ( .A(n183), .Y(n150) );
  XNOR2X4M U11 ( .A(n27), .B(n8), .Y(n137) );
  OAI31X2M U12 ( .A0(n130), .A1(n121), .A2(n120), .B0(n131), .Y(n123) );
  AOI211X2M U13 ( .A0(n12), .A1(n147), .B0(n127), .C0(n119), .Y(n120) );
  AOI211X2M U14 ( .A0(n128), .A1(n160), .B0(n127), .C0(n126), .Y(n129) );
  NAND2BX2M U15 ( .AN(n121), .B(n132), .Y(n127) );
  OAI21X2M U16 ( .A0(n140), .A1(n125), .B0(n141), .Y(N159) );
  BUFX4M U17 ( .A(n49), .Y(n5) );
  AOI222X2M U18 ( .A0(N111), .A1(n42), .B0(n15), .B1(n108), .C0(N127), .C1(n5), 
        .Y(n76) );
  AOI222X2M U19 ( .A0(N112), .A1(n42), .B0(n18), .B1(n109), .C0(N128), .C1(n5), 
        .Y(n70) );
  AOI222X2M U20 ( .A0(N113), .A1(n42), .B0(n21), .B1(n108), .C0(N129), .C1(n5), 
        .Y(n64) );
  AOI222X2M U21 ( .A0(N114), .A1(n42), .B0(n24), .B1(n109), .C0(N130), .C1(n5), 
        .Y(n58) );
  AOI222X2M U22 ( .A0(N126), .A1(n5), .B0(n110), .B1(n160), .C0(n12), .C1(n108), .Y(n82) );
  NOR3BX2M U23 ( .AN(n105), .B(n165), .C(ALU_FUN[2]), .Y(n49) );
  NOR2X2M U24 ( .A(n148), .B(n15), .Y(n121) );
  NOR2X2M U25 ( .A(n146), .B(n9), .Y(n118) );
  NOR2X2M U26 ( .A(n150), .B(n18), .Y(n130) );
  NOR2X2M U27 ( .A(n145), .B(B[7]), .Y(n140) );
  INVX4M U28 ( .A(n4), .Y(n109) );
  INVX4M U29 ( .A(n4), .Y(n108) );
  NOR2X4M U30 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  NOR2X2M U31 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n100) );
  AOI31X1M U32 ( .A0(n81), .A1(n82), .A2(n83), .B0(n162), .Y(ALU_OUT_Comb[1])
         );
  AOI31X1M U33 ( .A0(n75), .A1(n76), .A2(n77), .B0(n162), .Y(ALU_OUT_Comb[2])
         );
  AOI31X1M U34 ( .A0(n69), .A1(n70), .A2(n71), .B0(n162), .Y(ALU_OUT_Comb[3])
         );
  AOI31X1M U35 ( .A0(n63), .A1(n64), .A2(n65), .B0(n162), .Y(ALU_OUT_Comb[4])
         );
  AOI31X1M U36 ( .A0(n57), .A1(n58), .A2(n59), .B0(n162), .Y(ALU_OUT_Comb[5])
         );
  CLKBUFX6M U37 ( .A(B[6]), .Y(n8) );
  BUFX6M U38 ( .A(A[0]), .Y(n9) );
  BUFX4M U39 ( .A(n46), .Y(n112) );
  BUFX4M U40 ( .A(n46), .Y(n113) );
  INVX4M U41 ( .A(n3), .Y(n111) );
  INVX4M U42 ( .A(n3), .Y(n110) );
  OAI2BB1X2M U43 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U44 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U45 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U46 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U47 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U48 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  NOR2X4M U49 ( .A(n166), .B(n7), .Y(n105) );
  OAI2BB1X2M U50 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  CLKAND2X6M U51 ( .A(n106), .B(n105), .Y(n50) );
  INVX2M U52 ( .A(n100), .Y(n167) );
  CLKBUFX6M U53 ( .A(n47), .Y(n114) );
  OAI2BB1X2M U54 ( .A0N(n164), .A1N(n105), .B0(n101), .Y(n47) );
  INVX2M U55 ( .A(n107), .Y(n164) );
  AND3X2M U56 ( .A(n106), .B(n166), .C(n7), .Y(n46) );
  NOR2BX8M U57 ( .AN(n42), .B(n162), .Y(n31) );
  NAND3X4M U58 ( .A(n164), .B(n166), .C(n7), .Y(n36) );
  INVX4M U59 ( .A(n91), .Y(n163) );
  CLKBUFX6M U60 ( .A(n37), .Y(n41) );
  NOR2BX2M U61 ( .AN(n106), .B(n167), .Y(n37) );
  INVX6M U62 ( .A(EN), .Y(n162) );
  AND4X1M U63 ( .A(N159), .B(n99), .C(n7), .D(n166), .Y(n90) );
  AOI31X2M U64 ( .A0(n51), .A1(n52), .A2(n53), .B0(n162), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U65 ( .A0(N106), .A1(n50), .B0(N97), .B1(n41), .Y(n51) );
  AOI221X2M U66 ( .A0(n163), .A1(n30), .B0(n111), .B1(n25), .C0(n54), .Y(n53)
         );
  AOI222X2M U67 ( .A0(N115), .A1(n42), .B0(n108), .B1(n27), .C0(N131), .C1(n5), 
        .Y(n52) );
  INVX4M U68 ( .A(ALU_FUN[0]), .Y(n166) );
  INVX4M U69 ( .A(ALU_FUN[1]), .Y(n165) );
  NAND3X2M U70 ( .A(n106), .B(ALU_FUN[0]), .C(n7), .Y(n101) );
  AND2X2M U71 ( .A(ALU_FUN[2]), .B(n165), .Y(n99) );
  NAND2X4M U72 ( .A(EN), .B(n152), .Y(n32) );
  NAND2X2M U73 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  NAND3X2M U74 ( .A(n7), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  CLKBUFX6M U75 ( .A(n35), .Y(n42) );
  NOR3X2M U76 ( .A(n167), .B(ALU_FUN[2]), .C(n165), .Y(n35) );
  INVX2M U78 ( .A(n30), .Y(n145) );
  INVX4M U79 ( .A(n6), .Y(n7) );
  INVX4M U80 ( .A(n12), .Y(n160) );
  INVX2M U81 ( .A(n15), .Y(n159) );
  INVX2M U82 ( .A(n18), .Y(n158) );
  INVX2M U83 ( .A(n21), .Y(n157) );
  INVX2M U84 ( .A(n24), .Y(n156) );
  INVX6M U85 ( .A(n117), .Y(n115) );
  INVX4M U86 ( .A(n117), .Y(n116) );
  AOI31X2M U87 ( .A0(n93), .A1(n94), .A2(n95), .B0(n162), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U88 ( .A0(N100), .A1(n50), .B0(N91), .B1(n41), .Y(n93) );
  AOI211X2M U89 ( .A0(n111), .A1(n161), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X2M U90 ( .A0(N109), .A1(n42), .B0(n9), .B1(n109), .C0(N125), .C1(n5), 
        .Y(n94) );
  AOI222X2M U91 ( .A0(N92), .A1(n41), .B0(N110), .B1(n42), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U92 ( .A0(n15), .A1(n163), .B0(n84), .C0(n85), .Y(n83) );
  INVX4M U93 ( .A(n28), .Y(n29) );
  INVX4M U94 ( .A(n25), .Y(n26) );
  INVX4M U95 ( .A(n22), .Y(n23) );
  AOI22X1M U96 ( .A0(N102), .A1(n50), .B0(N93), .B1(n41), .Y(n75) );
  AOI221X2M U97 ( .A0(n18), .A1(n163), .B0(n111), .B1(n159), .C0(n78), .Y(n77)
         );
  INVX4M U98 ( .A(n19), .Y(n20) );
  AOI22X1M U99 ( .A0(N103), .A1(n50), .B0(N94), .B1(n41), .Y(n69) );
  AOI221X2M U100 ( .A0(n21), .A1(n163), .B0(n111), .B1(n158), .C0(n72), .Y(n71) );
  INVX4M U101 ( .A(n16), .Y(n17) );
  AOI22X1M U102 ( .A0(N104), .A1(n50), .B0(N95), .B1(n41), .Y(n63) );
  AOI221X2M U103 ( .A0(n163), .A1(n24), .B0(n111), .B1(n157), .C0(n66), .Y(n65) );
  INVX4M U104 ( .A(n13), .Y(n14) );
  INVX4M U105 ( .A(n10), .Y(n11) );
  AOI22X1M U106 ( .A0(N105), .A1(n50), .B0(N96), .B1(n41), .Y(n57) );
  AOI221X2M U107 ( .A0(n163), .A1(n27), .B0(n111), .B1(n156), .C0(n60), .Y(n59) );
  INVX2M U108 ( .A(n26), .Y(n144) );
  INVX2M U109 ( .A(n8), .Y(n151) );
  INVX4M U110 ( .A(n13), .Y(n15) );
  AOI31X2M U111 ( .A0(n38), .A1(n39), .A2(n40), .B0(n162), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U112 ( .A0(N107), .A1(n50), .B0(N98), .B1(n41), .Y(n38) );
  AOI221X2M U113 ( .A0(n111), .A1(n28), .B0(n109), .B1(n30), .C0(n43), .Y(n40)
         );
  AOI22X1M U114 ( .A0(N132), .A1(n5), .B0(N116), .B1(n42), .Y(n39) );
  INVX4M U115 ( .A(n16), .Y(n18) );
  INVX4M U116 ( .A(n10), .Y(n12) );
  OAI222X1M U117 ( .A0(n55), .A1(n151), .B0(n8), .B1(n56), .C0(n36), .C1(n156), 
        .Y(n54) );
  AOI221X2M U118 ( .A0(n27), .A1(n112), .B0(n114), .B1(n144), .C0(n110), .Y(
        n56) );
  AOI221X2M U119 ( .A0(n113), .A1(n144), .B0(n27), .B1(n48), .C0(n109), .Y(n55) );
  AOI21X2M U120 ( .A0(n33), .A1(n34), .B0(n162), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U121 ( .A0(N99), .A1(n41), .B0(n152), .Y(n33) );
  AOI2BB2X2M U122 ( .B0(N117), .B1(n42), .A0N(n28), .A1N(n36), .Y(n34) );
  INVX4M U123 ( .A(n19), .Y(n21) );
  INVX2M U124 ( .A(ALU_FUN[3]), .Y(n6) );
  INVX2M U125 ( .A(n92), .Y(n152) );
  AOI211X2M U126 ( .A0(N108), .A1(n50), .B0(n111), .C0(n114), .Y(n92) );
  INVX4M U127 ( .A(n25), .Y(n27) );
  INVX4M U128 ( .A(n22), .Y(n24) );
  INVX4M U129 ( .A(n28), .Y(n30) );
  INVX2M U130 ( .A(n9), .Y(n161) );
  INVX2M U131 ( .A(RST), .Y(n117) );
  INVX2M U132 ( .A(A[7]), .Y(n28) );
  INVX2M U133 ( .A(A[6]), .Y(n25) );
  INVX2M U134 ( .A(A[5]), .Y(n22) );
  INVX2M U135 ( .A(A[4]), .Y(n19) );
  INVX2M U136 ( .A(A[3]), .Y(n16) );
  INVX2M U137 ( .A(A[2]), .Y(n13) );
  INVX2M U138 ( .A(A[1]), .Y(n10) );
  INVXLM U139 ( .A(n118), .Y(n147) );
  OAI21X2M U140 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221X2M U141 ( .A0(n9), .A1(n112), .B0(n114), .B1(n161), .C0(n110), .Y(
        n102) );
  AOI31X2M U142 ( .A0(N157), .A1(n7), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U143 ( .A(n165), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  INVX2M U144 ( .A(B[0]), .Y(n146) );
  INVXLM U145 ( .A(n129), .Y(n149) );
  OAI21X2M U146 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221X2M U147 ( .A0(n12), .A1(n112), .B0(n114), .B1(n160), .C0(n110), .Y(
        n87) );
  AOI31X2M U148 ( .A0(N158), .A1(n7), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U149 ( .A(n166), .B(ALU_FUN[2]), .C(n165), .Y(n89) );
  OAI222X1M U150 ( .A0(n44), .A1(n153), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n144), .Y(n43) );
  INVX2M U151 ( .A(B[7]), .Y(n153) );
  AOI221X2M U152 ( .A0(n113), .A1(n30), .B0(n114), .B1(n145), .C0(n111), .Y(
        n45) );
  AOI221X2M U153 ( .A0(n113), .A1(n145), .B0(n30), .B1(n48), .C0(n108), .Y(n44) );
  OAI222X1M U154 ( .A0(n67), .A1(n155), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n158), .Y(n66) );
  INVX2M U155 ( .A(B[4]), .Y(n155) );
  AOI221X2M U156 ( .A0(n21), .A1(n112), .B0(n114), .B1(n157), .C0(n110), .Y(
        n68) );
  AOI221X2M U157 ( .A0(n113), .A1(n157), .B0(n21), .B1(n48), .C0(n109), .Y(n67) );
  OAI222X1M U158 ( .A0(n61), .A1(n154), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n157), .Y(n60) );
  INVX2M U159 ( .A(B[5]), .Y(n154) );
  AOI221X2M U160 ( .A0(n24), .A1(n112), .B0(n114), .B1(n156), .C0(n110), .Y(
        n62) );
  AOI221X2M U161 ( .A0(n113), .A1(n156), .B0(n24), .B1(n48), .C0(n108), .Y(n61) );
  OAI222X1M U162 ( .A0(n79), .A1(n148), .B0(n186), .B1(n80), .C0(n36), .C1(
        n160), .Y(n78) );
  AOI221X2M U163 ( .A0(n15), .A1(n112), .B0(n114), .B1(n159), .C0(n110), .Y(
        n80) );
  AOI221X2M U164 ( .A0(n113), .A1(n159), .B0(n15), .B1(n48), .C0(n109), .Y(n79) );
  OAI222X1M U165 ( .A0(n73), .A1(n150), .B0(n183), .B1(n74), .C0(n36), .C1(
        n159), .Y(n72) );
  AOI221X2M U166 ( .A0(n18), .A1(n112), .B0(n114), .B1(n158), .C0(n110), .Y(
        n74) );
  AOI221X2M U167 ( .A0(n113), .A1(n158), .B0(n18), .B1(n48), .C0(n108), .Y(n73) );
  OAI2B2X1M U168 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n161), .Y(n85) );
  AOI221X2M U169 ( .A0(n113), .A1(n160), .B0(n12), .B1(n48), .C0(n108), .Y(n86) );
  OAI2B2X1M U170 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n160), .Y(n97) );
  AOI221X2M U171 ( .A0(n112), .A1(n161), .B0(n9), .B1(n48), .C0(n109), .Y(n98)
         );
  NAND2BX1M U172 ( .AN(B[4]), .B(n21), .Y(n133) );
  NAND2BX1M U173 ( .AN(n21), .B(B[4]), .Y(n122) );
  CLKNAND2X2M U174 ( .A(n133), .B(n122), .Y(n135) );
  CLKNAND2X2M U175 ( .A(n15), .B(n148), .Y(n132) );
  AOI21X1M U176 ( .A0(n118), .A1(n160), .B0(B[1]), .Y(n119) );
  CLKNAND2X2M U177 ( .A(n18), .B(n150), .Y(n131) );
  NAND2BX1M U178 ( .AN(n24), .B(B[5]), .Y(n138) );
  OAI211X1M U179 ( .A0(n135), .A1(n123), .B0(n122), .C0(n138), .Y(n124) );
  NAND2BX1M U180 ( .AN(B[5]), .B(n24), .Y(n134) );
  AOI32X1M U181 ( .A0(n124), .A1(n134), .A2(n137), .B0(n8), .B1(n144), .Y(n125) );
  CLKNAND2X2M U182 ( .A(B[7]), .B(n145), .Y(n141) );
  CLKNAND2X2M U183 ( .A(n9), .B(n146), .Y(n128) );
  OA21X1M U184 ( .A0(n128), .A1(n160), .B0(B[1]), .Y(n126) );
  AOI31X1M U185 ( .A0(n149), .A1(n132), .A2(n131), .B0(n130), .Y(n136) );
  OAI2B11X1M U186 ( .A1N(n136), .A0(n135), .B0(n134), .C0(n133), .Y(n139) );
  AOI32X1M U187 ( .A0(n139), .A1(n138), .A2(n137), .B0(n27), .B1(n151), .Y(
        n142) );
  NOR2X1M U188 ( .A(N159), .B(N158), .Y(N157) );
  DLY1X1M U190 ( .A(n188), .Y(n171) );
  DLY1X1M U191 ( .A(n188), .Y(n172) );
  INVXLM U192 ( .A(n148), .Y(n173) );
  INVXLM U193 ( .A(n150), .Y(n174) );
  DLY1X1M U194 ( .A(n181), .Y(n175) );
  DLY1X1M U195 ( .A(n191), .Y(n176) );
  DLY1X1M U196 ( .A(n192), .Y(n177) );
  DLY1X1M U197 ( .A(n193), .Y(n178) );
  DLY1X1M U198 ( .A(n194), .Y(n179) );
  DLY1X1M U199 ( .A(n172), .Y(n180) );
  DLY1X1M U200 ( .A(n172), .Y(n181) );
  DLY1X1M U201 ( .A(n174), .Y(n182) );
  DLY1X1M U204 ( .A(n173), .Y(n185) );
  DLY1X1M U207 ( .A(test_se), .Y(n188) );
  DLY1X1M U208 ( .A(n171), .Y(n189) );
  DLY1X1M U209 ( .A(n171), .Y(n190) );
  DLY1X1M U210 ( .A(n189), .Y(n191) );
  DLY1X1M U211 ( .A(n189), .Y(n192) );
  DLY1X1M U212 ( .A(n190), .Y(n193) );
  DLY1X1M U213 ( .A(n190), .Y(n194) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 div_52 ( .a({n29, n26, n23, n20, 
        n17, n14, n11, n9}), .b({B[7], n8, B[5:4], n182, n185, B[1:0]}), 
        .quotient({N132, N131, N130, N129, N128, N127, N126, N125}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_46 ( .A({1'b0, n29, n26, n23, n20, 
        n17, n14, n11, n9}), .B({1'b0, B[7], n8, B[5:4], n183, n186, B[1:0]}), 
        .CI(1'b0), .DIFF({N108, N107, N106, N105, N104, N103, N102, N101, N100}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 add_43 ( .A({1'b0, n29, n26, n23, n20, 
        n17, n14, n11, n9}), .B({1'b0, B[7], n8, B[5:4], n183, n186, B[1:0]}), 
        .CI(1'b0), .SUM({N99, N98, N97, N96, N95, N94, N93, N92, N91}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_49 ( .A({n29, n26, n23, n20, 
        n17, n14, n11, n9}), .B({B[7], n8, B[5:4], n182, n185, B[1:0]}), .TC(
        1'b0), .PRODUCT({N124, N123, N122, N121, N120, N119, N118, N117, N116, 
        N115, N114, N113, N112, N111, N110, N109}) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .SI(ALU_OUT[13]), .SE(
        n181), .CK(CLK), .RN(n115), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .SI(ALU_OUT[10]), .SE(
        n180), .CK(CLK), .RN(n115), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .SI(ALU_OUT[4]), .SE(n180), 
        .CK(CLK), .RN(n115), .Q(ALU_OUT[5]) );
  SDFFRQX2M OUT_VALID_reg ( .D(EN), .SI(ALU_OUT[15]), .SE(n193), .CK(CLK), 
        .RN(n116), .Q(OUT_VALID) );
  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .SI(ALU_OUT[14]), .SE(
        n192), .CK(CLK), .RN(n115), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .SI(ALU_OUT[12]), .SE(
        n194), .CK(CLK), .RN(n115), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .SI(ALU_OUT[5]), .SE(n191), 
        .CK(CLK), .RN(n115), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .SI(ALU_OUT[7]), .SE(n175), 
        .CK(CLK), .RN(n115), .Q(ALU_OUT[8]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .SI(ALU_OUT[1]), .SE(n175), 
        .CK(CLK), .RN(n116), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .SI(ALU_OUT[11]), .SE(
        n176), .CK(CLK), .RN(n115), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .SI(ALU_OUT[9]), .SE(
        n178), .CK(CLK), .RN(n115), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .SI(ALU_OUT[8]), .SE(n177), 
        .CK(CLK), .RN(n115), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .SI(ALU_OUT[6]), .SE(n179), 
        .CK(CLK), .RN(n115), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .SI(ALU_OUT[3]), .SE(n178), 
        .CK(CLK), .RN(n115), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .SI(ALU_OUT[2]), .SE(n177), 
        .CK(CLK), .RN(n116), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .SI(ALU_OUT[0]), .SE(n179), 
        .CK(CLK), .RN(n116), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .SI(test_si), .SE(n176), 
        .CK(CLK), .RN(n116), .Q(ALU_OUT[0]) );
  BUFX2M U202 ( .A(B[2]), .Y(n186) );
  BUFX2M U203 ( .A(B[3]), .Y(n183) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, scan_clk, SI, SE, SO, 
        scan_rst, test_mode, UART_TX_O, parity_error, framing_error, test_si2, 
        test_so2, test_si3, test_so3, test_si4 );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN, scan_clk, SI, SE, scan_rst,
         test_mode, test_si2, test_si3, test_si4;
  output SO, UART_TX_O, parity_error, framing_error, test_so2, test_so3;
  wire   CLK_REF_M, CLK_UART_M, TX_CLK, CLK_UART_TX_M, RX_CLK, CLK_UART_RX_M,
         ALU_CLK, CLK_ALU_M, sync_reset_ref, RST_REF_M, sync_reset_uart,
         RST_UART_M, RST_M, data_valid, RX_D_VLD, TX_D_VLD, RD_INC, F_EMPTY,
         FIFO_FULL, busy, OUT_Valid, ALU_EN, CLK_EN, WrEn, RdEn, RdData_Valid,
         _3_net_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n19,
         n20, n21, n22, n35, n26, n27, n28, n29, n30, n31, n32, n33;
  wire   [7:0] RX_P_DATA;
  wire   [7:0] P_DATA_RX_SYNC;
  wire   [7:0] TX_P_DATA;
  wire   [7:0] RD_DATA_FIFO;
  wire   [7:0] REG3;
  wire   [7:0] REG2;
  wire   [7:0] ratio_rx;
  wire   [15:0] ALU_OUT;
  wire   [3:0] ALU_FUN;
  wire   [3:0] Address;
  wire   [7:0] WrData;
  wire   [7:0] RdData;
  wire   [7:0] REG0;
  wire   [7:0] REG1;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  INVX2M U4 ( .A(F_EMPTY), .Y(n1) );
  INVX4M U5 ( .A(n7), .Y(n6) );
  INVX4M U6 ( .A(n9), .Y(n8) );
  OR2X2M U7 ( .A(CLK_EN), .B(n2), .Y(_3_net_) );
  BUFX2M U8 ( .A(Address[0]), .Y(n4) );
  BUFX2M U9 ( .A(Address[1]), .Y(n5) );
  INVX2M U10 ( .A(RST_UART_M), .Y(n7) );
  CLKBUFX6M U11 ( .A(test_mode), .Y(n2) );
  INVX2M U12 ( .A(RST_REF_M), .Y(n9) );
  BUFX4M U13 ( .A(UART_RX_IN), .Y(n3) );
  BUFX2M U14 ( .A(CLK_UART_RX_M), .Y(n10) );
  DLY1X1M U19 ( .A(SE), .Y(n26) );
  DLY1X1M U20 ( .A(n29), .Y(n27) );
  DLY1X1M U21 ( .A(n30), .Y(n28) );
  DLY1X1M U22 ( .A(SE), .Y(n29) );
  DLY1X1M U23 ( .A(SE), .Y(n30) );
  DLY1X1M U24 ( .A(SE), .Y(n31) );
  DLY1X1M U25 ( .A(n26), .Y(n32) );
  DLY1X1M U26 ( .A(n26), .Y(n33) );
  mux2X1_0 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        CLK_REF_M) );
  mux2X1_7 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        CLK_UART_M) );
  mux2X1_6 U2_mux2X1 ( .IN_0(TX_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        CLK_UART_TX_M) );
  mux2X1_5 U3_mux2X1 ( .IN_0(RX_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        CLK_UART_RX_M) );
  mux2X1_4 U4_mux2X1 ( .IN_0(ALU_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        CLK_ALU_M) );
  mux2X1_3 U5_mux2X1 ( .IN_0(sync_reset_ref), .IN_1(scan_rst), .SEL(n2), .OUT(
        RST_REF_M) );
  mux2X1_2 U6_mux2X1 ( .IN_0(sync_reset_uart), .IN_1(scan_rst), .SEL(n2), 
        .OUT(RST_UART_M) );
  mux2X1_1 U7_mux2X1 ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(n2), .OUT(RST_M) );
  Reset_sync_test_0 RST_SYNC_1 ( .RST(RST_M), .CLK(CLK_REF_M), .sync_reset(
        sync_reset_ref), .test_si(n22), .test_se(n33) );
  Reset_sync_test_1 RST_SYNC_2 ( .RST(RST_M), .CLK(CLK_UART_M), .sync_reset(
        sync_reset_uart), .test_si(sync_reset_ref), .test_se(n31) );
  Data_Sync_BUS_WIDTH8_test_1 U0_DATA_SYNC ( .CLK(CLK_REF_M), .RST(n8), 
        .unsync_bus(RX_P_DATA), .bus_enable(data_valid), .enable_pulse(
        RX_D_VLD), .sync_bus(P_DATA_RX_SYNC), .test_si(n20), .test_se(n33) );
  FIFO_top_test_1 FIFO ( .wdata(TX_P_DATA), .winc(TX_D_VLD), .wclk(CLK_REF_M), 
        .wrst_n(n8), .rclk(CLK_UART_TX_M), .rrst_n(n6), .rinc(RD_INC), .rdata(
        RD_DATA_FIFO), .rempty(F_EMPTY), .wfull(FIFO_FULL), .test_si2(test_si2), .test_si1(SI), .test_so2(n22), .test_so1(n35), .test_se(n29) );
  PULSE_GEN_test_1 U0_PULSE_GEN ( .clk(CLK_UART_TX_M), .rst(n6), .lvl_sig(busy), .pulse_sig(RD_INC), .test_si(P_DATA_RX_SYNC[7]), .test_so(n19), .test_se(n32) );
  ClkDiv_test_1 U0_CLK_DIV_TX ( .i_ref_clk(CLK_UART_M), .i_rst(n6), .i_clk_en(
        1'b1), .i_div_ratio(REG3), .o_div_clk(TX_CLK), .test_si(n21), 
        .test_so(n20), .test_se(n28) );
  CLKDIV_MUX_WIDTH8 U0_CLKDIV_MUX ( .IN(REG2[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, ratio_rx[3:0]}) );
  ClkDiv_test_0 U0_CLK_DIV_RX ( .i_ref_clk(CLK_UART_M), .i_rst(n6), .i_clk_en(
        1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, ratio_rx[3:0]}), 
        .o_div_clk(RX_CLK), .test_si(OUT_Valid), .test_so(n21), .test_se(n32)
         );
  UART_TX_top_test_1 U0_TX ( .P_DATA(RD_DATA_FIFO), .PAR_EN(REG2[0]), 
        .Data_Valid(n1), .PAR_TYP(REG2[1]), .CLK(CLK_UART_TX_M), .RST(n6), 
        .TX_OUT(UART_TX_O), .busy(busy), .test_si(n12), .test_se(n28) );
  UART_RX_top_test_1 U0_RX ( .RX_IN(n3), .PAR_EN(REG2[0]), .PAR_TYP(REG2[1]), 
        .prescale(REG2[7:2]), .CLK(n10), .RST(n6), .data_valid(data_valid), 
        .P_DATA(RX_P_DATA), .test_si(n14), .test_so(n13), .test_se(n27) );
  sys_ctrl_test_1 U0_SYS_CTRL ( .CLK(CLK_REF_M), .RST(n8), .ALU_OUT(ALU_OUT), 
        .OUT_Valid(OUT_Valid), .FIFO_FULL(FIFO_FULL), .ALU_FUN(ALU_FUN), 
        .ALU_EN(ALU_EN), .CLK_EN(CLK_EN), .Address(Address), .WrEn(WrEn), 
        .RdEn(RdEn), .WrData(WrData), .RdData(RdData), .RdData_Valid(
        RdData_Valid), .RX_P_DATA(P_DATA_RX_SYNC), .RX_D_VLD(RX_D_VLD), 
        .TX_P_DATA(TX_P_DATA), .TX_D_VLD(TX_D_VLD), .test_si(n13), .test_so(
        n12), .test_se(n27) );
  RegFile_WIDTH8_ADDR4_test_1 U0_REG_FILE ( .CLK(CLK_REF_M), .RST(n8), .WrEn(
        WrEn), .RdEn(RdEn), .Address({Address[3:2], n5, n4}), .WrData(WrData), 
        .RdData(RdData), .RdData_VLD(RdData_Valid), .REG0(REG0), .REG1(REG1), 
        .REG2(REG2), .REG3(REG3), .test_si3(test_si4), .test_si2(test_si3), 
        .test_si1(n19), .test_so3(n14), .test_so2(test_so3), .test_so1(
        test_so2), .test_se(n30) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_test_1 U0_ALU ( .A(REG0), .B(REG1), .EN(ALU_EN), 
        .ALU_FUN(ALU_FUN), .CLK(CLK_ALU_M), .RST(n8), .ALU_OUT(ALU_OUT), 
        .OUT_VALID(OUT_Valid), .test_si(sync_reset_uart), .test_se(n31) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(_3_net_), .CLK(CLK_REF_M), .GATED_CLK(ALU_CLK) );
  CLKBUFX8M U27 ( .A(n35), .Y(SO) );
endmodule

