/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Oct 21 04:01:44 2024
/////////////////////////////////////////////////////////////


module Reset_sync_0 ( RST, CLK, sync_reset );
  input RST, CLK;
  output sync_reset;
  wire   \flops[0] ;

  DFFRQX2M \flops_reg[1]  ( .D(\flops[0] ), .CK(CLK), .RN(RST), .Q(sync_reset)
         );
  DFFRQX2M \flops_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\flops[0] ) );
endmodule


module Reset_sync_1 ( RST, CLK, sync_reset );
  input RST, CLK;
  output sync_reset;
  wire   \flops[0] ;

  DFFRQX2M \flops_reg[1]  ( .D(\flops[0] ), .CK(CLK), .RN(RST), .Q(sync_reset)
         );
  DFFRQX2M \flops_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\flops[0] ) );
endmodule


module Data_Sync_BUS_WIDTH8 ( CLK, RST, unsync_bus, bus_enable, enable_pulse, 
        sync_bus );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [1:0] flops;

  DFFRQX2M enable_flop_reg ( .D(flops[1]), .CK(CLK), .RN(n11), .Q(enable_flop)
         );
  DFFRQX2M \flops_reg[1]  ( .D(flops[0]), .CK(CLK), .RN(n11), .Q(flops[1]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(n11), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(n11), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(n11), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(n11), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(n11), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(n11), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(n11), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(n11), .Q(sync_bus[1]) );
  DFFRQX2M \flops_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(n11), .Q(flops[0])
         );
  DFFRQX4M enable_pulse_reg ( .D(n13), .CK(CLK), .RN(n11), .Q(enable_pulse) );
  INVX4M U3 ( .A(n1), .Y(n13) );
  BUFX4M U4 ( .A(n1), .Y(n10) );
  INVX6M U5 ( .A(n12), .Y(n11) );
  INVX2M U6 ( .A(RST), .Y(n12) );
  NAND2BX2M U7 ( .AN(enable_flop), .B(flops[1]), .Y(n1) );
  AO22X1M U8 ( .A0(unsync_bus[1]), .A1(n13), .B0(sync_bus[1]), .B1(n10), .Y(n3) );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n13), .B0(sync_bus[4]), .B1(n10), .Y(n6) );
  AO22X1M U10 ( .A0(unsync_bus[0]), .A1(n13), .B0(sync_bus[0]), .B1(n10), .Y(
        n2) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n13), .B0(sync_bus[6]), .B1(n10), .Y(
        n8) );
  AO22X1M U12 ( .A0(unsync_bus[5]), .A1(n13), .B0(sync_bus[5]), .B1(n10), .Y(
        n7) );
  AO22X1M U13 ( .A0(unsync_bus[2]), .A1(n13), .B0(sync_bus[2]), .B1(n10), .Y(
        n4) );
  AO22X1M U14 ( .A0(unsync_bus[7]), .A1(n13), .B0(sync_bus[7]), .B1(n10), .Y(
        n9) );
  AO22X1M U15 ( .A0(unsync_bus[3]), .A1(n13), .B0(sync_bus[3]), .B1(n10), .Y(
        n5) );
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


  CLKXOR2X2M U3 ( .A(binary[2]), .B(binary[1]), .Y(gray[1]) );
  CLKXOR2X2M U4 ( .A(binary[3]), .B(binary[2]), .Y(gray[2]) );
  CLKXOR2X2M U5 ( .A(binary[1]), .B(binary[0]), .Y(gray[0]) );
  BUFX2M U6 ( .A(binary[3]), .Y(gray[3]) );
endmodule


module FIFO_RD ( rinc, rclk, rrst_n, rq2_wptr, rptr_gray, rempty, raddr, rptr
 );
  input [3:0] rq2_wptr;
  input [3:0] rptr_gray;
  output [2:0] raddr;
  output [3:0] rptr;
  input rinc, rclk, rrst_n;
  output rempty;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n17;

  DFFRQX4M \rptr_reg[1]  ( .D(n12), .CK(rclk), .RN(n17), .Q(rptr[1]) );
  DFFRQX4M \rptr_reg[2]  ( .D(n11), .CK(rclk), .RN(n17), .Q(rptr[2]) );
  DFFRQX2M \rptr_reg[3]  ( .D(n10), .CK(rclk), .RN(n17), .Q(rptr[3]) );
  DFFRQX2M \rptr_reg[0]  ( .D(n13), .CK(rclk), .RN(n17), .Q(rptr[0]) );
  BUFX2M U3 ( .A(rrst_n), .Y(n17) );
  INVX2M U4 ( .A(n1), .Y(rempty) );
  XNOR2X2M U5 ( .A(rq2_wptr[0]), .B(rptr_gray[0]), .Y(n7) );
  NAND4X2M U6 ( .A(n6), .B(n7), .C(n8), .D(n9), .Y(n1) );
  XNOR2X2M U7 ( .A(rq2_wptr[3]), .B(rptr_gray[3]), .Y(n8) );
  XNOR2X2M U8 ( .A(rq2_wptr[2]), .B(rptr_gray[2]), .Y(n9) );
  XNOR2X2M U9 ( .A(rq2_wptr[1]), .B(rptr_gray[1]), .Y(n6) );
  NOR2BX2M U10 ( .AN(rptr[0]), .B(n5), .Y(n4) );
  CLKXOR2X2M U11 ( .A(rptr[3]), .B(n2), .Y(n10) );
  NOR2BX2M U12 ( .AN(rptr[2]), .B(n3), .Y(n2) );
  NAND2X2M U13 ( .A(rptr[1]), .B(n4), .Y(n3) );
  NAND2X2M U14 ( .A(rinc), .B(n1), .Y(n5) );
  CLKXOR2X2M U15 ( .A(rptr[1]), .B(n4), .Y(n12) );
  XNOR2X2M U16 ( .A(rptr[2]), .B(n3), .Y(n11) );
  XNOR2X2M U17 ( .A(rptr[0]), .B(n5), .Y(n13) );
  BUFX4M U18 ( .A(rptr[2]), .Y(raddr[2]) );
  BUFX2M U19 ( .A(rptr[1]), .Y(raddr[1]) );
  BUFX2M U20 ( .A(rptr[0]), .Y(raddr[0]) );
endmodule


module FIFO_WR ( winc, wclk, wrst_n, wq2_rptr, wptr_gray, wfull, waddr, wptr, 
        wclken );
  input [3:0] wq2_rptr;
  input [3:0] wptr_gray;
  output [2:0] waddr;
  output [3:0] wptr;
  input winc, wclk, wrst_n;
  output wfull, wclken;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15;

  DFFRQX2M \wptr_reg[3]  ( .D(n8), .CK(wclk), .RN(n15), .Q(wptr[3]) );
  DFFRQX2M \wptr_reg[0]  ( .D(n11), .CK(wclk), .RN(n15), .Q(wptr[0]) );
  DFFRQX4M \wptr_reg[1]  ( .D(n10), .CK(wclk), .RN(n15), .Q(wptr[1]) );
  DFFRQX4M \wptr_reg[2]  ( .D(n9), .CK(wclk), .RN(n15), .Q(wptr[2]) );
  BUFX2M U3 ( .A(wrst_n), .Y(n15) );
  NOR2BX4M U4 ( .AN(winc), .B(wfull), .Y(wclken) );
  XNOR2X2M U5 ( .A(wq2_rptr[0]), .B(wptr_gray[0]), .Y(n4) );
  CLKXOR2X2M U6 ( .A(wptr[3]), .B(n1), .Y(n8) );
  NOR2BX2M U7 ( .AN(wptr[2]), .B(n2), .Y(n1) );
  AND4X2M U8 ( .A(n4), .B(n5), .C(n6), .D(n7), .Y(wfull) );
  CLKXOR2X2M U9 ( .A(wq2_rptr[3]), .B(wptr_gray[3]), .Y(n7) );
  CLKXOR2X2M U10 ( .A(wq2_rptr[2]), .B(wptr_gray[2]), .Y(n6) );
  XNOR2X2M U11 ( .A(wq2_rptr[1]), .B(wptr_gray[1]), .Y(n5) );
  NAND2X2M U12 ( .A(wptr[1]), .B(n3), .Y(n2) );
  CLKXOR2X2M U13 ( .A(wptr[1]), .B(n3), .Y(n10) );
  XNOR2X2M U14 ( .A(wptr[2]), .B(n2), .Y(n9) );
  AND2X2M U15 ( .A(wptr[0]), .B(wclken), .Y(n3) );
  CLKXOR2X2M U16 ( .A(wptr[0]), .B(wclken), .Y(n11) );
  BUFX2M U17 ( .A(wptr[2]), .Y(waddr[2]) );
  BUFX4M U18 ( .A(wptr[1]), .Y(waddr[1]) );
  BUFX4M U19 ( .A(wptr[0]), .Y(waddr[0]) );
endmodule


module FIFO_MEM_CTRL ( wdata, wclken, waddr, wclk, raddr, rdata, wfull, RST );
  input [7:0] wdata;
  input [2:0] waddr;
  input [2:0] raddr;
  output [7:0] rdata;
  input wclken, wclk, wfull, RST;
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
         n128, n129, n130;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];

  DFFRQX2M \write_reg_reg[5][7]  ( .D(n68), .CK(wclk), .RN(n114), .Q(
        \write_reg[5][7] ) );
  DFFRQX2M \write_reg_reg[5][6]  ( .D(n67), .CK(wclk), .RN(n114), .Q(
        \write_reg[5][6] ) );
  DFFRQX2M \write_reg_reg[5][5]  ( .D(n66), .CK(wclk), .RN(n114), .Q(
        \write_reg[5][5] ) );
  DFFRQX2M \write_reg_reg[5][4]  ( .D(n65), .CK(wclk), .RN(n114), .Q(
        \write_reg[5][4] ) );
  DFFRQX2M \write_reg_reg[5][3]  ( .D(n64), .CK(wclk), .RN(n114), .Q(
        \write_reg[5][3] ) );
  DFFRQX2M \write_reg_reg[5][2]  ( .D(n63), .CK(wclk), .RN(n114), .Q(
        \write_reg[5][2] ) );
  DFFRQX2M \write_reg_reg[5][1]  ( .D(n62), .CK(wclk), .RN(n114), .Q(
        \write_reg[5][1] ) );
  DFFRQX2M \write_reg_reg[5][0]  ( .D(n61), .CK(wclk), .RN(n114), .Q(
        \write_reg[5][0] ) );
  DFFRQX2M \write_reg_reg[1][7]  ( .D(n36), .CK(wclk), .RN(n117), .Q(
        \write_reg[1][7] ) );
  DFFRQX2M \write_reg_reg[1][6]  ( .D(n35), .CK(wclk), .RN(n117), .Q(
        \write_reg[1][6] ) );
  DFFRQX2M \write_reg_reg[1][5]  ( .D(n34), .CK(wclk), .RN(n117), .Q(
        \write_reg[1][5] ) );
  DFFRQX2M \write_reg_reg[1][4]  ( .D(n33), .CK(wclk), .RN(n117), .Q(
        \write_reg[1][4] ) );
  DFFRQX2M \write_reg_reg[1][3]  ( .D(n32), .CK(wclk), .RN(n117), .Q(
        \write_reg[1][3] ) );
  DFFRQX2M \write_reg_reg[1][2]  ( .D(n31), .CK(wclk), .RN(n117), .Q(
        \write_reg[1][2] ) );
  DFFRQX2M \write_reg_reg[1][1]  ( .D(n30), .CK(wclk), .RN(n117), .Q(
        \write_reg[1][1] ) );
  DFFRQX2M \write_reg_reg[1][0]  ( .D(n29), .CK(wclk), .RN(n117), .Q(
        \write_reg[1][0] ) );
  DFFRQX2M \write_reg_reg[7][7]  ( .D(n84), .CK(wclk), .RN(n113), .Q(
        \write_reg[7][7] ) );
  DFFRQX2M \write_reg_reg[7][6]  ( .D(n83), .CK(wclk), .RN(n113), .Q(
        \write_reg[7][6] ) );
  DFFRQX2M \write_reg_reg[7][5]  ( .D(n82), .CK(wclk), .RN(n113), .Q(
        \write_reg[7][5] ) );
  DFFRQX2M \write_reg_reg[7][4]  ( .D(n81), .CK(wclk), .RN(n113), .Q(
        \write_reg[7][4] ) );
  DFFRQX2M \write_reg_reg[7][3]  ( .D(n80), .CK(wclk), .RN(n113), .Q(
        \write_reg[7][3] ) );
  DFFRQX2M \write_reg_reg[7][2]  ( .D(n79), .CK(wclk), .RN(n113), .Q(
        \write_reg[7][2] ) );
  DFFRQX2M \write_reg_reg[7][1]  ( .D(n78), .CK(wclk), .RN(n113), .Q(
        \write_reg[7][1] ) );
  DFFRQX2M \write_reg_reg[7][0]  ( .D(n77), .CK(wclk), .RN(n113), .Q(
        \write_reg[7][0] ) );
  DFFRQX2M \write_reg_reg[3][7]  ( .D(n52), .CK(wclk), .RN(n115), .Q(
        \write_reg[3][7] ) );
  DFFRQX2M \write_reg_reg[3][6]  ( .D(n51), .CK(wclk), .RN(n115), .Q(
        \write_reg[3][6] ) );
  DFFRQX2M \write_reg_reg[3][5]  ( .D(n50), .CK(wclk), .RN(n115), .Q(
        \write_reg[3][5] ) );
  DFFRQX2M \write_reg_reg[3][4]  ( .D(n49), .CK(wclk), .RN(n115), .Q(
        \write_reg[3][4] ) );
  DFFRQX2M \write_reg_reg[3][3]  ( .D(n48), .CK(wclk), .RN(n116), .Q(
        \write_reg[3][3] ) );
  DFFRQX2M \write_reg_reg[3][2]  ( .D(n47), .CK(wclk), .RN(n116), .Q(
        \write_reg[3][2] ) );
  DFFRQX2M \write_reg_reg[3][1]  ( .D(n46), .CK(wclk), .RN(n116), .Q(
        \write_reg[3][1] ) );
  DFFRQX2M \write_reg_reg[3][0]  ( .D(n45), .CK(wclk), .RN(n116), .Q(
        \write_reg[3][0] ) );
  DFFRQX2M \write_reg_reg[6][7]  ( .D(n76), .CK(wclk), .RN(n113), .Q(
        \write_reg[6][7] ) );
  DFFRQX2M \write_reg_reg[6][6]  ( .D(n75), .CK(wclk), .RN(n113), .Q(
        \write_reg[6][6] ) );
  DFFRQX2M \write_reg_reg[6][5]  ( .D(n74), .CK(wclk), .RN(n113), .Q(
        \write_reg[6][5] ) );
  DFFRQX2M \write_reg_reg[6][4]  ( .D(n73), .CK(wclk), .RN(n113), .Q(
        \write_reg[6][4] ) );
  DFFRQX2M \write_reg_reg[6][3]  ( .D(n72), .CK(wclk), .RN(n114), .Q(
        \write_reg[6][3] ) );
  DFFRQX2M \write_reg_reg[6][2]  ( .D(n71), .CK(wclk), .RN(n114), .Q(
        \write_reg[6][2] ) );
  DFFRQX2M \write_reg_reg[6][1]  ( .D(n70), .CK(wclk), .RN(n114), .Q(
        \write_reg[6][1] ) );
  DFFRQX2M \write_reg_reg[6][0]  ( .D(n69), .CK(wclk), .RN(n114), .Q(
        \write_reg[6][0] ) );
  DFFRQX2M \write_reg_reg[2][7]  ( .D(n44), .CK(wclk), .RN(n116), .Q(
        \write_reg[2][7] ) );
  DFFRQX2M \write_reg_reg[2][6]  ( .D(n43), .CK(wclk), .RN(n116), .Q(
        \write_reg[2][6] ) );
  DFFRQX2M \write_reg_reg[2][5]  ( .D(n42), .CK(wclk), .RN(n116), .Q(
        \write_reg[2][5] ) );
  DFFRQX2M \write_reg_reg[2][4]  ( .D(n41), .CK(wclk), .RN(n116), .Q(
        \write_reg[2][4] ) );
  DFFRQX2M \write_reg_reg[2][3]  ( .D(n40), .CK(wclk), .RN(n116), .Q(
        \write_reg[2][3] ) );
  DFFRQX2M \write_reg_reg[2][2]  ( .D(n39), .CK(wclk), .RN(n116), .Q(
        \write_reg[2][2] ) );
  DFFRQX2M \write_reg_reg[2][1]  ( .D(n38), .CK(wclk), .RN(n116), .Q(
        \write_reg[2][1] ) );
  DFFRQX2M \write_reg_reg[2][0]  ( .D(n37), .CK(wclk), .RN(n116), .Q(
        \write_reg[2][0] ) );
  DFFRQX2M \write_reg_reg[4][7]  ( .D(n60), .CK(wclk), .RN(n115), .Q(
        \write_reg[4][7] ) );
  DFFRQX2M \write_reg_reg[4][6]  ( .D(n59), .CK(wclk), .RN(n115), .Q(
        \write_reg[4][6] ) );
  DFFRQX2M \write_reg_reg[4][5]  ( .D(n58), .CK(wclk), .RN(n115), .Q(
        \write_reg[4][5] ) );
  DFFRQX2M \write_reg_reg[4][4]  ( .D(n57), .CK(wclk), .RN(n115), .Q(
        \write_reg[4][4] ) );
  DFFRQX2M \write_reg_reg[4][3]  ( .D(n56), .CK(wclk), .RN(n115), .Q(
        \write_reg[4][3] ) );
  DFFRQX2M \write_reg_reg[4][2]  ( .D(n55), .CK(wclk), .RN(n115), .Q(
        \write_reg[4][2] ) );
  DFFRQX2M \write_reg_reg[4][1]  ( .D(n54), .CK(wclk), .RN(n115), .Q(
        \write_reg[4][1] ) );
  DFFRQX2M \write_reg_reg[4][0]  ( .D(n53), .CK(wclk), .RN(n115), .Q(
        \write_reg[4][0] ) );
  DFFRQX2M \write_reg_reg[0][7]  ( .D(n28), .CK(wclk), .RN(n117), .Q(
        \write_reg[0][7] ) );
  DFFRQX2M \write_reg_reg[0][6]  ( .D(n27), .CK(wclk), .RN(n117), .Q(
        \write_reg[0][6] ) );
  DFFRQX2M \write_reg_reg[0][5]  ( .D(n26), .CK(wclk), .RN(n117), .Q(
        \write_reg[0][5] ) );
  DFFRQX2M \write_reg_reg[0][4]  ( .D(n25), .CK(wclk), .RN(n117), .Q(
        \write_reg[0][4] ) );
  DFFRQX2M \write_reg_reg[0][3]  ( .D(n24), .CK(wclk), .RN(n118), .Q(
        \write_reg[0][3] ) );
  DFFRQX2M \write_reg_reg[0][2]  ( .D(n23), .CK(wclk), .RN(n118), .Q(
        \write_reg[0][2] ) );
  DFFRQX2M \write_reg_reg[0][1]  ( .D(n22), .CK(wclk), .RN(n118), .Q(
        \write_reg[0][1] ) );
  DFFRQX2M \write_reg_reg[0][0]  ( .D(n21), .CK(wclk), .RN(n118), .Q(
        \write_reg[0][0] ) );
  NOR2BX4M U2 ( .AN(wclken), .B(waddr[2]), .Y(n12) );
  AND2X2M U3 ( .A(waddr[2]), .B(wclken), .Y(n17) );
  INVX2M U4 ( .A(waddr[1]), .Y(n130) );
  INVX2M U5 ( .A(waddr[0]), .Y(n129) );
  BUFX6M U6 ( .A(n120), .Y(n117) );
  BUFX6M U7 ( .A(n119), .Y(n116) );
  BUFX6M U8 ( .A(n119), .Y(n115) );
  BUFX6M U9 ( .A(n120), .Y(n114) );
  BUFX6M U10 ( .A(RST), .Y(n113) );
  BUFX2M U11 ( .A(n119), .Y(n118) );
  INVX4M U12 ( .A(n2), .Y(n104) );
  INVX4M U13 ( .A(n2), .Y(n103) );
  INVX4M U14 ( .A(n1), .Y(n112) );
  INVX4M U15 ( .A(n1), .Y(n111) );
  BUFX2M U16 ( .A(n120), .Y(n119) );
  AND3X2M U17 ( .A(n129), .B(n130), .C(n12), .Y(n1) );
  INVX4M U18 ( .A(n6), .Y(n110) );
  INVX4M U19 ( .A(n6), .Y(n109) );
  INVX4M U20 ( .A(n5), .Y(n108) );
  INVX4M U21 ( .A(n5), .Y(n107) );
  INVX4M U22 ( .A(n7), .Y(n106) );
  INVX4M U23 ( .A(n7), .Y(n105) );
  INVX4M U24 ( .A(n4), .Y(n98) );
  INVX4M U25 ( .A(n4), .Y(n97) );
  INVX4M U26 ( .A(n8), .Y(n102) );
  INVX4M U27 ( .A(n8), .Y(n101) );
  INVX4M U28 ( .A(n3), .Y(n100) );
  INVX4M U29 ( .A(n3), .Y(n99) );
  AND3X2M U30 ( .A(n129), .B(n130), .C(n17), .Y(n2) );
  BUFX2M U31 ( .A(RST), .Y(n120) );
  AND3X2M U32 ( .A(waddr[1]), .B(n129), .C(n17), .Y(n3) );
  AND3X2M U33 ( .A(waddr[1]), .B(waddr[0]), .C(n17), .Y(n4) );
  AND3X2M U34 ( .A(n12), .B(n129), .C(waddr[1]), .Y(n5) );
  AND3X2M U35 ( .A(n12), .B(n130), .C(waddr[0]), .Y(n6) );
  AND3X2M U36 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n7) );
  AND3X2M U37 ( .A(waddr[0]), .B(n130), .C(n17), .Y(n8) );
  INVX6M U38 ( .A(n93), .Y(n91) );
  INVX6M U39 ( .A(n93), .Y(n92) );
  INVX4M U40 ( .A(n96), .Y(n94) );
  INVX4M U41 ( .A(n96), .Y(n95) );
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
  MX4X1M U115 ( .A(\write_reg[0][0] ), .B(\write_reg[1][0] ), .C(
        \write_reg[2][0] ), .D(\write_reg[3][0] ), .S0(n92), .S1(n95), .Y(n10)
         );
  MX4X1M U116 ( .A(\write_reg[4][0] ), .B(\write_reg[5][0] ), .C(
        \write_reg[6][0] ), .D(\write_reg[7][0] ), .S0(n91), .S1(n94), .Y(n9)
         );
  MX2X2M U117 ( .A(n13), .B(n11), .S0(N12), .Y(rdata[1]) );
  MX4X1M U118 ( .A(\write_reg[0][1] ), .B(\write_reg[1][1] ), .C(
        \write_reg[2][1] ), .D(\write_reg[3][1] ), .S0(n92), .S1(n95), .Y(n13)
         );
  MX4X1M U119 ( .A(\write_reg[4][1] ), .B(\write_reg[5][1] ), .C(
        \write_reg[6][1] ), .D(\write_reg[7][1] ), .S0(n91), .S1(n94), .Y(n11)
         );
  MX2X2M U120 ( .A(n15), .B(n14), .S0(N12), .Y(rdata[2]) );
  MX4X1M U121 ( .A(\write_reg[0][2] ), .B(\write_reg[1][2] ), .C(
        \write_reg[2][2] ), .D(\write_reg[3][2] ), .S0(n92), .S1(n95), .Y(n15)
         );
  MX4X1M U122 ( .A(\write_reg[4][2] ), .B(\write_reg[5][2] ), .C(
        \write_reg[6][2] ), .D(\write_reg[7][2] ), .S0(n91), .S1(n94), .Y(n14)
         );
  MX2X2M U123 ( .A(n18), .B(n16), .S0(N12), .Y(rdata[3]) );
  MX4X1M U124 ( .A(\write_reg[0][3] ), .B(\write_reg[1][3] ), .C(
        \write_reg[2][3] ), .D(\write_reg[3][3] ), .S0(n92), .S1(n95), .Y(n18)
         );
  MX4X1M U125 ( .A(\write_reg[4][3] ), .B(\write_reg[5][3] ), .C(
        \write_reg[6][3] ), .D(\write_reg[7][3] ), .S0(n91), .S1(n94), .Y(n16)
         );
  MX2X2M U126 ( .A(n20), .B(n19), .S0(N12), .Y(rdata[4]) );
  MX4X1M U127 ( .A(\write_reg[0][4] ), .B(\write_reg[1][4] ), .C(
        \write_reg[2][4] ), .D(\write_reg[3][4] ), .S0(n92), .S1(n95), .Y(n20)
         );
  MX4X1M U128 ( .A(\write_reg[4][4] ), .B(\write_reg[5][4] ), .C(
        \write_reg[6][4] ), .D(\write_reg[7][4] ), .S0(n91), .S1(n94), .Y(n19)
         );
  MX2X2M U129 ( .A(n86), .B(n85), .S0(N12), .Y(rdata[5]) );
  MX4X1M U130 ( .A(\write_reg[0][5] ), .B(\write_reg[1][5] ), .C(
        \write_reg[2][5] ), .D(\write_reg[3][5] ), .S0(n92), .S1(n95), .Y(n86)
         );
  MX4X1M U131 ( .A(\write_reg[4][5] ), .B(\write_reg[5][5] ), .C(
        \write_reg[6][5] ), .D(\write_reg[7][5] ), .S0(n91), .S1(n94), .Y(n85)
         );
  MX2X2M U132 ( .A(n88), .B(n87), .S0(N12), .Y(rdata[6]) );
  MX4X1M U133 ( .A(\write_reg[0][6] ), .B(\write_reg[1][6] ), .C(
        \write_reg[2][6] ), .D(\write_reg[3][6] ), .S0(n92), .S1(n95), .Y(n88)
         );
  MX4X1M U134 ( .A(\write_reg[4][6] ), .B(\write_reg[5][6] ), .C(
        \write_reg[6][6] ), .D(\write_reg[7][6] ), .S0(n91), .S1(n94), .Y(n87)
         );
  INVX2M U135 ( .A(N11), .Y(n96) );
  INVX2M U136 ( .A(N10), .Y(n93) );
  MX2X2M U137 ( .A(n90), .B(n89), .S0(N12), .Y(rdata[7]) );
  MX4X1M U138 ( .A(\write_reg[0][7] ), .B(\write_reg[1][7] ), .C(
        \write_reg[2][7] ), .D(\write_reg[3][7] ), .S0(n92), .S1(n95), .Y(n90)
         );
  MX4X1M U139 ( .A(\write_reg[4][7] ), .B(\write_reg[5][7] ), .C(
        \write_reg[6][7] ), .D(\write_reg[7][7] ), .S0(n91), .S1(n94), .Y(n89)
         );
