/*=============================================================================
# FileName    :	transceiver_config.v
# Author      :	author
# Email       :	email@email.com
# Description :	主要是复位，IP配置。IP用到的时钟由其他模块给
# Version     :	1.0
# LastChange  :	2018-07-21 15:19:44
# ChangeLog   :	
=============================================================================*/

`timescale  1 ns/1 ps

module transceiver_config
(
    input   wire                clk,
    input   wire                rst,
    /*port*/

    output           soft_reset_tx_in,      // 复位TX FSM并且启动TX初始化，高电平复位
    output           soft_reset_rx_in,      // 复位RX FSM并且启动RX初始化，高电平复位
    output           dont_reset_on_data_error_in,  // 设置为0时，如果检测到错误，RX自动复位
    output           gt0_data_valid_in,     // 此信号有效后，gt0_rx_fsm_reset_done_out才会有效, RX部分初始化才算完成

    output           gt0_cpllreset_in,      // 高电平复位

    output   [8:0]   gt0_drpaddr_in,
    output   [15:0]  gt0_drpdi_in,
    output           gt0_drpen_in,
    output           gt0_drpwe_in,
    output           gt0_eyescanreset_in,
    output           gt0_rxuserrdy_in,   // RXUSRCLK和RXUSRCLK2稳定后，置高该信号
    output           gt0_eyescantrigger_in,
    output           gt0_rxcdrhold_in,
    output           gt0_rxdfelpmreset_in,      // LPM和DFE复位
    output   [1:0]   gt0_rxmonitorsel_in,
    output           gt0_gtrxreset_in,
    output           gt0_rxpmareset_in,
    output           gt0_rxslide_in,
    output           gt0_gttxreset_in,
    output           gt0_txuserrdy_in,
    output           gt0_txelecidle_in,
    output           gt0_txcominit_in,
    output           gt0_txcomsas_in,
    output           gt0_txcomwake_in
);

assign                  soft_reset_tx_in = 0;
assign                  soft_reset_rx_in = 0;
assign                  dont_reset_on_data_error_in = 0;
assign                  gt0_cpllreset_in = 0;

assign                  gt0_drpaddr_in = 8'h00;
assign                  gt0_drpdi_in = 16'h0000;
assign                  gt0_drpen_in = 0;
assign                  gt0_drpwe_in = 0;

assign                  gt0_eyescanreset_in = 0;
assign                  gt0_rxuserrdy_in = 1;
assign                  gt0_eyescantrigger_in  = 0;
assign                  gt0_rxcdrhold_in = 0;
assign                  gt0_rxdfelpmreset_in = 0;
assign                  gt0_rxmonitorsel_in = 0;
assign                  gt0_gtrxreset_in = 0;
assign                  gt0_rxpmareset_in = 0;
assign                  gt0_rxslide_in = 0;
assign                  gt0_gttxreset_in = 0;
assign                  gt0_txuserrdy_in = 1;
assign                  gt0_txelecidle_in = 0;

assign                  gt0_txcominit_in = 0;
assign                  gt0_txcomsas_in = 0;
assign                  gt0_txcomwake_in = 0;
initial
begin
    force gt0_data_valid_in = 0;
    #58107;
    force gt0_data_valid_in = 1;
end
endmodule
