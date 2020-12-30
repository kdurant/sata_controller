/*=============================================================================
# FileName    :	app_top.v
# Author      :	author
# Email       :	email@email.com
# Description :	sata 应用层
# Version     :	1.0
# LastChange  :	2018-07-20 14:00:21
# ChangeLog   :	
=============================================================================*/
`timescale  1 ns/1 ps

module app_top
(
    input   wire                clk,
    input   wire                rst,
    input   wire                sata_link_up,
    /*port*/

    // 命令&地址接口
    input   wire                command_s_axi_tvalid,
    input   wire                command_s_axi_tlast,
    output  wire                command_s_axi_tready,
    input   wire [31:00]        command_s_axi_tdata,

    // 写数据接口
    input   wire                write_s_axi_tvalid,
    input   wire                write_s_axi_tlast,
    output  wire                write_s_axi_tready,
    input   wire [31:00]        write_s_axi_tdata,

    //读数据接口
    output  wire                read_m_axi_tvalid,
    output  wire                read_m_axi_tlast,
    input   wire                read_m_axi_tready,
    output  wire [31:00]        read_m_axi_tdata,

);

endmodule
