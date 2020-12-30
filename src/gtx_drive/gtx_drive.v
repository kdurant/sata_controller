/*=============================================================================
# FileName    :	gtx_drive.v
# Author      :	author
# Email       :	email@email.com
# Description :	完成gtx ip的初始化，配置等功能。对外提供简单而有用的接口
# Version     :	1.0
# LastChange  :	2018-07-21 18:32:38
# ChangeLog   :	
=============================================================================*/
`timescale  1 ns/1 ps

module gtx_drive
(
    input   wire                clk,
    input   wire                rst,

    input   wire                gtr_refclk_p,
    input   wire                gtr_refclk_n,
    input   wire                drp_clk_p,
    input   wire                drp_clk_n,

    /*port*/
    input   wire                s_axi_tvalid,
    input   wire                s_axi_tlast,
    output  wire                s_axi_tready,
    input   wire [31:00]        s_axi_tdata,

    output  wire                gtx_rxusrclk,
    output  wire [31:00]        gtx_rxdata,
    output  wire [03:00]        gtx_rxcharisk,

    input   wire                RXN_IN,
    input   wire                RXP_IN,
    output  wire                TXN_OUT,
    output  wire                TXP_OUT
);

wire                        txdata_clk;
wire    [31:00]             gt_txdata_in;
wire    [03:00]             gt_txcharisk_in;
wire                        gtx_ready;

transceiver_write transceiver_writeEx01
(
    .clk                          (    txdata_clk         ),
    .rst                          (    rst                ),
    .gtx_ready                    (    gtx_ready          ),
    .s_axi_tvalid                 (    s_axi_tvalid       ),
    .s_axi_tlast                  (    s_axi_tlast        ),
    .s_axi_tready                 (    s_axi_tready       ),
    .s_axi_tdata                  (    s_axi_tdata        ),
    .gt_txdata_in                 (    gt_txdata_in       ),
    .gt_txcharisk_in              (    gt_txcharisk_in    )
);

sata_exdes sata_exdesEx01
(
    .Q0_CLK1_GTREFCLK_PAD_N_IN    (    gtr_refclk_p       ),
    .Q0_CLK1_GTREFCLK_PAD_P_IN    (    gtr_refclk_n       ),
    .DRP_CLK_IN_P                 (    drp_clk_p          ),
    .DRP_CLK_IN_N                 (    drp_clk_n          ),

    .txdata_clk                   (    txdata_clk         ),
    .gtx_ready                    (    gtx_ready          ),
    .gt_txdata_in                 (    gt_txdata_in       ),
    .gt_txcharisk_in              (    gt_txcharisk_in    ),

    .gt0_rxusrclk_i               (    gtx_rxusrclk       ),
    .gt0_rxusrclk2_i              (                       ),
    .gt0_rxdata_i                 (    gtx_rxdata         ),
    .gt0_rxcharisk_i              (    gtx_rxcharisk      ),

    .RXN_IN                       (    RXN_IN             ),
    .RXP_IN                       (    RXP_IN             ),
    .TXN_OUT                      (    TXN_OUT            ),
    .TXP_OUT                      (    TXP_OUT            )
);
endmodule