endmodule


module DF_SYNC_0 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] , n1, n2;

  DFFRQX1M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[3]) );
  DFFRQX1M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[2]) );
  DFFRQX1M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[1]) );
  DFFRQX1M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[0]) );
  DFFRQX1M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[3][0] ) );
  DFFRQX1M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[2][0] ) );
  DFFRQX1M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[1][0] ) );
  DFFRQX1M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[0][0] ) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
endmodule


module DF_SYNC_1 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] , n1, n2;

  DFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[1]) );
  DFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[0]) );
  DFFRQX2M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[3]) );
  DFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[2]) );
  DFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[3][0] ) );
  DFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[2][0] ) );
  DFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[1][0] ) );
  DFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[0][0] ) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
endmodule


module FIFO_top ( wdata, winc, wclk, wrst_n, rclk, rrst_n, rinc, rdata, rempty, 
        wfull );
  input [7:0] wdata;
  output [7:0] rdata;
  input winc, wclk, wrst_n, rclk, rrst_n, rinc;
  output rempty, wfull;
  wire   wclken, n1, n2, n3, n4;
  wire   [3:0] wptr;
  wire   [3:0] wptr_gray;
  wire   [3:0] rptr;
  wire   [3:0] rptr_gray;
  wire   [2:0] raddr;
  wire   [3:0] rq2_wptr;
  wire   [2:0] waddr;
  wire   [3:0] wq2_rptr;

  B2G_encoder_0 encoder1 ( .binary(wptr), .gray(wptr_gray) );
  B2G_encoder_1 encoder2 ( .binary(rptr), .gray(rptr_gray) );
  FIFO_RD U_FIFO_RD ( .rinc(rinc), .rclk(rclk), .rrst_n(n1), .rq2_wptr(
        rq2_wptr), .rptr_gray(rptr_gray), .rempty(rempty), .raddr(raddr), 
        .rptr(rptr) );
  FIFO_WR U_FIFO_WR ( .winc(winc), .wclk(wclk), .wrst_n(n3), .wq2_rptr(
        wq2_rptr), .wptr_gray(wptr_gray), .wfull(wfull), .waddr(waddr), .wptr(
        wptr), .wclken(wclken) );
  FIFO_MEM_CTRL U_FIFO_MEM_CTRL ( .wdata(wdata), .wclken(wclken), .waddr(waddr), .wclk(wclk), .raddr(raddr), .rdata(rdata), .wfull(wfull), .RST(n3) );
  DF_SYNC_0 U_DF_SYNC_RD ( .CLK(rclk), .RST(n1), .ASYNC(wptr_gray), .SYNC(
        rq2_wptr) );
  DF_SYNC_1 U_DF_SYNC_WR ( .CLK(wclk), .RST(n3), .ASYNC(rptr_gray), .SYNC(
        wq2_rptr) );
  INVX2M U1 ( .A(n4), .Y(n3) );
  INVX2M U2 ( .A(wrst_n), .Y(n4) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rrst_n), .Y(n2) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX1M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  DFFRQX1M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
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


module ClkDiv_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_0_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n18), .CK(i_ref_clk), .RN(n2), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n17), .CK(i_ref_clk), .SN(n2), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[6]  ( .D(n19), .CK(i_ref_clk), .RN(n2), .Q(count[6]) );
  DFFRQX4M \count_reg[0]  ( .D(n25), .CK(i_ref_clk), .RN(n2), .Q(count[0]) );
  DFFRQX2M \count_reg[5]  ( .D(n20), .CK(i_ref_clk), .RN(n2), .Q(count[5]) );
  DFFRQX2M \count_reg[4]  ( .D(n21), .CK(i_ref_clk), .RN(n2), .Q(count[4]) );
  DFFRQX2M \count_reg[3]  ( .D(n22), .CK(i_ref_clk), .RN(n2), .Q(count[3]) );
  DFFRQX2M \count_reg[2]  ( .D(n23), .CK(i_ref_clk), .RN(n2), .Q(count[2]) );
  DFFRQX2M \count_reg[1]  ( .D(n24), .CK(i_ref_clk), .RN(n2), .Q(count[1]) );
  NOR4X2M U3 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n31) );
  NOR2X4M U4 ( .A(n5), .B(i_div_ratio[4]), .Y(n6) );
  AND3X4M U5 ( .A(n12), .B(n13), .C(N2), .Y(n11) );
  NAND4X2M U6 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n15) );
  AO22XLM U7 ( .A0(n1), .A1(count[6]), .B0(N22), .B1(n11), .Y(n19) );
  AO22XLM U8 ( .A0(n1), .A1(count[0]), .B0(N16), .B1(n11), .Y(n25) );
  AO22XLM U9 ( .A0(n1), .A1(count[1]), .B0(N17), .B1(n11), .Y(n24) );
  AO22XLM U10 ( .A0(n1), .A1(count[2]), .B0(N18), .B1(n11), .Y(n23) );
  AO22XLM U11 ( .A0(n1), .A1(count[3]), .B0(N19), .B1(n11), .Y(n22) );
  AO22XLM U12 ( .A0(n1), .A1(count[4]), .B0(N20), .B1(n11), .Y(n21) );
  AO22XLM U13 ( .A0(n1), .A1(count[5]), .B0(N21), .B1(n11), .Y(n20) );
  OR2X2M U14 ( .A(n4), .B(i_div_ratio[3]), .Y(n5) );
  INVX4M U15 ( .A(n3), .Y(n2) );
  INVX2M U16 ( .A(i_rst), .Y(n3) );
  OR2X2M U17 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n4) );
  CLKBUFX6M U18 ( .A(n10), .Y(n1) );
  OAI21X2M U19 ( .A0(n44), .A1(n45), .B0(i_clk_en), .Y(n10) );
  INVX2M U20 ( .A(i_div_ratio[5]), .Y(n9) );
  CLKINVX1M U21 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U22 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n4), .Y(
        edge_flip_half[1]) );
  OAI2BB1X1M U23 ( .A0N(n4), .A1N(i_div_ratio[3]), .B0(n5), .Y(
        edge_flip_half[2]) );
  AO21XLM U24 ( .A0(n5), .A1(i_div_ratio[4]), .B0(n6), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U25 ( .A(n6), .B(n9), .Y(n7) );
  OAI21X1M U26 ( .A0(n6), .A1(n9), .B0(n7), .Y(edge_flip_half[4]) );
  XNOR2X1M U27 ( .A(i_div_ratio[6]), .B(n7), .Y(edge_flip_half[5]) );
  NOR2X1M U28 ( .A(i_div_ratio[6]), .B(n7), .Y(n8) );
  CLKXOR2X2M U29 ( .A(i_div_ratio[7]), .B(n8), .Y(edge_flip_half[6]) );
  MX2X6M U30 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  CLKXOR2X2M U31 ( .A(div_clk), .B(n14), .Y(n18) );
  AOI21X1M U32 ( .A0(n13), .A1(n12), .B0(n1), .Y(n14) );
  OR2X1M U33 ( .A(n15), .B(i_div_ratio[0]), .Y(n12) );
  XNOR2X1M U34 ( .A(odd_edge_tog), .B(n16), .Y(n17) );
  OR2X1M U35 ( .A(n13), .B(n1), .Y(n16) );
  CLKNAND2X2M U36 ( .A(n26), .B(i_div_ratio[0]), .Y(n13) );
  MXI2X1M U37 ( .A(n27), .B(n15), .S0(odd_edge_tog), .Y(n26) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n35) );
  CLKXOR2X2M U39 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n34) );
  CLKXOR2X2M U40 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n33) );
  CLKXOR2X2M U41 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n32) );
  XNOR2X1M U42 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n30) );
  XNOR2X1M U43 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n29) );
  XNOR2X1M U44 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n28) );
  NAND4X1M U45 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n27) );
  NOR4X1M U46 ( .A(n40), .B(n41), .C(n42), .D(n43), .Y(n39) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n43) );
  CLKXOR2X2M U48 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n42) );
  CLKXOR2X2M U49 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n41) );
  CLKXOR2X2M U50 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n40) );
  XNOR2X1M U51 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n38) );
  XNOR2X1M U52 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n37) );
  XNOR2X1M U53 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n36) );
  CLKINVX1M U54 ( .A(n1), .Y(N2) );
  OR3X1M U55 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), .Y(
        n45) );
  OR4X1M U56 ( .A(i_div_ratio[4]), .B(i_div_ratio[5]), .C(i_div_ratio[6]), .D(
        i_div_ratio[7]), .Y(n44) );
endmodule


module CLKDIV_MUX_WIDTH8 ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  NOR3X12M U6 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U8 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U10 ( .A(1'b1), .Y(OUT[7]) );
  NOR3X8M U12 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NAND4BX2M U13 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX2M U14 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR4X6M U15 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U16 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  OAI211X4M U17 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U18 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X2M U19 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  INVX2M U20 ( .A(IN[0]), .Y(n17) );
  INVX2M U21 ( .A(IN[2]), .Y(n15) );
  INVX2M U22 ( .A(IN[1]), .Y(n16) );
  INVX2M U23 ( .A(IN[5]), .Y(n14) );
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


module ClkDiv_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_1_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n53), .CK(i_ref_clk), .RN(n2), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n54), .CK(i_ref_clk), .SN(n2), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[6]  ( .D(n52), .CK(i_ref_clk), .RN(n2), .Q(count[6]) );
  DFFRQX4M \count_reg[0]  ( .D(n46), .CK(i_ref_clk), .RN(n2), .Q(count[0]) );
  DFFRQX2M \count_reg[5]  ( .D(n51), .CK(i_ref_clk), .RN(n2), .Q(count[5]) );
  DFFRQX2M \count_reg[4]  ( .D(n50), .CK(i_ref_clk), .RN(n2), .Q(count[4]) );
  DFFRQX2M \count_reg[3]  ( .D(n49), .CK(i_ref_clk), .RN(n2), .Q(count[3]) );
  DFFRQX2M \count_reg[2]  ( .D(n48), .CK(i_ref_clk), .RN(n2), .Q(count[2]) );
  DFFRQX2M \count_reg[1]  ( .D(n47), .CK(i_ref_clk), .RN(n2), .Q(count[1]) );
  NOR4X2M U3 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n31) );
  NOR2X4M U4 ( .A(n5), .B(i_div_ratio[4]), .Y(n6) );
  AND3X4M U5 ( .A(n12), .B(n13), .C(N2), .Y(n11) );
  OR2X2M U6 ( .A(n4), .B(i_div_ratio[3]), .Y(n5) );
  NAND4X2M U7 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n15) );
  AO22XLM U8 ( .A0(n1), .A1(count[6]), .B0(N22), .B1(n11), .Y(n52) );
  AO22XLM U9 ( .A0(n1), .A1(count[0]), .B0(N16), .B1(n11), .Y(n46) );
  AO22XLM U10 ( .A0(n1), .A1(count[1]), .B0(N17), .B1(n11), .Y(n47) );
  AO22XLM U11 ( .A0(n1), .A1(count[2]), .B0(N18), .B1(n11), .Y(n48) );
  AO22XLM U12 ( .A0(n1), .A1(count[3]), .B0(N19), .B1(n11), .Y(n49) );
  AO22XLM U13 ( .A0(n1), .A1(count[4]), .B0(N20), .B1(n11), .Y(n50) );
  AO22XLM U14 ( .A0(n1), .A1(count[5]), .B0(N21), .B1(n11), .Y(n51) );
  OAI2BB1XLM U15 ( .A0N(n4), .A1N(i_div_ratio[3]), .B0(n5), .Y(
        edge_flip_half[2]) );
  INVX4M U16 ( .A(n3), .Y(n2) );
  OR2X2M U17 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n4) );
  INVX2M U18 ( .A(i_rst), .Y(n3) );
  CLKBUFX6M U19 ( .A(n10), .Y(n1) );
  OAI21X2M U20 ( .A0(n44), .A1(n45), .B0(i_clk_en), .Y(n10) );
  MX2X2M U21 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  INVX2M U22 ( .A(i_div_ratio[5]), .Y(n9) );
  CLKINVX1M U23 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U24 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n4), .Y(
        edge_flip_half[1]) );
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
  CLKXOR2X2M U40 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n33) );
  CLKXOR2X2M U41 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n32) );
  XNOR2X1M U42 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n30) );
  XNOR2X1M U43 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n29) );
  XNOR2X1M U44 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n28) );
  NAND4X1M U45 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n27) );
  NOR4X1M U46 ( .A(n40), .B(n41), .C(n42), .D(n43), .Y(n39) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n43) );
  CLKXOR2X2M U48 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n42) );
  CLKXOR2X2M U49 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n41) );
  CLKXOR2X2M U50 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n40) );
  XNOR2X1M U51 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n38) );
  XNOR2X1M U52 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n37) );
  XNOR2X1M U53 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n36) );
  CLKINVX1M U54 ( .A(n1), .Y(N2) );
  OR3X1M U55 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), .Y(
        n45) );
  OR4X1M U56 ( .A(i_div_ratio[4]), .B(i_div_ratio[5]), .C(i_div_ratio[6]), .D(
        i_div_ratio[7]), .Y(n44) );
endmodule


module TX_FSM ( ser_done, PAR_EN, Data_Valid, CLK, RST, ser_en, busy, mux_sel
 );
  output [1:0] mux_sel;
  input ser_done, PAR_EN, Data_Valid, CLK, RST;
  output ser_en, busy;
  wire   \next_state[2] , busy_c, n6, n7, n8, n9, n10, n11, n1, n2, n3, n4;
  wire   [2:0] current_state;

  DFFRX1M \current_state_reg[2]  ( .D(\next_state[2] ), .CK(CLK), .RN(RST), 
        .Q(current_state[2]), .QN(n4) );
  DFFRX1M \current_state_reg[1]  ( .D(n2), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRX1M busy_reg ( .D(busy_c), .CK(CLK), .RN(RST), .Q(busy) );
  DFFRX4M \current_state_reg[0]  ( .D(n1), .CK(CLK), .RN(RST), .Q(
        current_state[0]), .QN(n3) );
  AOI31X2M U3 ( .A0(Data_Valid), .A1(n4), .A2(n3), .B0(ser_en), .Y(n10) );
  NAND2X2M U4 ( .A(PAR_EN), .B(n9), .Y(n6) );
  INVX2M U5 ( .A(n10), .Y(n1) );
  INVX2M U6 ( .A(n11), .Y(ser_en) );
  NAND2X2M U7 ( .A(n6), .B(n10), .Y(busy_c) );
  NAND2X2M U8 ( .A(n9), .B(n7), .Y(n11) );
  NAND2X2M U9 ( .A(n11), .B(n6), .Y(mux_sel[1]) );
  NOR2X2M U10 ( .A(n6), .B(n7), .Y(\next_state[2] ) );
  OAI221X1M U11 ( .A0(n3), .A1(n7), .B0(current_state[0]), .B1(Data_Valid), 
        .C0(n4), .Y(mux_sel[0]) );
  NAND2X2M U12 ( .A(ser_done), .B(current_state[1]), .Y(n7) );
  NOR2X4M U13 ( .A(n3), .B(current_state[2]), .Y(n9) );
  INVX2M U14 ( .A(n8), .Y(n2) );
  AOI31X2M U15 ( .A0(current_state[2]), .A1(n3), .A2(current_state[1]), .B0(n9), .Y(n8) );
endmodule


module MUX ( mux_sel, ser_data, par_bit, CLK, RST, TX_OUT );
  input [1:0] mux_sel;
  input ser_data, par_bit, CLK, RST;
  output TX_OUT;
  wire   mux_out, n2, n3, n1;

  DFFRHQX8M TX_OUT_reg ( .D(mux_out), .CK(CLK), .RN(RST), .Q(TX_OUT) );
  OAI21X2M U3 ( .A0(n2), .A1(n1), .B0(n3), .Y(mux_out) );
  NOR2BX2M U4 ( .AN(mux_sel[1]), .B(par_bit), .Y(n2) );
  NAND3X2M U5 ( .A(mux_sel[1]), .B(n1), .C(ser_data), .Y(n3) );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n1) );
endmodule


