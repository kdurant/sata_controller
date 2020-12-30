/*=============================================================================
# FileName    :	transceiver_clock.v
# Author      :	author
# Email       :	email@email.com
# Description :	完成gtx ip时钟配置( CPLL, QPLL等)
                目前代码仅供仿真时使用
# Version     :	1.0
# LastChange  :	2018-07-22 15:00:35
# ChangeLog   :	
=============================================================================*/

`timescale  1 ns/1 ps

module transceiver_clock
(
    input   wire                clk,

    output  wire                sysclk_in,
    output  wire                gt0_cplllockdetclk_in,
    output  wire                gt0_drpclk_in,

    input   wire                gt0_rxoutclk_out,
    output  wire                gt0_rxusrclk_in,
    output  wire                gt0_rxusrclk2_in,

    input   wire                gt0_txoutclk_out,
    output  wire                gt0_txusrclk_in,
    output  wire                gt0_txusrclk2_in,

    output  wire                gt0_gtrefclk0_in,
    output  wire                gt0_gtrefclk1_in,

    output  wire                gt0_qplloutclk_in,
    output  wire                gt0_qplloutrefclk_in
);
reg                     clk0 = 0;
always
    #(6.667/2) clk0 = ~clk0;

reg                     clk1 = 0;
always
    #(16.667/2) clk1 = ~clk1;

assign                  gt0_cplllockdetclk_in = clk1;
assign                  gt0_drpclk_in = clk1;
assign                  sysclk_in = clk1;

assign                  gt0_rxusrclk_in = gt0_rxoutclk_out;
assign                  gt0_rxusrclk2_in = gt0_rxoutclk_out;

assign                  gt0_txusrclk_in = gt0_txoutclk_out;
assign                  gt0_txusrclk2_in = gt0_txoutclk_out;


assign                  gt0_gtrefclk0_in = 0;
assign                  gt0_gtrefclk1_in = clk0;


assign                  gt0_qplloutclk_in = 1;
assign                  gt0_qplloutrefclk_in = 0;

endmodule
