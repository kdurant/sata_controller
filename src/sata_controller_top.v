/*=============================================================================
# FileName    :	sata_controller_top.v
# Author      :	author
# Email       :	email@email.com
# Description :	提供最简单易用的对外读写接口
                内部提供16KByte字节大小的读写FIFO
                写操作示例：
                command通道发送：写命令 + 写地址 + 写长度( + 可扩展)
                write通道发送：要写入的数据
                读操作示例：
                command通道发送：读命令 + 读地址 + 读长度( + 可扩展)
                read通道读出：要读的数据
                
# Version     :	1.0
# LastChange  :	2018-07-20 13:39:37
# ChangeLog   :	
=============================================================================*/
`timescale  1 ns/1 ps

module sata_controller_top
(
    input   wire                clk,
    input   wire                rst,

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


    output  wire                sata_link_up,   // sata_link_up = 1时，才可以读sata进行读写操作
    output  wire [31:00]        sata_status,

    input   wire                SATA_CLK_P,
    input   wire                SATA_CLK_N,
    output  wire                SATA_TXP,
    output  wire                SATA_TXN,
    input   wire                SATA_RXP,
    input   wire                SATA_RXN
);

endmodule