module Parity_calc ( P_DATA, Data_Valid, PAR_TYP, PAR_EN, CLK, RST, par_bit, 
        busy );
  input [7:0] P_DATA;
  input Data_Valid, PAR_TYP, PAR_EN, CLK, RST, busy;
  output par_bit;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n2, n16,
         n17, n18;
  wire   [7:0] par_data;

  DFFRX1M par_bit_reg ( .D(n7), .CK(CLK), .RN(RST), .Q(par_bit) );
  DFFRX1M \par_data_reg[7]  ( .D(n15), .CK(CLK), .RN(RST), .Q(par_data[7]) );
  DFFRX1M \par_data_reg[6]  ( .D(n14), .CK(CLK), .RN(RST), .Q(par_data[6]) );
  DFFRX1M \par_data_reg[5]  ( .D(n13), .CK(CLK), .RN(RST), .Q(par_data[5]) );
  DFFRX1M \par_data_reg[4]  ( .D(n12), .CK(CLK), .RN(RST), .Q(par_data[4]) );
  DFFRX1M \par_data_reg[3]  ( .D(n11), .CK(CLK), .RN(RST), .Q(par_data[3]) );
  DFFRX1M \par_data_reg[2]  ( .D(n10), .CK(CLK), .RN(RST), .Q(par_data[2]) );
  DFFRX1M \par_data_reg[1]  ( .D(n9), .CK(CLK), .RN(RST), .Q(par_data[1]) );
  DFFRX1M \par_data_reg[0]  ( .D(n8), .CK(CLK), .RN(RST), .Q(par_data[0]) );
  INVX4M U2 ( .A(n2), .Y(n16) );
  INVX4M U3 ( .A(n2), .Y(n17) );
  INVX2M U4 ( .A(Data_Valid), .Y(n2) );
  AO2B2X2M U5 ( .B0(P_DATA[0]), .B1(n16), .A0(par_data[0]), .A1N(n16), .Y(n8)
         );
  AO2B2X2M U6 ( .B0(P_DATA[1]), .B1(n17), .A0(par_data[1]), .A1N(n17), .Y(n9)
         );
  AO2B2X2M U7 ( .B0(P_DATA[2]), .B1(n16), .A0(par_data[2]), .A1N(n16), .Y(n10)
         );
  AO2B2X2M U8 ( .B0(P_DATA[3]), .B1(n17), .A0(par_data[3]), .A1N(n17), .Y(n11)
         );
  AO2B2X2M U9 ( .B0(P_DATA[4]), .B1(n16), .A0(par_data[4]), .A1N(n16), .Y(n12)
         );
  AO2B2X2M U10 ( .B0(P_DATA[5]), .B1(n17), .A0(par_data[5]), .A1N(n17), .Y(n13) );
  AO2B2X2M U11 ( .B0(P_DATA[6]), .B1(n16), .A0(par_data[6]), .A1N(n16), .Y(n14) );
  AO2B2X2M U12 ( .B0(P_DATA[7]), .B1(n17), .A0(par_data[7]), .A1N(n17), .Y(n15) );
  XNOR2X2M U13 ( .A(par_data[2]), .B(par_data[3]), .Y(n5) );
  OAI2BB2X1M U14 ( .B0(n1), .B1(n18), .A0N(par_bit), .A1N(n18), .Y(n7) );
  INVX2M U15 ( .A(PAR_EN), .Y(n18) );
  XOR3XLM U16 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U17 ( .A(par_data[1]), .B(par_data[0]), .C(n5), .Y(n4) );
  XOR3XLM U18 ( .A(par_data[5]), .B(par_data[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U19 ( .A(par_data[7]), .B(par_data[6]), .Y(n6) );
endmodule


module Serializer ( P_DATA, Data_Valid, ser_en, CLK, RST, busy, ser_done, 
        ser_data );
  input [7:0] P_DATA;
  input Data_Valid, ser_en, CLK, RST, busy;
  output ser_done, ser_data;
  wire   N24, N25, N26, N27, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n1,
         n2, n3, n28, n29, n30;
  wire   [7:1] data;
  wire   [3:0] count;

  NOR2X12M U20 ( .A(n28), .B(n1), .Y(n8) );
  DFFRX1M \count_reg[1]  ( .D(N25), .CK(CLK), .RN(n2), .Q(count[1]), .QN(n29)
         );
  DFFRX1M \count_reg[3]  ( .D(N27), .CK(CLK), .RN(n2), .Q(count[3]) );
  DFFRX1M \data_reg[6]  ( .D(n22), .CK(CLK), .RN(n2), .Q(data[6]) );
  DFFRX1M \data_reg[5]  ( .D(n23), .CK(CLK), .RN(n2), .Q(data[5]) );
  DFFRX1M \data_reg[4]  ( .D(n24), .CK(CLK), .RN(n2), .Q(data[4]) );
  DFFRX1M \data_reg[3]  ( .D(n25), .CK(CLK), .RN(n2), .Q(data[3]) );
  DFFRX1M \data_reg[2]  ( .D(n26), .CK(CLK), .RN(n2), .Q(data[2]) );
  DFFRX1M \data_reg[1]  ( .D(n27), .CK(CLK), .RN(n2), .Q(data[1]) );
  DFFRX1M \data_reg[0]  ( .D(n20), .CK(CLK), .RN(n2), .Q(ser_data) );
  DFFRX1M \data_reg[7]  ( .D(n21), .CK(CLK), .RN(n2), .Q(data[7]) );
  DFFRX4M \count_reg[0]  ( .D(N24), .CK(CLK), .RN(n2), .Q(count[0]) );
  DFFRX4M \count_reg[2]  ( .D(N26), .CK(CLK), .RN(n2), .Q(count[2]), .QN(n30)
         );
  AOI32X1M U3 ( .A0(count[1]), .A1(n30), .A2(count[0]), .B0(count[2]), .B1(n29), .Y(n19) );
  OAI2BB2X4M U4 ( .B0(n18), .B1(n30), .A0N(count[1]), .A1N(count[0]), .Y(n4)
         );
  INVX4M U5 ( .A(ser_en), .Y(n28) );
  INVX6M U6 ( .A(n3), .Y(n2) );
  INVX2M U7 ( .A(RST), .Y(n3) );
  NOR2X8M U8 ( .A(n1), .B(n8), .Y(n6) );
  CLKXOR2X2M U9 ( .A(n18), .B(n30), .Y(n5) );
  NOR2X2M U10 ( .A(n18), .B(n28), .Y(N25) );
  CLKBUFX6M U11 ( .A(n9), .Y(n1) );
  NOR2BX2M U12 ( .AN(Data_Valid), .B(busy), .Y(n9) );
  OAI2BB1X2M U13 ( .A0N(ser_data), .A1N(n6), .B0(n7), .Y(n20) );
  AOI22X1M U14 ( .A0(data[1]), .A1(n8), .B0(P_DATA[0]), .B1(n1), .Y(n7) );
  OAI2BB1X2M U15 ( .A0N(data[1]), .A1N(n6), .B0(n15), .Y(n27) );
  AOI22X1M U16 ( .A0(data[2]), .A1(n8), .B0(P_DATA[1]), .B1(n1), .Y(n15) );
  OAI2BB1X2M U17 ( .A0N(n6), .A1N(data[2]), .B0(n14), .Y(n26) );
  AOI22X1M U18 ( .A0(data[3]), .A1(n8), .B0(P_DATA[2]), .B1(n1), .Y(n14) );
  OAI2BB1X2M U19 ( .A0N(n6), .A1N(data[3]), .B0(n13), .Y(n25) );
  AOI22X1M U21 ( .A0(data[4]), .A1(n8), .B0(P_DATA[3]), .B1(n1), .Y(n13) );
  OAI2BB1X2M U22 ( .A0N(n6), .A1N(data[4]), .B0(n12), .Y(n24) );
  AOI22X1M U23 ( .A0(data[5]), .A1(n8), .B0(P_DATA[4]), .B1(n1), .Y(n12) );
  OAI2BB1X2M U24 ( .A0N(n6), .A1N(data[5]), .B0(n11), .Y(n23) );
  AOI22X1M U25 ( .A0(data[6]), .A1(n8), .B0(P_DATA[5]), .B1(n1), .Y(n11) );
  OAI2BB1X2M U26 ( .A0N(n6), .A1N(data[6]), .B0(n10), .Y(n22) );
  AOI22X1M U27 ( .A0(data[7]), .A1(n8), .B0(P_DATA[6]), .B1(n1), .Y(n10) );
  AO22X1M U28 ( .A0(n6), .A1(data[7]), .B0(P_DATA[7]), .B1(n1), .Y(n21) );
  CLKXOR2X2M U29 ( .A(count[0]), .B(n29), .Y(n18) );
  NOR3BX2M U30 ( .AN(count[3]), .B(n4), .C(n5), .Y(ser_done) );
  NOR2X2M U31 ( .A(n28), .B(count[0]), .Y(N24) );
  OAI2BB2X1M U32 ( .B0(n19), .B1(n28), .A0N(count[2]), .A1N(N24), .Y(N26) );
  NOR2X2M U33 ( .A(n16), .B(n28), .Y(N27) );
  CLKXOR2X2M U34 ( .A(n17), .B(count[3]), .Y(n16) );
  NAND2X2M U35 ( .A(n5), .B(n4), .Y(n17) );
endmodule


module UART_TX_top ( P_DATA, PAR_EN, Data_Valid, PAR_TYP, CLK, RST, TX_OUT, 
        busy );
  input [7:0] P_DATA;
  input PAR_EN, Data_Valid, PAR_TYP, CLK, RST;
  output TX_OUT, busy;
  wire   ser_en, ser_done, ser_data, par_bit, n1, n2, n3, n4;
  wire   [1:0] mux_sel;

  TX_FSM U_FSM ( .ser_done(ser_done), .PAR_EN(PAR_EN), .Data_Valid(Data_Valid), 
        .CLK(CLK), .RST(n2), .ser_en(ser_en), .busy(busy), .mux_sel(mux_sel)
         );
  MUX U_MUX ( .mux_sel(mux_sel), .ser_data(ser_data), .par_bit(par_bit), .CLK(
        CLK), .RST(n3), .TX_OUT(TX_OUT) );
  Parity_calc U_PARITY_CALC ( .P_DATA(P_DATA), .Data_Valid(Data_Valid), 
        .PAR_TYP(PAR_TYP), .PAR_EN(PAR_EN), .CLK(CLK), .RST(n2), .par_bit(
        par_bit), .busy(busy) );
  Serializer U_SERIALIZER ( .P_DATA(P_DATA), .Data_Valid(Data_Valid), .ser_en(
        ser_en), .CLK(CLK), .RST(n1), .busy(busy), .ser_done(ser_done), 
        .ser_data(ser_data) );
  INVX6M U1 ( .A(n4), .Y(n2) );
  CLKINVX1M U2 ( .A(n4), .Y(n1) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(RST), .Y(n4) );
endmodule


module FSM ( RX_IN, PAR_EN, edge_cnt, bit_cnt, par_err, strt_glitch, stp_err, 
        CLK, RST, prescale, dat_samp_en, enable, par_chk_en, strt_chk_en, 
        stp_chk_en, deser_en, data_valid, from_parity );
  input [5:0] edge_cnt;
  input [3:0] bit_cnt;
  input [5:0] prescale;
  input RX_IN, PAR_EN, par_err, strt_glitch, stp_err, CLK, RST;
  output dat_samp_en, enable, par_chk_en, strt_chk_en, stp_chk_en, deser_en,
         data_valid, from_parity;
  wire   delay_parity, error_detected, N42, N43, N44, N45, N46, N47, N48, N49,
         data_valid_c, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n50, n51, n52, n53, n54;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  OAI33X4M U22 ( .A0(n44), .A1(prescale[5]), .A2(edge_cnt[4]), .B0(n45), .B1(
        n25), .B2(n51), .Y(n42) );
  DFFRQX2M delay_parity_reg ( .D(PAR_EN), .CK(n1), .RN(n3), .Q(delay_parity)
         );
  DFFRQX2M error_detected_reg ( .D(n49), .CK(n1), .RN(n3), .Q(error_detected)
         );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(n1), .RN(n3), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(n1), .RN(n3), .Q(
        current_state[0]) );
  DFFRQX2M data_valid_reg ( .D(data_valid_c), .CK(n1), .RN(n3), .Q(data_valid)
         );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(n1), .RN(n3), .Q(
        current_state[1]) );
  OAI32X2M U3 ( .A0(n21), .A1(delay_parity), .A2(n35), .B0(N49), .B1(n30), .Y(
        n34) );
  INVX2M U4 ( .A(N49), .Y(n19) );
  NOR4X6M U5 ( .A(n17), .B(n16), .C(n15), .D(n14), .Y(N49) );
  NOR2BX2M U6 ( .AN(edge_cnt[0]), .B(N42), .Y(n10) );
  NOR2BX2M U7 ( .AN(N42), .B(edge_cnt[0]), .Y(n9) );
  NOR2X2M U8 ( .A(n8), .B(prescale[5]), .Y(N48) );
  OAI21X1M U9 ( .A0(n28), .A1(n19), .B0(n20), .Y(next_state[1]) );
  OR2X2M U10 ( .A(n7), .B(prescale[4]), .Y(n8) );
  OR2X2M U11 ( .A(n6), .B(prescale[3]), .Y(n7) );
  OR2X2M U12 ( .A(n5), .B(prescale[2]), .Y(n6) );
  OAI2BB1XLM U13 ( .A0N(n7), .A1N(prescale[4]), .B0(n8), .Y(N46) );
  OAI2BB1XLM U14 ( .A0N(n6), .A1N(prescale[3]), .B0(n7), .Y(N45) );
  OAI2BB1XLM U15 ( .A0N(n5), .A1N(prescale[2]), .B0(n6), .Y(N44) );
  NOR4BX1M U16 ( .AN(n39), .B(error_detected), .C(n46), .D(n37), .Y(
        data_valid_c) );
  INVX2M U17 ( .A(current_state[2]), .Y(n26) );
  NAND2X2M U18 ( .A(n18), .B(n20), .Y(dat_samp_en) );
  INVX4M U19 ( .A(n4), .Y(n3) );
  INVX2M U20 ( .A(RST), .Y(n4) );
  NOR2X2M U21 ( .A(n31), .B(n35), .Y(deser_en) );
  INVX2M U23 ( .A(n47), .Y(n20) );
  OAI211X1M U24 ( .A0(N49), .A1(n30), .B0(n35), .C0(n32), .Y(n47) );
  NAND4X2M U25 ( .A(n41), .B(n35), .C(n32), .D(n30), .Y(enable) );
  INVX2M U26 ( .A(n48), .Y(n18) );
  OAI31X2M U27 ( .A0(n19), .A1(RX_IN), .A2(n30), .B0(n41), .Y(n48) );
  OAI21X2M U28 ( .A0(n36), .A1(n35), .B0(n18), .Y(next_state[0]) );
  NOR2X2M U29 ( .A(n30), .B(n31), .Y(stp_chk_en) );
  OA21X2M U30 ( .A0(RX_IN), .A1(n40), .B0(n28), .Y(n41) );
  NAND3X2M U31 ( .A(n50), .B(n26), .C(n27), .Y(n40) );
  INVX6M U32 ( .A(n2), .Y(n1) );
  INVX2M U33 ( .A(CLK), .Y(n2) );
  INVX2M U34 ( .A(n32), .Y(from_parity) );
  OR2X2M U35 ( .A(prescale[1]), .B(prescale[0]), .Y(n5) );
  NAND3BX2M U36 ( .AN(bit_cnt[2]), .B(bit_cnt[3]), .C(N49), .Y(n37) );
  NOR3X4M U37 ( .A(bit_cnt[0]), .B(bit_cnt[1]), .C(n37), .Y(n36) );
  AOI33X2M U38 ( .A0(n24), .A1(n52), .A2(prescale[3]), .B0(edge_cnt[3]), .B1(
        n53), .B2(prescale[4]), .Y(n44) );
  INVX2M U39 ( .A(edge_cnt[3]), .Y(n24) );
  NOR3X4M U40 ( .A(strt_glitch), .B(stp_err), .C(par_err), .Y(n39) );
  NOR2X2M U41 ( .A(n28), .B(n29), .Y(strt_chk_en) );
  AOI33X2M U42 ( .A0(n54), .A1(n23), .A2(bit_cnt[0]), .B0(PAR_EN), .B1(n22), 
        .B2(bit_cnt[1]), .Y(n46) );
  INVX2M U43 ( .A(PAR_EN), .Y(n54) );
  INVX2M U44 ( .A(bit_cnt[1]), .Y(n23) );
  NAND3X4M U45 ( .A(n27), .B(n26), .C(current_state[1]), .Y(n32) );
  NAND3X4M U46 ( .A(current_state[0]), .B(n26), .C(current_state[1]), .Y(n35)
         );
  NAND3X4M U47 ( .A(current_state[1]), .B(n27), .C(current_state[2]), .Y(n30)
         );
  OAI21BX1M U48 ( .A0(n32), .A1(n19), .B0N(n34), .Y(next_state[2]) );
  INVX2M U49 ( .A(n36), .Y(n21) );
  NAND2X2M U50 ( .A(edge_cnt[0]), .B(n33), .Y(n31) );
  INVX2M U51 ( .A(prescale[3]), .Y(n53) );
  INVX2M U52 ( .A(prescale[4]), .Y(n52) );
  NAND3X4M U53 ( .A(n50), .B(n26), .C(current_state[0]), .Y(n28) );
  INVXLM U54 ( .A(bit_cnt[0]), .Y(n22) );
  NAND2BX2M U55 ( .AN(edge_cnt[0]), .B(n33), .Y(n29) );
  OAI2B1X2M U56 ( .A1N(error_detected), .A0(n38), .B0(n39), .Y(n49) );
  OAI2B2X1M U57 ( .A1N(RX_IN), .A0(n40), .B0(RX_IN), .B1(n28), .Y(n38) );
  INVX2M U58 ( .A(current_state[0]), .Y(n27) );
  AND4X2M U59 ( .A(edge_cnt[1]), .B(n42), .C(edge_cnt[2]), .D(n43), .Y(n33) );
  NOR4X2M U60 ( .A(prescale[2]), .B(prescale[1]), .C(prescale[0]), .D(
        edge_cnt[5]), .Y(n43) );
  INVX2M U61 ( .A(edge_cnt[4]), .Y(n25) );
  INVX2M U62 ( .A(prescale[5]), .Y(n51) );
  INVX2M U63 ( .A(current_state[1]), .Y(n50) );
  NAND3X2M U64 ( .A(n53), .B(n52), .C(edge_cnt[3]), .Y(n45) );
  NOR2X2M U65 ( .A(n29), .B(n32), .Y(par_chk_en) );
  CLKINVX1M U66 ( .A(prescale[0]), .Y(N42) );
  OAI2BB1X1M U67 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n5), .Y(N43) );
  AO21XLM U68 ( .A0(n8), .A1(prescale[5]), .B0(N48), .Y(N47) );
  OAI2B2X1M U69 ( .A1N(edge_cnt[1]), .A0(n9), .B0(N43), .B1(n9), .Y(n13) );
  XNOR2X1M U70 ( .A(N47), .B(edge_cnt[5]), .Y(n12) );
  OAI2B2X1M U71 ( .A1N(N43), .A0(n10), .B0(edge_cnt[1]), .B1(n10), .Y(n11) );
  NAND4BX1M U72 ( .AN(N48), .B(n13), .C(n12), .D(n11), .Y(n17) );
  CLKXOR2X2M U73 ( .A(N46), .B(edge_cnt[4]), .Y(n16) );
  CLKXOR2X2M U74 ( .A(N44), .B(edge_cnt[2]), .Y(n15) );
  CLKXOR2X2M U75 ( .A(N45), .B(edge_cnt[3]), .Y(n14) );
endmodule


module edge_bit_counter ( enable, CLK, RST, bit_cnt, edge_cnt, prescale, 
        PAR_EN, from_parity );
  output [3:0] bit_cnt;
  output [5:0] edge_cnt;
  input [5:0] prescale;
  input enable, CLK, RST, PAR_EN, from_parity;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         n6, n8, n9, n11, n13, n14, n17, n19, n20, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, \add_23/carry[5] , \add_23/carry[4] ,
         \add_23/carry[3] , \add_23/carry[2] , n1, n2, n3, n4, n5, n7, n10,
         n12, n15, n16, n18, n21, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44;

  DFFRHQX8M \edge_cnt_reg[0]  ( .D(n27), .CK(n1), .RN(n3), .Q(edge_cnt[0]) );
  DFFRHQX8M \bit_cnt_reg[0]  ( .D(n30), .CK(n1), .RN(n3), .Q(bit_cnt[0]) );
  DFFRHQX8M \bit_cnt_reg[1]  ( .D(n29), .CK(n1), .RN(n3), .Q(bit_cnt[1]) );
  DFFRHQX8M \edge_cnt_reg[1]  ( .D(n26), .CK(n1), .RN(n3), .Q(edge_cnt[1]) );
  DFFRHQX8M \edge_cnt_reg[3]  ( .D(n24), .CK(n1), .RN(n3), .Q(edge_cnt[3]) );
  DFFRQX4M \bit_cnt_reg[3]  ( .D(n31), .CK(n1), .RN(n3), .Q(bit_cnt[3]) );
  DFFRQX4M \edge_cnt_reg[5]  ( .D(n22), .CK(n1), .RN(n3), .Q(edge_cnt[5]) );
  DFFRQX4M \bit_cnt_reg[2]  ( .D(n28), .CK(n1), .RN(n3), .Q(bit_cnt[2]) );
  DFFRQX4M \edge_cnt_reg[2]  ( .D(n25), .CK(n1), .RN(n3), .Q(edge_cnt[2]) );
  DFFRQX4M \edge_cnt_reg[4]  ( .D(n23), .CK(n1), .RN(n3), .Q(edge_cnt[4]) );
  NOR4X4M U3 ( .A(n36), .B(n35), .C(n34), .D(n33), .Y(N21) );
  NOR2BX2M U4 ( .AN(edge_cnt[0]), .B(N14), .Y(n16) );
  NOR2BX2M U5 ( .AN(N14), .B(edge_cnt[0]), .Y(n15) );
  NOR2X2M U6 ( .A(n12), .B(prescale[5]), .Y(N20) );
  OR2X2M U7 ( .A(n10), .B(prescale[4]), .Y(n12) );
  OR2X2M U8 ( .A(n7), .B(prescale[3]), .Y(n10) );
  OR2X2M U9 ( .A(n5), .B(prescale[2]), .Y(n7) );
  OAI2BB1XLM U10 ( .A0N(n10), .A1N(prescale[4]), .B0(n12), .Y(N18) );
  OAI2BB1XLM U11 ( .A0N(n7), .A1N(prescale[3]), .B0(n10), .Y(N17) );
  OAI2BB1XLM U12 ( .A0N(n5), .A1N(prescale[2]), .B0(n7), .Y(N16) );
  INVX4M U13 ( .A(enable), .Y(n43) );
  INVX2M U14 ( .A(n14), .Y(n37) );
  INVX6M U15 ( .A(n4), .Y(n3) );
  INVX2M U16 ( .A(RST), .Y(n4) );
  NOR2X6M U17 ( .A(n43), .B(N21), .Y(n6) );
  NAND2X2M U18 ( .A(N21), .B(enable), .Y(n14) );
  AOI21X2M U19 ( .A0(n40), .A1(n13), .B0(n14), .Y(n9) );
  CLKXOR2X2M U20 ( .A(n42), .B(n8), .Y(n28) );
  INVX2M U21 ( .A(n13), .Y(n39) );
  CLKINVX12M U22 ( .A(n2), .Y(n1) );
  INVX2M U23 ( .A(CLK), .Y(n2) );
  OR2X2M U24 ( .A(prescale[1]), .B(prescale[0]), .Y(n5) );
  OAI211X4M U25 ( .A0(bit_cnt[1]), .A1(bit_cnt[0]), .B0(bit_cnt[3]), .C0(n20), 
        .Y(n13) );
  AOI221X2M U26 ( .A0(PAR_EN), .A1(bit_cnt[0]), .B0(bit_cnt[1]), .B1(n44), 
        .C0(bit_cnt[2]), .Y(n20) );
  INVX2M U27 ( .A(PAR_EN), .Y(n44) );
  OAI32X2M U28 ( .A0(n14), .A1(bit_cnt[0]), .A2(n39), .B0(n37), .B1(n40), .Y(
        n30) );
  OAI32X2M U29 ( .A0(n8), .A1(bit_cnt[3]), .A2(n42), .B0(n17), .B1(n38), .Y(
        n31) );
  INVX2M U30 ( .A(bit_cnt[3]), .Y(n38) );
  NOR2BX2M U31 ( .AN(n9), .B(n19), .Y(n17) );
  AOI21X2M U32 ( .A0(bit_cnt[2]), .A1(bit_cnt[1]), .B0(n39), .Y(n19) );
  NAND3X2M U33 ( .A(bit_cnt[0]), .B(n37), .C(bit_cnt[1]), .Y(n8) );
  INVX2M U34 ( .A(bit_cnt[0]), .Y(n40) );
  OAI21X2M U35 ( .A0(n9), .A1(n41), .B0(n11), .Y(n29) );
  NAND4X1M U36 ( .A(bit_cnt[0]), .B(n37), .C(n13), .D(n41), .Y(n11) );
  CLKINVX1M U37 ( .A(bit_cnt[1]), .Y(n41) );
  INVX2M U38 ( .A(bit_cnt[2]), .Y(n42) );
  ADDHX1M U39 ( .A(edge_cnt[3]), .B(\add_23/carry[3] ), .CO(\add_23/carry[4] ), 
        .S(N11) );
  ADDHX1M U40 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_23/carry[2] ), .S(
        N9) );
  ADDHX1M U41 ( .A(edge_cnt[2]), .B(\add_23/carry[2] ), .CO(\add_23/carry[3] ), 
        .S(N10) );
  AO22X1M U42 ( .A0(edge_cnt[0]), .A1(n43), .B0(N8), .B1(n6), .Y(n27) );
  AO22X1M U43 ( .A0(edge_cnt[3]), .A1(n43), .B0(N11), .B1(n6), .Y(n24) );
  AO22X1M U44 ( .A0(edge_cnt[1]), .A1(n43), .B0(N9), .B1(n6), .Y(n26) );
  AO22X1M U45 ( .A0(edge_cnt[4]), .A1(n43), .B0(N12), .B1(n6), .Y(n23) );
  ADDHX1M U46 ( .A(edge_cnt[4]), .B(\add_23/carry[4] ), .CO(\add_23/carry[5] ), 
        .S(N12) );
  AO22X1M U47 ( .A0(edge_cnt[2]), .A1(n43), .B0(N10), .B1(n6), .Y(n25) );
  AO22X1M U48 ( .A0(edge_cnt[5]), .A1(n43), .B0(N13), .B1(n6), .Y(n22) );
  CLKINVX1M U49 ( .A(edge_cnt[0]), .Y(N8) );
  CLKXOR2X2M U50 ( .A(\add_23/carry[5] ), .B(edge_cnt[5]), .Y(N13) );
  CLKINVX1M U51 ( .A(prescale[0]), .Y(N14) );
  OAI2BB1X1M U52 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n5), .Y(N15) );
  AO21XLM U53 ( .A0(n12), .A1(prescale[5]), .B0(N20), .Y(N19) );
  OAI2B2X1M U54 ( .A1N(edge_cnt[1]), .A0(n15), .B0(N15), .B1(n15), .Y(n32) );
  XNOR2X1M U55 ( .A(N19), .B(edge_cnt[5]), .Y(n21) );
  OAI2B2X1M U56 ( .A1N(N15), .A0(n16), .B0(edge_cnt[1]), .B1(n16), .Y(n18) );
  NAND4BX1M U57 ( .AN(N20), .B(n32), .C(n21), .D(n18), .Y(n36) );
  CLKXOR2X2M U58 ( .A(N18), .B(edge_cnt[4]), .Y(n35) );
  CLKXOR2X2M U59 ( .A(N16), .B(edge_cnt[2]), .Y(n34) );
  CLKXOR2X2M U60 ( .A(N17), .B(edge_cnt[3]), .Y(n33) );
endmodule


module data_sampling ( dat_samp_en, edge_cnt, RX_IN, CLK, RST, prescale, 
        sampled_bit );
  input [5:0] edge_cnt;
  input [5:0] prescale;
  input dat_samp_en, RX_IN, CLK, RST;
  output sampled_bit;
  wire   complete_sample_flag, n1, n2, n3, n4, n5, n9, n10, n11, n13, n15, n17,
         n18, n19, n20, n21, n22, n25, n26, n27, n28, n29, n33, n34, n35, n36,
         n37, n38, n6, n7, n8, n12, n14, n16, n23, n24, n30, n31, n32, n39,
         n40, n41, n42;
  wire   [2:0] test_bits;

  DFFRQX2M \test_bits_reg[1]  ( .D(n37), .CK(n6), .RN(n8), .Q(test_bits[1]) );
  DFFRQX2M complete_sample_flag_reg ( .D(n34), .CK(n6), .RN(n8), .Q(
        complete_sample_flag) );
  DFFRQX2M \test_bits_reg[0]  ( .D(n36), .CK(n6), .RN(n8), .Q(test_bits[0]) );
  DFFRQX4M sampled_bit_reg ( .D(n35), .CK(n6), .RN(n8), .Q(sampled_bit) );
  DFFRX2M \test_bits_reg[2]  ( .D(n38), .CK(n6), .RN(n8), .Q(n33) );
  NOR2X2M U3 ( .A(n23), .B(n11), .Y(n25) );
  INVX2M U4 ( .A(edge_cnt[2]), .Y(n23) );
  INVX2M U5 ( .A(dat_samp_en), .Y(n14) );
  INVX2M U6 ( .A(n25), .Y(n16) );
  INVX4M U7 ( .A(n12), .Y(n8) );
  INVX2M U8 ( .A(RST), .Y(n12) );
  AOI21X2M U9 ( .A0(n39), .A1(n23), .B0(n30), .Y(n22) );
  INVX2M U10 ( .A(RX_IN), .Y(n42) );
  INVX2M U11 ( .A(n17), .Y(n39) );
  INVX6M U12 ( .A(n7), .Y(n6) );
  INVX2M U13 ( .A(CLK), .Y(n7) );
  NOR3X6M U14 ( .A(prescale[2]), .B(prescale[1]), .C(prescale[0]), .Y(n29) );
  NAND4X2M U15 ( .A(edge_cnt[0]), .B(dat_samp_en), .C(n26), .D(n27), .Y(n1) );
  NOR2X2M U16 ( .A(edge_cnt[5]), .B(edge_cnt[1]), .Y(n26) );
  OAI22X2M U17 ( .A0(n21), .A1(n24), .B0(edge_cnt[3]), .B1(n28), .Y(n27) );
  AOI32X1M U18 ( .A0(n39), .A1(n23), .A2(edge_cnt[4]), .B0(n25), .B1(n30), .Y(
        n28) );
  NAND4X2M U19 ( .A(prescale[3]), .B(n29), .C(n40), .D(n32), .Y(n11) );
  NAND4X2M U20 ( .A(prescale[4]), .B(n29), .C(n41), .D(n32), .Y(n15) );
  NAND4X2M U21 ( .A(prescale[5]), .B(n29), .C(n41), .D(n40), .Y(n17) );
  INVX2M U22 ( .A(edge_cnt[4]), .Y(n30) );
  INVX2M U23 ( .A(prescale[3]), .Y(n41) );
  INVX2M U24 ( .A(prescale[4]), .Y(n40) );
  INVX2M U25 ( .A(edge_cnt[3]), .Y(n24) );
  INVX2M U26 ( .A(prescale[5]), .Y(n32) );
  OAI2BB2X1M U27 ( .B0(n42), .B1(n18), .A0N(n18), .A1N(test_bits[1]), .Y(n37)
         );
  NAND4BX2M U28 ( .AN(edge_cnt[1]), .B(n31), .C(n19), .D(n20), .Y(n18) );
  AOI31X2M U29 ( .A0(n24), .A1(n30), .A2(n16), .B0(edge_cnt[0]), .Y(n19) );
  AOI211X2M U30 ( .A0(edge_cnt[3]), .A1(n21), .B0(n14), .C0(n22), .Y(n20) );
  OAI2BB2X1M U31 ( .B0(n42), .B1(n1), .A0N(n1), .A1N(n33), .Y(n38) );
  OAI2BB2X1M U32 ( .B0(n5), .B1(n42), .A0N(n5), .A1N(test_bits[0]), .Y(n36) );
  NAND4X2M U33 ( .A(n30), .B(n31), .C(n9), .D(n10), .Y(n5) );
  AOI32X1M U34 ( .A0(n15), .A1(n24), .A2(edge_cnt[2]), .B0(edge_cnt[3]), .B1(
        n17), .Y(n9) );
  AOI211X2M U35 ( .A0(n11), .A1(n23), .B0(n13), .C0(n14), .Y(n10) );
  OAI2BB2X1M U36 ( .B0(n2), .B1(n3), .A0N(sampled_bit), .A1N(n3), .Y(n35) );
  NAND2X2M U37 ( .A(complete_sample_flag), .B(dat_samp_en), .Y(n3) );
  AOI21X2M U38 ( .A0(test_bits[0]), .A1(n33), .B0(n4), .Y(n2) );
  OA21X2M U39 ( .A0(test_bits[0]), .A1(n33), .B0(test_bits[1]), .Y(n4) );
  INVX2M U40 ( .A(edge_cnt[5]), .Y(n31) );
  NAND2X2M U41 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .Y(n13) );
  NAND2BX2M U42 ( .AN(complete_sample_flag), .B(n1), .Y(n34) );
  OR3X2M U43 ( .A(n15), .B(edge_cnt[2]), .C(edge_cnt[4]), .Y(n21) );
endmodule


module deserializer ( deser_en, sampled_bit, CLK, RST, P_DATA, bit_cnt, PAR_EN
 );
  output [7:0] P_DATA;
  input [3:0] bit_cnt;
  input deser_en, sampled_bit, CLK, RST, PAR_EN;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n1, n2, n3, n4, n25, n26, n27, n28;

  DFFRQX2M \P_DATA_reg[6]  ( .D(n23), .CK(n1), .RN(n3), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n18), .CK(n1), .RN(n3), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n22), .CK(n1), .RN(n3), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[0]  ( .D(n17), .CK(n1), .RN(n3), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n21), .CK(n1), .RN(n3), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n19), .CK(n1), .RN(n3), .Q(P_DATA[2]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n24), .CK(n1), .RN(n3), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n20), .CK(n1), .RN(n3), .Q(P_DATA[3]) );
  AND2X2M U2 ( .A(n6), .B(bit_cnt[2]), .Y(n11) );
  INVX4M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(RST), .Y(n4) );
  INVX8M U5 ( .A(n2), .Y(n1) );
  INVX2M U6 ( .A(CLK), .Y(n2) );
  INVX4M U7 ( .A(sampled_bit), .Y(n25) );
  INVX2M U8 ( .A(bit_cnt[0]), .Y(n26) );
  INVX2M U9 ( .A(bit_cnt[1]), .Y(n27) );
  NOR2BX4M U10 ( .AN(deser_en), .B(bit_cnt[3]), .Y(n6) );
  AND3X2M U11 ( .A(n6), .B(n28), .C(bit_cnt[1]), .Y(n8) );
  OAI2BB2X1M U12 ( .B0(n25), .B1(n7), .A0N(P_DATA[1]), .A1N(n7), .Y(n18) );
  NAND2X2M U13 ( .A(n8), .B(n26), .Y(n7) );
  OAI2BB2X1M U14 ( .B0(n25), .B1(n9), .A0N(P_DATA[2]), .A1N(n9), .Y(n19) );
  NAND2X2M U15 ( .A(n8), .B(bit_cnt[0]), .Y(n9) );
  OAI2BB2X1M U16 ( .B0(n25), .B1(n10), .A0N(P_DATA[3]), .A1N(n10), .Y(n20) );
  NAND3X2M U17 ( .A(n26), .B(n27), .C(n11), .Y(n10) );
  OAI2BB2X1M U18 ( .B0(n25), .B1(n12), .A0N(P_DATA[4]), .A1N(n12), .Y(n21) );
  NAND3X1M U19 ( .A(bit_cnt[0]), .B(n27), .C(n11), .Y(n12) );
  OAI2BB2X1M U20 ( .B0(n25), .B1(n13), .A0N(P_DATA[5]), .A1N(n13), .Y(n22) );
  NAND3X2M U21 ( .A(bit_cnt[1]), .B(n26), .C(n11), .Y(n13) );
  OAI2BB2X1M U22 ( .B0(n25), .B1(n14), .A0N(P_DATA[6]), .A1N(n14), .Y(n23) );
  NAND3X1M U23 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .C(n11), .Y(n14) );
  OAI2BB2X1M U24 ( .B0(n25), .B1(n15), .A0N(P_DATA[7]), .A1N(n15), .Y(n24) );
  NAND4X2M U25 ( .A(bit_cnt[3]), .B(deser_en), .C(n16), .D(n26), .Y(n15) );
  NOR2X1M U26 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n16) );
  OAI2BB2X1M U27 ( .B0(n5), .B1(n25), .A0N(P_DATA[0]), .A1N(n5), .Y(n17) );
  NAND4X2M U28 ( .A(bit_cnt[0]), .B(n6), .C(n27), .D(n28), .Y(n5) );
  INVX2M U29 ( .A(bit_cnt[2]), .Y(n28) );
endmodule


module parity_check ( par_chk_en, sampled_bit, PAR_TYP, CLK, RST, P_DATA, 
        par_err );
  input [7:0] P_DATA;
  input par_chk_en, sampled_bit, PAR_TYP, CLK, RST;
  output par_err;
  wire   N13, n1, n2, n3, n4, n5, n6;

  DFFRQX2M par_err_reg ( .D(N13), .CK(CLK), .RN(RST), .Q(par_err) );
  XNOR2X2M U3 ( .A(P_DATA[2]), .B(PAR_TYP), .Y(n4) );
  XNOR2X2M U4 ( .A(P_DATA[4]), .B(P_DATA[3]), .Y(n6) );
  XOR3XLM U5 ( .A(P_DATA[6]), .B(P_DATA[5]), .C(n5), .Y(n3) );
  XNOR2X2M U6 ( .A(sampled_bit), .B(P_DATA[7]), .Y(n5) );
  NOR2BX2M U7 ( .AN(par_chk_en), .B(n1), .Y(N13) );
  XOR3XLM U8 ( .A(n2), .B(n3), .C(n4), .Y(n1) );
  XOR3XLM U9 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n6), .Y(n2) );
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


module UART_RX_top ( RX_IN, PAR_EN, PAR_TYP, prescale, CLK, RST, data_valid, 
        P_DATA );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYP, CLK, RST;
  output data_valid;
  wire   dat_samp_en, enable, par_chk_en, par_err, strt_chk_en, strt_glitch,
         stp_chk_en, stp_err, deser_en, from_parity, sampled_bit, n1, n2, n3,
         n4;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;

  FSM U_FSM ( .RX_IN(RX_IN), .PAR_EN(PAR_EN), .edge_cnt(edge_cnt), .bit_cnt(
        bit_cnt), .par_err(par_err), .strt_glitch(strt_glitch), .stp_err(
        stp_err), .CLK(n1), .RST(n3), .prescale(prescale), .dat_samp_en(
        dat_samp_en), .enable(enable), .par_chk_en(par_chk_en), .strt_chk_en(
        strt_chk_en), .stp_chk_en(stp_chk_en), .deser_en(deser_en), 
        .data_valid(data_valid), .from_parity(from_parity) );
  edge_bit_counter U_edge_bit_counter ( .enable(enable), .CLK(n1), .RST(n3), 
        .bit_cnt(bit_cnt), .edge_cnt(edge_cnt), .prescale(prescale), .PAR_EN(
        PAR_EN), .from_parity(from_parity) );
  data_sampling U_data_sampling ( .dat_samp_en(dat_samp_en), .edge_cnt(
        edge_cnt), .RX_IN(RX_IN), .CLK(n1), .RST(n3), .prescale(prescale), 
        .sampled_bit(sampled_bit) );
  deserializer U_deserializer ( .deser_en(deser_en), .sampled_bit(sampled_bit), 
        .CLK(n1), .RST(n3), .P_DATA(P_DATA), .bit_cnt(bit_cnt), .PAR_EN(PAR_EN) );
  parity_check U_parity_check ( .par_chk_en(par_chk_en), .sampled_bit(
        sampled_bit), .PAR_TYP(PAR_TYP), .CLK(n1), .RST(n3), .P_DATA(P_DATA), 
        .par_err(par_err) );
  strt_check U_strt_check ( .strt_chk_en(strt_chk_en), .sampled_bit(
        sampled_bit), .strt_glitch(strt_glitch), .CLK(n1), .RST(n3) );
  stop_check U_stop_check ( .stp_chk_en(stp_chk_en), .sampled_bit(sampled_bit), 
        .stp_err(stp_err), .CLK(n1), .RST(n3) );
  INVX4M U1 ( .A(n4), .Y(n3) );
  INVX6M U2 ( .A(n2), .Y(n1) );
  INVX2M U3 ( .A(RST), .Y(n4) );
  INVX2M U4 ( .A(CLK), .Y(n2) );
endmodule


module sys_ctrl ( CLK, RST, ALU_OUT, OUT_Valid, FIFO_FULL, ALU_FUN, ALU_EN, 
        CLK_EN, Address, WrEn, RdEn, WrData, RdData, RdData_Valid, RX_P_DATA, 
        RX_D_VLD, TX_P_DATA, TX_D_VLD, clk_div_en );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  input [7:0] RdData;
  input [7:0] RX_P_DATA;
  output [7:0] TX_P_DATA;
  input CLK, RST, OUT_Valid, FIFO_FULL, RdData_Valid, RX_D_VLD;
  output ALU_EN, CLK_EN, WrEn, RdEn, TX_D_VLD, clk_div_en;
  wire   n15, n16, n17, n18, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n19,
         n20, n21, n22, n23, n24, n25, n26, n82, n83, n84, n85, n86, n87;
  wire   [3:0] current_state;
  wire   [3:0] next_state;

  NOR2X12M U73 ( .A(n77), .B(n15), .Y(Address[3]) );
  NOR2X12M U74 ( .A(n77), .B(n16), .Y(Address[2]) );
  DFFRX1M \stored_addr_reg[0]  ( .D(n78), .CK(CLK), .RN(n6), .QN(n18) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(n6), .Q(
        current_state[1]) );
  DFFRX1M \stored_addr_reg[3]  ( .D(n81), .CK(CLK), .RN(n6), .QN(n15) );
  DFFRX1M \stored_addr_reg[2]  ( .D(n80), .CK(CLK), .RN(n6), .QN(n16) );
  DFFRX1M \stored_addr_reg[1]  ( .D(n79), .CK(CLK), .RN(n6), .QN(n17) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(n6), .Q(
        current_state[2]) );
  DFFRX4M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]), .QN(n14) );
  DFFRQX4M \current_state_reg[3]  ( .D(next_state[3]), .CK(CLK), .RN(n6), .Q(
        current_state[3]) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  NAND3X2M U5 ( .A(current_state[0]), .B(n76), .C(current_state[3]), .Y(n35)
         );
  OAI211X2M U6 ( .A0(RX_D_VLD), .A1(n53), .B0(n54), .C0(n55), .Y(next_state[0]) );
  NOR2X8M U7 ( .A(n84), .B(n19), .Y(ALU_FUN[2]) );
  NOR2X6M U8 ( .A(n86), .B(n19), .Y(ALU_FUN[0]) );
  NOR2X4M U9 ( .A(n85), .B(n19), .Y(ALU_FUN[1]) );
  NOR2X2M U10 ( .A(n12), .B(n32), .Y(n75) );
  NOR2X4M U11 ( .A(n25), .B(current_state[1]), .Y(n76) );
  NAND3X2M U12 ( .A(n76), .B(n23), .C(current_state[0]), .Y(n36) );
  NOR2X4M U13 ( .A(n24), .B(current_state[3]), .Y(n63) );
  INVX2M U14 ( .A(current_state[3]), .Y(n23) );
  INVX2M U15 ( .A(RX_P_DATA[3]), .Y(n83) );
  NAND3X2M U16 ( .A(n76), .B(n14), .C(current_state[3]), .Y(n34) );
  NOR4X4M U17 ( .A(n24), .B(n23), .C(n25), .D(current_state[0]), .Y(n32) );
  INVX2M U18 ( .A(RX_P_DATA[2]), .Y(n84) );
  INVX4M U19 ( .A(n31), .Y(n19) );
  CLKBUFX6M U20 ( .A(n66), .Y(n4) );
  NOR2X2M U21 ( .A(n38), .B(n41), .Y(n66) );
  INVX2M U22 ( .A(n62), .Y(n9) );
  NOR2X4M U23 ( .A(n87), .B(n36), .Y(n31) );
  NAND2X2M U24 ( .A(n31), .B(n83), .Y(ALU_FUN[3]) );
  AND3X4M U25 ( .A(n52), .B(n41), .C(n35), .Y(n77) );
  NAND3X2M U26 ( .A(n14), .B(n23), .C(n76), .Y(n41) );
  NOR2X8M U27 ( .A(n33), .B(n21), .Y(n67) );
  OAI2B11X2M U28 ( .A1N(n33), .A0(n21), .B0(n45), .C0(n46), .Y(n40) );
  NAND4X2M U29 ( .A(n47), .B(n48), .C(n86), .D(n82), .Y(n45) );
  OAI21BX1M U30 ( .A0(n75), .A1(n33), .B0N(n4), .Y(TX_D_VLD) );
  NOR2X2M U31 ( .A(n10), .B(n86), .Y(WrData[0]) );
  NOR2X2M U32 ( .A(n10), .B(n85), .Y(WrData[1]) );
  NOR2X2M U33 ( .A(n10), .B(n84), .Y(WrData[2]) );
  NOR2X2M U34 ( .A(n10), .B(n83), .Y(WrData[3]) );
  NOR2X2M U35 ( .A(n10), .B(n82), .Y(WrData[4]) );
  NOR2X2M U36 ( .A(n10), .B(n26), .Y(WrData[7]) );
  INVX4M U37 ( .A(WrEn), .Y(n10) );
  INVX2M U38 ( .A(n32), .Y(n21) );
  NAND4X2M U39 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(next_state[2]) );
  AOI211X2M U40 ( .A0(n13), .A1(n38), .B0(n39), .C0(n40), .Y(n37) );
  INVX2M U41 ( .A(n41), .Y(n13) );
  INVX2M U42 ( .A(n51), .Y(n20) );
  INVX2M U43 ( .A(n34), .Y(n12) );
  BUFX4M U44 ( .A(n50), .Y(n5) );
  NOR2X2M U45 ( .A(n33), .B(n34), .Y(n50) );
  INVX2M U46 ( .A(n46), .Y(n11) );
  OR2X2M U47 ( .A(FIFO_FULL), .B(n8), .Y(n38) );
  NOR4X4M U48 ( .A(n24), .B(n23), .C(n14), .D(n25), .Y(n30) );
  AND3X2M U49 ( .A(n61), .B(n14), .C(n24), .Y(n47) );
  NAND2X4M U50 ( .A(n27), .B(n59), .Y(n62) );
  NAND3X4M U51 ( .A(n14), .B(n25), .C(n63), .Y(n27) );
  OAI211X2M U52 ( .A0(n87), .A1(n27), .B0(n28), .C0(n29), .Y(next_state[3]) );
  AOI211X2M U53 ( .A0(n30), .A1(n87), .B0(n31), .C0(n12), .Y(n29) );
  AOI22X1M U54 ( .A0(n32), .A1(n33), .B0(RdEn), .B1(n8), .Y(n28) );
  INVX2M U55 ( .A(n35), .Y(RdEn) );
  INVX2M U56 ( .A(n59), .Y(n22) );
  INVX4M U57 ( .A(n7), .Y(n6) );
  INVX2M U58 ( .A(RST), .Y(n7) );
  INVX4M U59 ( .A(current_state[2]), .Y(n25) );
  INVX4M U60 ( .A(RX_D_VLD), .Y(n87) );
  INVX4M U61 ( .A(RX_P_DATA[0]), .Y(n86) );
  INVX2M U62 ( .A(RX_P_DATA[1]), .Y(n85) );
  INVX4M U63 ( .A(current_state[1]), .Y(n24) );
  NAND3X2M U64 ( .A(current_state[0]), .B(n25), .C(n63), .Y(n52) );
  OAI22X1M U65 ( .A0(n87), .A1(n51), .B0(n77), .B1(n18), .Y(Address[0]) );
  OAI2BB1X2M U66 ( .A0N(ALU_OUT[0]), .A1N(n5), .B0(n74), .Y(TX_P_DATA[0]) );
  AOI22X1M U67 ( .A0(RdData[0]), .A1(n4), .B0(ALU_OUT[8]), .B1(n67), .Y(n74)
         );
  OAI2BB1X2M U68 ( .A0N(ALU_OUT[1]), .A1N(n5), .B0(n73), .Y(TX_P_DATA[1]) );
  AOI22X1M U69 ( .A0(RdData[1]), .A1(n4), .B0(ALU_OUT[9]), .B1(n67), .Y(n73)
         );
  OAI2BB1X2M U70 ( .A0N(ALU_OUT[2]), .A1N(n5), .B0(n72), .Y(TX_P_DATA[2]) );
  AOI22X1M U71 ( .A0(RdData[2]), .A1(n4), .B0(ALU_OUT[10]), .B1(n67), .Y(n72)
         );
  OAI2BB1X2M U72 ( .A0N(ALU_OUT[3]), .A1N(n5), .B0(n71), .Y(TX_P_DATA[3]) );
  AOI22X1M U75 ( .A0(RdData[3]), .A1(n4), .B0(ALU_OUT[11]), .B1(n67), .Y(n71)
         );
  OAI2BB1X2M U76 ( .A0N(ALU_OUT[4]), .A1N(n5), .B0(n70), .Y(TX_P_DATA[4]) );
  AOI22X1M U77 ( .A0(RdData[4]), .A1(n4), .B0(ALU_OUT[12]), .B1(n67), .Y(n70)
         );
  OAI2BB1X2M U78 ( .A0N(ALU_OUT[5]), .A1N(n5), .B0(n69), .Y(TX_P_DATA[5]) );
  AOI22X1M U79 ( .A0(RdData[5]), .A1(n4), .B0(ALU_OUT[13]), .B1(n67), .Y(n69)
         );
  OAI2BB1X2M U80 ( .A0N(ALU_OUT[6]), .A1N(n5), .B0(n68), .Y(TX_P_DATA[6]) );
  AOI22X1M U81 ( .A0(RdData[6]), .A1(n4), .B0(ALU_OUT[14]), .B1(n67), .Y(n68)
         );
  OAI2BB1X2M U82 ( .A0N(ALU_OUT[7]), .A1N(n5), .B0(n65), .Y(TX_P_DATA[7]) );
  AOI22X1M U83 ( .A0(RdData[7]), .A1(n4), .B0(ALU_OUT[15]), .B1(n67), .Y(n65)
         );
  NAND2BX4M U84 ( .AN(FIFO_FULL), .B(OUT_Valid), .Y(n33) );
  NAND3X2M U85 ( .A(current_state[0]), .B(current_state[2]), .C(n63), .Y(n51)
         );
  NAND2X4M U86 ( .A(n52), .B(n64), .Y(WrEn) );
  OAI21X2M U87 ( .A0(n20), .A1(n11), .B0(RX_D_VLD), .Y(n64) );
  NAND3X2M U88 ( .A(current_state[2]), .B(n14), .C(n63), .Y(n46) );
  NOR2X2M U89 ( .A(n77), .B(n17), .Y(Address[1]) );
  OAI211X4M U90 ( .A0(n87), .A1(n27), .B0(n56), .C0(n57), .Y(n39) );
  NOR2X2M U91 ( .A(n30), .B(n20), .Y(n57) );
  NAND4X2M U92 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n47), .D(n48), .Y(n56)
         );
  OAI2B11X2M U93 ( .A1N(n42), .A0(RX_D_VLD), .B0(n43), .C0(n44), .Y(
        next_state[1]) );
  NAND4BX1M U94 ( .AN(n30), .B(n27), .C(n51), .D(n52), .Y(n42) );
  AOI31X2M U95 ( .A0(RX_P_DATA[4]), .A1(RX_P_DATA[0]), .A2(n49), .B0(n5), .Y(
        n43) );
  AOI21X2M U96 ( .A0(n22), .A1(RX_D_VLD), .B0(n40), .Y(n44) );
  NOR2X4M U97 ( .A(current_state[2]), .B(current_state[3]), .Y(n61) );
  OAI22X1M U98 ( .A0(n9), .A1(n86), .B0(n62), .B1(n18), .Y(n78) );
  OAI22X1M U99 ( .A0(n9), .A1(n85), .B0(n62), .B1(n17), .Y(n79) );
  OAI22X1M U100 ( .A0(n9), .A1(n84), .B0(n62), .B1(n16), .Y(n80) );
  OAI22X1M U101 ( .A0(n9), .A1(n83), .B0(n62), .B1(n15), .Y(n81) );
  AND2X2M U102 ( .A(RX_P_DATA[5]), .B(WrEn), .Y(WrData[5]) );
  AND2X2M U103 ( .A(RX_P_DATA[6]), .B(WrEn), .Y(WrData[6]) );
  AOI21BX2M U104 ( .A0(n61), .A1(current_state[0]), .B0N(n36), .Y(n53) );
  AOI31X2M U105 ( .A0(n86), .A1(n82), .A2(n49), .B0(n22), .Y(n54) );
  AOI221X2M U106 ( .A0(n11), .A1(RX_D_VLD), .B0(RdEn), .B1(n8), .C0(n39), .Y(
        n55) );
  INVX2M U107 ( .A(RdData_Valid), .Y(n8) );
  AND4X2M U108 ( .A(RX_P_DATA[1]), .B(n47), .C(RX_P_DATA[5]), .D(n60), .Y(n49)
         );
  NOR4X2M U109 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[2]), .C(n83), .D(n26), .Y(n60)
         );
  NAND3X2M U110 ( .A(current_state[0]), .B(n24), .C(n61), .Y(n59) );
  AND4X2M U111 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[3]), .C(RX_P_DATA[7]), .D(n58), 
        .Y(n48) );
  NOR3X2M U112 ( .A(n84), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n58) );
  INVX2M U113 ( .A(RX_P_DATA[4]), .Y(n82) );
  INVX2M U114 ( .A(RX_P_DATA[7]), .Y(n26) );
  BUFX2M U115 ( .A(ALU_EN), .Y(CLK_EN) );
  NAND2X4M U116 ( .A(n75), .B(n19), .Y(ALU_EN) );
endmodule


module RegFile_WIDTH8_ADDR4 ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, 
        RdData_VLD, REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
  wire   N11, N12, N13, N14, n271, n272, n273, n274, n275, \regArr[15][7] ,
         \regArr[15][6] , \regArr[15][5] , \regArr[15][4] , \regArr[15][3] ,
         \regArr[15][2] , \regArr[15][1] , \regArr[15][0] , \regArr[14][7] ,
         \regArr[14][6] , \regArr[14][5] , \regArr[14][4] , \regArr[14][3] ,
         \regArr[14][2] , \regArr[14][1] , \regArr[14][0] , \regArr[13][7] ,
         \regArr[13][6] , \regArr[13][5] , \regArr[13][4] , \regArr[13][3] ,
         \regArr[13][2] , \regArr[13][1] , \regArr[13][0] , \regArr[12][7] ,
         \regArr[12][6] , \regArr[12][5] , \regArr[12][4] , \regArr[12][3] ,
         \regArr[12][2] , \regArr[12][1] , \regArr[12][0] , \regArr[11][7] ,
         \regArr[11][6] , \regArr[11][5] , \regArr[11][4] , \regArr[11][3] ,
         \regArr[11][2] , \regArr[11][1] , \regArr[11][0] , \regArr[10][7] ,
         \regArr[10][6] , \regArr[10][5] , \regArr[10][4] , \regArr[10][3] ,
         \regArr[10][2] , \regArr[10][1] , \regArr[10][0] , \regArr[9][7] ,
         \regArr[9][6] , \regArr[9][5] , \regArr[9][4] , \regArr[9][3] ,
         \regArr[9][2] , \regArr[9][1] , \regArr[9][0] , \regArr[8][7] ,
         \regArr[8][6] , \regArr[8][5] , \regArr[8][4] , \regArr[8][3] ,
         \regArr[8][2] , \regArr[8][1] , \regArr[8][0] , \regArr[7][7] ,
         \regArr[7][6] , \regArr[7][5] , \regArr[7][4] , \regArr[7][3] ,
         \regArr[7][2] , \regArr[7][1] , \regArr[7][0] , \regArr[6][7] ,
         \regArr[6][6] , \regArr[6][5] , \regArr[6][4] , \regArr[6][3] ,
         \regArr[6][2] , \regArr[6][1] , \regArr[6][0] , \regArr[5][7] ,
         \regArr[5][6] , \regArr[5][5] , \regArr[5][4] , \regArr[5][3] ,
         \regArr[5][2] , \regArr[5][1] , \regArr[5][0] , \regArr[4][7] ,
         \regArr[4][6] , \regArr[4][5] , \regArr[4][4] , \regArr[4][3] ,
         \regArr[4][2] , \regArr[4][1] , \regArr[4][0] , N36, N37, N38, N39,
         N40, N41, N42, N43, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n3, n5, n8, n9, n10, n11, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRHQX8M \regArr_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n251), .Q(REG2[6]) );
  DFFRHQX8M \regArr_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n251), .Q(REG2[5]) );
  DFFRHQX8M \regArr_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n251), .Q(REG2[4]) );
  DFFRHQX8M \regArr_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n251), .Q(REG2[3]) );
  DFFRHQX8M \regArr_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n251), .Q(REG2[2]) );
  DFFRHQX8M \regArr_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n250), .Q(REG1[7]) );
  DFFRHQX8M \regArr_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n251), .Q(REG1[5]) );
  DFFRHQX8M \regArr_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n250), .Q(REG1[1]) );
  DFFRQX2M \regArr_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n258), .Q(
        \regArr[13][7] ) );
  DFFRQX2M \regArr_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n258), .Q(
        \regArr[13][6] ) );
  DFFRQX2M \regArr_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n258), .Q(
        \regArr[13][5] ) );
  DFFRQX2M \regArr_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n258), .Q(
        \regArr[13][4] ) );
  DFFRQX2M \regArr_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n258), .Q(
        \regArr[13][3] ) );
  DFFRQX2M \regArr_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n257), .Q(
        \regArr[13][2] ) );
  DFFRQX2M \regArr_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n257), .Q(
        \regArr[13][1] ) );
  DFFRQX2M \regArr_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n257), .Q(
        \regArr[13][0] ) );
  DFFRQX2M \regArr_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n255), .Q(
        \regArr[9][7] ) );
  DFFRQX2M \regArr_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n255), .Q(
        \regArr[9][6] ) );
  DFFRQX2M \regArr_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n255), .Q(
        \regArr[9][5] ) );
  DFFRQX2M \regArr_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n255), .Q(
        \regArr[9][4] ) );
  DFFRQX2M \regArr_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n255), .Q(
        \regArr[9][3] ) );
  DFFRQX2M \regArr_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n255), .Q(
        \regArr[9][2] ) );
  DFFRQX2M \regArr_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n255), .Q(
        \regArr[9][1] ) );
  DFFRQX2M \regArr_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n255), .Q(
        \regArr[9][0] ) );
  DFFRQX2M \regArr_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n253), .Q(
        \regArr[5][7] ) );
  DFFRQX2M \regArr_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n253), .Q(
        \regArr[5][6] ) );
  DFFRQX2M \regArr_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n253), .Q(
        \regArr[5][5] ) );
  DFFRQX2M \regArr_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n253), .Q(
        \regArr[5][4] ) );
  DFFRQX2M \regArr_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n253), .Q(
        \regArr[5][3] ) );
  DFFRQX2M \regArr_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n252), .Q(
        \regArr[5][2] ) );
  DFFRQX2M \regArr_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n252), .Q(
        \regArr[5][1] ) );
  DFFRQX2M \regArr_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n252), .Q(
        \regArr[5][0] ) );
  DFFRQX2M \regArr_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n249), .Q(
        \regArr[15][7] ) );
  DFFRQX2M \regArr_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n259), .Q(
        \regArr[15][6] ) );
  DFFRQX2M \regArr_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n259), .Q(
        \regArr[15][5] ) );
  DFFRQX2M \regArr_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n259), .Q(
        \regArr[15][4] ) );
  DFFRQX2M \regArr_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n259), .Q(
        \regArr[15][3] ) );
  DFFRQX2M \regArr_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n259), .Q(
        \regArr[15][2] ) );
  DFFRQX2M \regArr_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n259), .Q(
        \regArr[15][1] ) );
  DFFRQX2M \regArr_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n259), .Q(
        \regArr[15][0] ) );
  DFFRQX2M \regArr_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n257), .Q(
        \regArr[11][7] ) );
  DFFRQX2M \regArr_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n257), .Q(
        \regArr[11][6] ) );
  DFFRQX2M \regArr_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n256), .Q(
        \regArr[11][5] ) );
  DFFRQX2M \regArr_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n256), .Q(
        \regArr[11][4] ) );
  DFFRQX2M \regArr_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n256), .Q(
        \regArr[11][3] ) );
  DFFRQX2M \regArr_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n256), .Q(
        \regArr[11][2] ) );
  DFFRQX2M \regArr_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n256), .Q(
        \regArr[11][1] ) );
  DFFRQX2M \regArr_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n256), .Q(
        \regArr[11][0] ) );
  DFFRQX2M \regArr_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n254), .Q(
        \regArr[7][7] ) );
  DFFRQX2M \regArr_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n254), .Q(
        \regArr[7][6] ) );
  DFFRQX2M \regArr_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n254), .Q(
        \regArr[7][5] ) );
  DFFRQX2M \regArr_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n254), .Q(
        \regArr[7][4] ) );
  DFFRQX2M \regArr_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n254), .Q(
        \regArr[7][3] ) );
  DFFRQX2M \regArr_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n254), .Q(
        \regArr[7][2] ) );
  DFFRQX2M \regArr_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n254), .Q(
        \regArr[7][1] ) );
  DFFRQX2M \regArr_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n254), .Q(
        \regArr[7][0] ) );
  DFFRQX2M \regArr_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n258), .Q(
        \regArr[14][7] ) );
  DFFRQX2M \regArr_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n258), .Q(
        \regArr[14][6] ) );
  DFFRQX2M \regArr_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n258), .Q(
        \regArr[14][5] ) );
  DFFRQX2M \regArr_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n258), .Q(
        \regArr[14][4] ) );
  DFFRQX2M \regArr_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n258), .Q(
        \regArr[14][3] ) );
  DFFRQX2M \regArr_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n258), .Q(
        \regArr[14][2] ) );
  DFFRQX2M \regArr_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n258), .Q(
        \regArr[14][1] ) );
  DFFRQX2M \regArr_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n258), .Q(
        \regArr[14][0] ) );
  DFFRQX2M \regArr_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n256), .Q(
        \regArr[10][7] ) );
  DFFRQX2M \regArr_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n256), .Q(
        \regArr[10][6] ) );
  DFFRQX2M \regArr_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n256), .Q(
        \regArr[10][5] ) );
  DFFRQX2M \regArr_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n256), .Q(
        \regArr[10][4] ) );
  DFFRQX2M \regArr_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n256), .Q(
        \regArr[10][3] ) );
  DFFRQX2M \regArr_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n256), .Q(
        \regArr[10][2] ) );
  DFFRQX2M \regArr_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n256), .Q(
        \regArr[10][1] ) );
  DFFRQX2M \regArr_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n255), .Q(
        \regArr[10][0] ) );
  DFFRQX2M \regArr_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n253), .Q(
        \regArr[6][7] ) );
  DFFRQX2M \regArr_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n253), .Q(
        \regArr[6][6] ) );
  DFFRQX2M \regArr_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n253), .Q(
        \regArr[6][5] ) );
  DFFRQX2M \regArr_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n253), .Q(
        \regArr[6][4] ) );
  DFFRQX2M \regArr_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n253), .Q(
        \regArr[6][3] ) );
  DFFRQX2M \regArr_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n253), .Q(
        \regArr[6][2] ) );
  DFFRQX2M \regArr_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n253), .Q(
        \regArr[6][1] ) );
  DFFRQX2M \regArr_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n253), .Q(
        \regArr[6][0] ) );
  DFFRQX2M \regArr_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n257), .Q(
        \regArr[12][7] ) );
  DFFRQX2M \regArr_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n257), .Q(
        \regArr[12][6] ) );
  DFFRQX2M \regArr_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n257), .Q(
        \regArr[12][5] ) );
  DFFRQX2M \regArr_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n257), .Q(
        \regArr[12][4] ) );
  DFFRQX2M \regArr_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n257), .Q(
        \regArr[12][3] ) );
  DFFRQX2M \regArr_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n257), .Q(
        \regArr[12][2] ) );
  DFFRQX2M \regArr_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n257), .Q(
        \regArr[12][1] ) );
  DFFRQX2M \regArr_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n257), .Q(
        \regArr[12][0] ) );
  DFFRQX2M \regArr_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n255), .Q(
        \regArr[8][7] ) );
  DFFRQX2M \regArr_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n255), .Q(
        \regArr[8][6] ) );
  DFFRQX2M \regArr_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n255), .Q(
        \regArr[8][5] ) );
  DFFRQX2M \regArr_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n255), .Q(
        \regArr[8][4] ) );
  DFFRQX2M \regArr_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n254), .Q(
        \regArr[8][3] ) );
  DFFRQX2M \regArr_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n254), .Q(
        \regArr[8][2] ) );
  DFFRQX2M \regArr_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n254), .Q(
        \regArr[8][1] ) );
  DFFRQX2M \regArr_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n254), .Q(
        \regArr[8][0] ) );
  DFFRQX2M \regArr_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n252), .Q(
        \regArr[4][7] ) );
  DFFRQX2M \regArr_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n252), .Q(
        \regArr[4][6] ) );
  DFFRQX2M \regArr_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n252), .Q(
        \regArr[4][5] ) );
  DFFRQX2M \regArr_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n252), .Q(
        \regArr[4][4] ) );
  DFFRQX2M \regArr_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n252), .Q(
        \regArr[4][3] ) );
  DFFRQX2M \regArr_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n252), .Q(
        \regArr[4][2] ) );
  DFFRQX2M \regArr_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n252), .Q(
        \regArr[4][1] ) );
  DFFRQX2M \regArr_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n252), .Q(
        \regArr[4][0] ) );
  DFFRQX2M \regArr_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n251), .Q(REG3[0]) );
  DFFRQX2M \regArr_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n251), .Q(REG2[1]) );
  DFFSQX4M \regArr_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n249), .Q(REG3[5]) );
  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n250), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n249), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n249), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n249), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n249), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n249), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n249), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n254), .Q(RdData[0]) );
  DFFRQX2M RdData_VLD_reg ( .D(n48), .CK(CLK), .RN(n249), .Q(RdData_VLD) );
  DFFRQX2M \regArr_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n250), .Q(REG0[3]) );
  DFFRQX2M \regArr_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n250), .Q(REG0[2]) );
  DFFRQX2M \regArr_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n249), .Q(REG0[0]) );
  DFFRQX2M \regArr_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n249), .Q(REG0[1]) );
  DFFRHQX8M \regArr_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n250), .Q(REG0[4]) );
  DFFRQX2M \regArr_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n250), .Q(REG0[5]) );
  DFFSHQX8M \regArr_reg[2][7]  ( .D(n72), .CK(CLK), .SN(RST), .Q(REG2[7]) );
  DFFSQX4M \regArr_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n249), .Q(REG2[0]) );
  DFFRQX4M \regArr_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n251), .Q(REG3[1]) );
  DFFRQX4M \regArr_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n251), .Q(REG3[4]) );
  DFFRQX4M \regArr_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n251), .Q(REG3[3]) );
  DFFRQX4M \regArr_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n251), .Q(REG3[2]) );
  DFFRQX4M \regArr_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n252), .Q(REG3[6]) );
  DFFRQX4M \regArr_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n252), .Q(REG3[7]) );
  DFFRQX2M \regArr_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n250), .Q(n272) );
  DFFRQX2M \regArr_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n250), .Q(n275) );
  DFFRHQX4M \regArr_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n250), .Q(REG0[6]) );
  DFFRHQX8M \regArr_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n250), .Q(n271) );
  DFFRHQX8M \regArr_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n250), .Q(n273) );
  DFFRHQX8M \regArr_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n251), .Q(REG1[6]) );
  DFFRHQX8M \regArr_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n250), .Q(n274) );
  BUFX32M U3 ( .A(n274), .Y(REG1[2]) );
  BUFX32M U4 ( .A(n273), .Y(REG1[3]) );
  INVX12M U5 ( .A(n271), .Y(n3) );
  CLKINVX40M U6 ( .A(n3), .Y(REG0[7]) );
  INVX32M U7 ( .A(n5), .Y(REG1[4]) );
  INVX10M U8 ( .A(n272), .Y(n5) );
  BUFX20M U9 ( .A(n275), .Y(REG1[0]) );
  BUFX6M U10 ( .A(n260), .Y(n250) );
  NOR2BX4M U11 ( .AN(n27), .B(n245), .Y(n16) );
  NOR2X4M U12 ( .A(n248), .B(N13), .Y(n20) );
  NOR2X4M U13 ( .A(n247), .B(N13), .Y(n15) );
  NOR2BX2M U14 ( .AN(n13), .B(N14), .Y(n27) );
  NOR2BX4M U15 ( .AN(N13), .B(n247), .Y(n23) );
  NOR2BX4M U16 ( .AN(n38), .B(n246), .Y(n32) );
  NOR2BX4M U17 ( .AN(N13), .B(n248), .Y(n26) );
  NOR2BX4M U18 ( .AN(n27), .B(n246), .Y(n18) );
  INVX2M U19 ( .A(N11), .Y(n246) );
  INVX2M U20 ( .A(N12), .Y(n248) );
  MX4XLM U21 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n210), 
        .S1(n206), .Y(n11) );
  MX4XLM U22 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n210), 
        .S1(n205), .Y(n180) );
  MX4XLM U23 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n211), 
        .S1(n205), .Y(n184) );
  MX4XLM U24 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n211), 
        .S1(n205), .Y(n188) );
  MX4XLM U25 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n211), 
        .S1(n206), .Y(n192) );
  MX4XLM U26 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n208), 
        .S1(n206), .Y(n196) );
  MX4XLM U27 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n208), 
        .S1(n206), .Y(n200) );
  MX4XLM U28 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n208), 
        .S1(n206), .Y(n204) );
  INVX8M U29 ( .A(WrData[5]), .Y(n269) );
  INVX8M U30 ( .A(WrData[6]), .Y(n270) );
  CLKBUFX8M U31 ( .A(n209), .Y(n211) );
  CLKBUFX6M U32 ( .A(n209), .Y(n210) );
  CLKBUFX8M U33 ( .A(n247), .Y(n205) );
  CLKBUFX8M U34 ( .A(n261), .Y(n249) );
  CLKBUFX8M U35 ( .A(n261), .Y(n251) );
  CLKBUFX8M U36 ( .A(n261), .Y(n252) );
  CLKBUFX8M U37 ( .A(n261), .Y(n253) );
  CLKBUFX8M U38 ( .A(n260), .Y(n254) );
  CLKBUFX8M U39 ( .A(n260), .Y(n255) );
  CLKBUFX8M U40 ( .A(n260), .Y(n256) );
  CLKBUFX8M U41 ( .A(RST), .Y(n257) );
  CLKBUFX8M U42 ( .A(n249), .Y(n258) );
  BUFX4M U43 ( .A(n251), .Y(n259) );
  BUFX2M U44 ( .A(n207), .Y(n208) );
  BUFX4M U45 ( .A(n29), .Y(n227) );
  BUFX4M U46 ( .A(n31), .Y(n225) );
  BUFX4M U47 ( .A(n33), .Y(n223) );
  BUFX4M U48 ( .A(n34), .Y(n221) );
  BUFX4M U49 ( .A(n22), .Y(n235) );
  BUFX4M U50 ( .A(n24), .Y(n233) );
  BUFX4M U51 ( .A(n25), .Y(n231) );
  BUFX4M U52 ( .A(n28), .Y(n229) );
  BUFX4M U53 ( .A(n35), .Y(n219) );
  BUFX4M U54 ( .A(n36), .Y(n217) );
  BUFX4M U55 ( .A(n37), .Y(n215) );
  BUFX4M U56 ( .A(n39), .Y(n213) );
  BUFX4M U57 ( .A(n29), .Y(n226) );
  BUFX4M U58 ( .A(n31), .Y(n224) );
  BUFX4M U59 ( .A(n33), .Y(n222) );
  BUFX4M U60 ( .A(n34), .Y(n220) );
  BUFX4M U61 ( .A(n22), .Y(n234) );
  BUFX4M U62 ( .A(n24), .Y(n232) );
  BUFX4M U63 ( .A(n25), .Y(n230) );
  BUFX4M U64 ( .A(n28), .Y(n228) );
  BUFX4M U65 ( .A(n35), .Y(n218) );
  BUFX4M U66 ( .A(n36), .Y(n216) );
  BUFX4M U67 ( .A(n37), .Y(n214) );
  BUFX4M U68 ( .A(n39), .Y(n212) );
  BUFX2M U69 ( .A(n207), .Y(n209) );
  CLKBUFX8M U70 ( .A(n247), .Y(n206) );
  BUFX4M U71 ( .A(n17), .Y(n241) );
  BUFX4M U72 ( .A(n19), .Y(n239) );
  BUFX4M U73 ( .A(n21), .Y(n237) );
  BUFX4M U74 ( .A(n14), .Y(n243) );
  BUFX4M U75 ( .A(n17), .Y(n240) );
  BUFX4M U76 ( .A(n19), .Y(n238) );
  BUFX4M U77 ( .A(n21), .Y(n236) );
  BUFX4M U78 ( .A(n14), .Y(n242) );
  INVX4M U79 ( .A(n244), .Y(n262) );
  BUFX2M U80 ( .A(RST), .Y(n261) );
  BUFX2M U81 ( .A(RST), .Y(n260) );
  NOR2BX4M U82 ( .AN(n38), .B(n245), .Y(n30) );
  NAND2X2M U83 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U84 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U85 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U86 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U87 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U88 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U89 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U90 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U91 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U92 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U93 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U94 ( .A(n32), .B(n26), .Y(n39) );
  BUFX2M U95 ( .A(n245), .Y(n207) );
  NAND2X2M U96 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U97 ( .A(n15), .B(n16), .Y(n14) );
  NAND2X2M U98 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U99 ( .A(n20), .B(n18), .Y(n21) );
  BUFX4M U100 ( .A(n12), .Y(n244) );
  AND2X2M U101 ( .A(N14), .B(n13), .Y(n38) );
  INVX2M U102 ( .A(n246), .Y(n245) );
  INVX8M U103 ( .A(WrData[0]), .Y(n268) );
  INVX8M U104 ( .A(WrData[1]), .Y(n267) );
  INVX8M U105 ( .A(WrData[2]), .Y(n266) );
  INVX8M U106 ( .A(WrData[3]), .Y(n265) );
  INVX8M U107 ( .A(WrData[4]), .Y(n264) );
  INVX8M U108 ( .A(WrData[7]), .Y(n263) );
  NOR2BX4M U109 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  INVX2M U110 ( .A(n248), .Y(n247) );
  NAND2BX2M U111 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  OAI2BB2X1M U112 ( .B0(n269), .B1(n234), .A0N(\regArr[4][5] ), .A1N(n235), 
        .Y(n86) );
  OAI2BB2X1M U113 ( .B0(n270), .B1(n234), .A0N(\regArr[4][6] ), .A1N(n235), 
        .Y(n87) );
  OAI2BB2X1M U114 ( .B0(n269), .B1(n232), .A0N(\regArr[5][5] ), .A1N(n233), 
        .Y(n94) );
  OAI2BB2X1M U115 ( .B0(n270), .B1(n232), .A0N(\regArr[5][6] ), .A1N(n233), 
        .Y(n95) );
  OAI2BB2X1M U116 ( .B0(n269), .B1(n230), .A0N(\regArr[6][5] ), .A1N(n231), 
        .Y(n102) );
  OAI2BB2X1M U117 ( .B0(n270), .B1(n230), .A0N(\regArr[6][6] ), .A1N(n231), 
        .Y(n103) );
  OAI2BB2X1M U118 ( .B0(n269), .B1(n228), .A0N(\regArr[7][5] ), .A1N(n229), 
        .Y(n110) );
  OAI2BB2X1M U119 ( .B0(n270), .B1(n228), .A0N(\regArr[7][6] ), .A1N(n229), 
        .Y(n111) );
  OAI2BB2X1M U120 ( .B0(n269), .B1(n226), .A0N(\regArr[8][5] ), .A1N(n227), 
        .Y(n118) );
  OAI2BB2X1M U121 ( .B0(n270), .B1(n226), .A0N(\regArr[8][6] ), .A1N(n227), 
        .Y(n119) );
  OAI2BB2X1M U122 ( .B0(n269), .B1(n224), .A0N(\regArr[9][5] ), .A1N(n225), 
        .Y(n126) );
  OAI2BB2X1M U123 ( .B0(n270), .B1(n224), .A0N(\regArr[9][6] ), .A1N(n225), 
        .Y(n127) );
  OAI2BB2X1M U124 ( .B0(n269), .B1(n222), .A0N(\regArr[10][5] ), .A1N(n223), 
        .Y(n134) );
  OAI2BB2X1M U125 ( .B0(n270), .B1(n222), .A0N(\regArr[10][6] ), .A1N(n223), 
        .Y(n135) );
  OAI2BB2X1M U126 ( .B0(n269), .B1(n220), .A0N(\regArr[11][5] ), .A1N(n221), 
        .Y(n142) );
  OAI2BB2X1M U127 ( .B0(n270), .B1(n220), .A0N(\regArr[11][6] ), .A1N(n221), 
        .Y(n143) );
  OAI2BB2X1M U128 ( .B0(n269), .B1(n218), .A0N(\regArr[12][5] ), .A1N(n219), 
        .Y(n150) );
  OAI2BB2X1M U129 ( .B0(n270), .B1(n218), .A0N(\regArr[12][6] ), .A1N(n219), 
        .Y(n151) );
  OAI2BB2X1M U130 ( .B0(n269), .B1(n216), .A0N(\regArr[13][5] ), .A1N(n217), 
        .Y(n158) );
  OAI2BB2X1M U131 ( .B0(n270), .B1(n216), .A0N(\regArr[13][6] ), .A1N(n217), 
        .Y(n159) );
  OAI2BB2X1M U132 ( .B0(n269), .B1(n214), .A0N(\regArr[14][5] ), .A1N(n215), 
        .Y(n166) );
  OAI2BB2X1M U133 ( .B0(n270), .B1(n214), .A0N(\regArr[14][6] ), .A1N(n215), 
        .Y(n167) );
  OAI2BB2X1M U134 ( .B0(n269), .B1(n212), .A0N(\regArr[15][5] ), .A1N(n213), 
        .Y(n174) );
  OAI2BB2X1M U135 ( .B0(n270), .B1(n212), .A0N(\regArr[15][6] ), .A1N(n213), 
        .Y(n175) );
  OAI2BB2X1M U136 ( .B0(n268), .B1(n235), .A0N(\regArr[4][0] ), .A1N(n235), 
        .Y(n81) );
  OAI2BB2X1M U137 ( .B0(n267), .B1(n234), .A0N(\regArr[4][1] ), .A1N(n235), 
        .Y(n82) );
  OAI2BB2X1M U138 ( .B0(n266), .B1(n234), .A0N(\regArr[4][2] ), .A1N(n235), 
        .Y(n83) );
  OAI2BB2X1M U139 ( .B0(n265), .B1(n234), .A0N(\regArr[4][3] ), .A1N(n235), 
        .Y(n84) );
  OAI2BB2X1M U140 ( .B0(n264), .B1(n234), .A0N(\regArr[4][4] ), .A1N(n235), 
        .Y(n85) );
  OAI2BB2X1M U141 ( .B0(n263), .B1(n234), .A0N(\regArr[4][7] ), .A1N(n235), 
        .Y(n88) );
  OAI2BB2X1M U142 ( .B0(n268), .B1(n233), .A0N(\regArr[5][0] ), .A1N(n233), 
        .Y(n89) );
  OAI2BB2X1M U143 ( .B0(n267), .B1(n232), .A0N(\regArr[5][1] ), .A1N(n233), 
        .Y(n90) );
  OAI2BB2X1M U144 ( .B0(n266), .B1(n232), .A0N(\regArr[5][2] ), .A1N(n233), 
        .Y(n91) );
  OAI2BB2X1M U145 ( .B0(n265), .B1(n232), .A0N(\regArr[5][3] ), .A1N(n233), 
        .Y(n92) );
  OAI2BB2X1M U146 ( .B0(n264), .B1(n232), .A0N(\regArr[5][4] ), .A1N(n233), 
        .Y(n93) );
  OAI2BB2X1M U147 ( .B0(n263), .B1(n232), .A0N(\regArr[5][7] ), .A1N(n233), 
        .Y(n96) );
  OAI2BB2X1M U148 ( .B0(n268), .B1(n231), .A0N(\regArr[6][0] ), .A1N(n231), 
        .Y(n97) );
  OAI2BB2X1M U149 ( .B0(n267), .B1(n230), .A0N(\regArr[6][1] ), .A1N(n231), 
        .Y(n98) );
  OAI2BB2X1M U150 ( .B0(n266), .B1(n230), .A0N(\regArr[6][2] ), .A1N(n231), 
        .Y(n99) );
  OAI2BB2X1M U151 ( .B0(n265), .B1(n230), .A0N(\regArr[6][3] ), .A1N(n231), 
        .Y(n100) );
  OAI2BB2X1M U152 ( .B0(n264), .B1(n230), .A0N(\regArr[6][4] ), .A1N(n231), 
        .Y(n101) );
  OAI2BB2X1M U153 ( .B0(n263), .B1(n230), .A0N(\regArr[6][7] ), .A1N(n231), 
        .Y(n104) );
  OAI2BB2X1M U154 ( .B0(n268), .B1(n229), .A0N(\regArr[7][0] ), .A1N(n229), 
        .Y(n105) );
  OAI2BB2X1M U155 ( .B0(n267), .B1(n228), .A0N(\regArr[7][1] ), .A1N(n229), 
        .Y(n106) );
  OAI2BB2X1M U156 ( .B0(n266), .B1(n228), .A0N(\regArr[7][2] ), .A1N(n229), 
        .Y(n107) );
  OAI2BB2X1M U157 ( .B0(n265), .B1(n228), .A0N(\regArr[7][3] ), .A1N(n229), 
        .Y(n108) );
  OAI2BB2X1M U158 ( .B0(n264), .B1(n228), .A0N(\regArr[7][4] ), .A1N(n229), 
        .Y(n109) );
  OAI2BB2X1M U159 ( .B0(n263), .B1(n228), .A0N(\regArr[7][7] ), .A1N(n229), 
        .Y(n112) );
  OAI2BB2X1M U160 ( .B0(n268), .B1(n227), .A0N(\regArr[8][0] ), .A1N(n227), 
        .Y(n113) );
  OAI2BB2X1M U161 ( .B0(n267), .B1(n226), .A0N(\regArr[8][1] ), .A1N(n227), 
        .Y(n114) );
  OAI2BB2X1M U162 ( .B0(n266), .B1(n226), .A0N(\regArr[8][2] ), .A1N(n227), 
        .Y(n115) );
  OAI2BB2X1M U163 ( .B0(n265), .B1(n226), .A0N(\regArr[8][3] ), .A1N(n227), 
        .Y(n116) );
  OAI2BB2X1M U164 ( .B0(n264), .B1(n226), .A0N(\regArr[8][4] ), .A1N(n227), 
        .Y(n117) );
  OAI2BB2X1M U165 ( .B0(n263), .B1(n226), .A0N(\regArr[8][7] ), .A1N(n227), 
        .Y(n120) );
  OAI2BB2X1M U166 ( .B0(n268), .B1(n225), .A0N(\regArr[9][0] ), .A1N(n225), 
        .Y(n121) );
  OAI2BB2X1M U167 ( .B0(n267), .B1(n224), .A0N(\regArr[9][1] ), .A1N(n225), 
        .Y(n122) );
  OAI2BB2X1M U168 ( .B0(n266), .B1(n224), .A0N(\regArr[9][2] ), .A1N(n225), 
        .Y(n123) );
  OAI2BB2X1M U169 ( .B0(n265), .B1(n224), .A0N(\regArr[9][3] ), .A1N(n225), 
        .Y(n124) );
  OAI2BB2X1M U170 ( .B0(n264), .B1(n224), .A0N(\regArr[9][4] ), .A1N(n225), 
        .Y(n125) );
  OAI2BB2X1M U171 ( .B0(n263), .B1(n224), .A0N(\regArr[9][7] ), .A1N(n225), 
        .Y(n128) );
  OAI2BB2X1M U172 ( .B0(n268), .B1(n223), .A0N(\regArr[10][0] ), .A1N(n223), 
        .Y(n129) );
  OAI2BB2X1M U173 ( .B0(n267), .B1(n222), .A0N(\regArr[10][1] ), .A1N(n223), 
        .Y(n130) );
  OAI2BB2X1M U174 ( .B0(n266), .B1(n222), .A0N(\regArr[10][2] ), .A1N(n223), 
        .Y(n131) );
  OAI2BB2X1M U175 ( .B0(n265), .B1(n222), .A0N(\regArr[10][3] ), .A1N(n223), 
        .Y(n132) );
  OAI2BB2X1M U176 ( .B0(n264), .B1(n222), .A0N(\regArr[10][4] ), .A1N(n223), 
        .Y(n133) );
  OAI2BB2X1M U177 ( .B0(n263), .B1(n222), .A0N(\regArr[10][7] ), .A1N(n223), 
        .Y(n136) );
  OAI2BB2X1M U178 ( .B0(n268), .B1(n221), .A0N(\regArr[11][0] ), .A1N(n221), 
        .Y(n137) );
  OAI2BB2X1M U179 ( .B0(n267), .B1(n220), .A0N(\regArr[11][1] ), .A1N(n221), 
        .Y(n138) );
  OAI2BB2X1M U180 ( .B0(n266), .B1(n220), .A0N(\regArr[11][2] ), .A1N(n221), 
        .Y(n139) );
  OAI2BB2X1M U181 ( .B0(n265), .B1(n220), .A0N(\regArr[11][3] ), .A1N(n221), 
        .Y(n140) );
  OAI2BB2X1M U182 ( .B0(n264), .B1(n220), .A0N(\regArr[11][4] ), .A1N(n221), 
        .Y(n141) );
  OAI2BB2X1M U183 ( .B0(n263), .B1(n220), .A0N(\regArr[11][7] ), .A1N(n221), 
        .Y(n144) );
  OAI2BB2X1M U184 ( .B0(n268), .B1(n219), .A0N(\regArr[12][0] ), .A1N(n219), 
        .Y(n145) );
  OAI2BB2X1M U185 ( .B0(n267), .B1(n218), .A0N(\regArr[12][1] ), .A1N(n219), 
        .Y(n146) );
  OAI2BB2X1M U186 ( .B0(n266), .B1(n218), .A0N(\regArr[12][2] ), .A1N(n219), 
        .Y(n147) );
  OAI2BB2X1M U187 ( .B0(n265), .B1(n218), .A0N(\regArr[12][3] ), .A1N(n219), 
        .Y(n148) );
  OAI2BB2X1M U188 ( .B0(n264), .B1(n218), .A0N(\regArr[12][4] ), .A1N(n219), 
        .Y(n149) );
  OAI2BB2X1M U189 ( .B0(n263), .B1(n218), .A0N(\regArr[12][7] ), .A1N(n219), 
        .Y(n152) );
  OAI2BB2X1M U190 ( .B0(n268), .B1(n217), .A0N(\regArr[13][0] ), .A1N(n217), 
        .Y(n153) );
  OAI2BB2X1M U191 ( .B0(n267), .B1(n216), .A0N(\regArr[13][1] ), .A1N(n217), 
        .Y(n154) );
  OAI2BB2X1M U192 ( .B0(n266), .B1(n216), .A0N(\regArr[13][2] ), .A1N(n217), 
        .Y(n155) );
  OAI2BB2X1M U193 ( .B0(n265), .B1(n216), .A0N(\regArr[13][3] ), .A1N(n217), 
        .Y(n156) );
  OAI2BB2X1M U194 ( .B0(n264), .B1(n216), .A0N(\regArr[13][4] ), .A1N(n217), 
        .Y(n157) );
  OAI2BB2X1M U195 ( .B0(n263), .B1(n216), .A0N(\regArr[13][7] ), .A1N(n217), 
        .Y(n160) );
  OAI2BB2X1M U196 ( .B0(n268), .B1(n215), .A0N(\regArr[14][0] ), .A1N(n215), 
        .Y(n161) );
  OAI2BB2X1M U197 ( .B0(n267), .B1(n214), .A0N(\regArr[14][1] ), .A1N(n215), 
        .Y(n162) );
  OAI2BB2X1M U198 ( .B0(n266), .B1(n214), .A0N(\regArr[14][2] ), .A1N(n215), 
        .Y(n163) );
  OAI2BB2X1M U199 ( .B0(n265), .B1(n214), .A0N(\regArr[14][3] ), .A1N(n215), 
        .Y(n164) );
  OAI2BB2X1M U200 ( .B0(n264), .B1(n214), .A0N(\regArr[14][4] ), .A1N(n215), 
        .Y(n165) );
  OAI2BB2X1M U201 ( .B0(n263), .B1(n214), .A0N(\regArr[14][7] ), .A1N(n215), 
        .Y(n168) );
  OAI2BB2X1M U202 ( .B0(n268), .B1(n213), .A0N(\regArr[15][0] ), .A1N(n213), 
        .Y(n169) );
  OAI2BB2X1M U203 ( .B0(n267), .B1(n212), .A0N(\regArr[15][1] ), .A1N(n213), 
        .Y(n170) );
  OAI2BB2X1M U204 ( .B0(n266), .B1(n212), .A0N(\regArr[15][2] ), .A1N(n213), 
        .Y(n171) );
  OAI2BB2X1M U205 ( .B0(n265), .B1(n212), .A0N(\regArr[15][3] ), .A1N(n213), 
        .Y(n172) );
  OAI2BB2X1M U206 ( .B0(n264), .B1(n212), .A0N(\regArr[15][4] ), .A1N(n213), 
        .Y(n173) );
  OAI2BB2X1M U207 ( .B0(n263), .B1(n212), .A0N(\regArr[15][7] ), .A1N(n213), 
        .Y(n176) );
  MX4X1M U208 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n211), .S1(n205), .Y(n183) );
  MX4X1M U209 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n211), .S1(n205), .Y(n187) );
  MX4X1M U210 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n211), .S1(n205), .Y(n191) );
  MX4X1M U211 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n245), .S1(n206), .Y(n195) );
  MX4X1M U212 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(N11), .S1(n206), .Y(n199) );
  MX4X1M U213 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(N11), .S1(n206), .Y(n203) );
  MX4X1M U214 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n211), .S1(n205), .Y(n181) );
  MX4X1M U215 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n211), .S1(n205), .Y(n185) );
  MX4X1M U216 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n211), .S1(n205), .Y(n189) );
  MX4X1M U217 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n208), .S1(n206), .Y(n193) );
  MX4X1M U218 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n210), .S1(n206), .Y(n197) );
  MX4X1M U219 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n211), .S1(n206), .Y(n201) );
  MX4X1M U220 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(n210), .S1(n205), .Y(n10) );
  MX4X1M U221 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n210), .S1(n205), .Y(n179) );
  MX4X1M U222 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n210), .S1(n206), .Y(n8) );
  MX4X1M U223 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n210), .S1(n205), .Y(n177) );
  AO22X1M U224 ( .A0(N43), .A1(n262), .B0(RdData[0]), .B1(n244), .Y(n40) );
  MX4XLM U225 ( .A(n11), .B(n9), .C(n10), .D(n8), .S0(N14), .S1(N13), .Y(N43)
         );
  MX4X1M U226 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(n210), .S1(N12), .Y(n9) );
  AO22X1M U227 ( .A0(N42), .A1(n262), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4XLM U228 ( .A(n180), .B(n178), .C(n179), .D(n177), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U229 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(n210), .S1(N12), .Y(n178) );
  AO22X1M U230 ( .A0(N41), .A1(n262), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4XLM U231 ( .A(n184), .B(n182), .C(n183), .D(n181), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U232 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n211), .S1(n205), .Y(n182) );
  AO22X1M U233 ( .A0(N40), .A1(n262), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4XLM U234 ( .A(n188), .B(n186), .C(n187), .D(n185), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U235 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n211), .S1(n205), .Y(n186) );
  AO22X1M U236 ( .A0(N39), .A1(n262), .B0(RdData[4]), .B1(n244), .Y(n44) );
  MX4XLM U237 ( .A(n192), .B(n190), .C(n191), .D(n189), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U238 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n211), .S1(n205), .Y(n190) );
  AO22X1M U239 ( .A0(N38), .A1(n262), .B0(RdData[5]), .B1(n244), .Y(n45) );
  MX4XLM U240 ( .A(n196), .B(n194), .C(n195), .D(n193), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U241 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(N11), .S1(n206), .Y(n194) );
  AO22X1M U242 ( .A0(N37), .A1(n262), .B0(RdData[6]), .B1(n244), .Y(n46) );
  MX4XLM U243 ( .A(n200), .B(n198), .C(n199), .D(n197), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U244 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n207), .S1(n206), .Y(n198) );
  AO22X1M U245 ( .A0(N36), .A1(n262), .B0(RdData[7]), .B1(n244), .Y(n47) );
  MX4XLM U246 ( .A(n204), .B(n202), .C(n203), .D(n201), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U247 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n207), .S1(n206), .Y(n202) );
  OAI2BB2X1M U248 ( .B0(n242), .B1(n269), .A0N(REG0[5]), .A1N(n243), .Y(n54)
         );
  OAI2BB2X1M U249 ( .B0(n242), .B1(n270), .A0N(REG0[6]), .A1N(n243), .Y(n55)
         );
  OAI2BB2X1M U250 ( .B0(n269), .B1(n240), .A0N(REG1[5]), .A1N(n241), .Y(n62)
         );
  OAI2BB2X1M U251 ( .B0(n270), .B1(n240), .A0N(REG1[6]), .A1N(n241), .Y(n63)
         );
  OAI2BB2X1M U252 ( .B0(n269), .B1(n238), .A0N(REG2[5]), .A1N(n239), .Y(n70)
         );
  OAI2BB2X1M U253 ( .B0(n270), .B1(n238), .A0N(REG2[6]), .A1N(n239), .Y(n71)
         );
  OAI2BB2X1M U254 ( .B0(n270), .B1(n236), .A0N(REG3[6]), .A1N(n237), .Y(n79)
         );
  OAI2BB2X1M U255 ( .B0(n243), .B1(n268), .A0N(REG0[0]), .A1N(n243), .Y(n49)
         );
  OAI2BB2X1M U256 ( .B0(n242), .B1(n267), .A0N(REG0[1]), .A1N(n243), .Y(n50)
         );
  OAI2BB2X1M U257 ( .B0(n242), .B1(n266), .A0N(REG0[2]), .A1N(n243), .Y(n51)
         );
  OAI2BB2X1M U258 ( .B0(n242), .B1(n265), .A0N(REG0[3]), .A1N(n243), .Y(n52)
         );
  OAI2BB2X1M U259 ( .B0(n242), .B1(n264), .A0N(REG0[4]), .A1N(n243), .Y(n53)
         );
  OAI2BB2X1M U260 ( .B0(n242), .B1(n263), .A0N(REG0[7]), .A1N(n243), .Y(n56)
         );
  OAI2BB2X1M U261 ( .B0(n268), .B1(n241), .A0N(REG1[0]), .A1N(n241), .Y(n57)
         );
  OAI2BB2X1M U262 ( .B0(n267), .B1(n240), .A0N(REG1[1]), .A1N(n241), .Y(n58)
         );
  OAI2BB2X1M U263 ( .B0(n266), .B1(n240), .A0N(REG1[2]), .A1N(n241), .Y(n59)
         );
  OAI2BB2X1M U264 ( .B0(n265), .B1(n240), .A0N(REG1[3]), .A1N(n241), .Y(n60)
         );
  OAI2BB2X1M U265 ( .B0(n264), .B1(n240), .A0N(REG1[4]), .A1N(n241), .Y(n61)
         );
  OAI2BB2X1M U266 ( .B0(n263), .B1(n240), .A0N(REG1[7]), .A1N(n241), .Y(n64)
         );
  OAI2BB2X1M U267 ( .B0(n267), .B1(n238), .A0N(REG2[1]), .A1N(n239), .Y(n66)
         );
  OAI2BB2X1M U268 ( .B0(n266), .B1(n238), .A0N(REG2[2]), .A1N(n239), .Y(n67)
         );
  OAI2BB2X1M U269 ( .B0(n265), .B1(n238), .A0N(REG2[3]), .A1N(n239), .Y(n68)
         );
  OAI2BB2X1M U270 ( .B0(n264), .B1(n238), .A0N(REG2[4]), .A1N(n239), .Y(n69)
         );
  OAI2BB2X1M U271 ( .B0(n268), .B1(n237), .A0N(REG3[0]), .A1N(n237), .Y(n73)
         );
  OAI2BB2X1M U272 ( .B0(n267), .B1(n236), .A0N(REG3[1]), .A1N(n237), .Y(n74)
         );
  OAI2BB2X1M U273 ( .B0(n266), .B1(n236), .A0N(REG3[2]), .A1N(n237), .Y(n75)
         );
  OAI2BB2X1M U274 ( .B0(n265), .B1(n236), .A0N(REG3[3]), .A1N(n237), .Y(n76)
         );
  OAI2BB2X1M U275 ( .B0(n264), .B1(n236), .A0N(REG3[4]), .A1N(n237), .Y(n77)
         );
  OAI2BB2X1M U276 ( .B0(n263), .B1(n236), .A0N(REG3[7]), .A1N(n237), .Y(n80)
         );
  OAI2BB2X1M U277 ( .B0(n269), .B1(n236), .A0N(REG3[5]), .A1N(n237), .Y(n78)
         );
  OAI2BB2X1M U278 ( .B0(n268), .B1(n239), .A0N(REG2[0]), .A1N(n239), .Y(n65)
         );
  OAI2BB2X1M U279 ( .B0(n263), .B1(n238), .A0N(REG2[7]), .A1N(n239), .Y(n72)
         );
  OAI2BB1X2M U280 ( .A0N(RdData_VLD), .A1N(n13), .B0(n244), .Y(n48) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   n27, n28, n29, \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] ,
         \u_div/SumTmp[1][2] , \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] ,
         \u_div/SumTmp[1][5] , \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] ,
         \u_div/SumTmp[2][1] , \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] ,
         \u_div/SumTmp[2][4] , \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] ,
         \u_div/SumTmp[3][1] , \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] ,
         \u_div/SumTmp[3][4] , \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] ,
         \u_div/SumTmp[4][2] , \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] ,
         \u_div/SumTmp[5][1] , \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] ,
         \u_div/SumTmp[6][1] , \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] ,
         \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] ,
         \u_div/CryTmp[0][5] , \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] ,
         \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] ,
         \u_div/CryTmp[1][4] , \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] ,
         \u_div/CryTmp[1][7] , \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] ,
         \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] ,
         \u_div/CryTmp[2][6] , \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] ,
         \u_div/CryTmp[3][3] , \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] ,
         \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] ,
         \u_div/CryTmp[4][4] , \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] ,
         \u_div/CryTmp[5][3] , \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] ,
         \u_div/CryTmp[7][1] , \u_div/PartRem[1][1] , \u_div/PartRem[1][2] ,
         \u_div/PartRem[1][3] , \u_div/PartRem[1][4] , \u_div/PartRem[1][5] ,
         \u_div/PartRem[1][6] , \u_div/PartRem[1][7] , \u_div/PartRem[2][1] ,
         \u_div/PartRem[2][2] , \u_div/PartRem[2][3] , \u_div/PartRem[2][4] ,
         \u_div/PartRem[2][5] , \u_div/PartRem[2][6] , \u_div/PartRem[3][1] ,
         \u_div/PartRem[3][2] , \u_div/PartRem[3][3] , \u_div/PartRem[3][4] ,
         \u_div/PartRem[3][5] , \u_div/PartRem[4][1] , \u_div/PartRem[4][2] ,
         \u_div/PartRem[4][3] , \u_div/PartRem[4][4] , \u_div/PartRem[5][1] ,
         \u_div/PartRem[5][2] , \u_div/PartRem[5][3] , \u_div/PartRem[6][1] ,
         \u_div/PartRem[6][2] , \u_div/PartRem[7][1] , n1, n3, n6, n7, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26;

  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n19), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n18), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n19), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX4M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n18), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n17), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n16), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFHX8M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n20), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n22), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n20), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n22), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX4M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n21), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_5_2  ( .A(n3), .B(n21), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n22), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n19), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_2  ( .A(n6), .B(n21), .CI(
        \u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n20), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n21), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n22), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n21), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n22), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n22), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n20), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n22), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n17), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n21), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n18), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n20), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n19), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  CLKMX2X2M U1 ( .A(n3), .B(\u_div/SumTmp[5][2] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][3] ) );
  BUFX20M U2 ( .A(n15), .Y(quotient[5]) );
  CLKBUFX40M U3 ( .A(n29), .Y(n1) );
  CLKBUFX40M U4 ( .A(n29), .Y(quotient[1]) );
  AND2X12M U5 ( .A(\u_div/CryTmp[6][2] ), .B(n14), .Y(quotient[6]) );
  CLKAND2X3M U6 ( .A(\u_div/CryTmp[5][3] ), .B(n24), .Y(n15) );
  BUFX16M U7 ( .A(\u_div/PartRem[6][2] ), .Y(n3) );
  NAND2X12M U8 ( .A(n11), .B(n12), .Y(\u_div/PartRem[6][1] ) );
  CLKNAND2X8M U9 ( .A(a[6]), .B(n10), .Y(n11) );
  AND2X12M U10 ( .A(\u_div/CryTmp[3][5] ), .B(n9), .Y(quotient[3]) );
  MX2X4M U11 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(n1), .Y(
        \u_div/PartRem[1][1] ) );
  CLKBUFX8M U12 ( .A(n27), .Y(quotient[4]) );
  BUFX20M U13 ( .A(\u_div/PartRem[4][2] ), .Y(n6) );
  CLKMX2X6M U14 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  OR2X8M U15 ( .A(a[7]), .B(n23), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U16 ( .A(n23), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  OR2X12M U17 ( .A(a[6]), .B(n23), .Y(\u_div/CryTmp[6][1] ) );
  XNOR2X8M U18 ( .A(n23), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X4M U19 ( .A(n23), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  INVX32M U20 ( .A(b[0]), .Y(n23) );
  MX2X8M U21 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(n27), .Y(
        \u_div/PartRem[4][1] ) );
  MX2X4M U22 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  BUFX12M U23 ( .A(n28), .Y(quotient[2]) );
  MX2X2M U24 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  AND2X2M U25 ( .A(\u_div/CryTmp[4][4] ), .B(n25), .Y(n27) );
  MX2X2M U26 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  MX2X2M U27 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  MX2X2M U28 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  MX2X2M U29 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  MX2X6M U30 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKINVX32M U31 ( .A(n7), .Y(quotient[7]) );
  MX2X6M U32 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X12M U33 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  MX2XLM U34 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  MX2X1M U35 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKAND2X6M U36 ( .A(\u_div/CryTmp[2][6] ), .B(n26), .Y(n28) );
  AND2X12M U37 ( .A(\u_div/CryTmp[1][7] ), .B(n16), .Y(n29) );
  MX2X12M U38 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  OR2X8M U39 ( .A(a[5]), .B(n23), .Y(\u_div/CryTmp[5][1] ) );
  INVX8M U40 ( .A(b[3]), .Y(n20) );
  AND3X12M U41 ( .A(n26), .B(n19), .C(n18), .Y(n25) );
  NAND2X12M U42 ( .A(n24), .B(n13), .Y(n7) );
  MX2X6M U43 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  NAND2X4M U44 ( .A(\u_div/SumTmp[6][0] ), .B(quotient[6]), .Y(n12) );
  MX2X1M U45 ( .A(n6), .B(\u_div/SumTmp[3][2] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][3] ) );
  INVX24M U46 ( .A(b[5]), .Y(n18) );
  AND2X1M U47 ( .A(n26), .B(n18), .Y(n9) );
  MX2X4M U48 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  AND3X4M U49 ( .A(\u_div/CryTmp[7][1] ), .B(n22), .C(n21), .Y(n13) );
  AND2X1M U50 ( .A(n24), .B(n21), .Y(n14) );
  INVX4M U51 ( .A(quotient[6]), .Y(n10) );
  AND2X12M U52 ( .A(n25), .B(n20), .Y(n24) );
  INVX20M U53 ( .A(b[1]), .Y(n22) );
  INVX20M U54 ( .A(b[2]), .Y(n21) );
  MX2X1M U55 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  INVX16M U56 ( .A(b[4]), .Y(n19) );
  OR2X1M U57 ( .A(a[0]), .B(n23), .Y(\u_div/CryTmp[0][1] ) );
  NOR2X12M U58 ( .A(b[6]), .B(b[7]), .Y(n26) );
  MX2X1M U59 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  MX2X1M U60 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  XNOR2X1M U61 ( .A(n23), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X1M U62 ( .A(n23), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X1M U63 ( .A(n23), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X1M U64 ( .A(n23), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  CLKINVX1M U65 ( .A(b[7]), .Y(n16) );
  OR2X2M U66 ( .A(a[4]), .B(n23), .Y(\u_div/CryTmp[4][1] ) );
  OR2X2M U67 ( .A(a[3]), .B(n23), .Y(\u_div/CryTmp[3][1] ) );
  OR2X2M U68 ( .A(a[1]), .B(n23), .Y(\u_div/CryTmp[1][1] ) );
  OR2X2M U69 ( .A(a[2]), .B(n23), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U70 ( .A(b[6]), .Y(n17) );
  CLKMX2X2M U71 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U72 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U73 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U74 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U75 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
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
  CLKINVX1M U1 ( .A(B[0]), .Y(n8) );
  INVXLM U2 ( .A(B[1]), .Y(n7) );
  INVXLM U3 ( .A(B[4]), .Y(n4) );
  INVXLM U4 ( .A(B[5]), .Y(n3) );
  INVXLM U5 ( .A(B[2]), .Y(n6) );
  INVXLM U6 ( .A(B[3]), .Y(n5) );
  INVXLM U7 ( .A(B[7]), .Y(n1) );
  INVX2M U8 ( .A(B[6]), .Y(n2) );
  XNOR2X2M U9 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  OR2X2M U10 ( .A(A[0]), .B(n8), .Y(carry[1]) );
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
  XOR2X1M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
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

  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , 
        \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , 
        \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n12, 
        n11, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
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
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n6), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
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
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n7), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  NOR2X2M U10 ( .A(n18), .B(n32), .Y(\ab[0][6] ) );
  NOR2X2M U11 ( .A(n18), .B(n31), .Y(\ab[1][6] ) );
  NOR2X2M U12 ( .A(n19), .B(n32), .Y(\ab[0][5] ) );
  NOR2X2M U13 ( .A(n20), .B(n32), .Y(\ab[0][4] ) );
  NOR2X2M U14 ( .A(n21), .B(n32), .Y(\ab[0][3] ) );
  NOR2X2M U15 ( .A(n20), .B(n31), .Y(\ab[1][4] ) );
  NOR2X2M U16 ( .A(n21), .B(n31), .Y(\ab[1][3] ) );
  NOR2X2M U17 ( .A(n22), .B(n31), .Y(\ab[1][2] ) );
  CLKXOR2X2M U18 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  NOR2X2M U19 ( .A(n22), .B(n32), .Y(\ab[0][2] ) );
  NOR2X2M U20 ( .A(n23), .B(n32), .Y(\ab[0][1] ) );
  NOR2X2M U21 ( .A(n17), .B(n32), .Y(\ab[0][7] ) );
  NOR2X2M U22 ( .A(n23), .B(n31), .Y(\ab[1][1] ) );
  NOR2X2M U23 ( .A(n24), .B(n31), .Y(\ab[1][0] ) );
  NOR2X2M U24 ( .A(n19), .B(n31), .Y(\ab[1][5] ) );
  NOR2X2M U25 ( .A(n25), .B(n17), .Y(\ab[7][7] ) );
  CLKINVX4M U26 ( .A(A[4]), .Y(n28) );
  CLKINVX4M U27 ( .A(A[5]), .Y(n27) );
  CLKINVX4M U28 ( .A(A[6]), .Y(n26) );
  CLKINVX4M U29 ( .A(A[7]), .Y(n25) );
  CLKINVX4M U30 ( .A(B[2]), .Y(n22) );
  CLKINVX4M U31 ( .A(B[3]), .Y(n21) );
  CLKINVX4M U32 ( .A(B[4]), .Y(n20) );
  CLKINVX4M U33 ( .A(B[5]), .Y(n19) );
  CLKINVX4M U34 ( .A(B[0]), .Y(n24) );
  CLKINVX4M U35 ( .A(B[1]), .Y(n23) );
  CLKINVX4M U36 ( .A(B[7]), .Y(n17) );
  CLKXOR2X2M U37 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U38 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U39 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  INVX4M U40 ( .A(A[1]), .Y(n31) );
  AND2X2M U41 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U42 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  INVX4M U43 ( .A(A[2]), .Y(n30) );
  AND2X2M U44 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  CLKXOR2X2M U45 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U46 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX4M U47 ( .A(A[3]), .Y(n29) );
  AND2X2M U48 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U49 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U50 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U51 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U52 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  XOR2X1M U53 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XOR2X1M U54 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  INVX4M U55 ( .A(B[6]), .Y(n18) );
  INVX4M U56 ( .A(A[0]), .Y(n32) );
  XOR2X1M U57 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1M U58 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2X1M U59 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2X1M U60 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
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
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, 
        OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N159, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n41, n42, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167;
  wire   [15:0] ALU_OUT_Comb;

  OAI2BB1X4M U77 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 div_52 ( .a({n41, A[6], n26, n24, 
        n21, n18, n15, n13}), .b({B[7], n12, B[5:0]}), .quotient({N132, N131, 
        N130, N129, N128, N127, N126, N125}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_46 ( .A({1'b0, n41, n29, n26, n24, 
        n21, n18, n15, n13}), .B({1'b0, B[7], n12, B[5:0]}), .CI(1'b0), .DIFF(
        {N108, N107, N106, N105, N104, N103, N102, N101, N100}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 add_43 ( .A({1'b0, n41, A[6], n26, 
        n24, n21, n18, n15, n13}), .B({1'b0, B[7], n12, B[5:0]}), .CI(1'b0), 
        .SUM({N99, N98, N97, N96, N95, N94, N93, N92, N91}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_49 ( .A({n41, n29, n26, n24, 
        n21, n18, n15, n13}), .B({B[7], n12, B[5:0]}), .TC(1'b0), .PRODUCT({
        N124, N123, N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, 
        N112, N111, N110, N109}) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(n117), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(n117), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(n117), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(n116), .Q(
        ALU_OUT[8]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(n117), .Q(OUT_VALID) );
  DFFRQX1M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(n117), .Q(
        ALU_OUT[0]) );
  INVX24M U3 ( .A(n30), .Y(n41) );
  BUFX32M U4 ( .A(B[6]), .Y(n12) );
  NOR2X8M U7 ( .A(n6), .B(n162), .Y(ALU_OUT_Comb[0]) );
  AND3X6M U8 ( .A(n93), .B(n94), .C(n95), .Y(n6) );
  NOR2X4M U9 ( .A(n166), .B(n11), .Y(n105) );
  INVX6M U10 ( .A(EN), .Y(n162) );
  AOI31X2M U11 ( .A0(n81), .A1(n82), .A2(n83), .B0(n162), .Y(ALU_OUT_Comb[1])
         );
  AND3X2M U12 ( .A(n7), .B(n8), .C(n9), .Y(n82) );
  AOI222X4M U13 ( .A0(N109), .A1(n108), .B0(n13), .B1(n110), .C0(N125), .C1(n5), .Y(n94) );
  INVX4M U14 ( .A(A[5]), .Y(n25) );
  OR2X2M U15 ( .A(n107), .B(n167), .Y(n3) );
  NAND2X2M U16 ( .A(n99), .B(n105), .Y(n4) );
  AOI2B1X1M U17 ( .A1N(n143), .A0(n142), .B0(n141), .Y(n144) );
  INVX2M U18 ( .A(n144), .Y(n152) );
  INVX4M U19 ( .A(A[4]), .Y(n23) );
  INVX2M U20 ( .A(A[6]), .Y(n28) );
  INVX2M U21 ( .A(B[2]), .Y(n148) );
  INVX2M U22 ( .A(B[3]), .Y(n150) );
  XNOR2X4M U23 ( .A(n29), .B(n12), .Y(n138) );
  OAI31X2M U24 ( .A0(n131), .A1(n122), .A2(n121), .B0(n132), .Y(n124) );
  AOI211X2M U25 ( .A0(n16), .A1(n147), .B0(n128), .C0(n120), .Y(n121) );
  NOR2X2M U26 ( .A(n145), .B(B[7]), .Y(n141) );
  AOI211X2M U27 ( .A0(n129), .A1(n160), .B0(n128), .C0(n127), .Y(n130) );
  NAND2BX2M U28 ( .AN(n122), .B(n133), .Y(n128) );
  OAI21X2M U29 ( .A0(n141), .A1(n126), .B0(n142), .Y(N159) );
  BUFX4M U30 ( .A(n49), .Y(n5) );
  NOR3BX2M U31 ( .AN(n105), .B(n165), .C(ALU_FUN[2]), .Y(n49) );
  NAND2XLM U32 ( .A(N126), .B(n5), .Y(n7) );
  NAND2X2M U33 ( .A(n111), .B(n160), .Y(n8) );
  NAND2X2M U34 ( .A(n16), .B(n109), .Y(n9) );
  NOR2X2M U35 ( .A(n148), .B(n19), .Y(n122) );
  NOR2X2M U36 ( .A(n146), .B(n13), .Y(n119) );
  NOR2X2M U37 ( .A(n150), .B(n22), .Y(n131) );
  INVX8M U38 ( .A(A[7]), .Y(n30) );
  NOR2X4M U39 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  NOR2X2M U40 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n100) );
  BUFX6M U41 ( .A(A[0]), .Y(n13) );
  OAI21X1M U42 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  OAI21X1M U43 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  CLKINVX1M U44 ( .A(B[0]), .Y(n146) );
  INVXLM U45 ( .A(B[4]), .Y(n156) );
  INVXLM U46 ( .A(B[5]), .Y(n155) );
  INVXLM U47 ( .A(B[7]), .Y(n154) );
  NAND2X1M U48 ( .A(B[7]), .B(n145), .Y(n142) );
  BUFX4M U49 ( .A(n46), .Y(n113) );
  BUFX4M U50 ( .A(n46), .Y(n114) );
  INVX4M U51 ( .A(n3), .Y(n112) );
  INVX4M U52 ( .A(n3), .Y(n111) );
  INVX4M U53 ( .A(n4), .Y(n109) );
  INVX4M U54 ( .A(n4), .Y(n110) );
  OAI2BB1X2M U55 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U56 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U57 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U58 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U59 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U60 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U61 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  CLKAND2X6M U62 ( .A(n106), .B(n105), .Y(n50) );
  INVX2M U63 ( .A(n100), .Y(n167) );
  CLKBUFX6M U64 ( .A(n47), .Y(n115) );
  OAI2BB1X2M U65 ( .A0N(n164), .A1N(n105), .B0(n101), .Y(n47) );
  INVX2M U66 ( .A(n107), .Y(n164) );
  AND3X2M U67 ( .A(n106), .B(n166), .C(n11), .Y(n46) );
  NOR2BX8M U68 ( .AN(n108), .B(n162), .Y(n31) );
  NAND3X4M U69 ( .A(n164), .B(n166), .C(n11), .Y(n36) );
  INVX4M U70 ( .A(n91), .Y(n163) );
  CLKBUFX6M U71 ( .A(n37), .Y(n42) );
  NOR2BX2M U72 ( .AN(n106), .B(n167), .Y(n37) );
  AND4X1M U73 ( .A(N159), .B(n99), .C(n11), .D(n166), .Y(n90) );
  AOI31X2M U74 ( .A0(n51), .A1(n52), .A2(n53), .B0(n162), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U75 ( .A0(N106), .A1(n50), .B0(N97), .B1(n42), .Y(n51) );
  AOI221X2M U76 ( .A0(n163), .A1(A[7]), .B0(n112), .B1(n157), .C0(n54), .Y(n53) );
  AOI222X2M U78 ( .A0(N115), .A1(n108), .B0(n109), .B1(n29), .C0(N131), .C1(n5), .Y(n52) );
  INVX4M U79 ( .A(ALU_FUN[0]), .Y(n166) );
  INVX4M U80 ( .A(ALU_FUN[1]), .Y(n165) );
  NAND3X2M U81 ( .A(n106), .B(ALU_FUN[0]), .C(n11), .Y(n101) );
  AND2X2M U82 ( .A(ALU_FUN[2]), .B(n165), .Y(n99) );
  NAND2X4M U83 ( .A(EN), .B(n153), .Y(n32) );
  NAND2X2M U84 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  NAND3X2M U85 ( .A(n11), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  CLKBUFX6M U86 ( .A(n35), .Y(n108) );
  NOR3X2M U87 ( .A(n167), .B(ALU_FUN[2]), .C(n165), .Y(n35) );
  INVX2M U88 ( .A(n41), .Y(n145) );
  INVX4M U89 ( .A(n10), .Y(n11) );
  INVX4M U90 ( .A(n16), .Y(n160) );
  INVX2M U91 ( .A(n19), .Y(n159) );
  INVX2M U92 ( .A(n22), .Y(n158) );
  INVX2M U93 ( .A(n29), .Y(n157) );
  INVX6M U94 ( .A(n118), .Y(n116) );
  INVX4M U95 ( .A(n118), .Y(n117) );
  AOI22X1M U96 ( .A0(N100), .A1(n50), .B0(N91), .B1(n42), .Y(n93) );
  AOI211X2M U97 ( .A0(n112), .A1(n161), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X2M U98 ( .A0(N92), .A1(n42), .B0(N110), .B1(n108), .C0(N101), .C1(n50), .Y(n81) );
  AOI211X2M U99 ( .A0(n19), .A1(n163), .B0(n84), .C0(n85), .Y(n83) );
  AOI31X2M U100 ( .A0(n75), .A1(n76), .A2(n77), .B0(n162), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U101 ( .A0(N102), .A1(n50), .B0(N93), .B1(n42), .Y(n75) );
  AOI221X2M U102 ( .A0(n22), .A1(n163), .B0(n112), .B1(n159), .C0(n78), .Y(n77) );
  AOI222X2M U103 ( .A0(N111), .A1(n108), .B0(n19), .B1(n109), .C0(N127), .C1(
        n5), .Y(n76) );
  INVX4M U104 ( .A(n25), .Y(n26) );
  INVX4M U105 ( .A(n14), .Y(n15) );
  INVX4M U106 ( .A(n23), .Y(n24) );
  INVX4M U107 ( .A(n17), .Y(n18) );
  AOI31X2M U108 ( .A0(n69), .A1(n70), .A2(n71), .B0(n162), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U109 ( .A0(N103), .A1(n50), .B0(N94), .B1(n42), .Y(n69) );
  AOI221X2M U110 ( .A0(A[4]), .A1(n163), .B0(n112), .B1(n158), .C0(n72), .Y(
        n71) );
  AOI222X2M U111 ( .A0(N112), .A1(n108), .B0(n22), .B1(n110), .C0(N128), .C1(
        n5), .Y(n70) );
  INVX4M U112 ( .A(n20), .Y(n21) );
  INVX2M U113 ( .A(n12), .Y(n151) );
  AOI31X2M U114 ( .A0(n63), .A1(n64), .A2(n65), .B0(n162), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U115 ( .A0(N104), .A1(n50), .B0(N95), .B1(n42), .Y(n63) );
  AOI221X2M U116 ( .A0(n163), .A1(n27), .B0(n112), .B1(n23), .C0(n66), .Y(n65)
         );
  AOI222X2M U117 ( .A0(N113), .A1(n108), .B0(A[4]), .B1(n109), .C0(N129), .C1(
        n5), .Y(n64) );
  INVX4M U118 ( .A(n17), .Y(n19) );
  AOI31X2M U119 ( .A0(n57), .A1(n58), .A2(n59), .B0(n162), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U120 ( .A0(N105), .A1(n50), .B0(N96), .B1(n42), .Y(n57) );
  AOI221X2M U121 ( .A0(n163), .A1(n29), .B0(n112), .B1(n25), .C0(n60), .Y(n59)
         );
  AOI222X2M U122 ( .A0(N114), .A1(n108), .B0(n27), .B1(n110), .C0(N130), .C1(
        n5), .Y(n58) );
  AOI31X2M U123 ( .A0(n38), .A1(n39), .A2(n40), .B0(n162), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U124 ( .A0(N107), .A1(n50), .B0(N98), .B1(n42), .Y(n38) );
  AOI221X2M U125 ( .A0(n112), .A1(n30), .B0(n110), .B1(A[7]), .C0(n43), .Y(n40) );
  AOI22X1M U126 ( .A0(N132), .A1(n5), .B0(N116), .B1(n108), .Y(n39) );
  INVX4M U127 ( .A(n20), .Y(n22) );
  INVX4M U128 ( .A(n14), .Y(n16) );
  OAI222X1M U129 ( .A0(n55), .A1(n151), .B0(n12), .B1(n56), .C0(n36), .C1(n25), 
        .Y(n54) );
  AOI221X2M U130 ( .A0(n29), .A1(n113), .B0(n115), .B1(n157), .C0(n111), .Y(
        n56) );
  AOI221X2M U131 ( .A0(n114), .A1(n157), .B0(n29), .B1(n48), .C0(n110), .Y(n55) );
  AOI21X2M U132 ( .A0(n33), .A1(n34), .B0(n162), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U133 ( .A0(N99), .A1(n42), .B0(n153), .Y(n33) );
  AOI2BB2X2M U134 ( .B0(N117), .B1(n108), .A0N(n30), .A1N(n36), .Y(n34) );
  INVX2M U135 ( .A(ALU_FUN[3]), .Y(n10) );
  INVX2M U136 ( .A(n92), .Y(n153) );
  AOI211X2M U137 ( .A0(N108), .A1(n50), .B0(n112), .C0(n115), .Y(n92) );
  INVX4M U138 ( .A(n28), .Y(n29) );
  INVX4M U139 ( .A(n25), .Y(n27) );
  INVX2M U140 ( .A(n13), .Y(n161) );
  INVX2M U141 ( .A(RST), .Y(n118) );
  INVX2M U142 ( .A(A[1]), .Y(n14) );
  INVX2M U143 ( .A(A[2]), .Y(n17) );
  INVX2M U144 ( .A(A[3]), .Y(n20) );
  INVXLM U145 ( .A(n119), .Y(n147) );
  AOI221X2M U146 ( .A0(n13), .A1(n113), .B0(n115), .B1(n161), .C0(n111), .Y(
        n102) );
  AOI31X2M U147 ( .A0(N157), .A1(n11), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U148 ( .A(n165), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  INVXLM U149 ( .A(n130), .Y(n149) );
  AOI221X2M U150 ( .A0(n16), .A1(n113), .B0(n115), .B1(n160), .C0(n111), .Y(
        n87) );
  AOI31X2M U151 ( .A0(n152), .A1(n11), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U152 ( .A(n166), .B(ALU_FUN[2]), .C(n165), .Y(n89) );
  OAI222X1M U153 ( .A0(n44), .A1(n154), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n157), .Y(n43) );
  AOI221X2M U154 ( .A0(n114), .A1(n41), .B0(n115), .B1(n145), .C0(n112), .Y(
        n45) );
  AOI221X2M U155 ( .A0(n114), .A1(n145), .B0(A[7]), .B1(n48), .C0(n109), .Y(
        n44) );
  OAI222X1M U156 ( .A0(n67), .A1(n156), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n158), .Y(n66) );
  AOI221X2M U157 ( .A0(A[4]), .A1(n113), .B0(n115), .B1(n23), .C0(n111), .Y(
        n68) );
  AOI221X2M U158 ( .A0(n114), .A1(n23), .B0(A[4]), .B1(n48), .C0(n110), .Y(n67) );
  OAI222X1M U159 ( .A0(n61), .A1(n155), .B0(B[5]), .B1(n62), .C0(n36), .C1(n23), .Y(n60) );
  AOI221X2M U160 ( .A0(n27), .A1(n113), .B0(n115), .B1(n25), .C0(n111), .Y(n62) );
  AOI221X2M U161 ( .A0(n114), .A1(n25), .B0(n27), .B1(n48), .C0(n109), .Y(n61)
         );
  OAI222X1M U162 ( .A0(n79), .A1(n148), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n160), .Y(n78) );
  AOI221X2M U163 ( .A0(n19), .A1(n113), .B0(n115), .B1(n159), .C0(n111), .Y(
        n80) );
  AOI221X2M U164 ( .A0(n114), .A1(n159), .B0(n19), .B1(n48), .C0(n110), .Y(n79) );
  OAI222X1M U165 ( .A0(n73), .A1(n150), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n159), .Y(n72) );
  AOI221X2M U166 ( .A0(n22), .A1(n113), .B0(n115), .B1(n158), .C0(n111), .Y(
        n74) );
  AOI221X2M U167 ( .A0(n114), .A1(n158), .B0(n22), .B1(n48), .C0(n109), .Y(n73) );
  OAI2B2X1M U168 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n161), .Y(n85) );
  AOI221X2M U169 ( .A0(n114), .A1(n160), .B0(n16), .B1(n48), .C0(n109), .Y(n86) );
  OAI2B2X1M U170 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n160), .Y(n97) );
  AOI221X2M U171 ( .A0(n113), .A1(n161), .B0(n13), .B1(n48), .C0(n110), .Y(n98) );
  NAND2BX1M U172 ( .AN(B[4]), .B(A[4]), .Y(n134) );
  NAND2BX1M U173 ( .AN(A[4]), .B(B[4]), .Y(n123) );
  CLKNAND2X2M U174 ( .A(n134), .B(n123), .Y(n136) );
  CLKNAND2X2M U175 ( .A(n19), .B(n148), .Y(n133) );
  AOI21X1M U176 ( .A0(n119), .A1(n160), .B0(B[1]), .Y(n120) );
  CLKNAND2X2M U177 ( .A(n22), .B(n150), .Y(n132) );
  NAND2BX1M U178 ( .AN(n27), .B(B[5]), .Y(n139) );
  OAI211X1M U179 ( .A0(n136), .A1(n124), .B0(n123), .C0(n139), .Y(n125) );
  NAND2BX1M U180 ( .AN(B[5]), .B(n27), .Y(n135) );
  AOI32X1M U181 ( .A0(n125), .A1(n135), .A2(n138), .B0(n12), .B1(n28), .Y(n126) );
  CLKNAND2X2M U182 ( .A(n13), .B(n146), .Y(n129) );
  OA21X1M U183 ( .A0(n129), .A1(n160), .B0(B[1]), .Y(n127) );
  AOI31X1M U184 ( .A0(n149), .A1(n133), .A2(n132), .B0(n131), .Y(n137) );
  OAI2B11X1M U185 ( .A1N(n137), .A0(n136), .B0(n135), .C0(n134), .Y(n140) );
  AOI32X1M U186 ( .A0(n140), .A1(n139), .A2(n138), .B0(n29), .B1(n151), .Y(
        n143) );
  NOR2X1M U187 ( .A(N159), .B(n152), .Y(N157) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, SCAN_CLK, SI, SE, SO, 
        SCAN_RST, test_mode, UART_TX_O, parity_error, framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN, SCAN_CLK, SI, SE, SCAN_RST,
         test_mode;
  output SO, UART_TX_O, parity_error, framing_error;
  wire   sync_reset_ref, sync_reset_uart, data_valid, RX_D_VLD, TX_D_VLD,
         TX_CLK, RD_INC, F_EMPTY, FIFO_FULL, busy, RX_CLK, OUT_Valid, ALU_EN,
         CLK_EN, WrEn, RdEn, RdData_Valid, ALU_CLK, n1, n2, n3, n4, n5, n6, n7,
         n8, n9;
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

  Reset_sync_0 RST_SYNC_1 ( .RST(RST_N), .CLK(REF_CLK), .sync_reset(
        sync_reset_ref) );
  Reset_sync_1 RST_SYNC_2 ( .RST(RST_N), .CLK(UART_CLK), .sync_reset(
        sync_reset_uart) );
  Data_Sync_BUS_WIDTH8 U0_DATA_SYNC ( .CLK(REF_CLK), .RST(n8), .unsync_bus(
        RX_P_DATA), .bus_enable(data_valid), .enable_pulse(RX_D_VLD), 
        .sync_bus(P_DATA_RX_SYNC) );
  FIFO_top FIFO ( .wdata(TX_P_DATA), .winc(TX_D_VLD), .wclk(REF_CLK), .wrst_n(
        n8), .rclk(TX_CLK), .rrst_n(n6), .rinc(RD_INC), .rdata(RD_DATA_FIFO), 
        .rempty(F_EMPTY), .wfull(FIFO_FULL) );
  PULSE_GEN U0_PULSE_GEN ( .clk(TX_CLK), .rst(n6), .lvl_sig(busy), .pulse_sig(
        RD_INC) );
  ClkDiv_0 U0_CLK_DIV_TX ( .i_ref_clk(UART_CLK), .i_rst(n6), .i_clk_en(1'b1), 
        .i_div_ratio(REG3), .o_div_clk(TX_CLK) );
  CLKDIV_MUX_WIDTH8 U0_CLKDIV_MUX ( .IN(REG2[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, ratio_rx[3:0]}) );
  ClkDiv_1 U0_CLK_DIV_RX ( .i_ref_clk(UART_CLK), .i_rst(n6), .i_clk_en(1'b1), 
        .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, ratio_rx[3:0]}), .o_div_clk(
        RX_CLK) );
  UART_TX_top U0_TX ( .P_DATA(RD_DATA_FIFO), .PAR_EN(REG2[0]), .Data_Valid(n1), 
        .PAR_TYP(REG2[1]), .CLK(TX_CLK), .RST(n6), .TX_OUT(UART_TX_O), .busy(
        busy) );
  UART_RX_top U0_RX ( .RX_IN(n2), .PAR_EN(REG2[0]), .PAR_TYP(REG2[1]), 
        .prescale(REG2[7:2]), .CLK(n5), .RST(n6), .data_valid(data_valid), 
        .P_DATA(RX_P_DATA) );
  sys_ctrl U0_SYS_CTRL ( .CLK(REF_CLK), .RST(n8), .ALU_OUT(ALU_OUT), 
        .OUT_Valid(OUT_Valid), .FIFO_FULL(FIFO_FULL), .ALU_FUN(ALU_FUN), 
        .ALU_EN(ALU_EN), .CLK_EN(CLK_EN), .Address(Address), .WrEn(WrEn), 
        .RdEn(RdEn), .WrData(WrData), .RdData(RdData), .RdData_Valid(
        RdData_Valid), .RX_P_DATA(P_DATA_RX_SYNC), .RX_D_VLD(RX_D_VLD), 
        .TX_P_DATA(TX_P_DATA), .TX_D_VLD(TX_D_VLD) );
  RegFile_WIDTH8_ADDR4 U0_REG_FILE ( .CLK(REF_CLK), .RST(n8), .WrEn(WrEn), 
        .RdEn(RdEn), .Address({Address[3:2], n4, n3}), .WrData(WrData), 
        .RdData(RdData), .RdData_VLD(RdData_Valid), .REG0(REG0), .REG1(REG1), 
        .REG2(REG2), .REG3(REG3) );
  ALU_OPER_WIDTH8_OUT_WIDTH16 U0_ALU ( .A(REG0), .B(REG1), .EN(ALU_EN), 
        .ALU_FUN(ALU_FUN), .CLK(ALU_CLK), .RST(n8), .ALU_OUT(ALU_OUT), 
        .OUT_VALID(OUT_Valid) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLK_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  INVX2M U3 ( .A(F_EMPTY), .Y(n1) );
  INVX4M U4 ( .A(n7), .Y(n6) );
  INVX4M U5 ( .A(n9), .Y(n8) );
  BUFX2M U6 ( .A(Address[0]), .Y(n3) );
  BUFX2M U7 ( .A(Address[1]), .Y(n4) );
  INVX2M U8 ( .A(sync_reset_uart), .Y(n7) );
  INVX2M U9 ( .A(sync_reset_ref), .Y(n9) );
  BUFX4M U10 ( .A(UART_RX_IN), .Y(n2) );
  BUFX2M U11 ( .A(RX_CLK), .Y(n5) );
endmodule

