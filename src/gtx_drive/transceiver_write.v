/*=============================================================================
# FileName    :	transceiver_write.v
# Author      :	author
# Email       :	email@email.com
# Description :	写数据通道
                假设写入的数据为32’h03020100, 先发送8'h00的8B/10B码(高位先出)，再发送8'h01, 8'h02, 8'h03
                从写入并行数据，到在差分端口上出现大概需要113ns(112.997ns)
                关于RD值，相邻的两次发送同一个数据，则8B/10B码相反
# Version     :	1.0
# LastChange  :	2018-07-22 16:01:31
# ChangeLog   :	
=============================================================================*/

`timescale  1 ns/1 ps

module transceiver_write
(
    input   wire                clk,
    input   wire                rst,
    /*port*/

    input   wire                gtx_ready,
    input   wire                s_axi_tvalid,
    input   wire                s_axi_tlast,
    output  wire                s_axi_tready,
    input   wire [31:00]        s_axi_tdata,


    /*
     * gt0_txcharisk_in[0] 对应 gt0_txdata_in[07:00]
     * gt0_txcharisk_in[1] 对应 gt0_txdata_in[15:08]
     * gt0_txcharisk_in[2] 对应 gt0_txdata_in[23:16]
     * gt0_txcharisk_in[3] 对应 gt0_txdata_in[31:24]
     * 一般情况下，gt0_txdata_in[07:00]发送数据被8'BC(K28.5)时, gt0_txcharisk_in[0] = 1
     */
    output  reg  [31:00]        gt_txdata_in,
    output  reg  [03:00]        gt_txcharisk_in
);

assign                  s_axi_tready = gtx_ready;

always @ (posedge clk)
begin
    if(rst)
        gt_txdata_in <= 0;
    else if(s_axi_tready & s_axi_tvalid)
        gt_txdata_in <= s_axi_tdata;
    else
        gt_txdata_in <= 0;
end

always @ (posedge clk)
begin
    if(rst)
        gt_txcharisk_in <= 0;
    else if(s_axi_tready & s_axi_tvalid)
    begin
        if(s_axi_tdata[07:00] == 8'hBC)
            gt_txcharisk_in[0] <= 1;
        else
            gt_txcharisk_in[0] <= 0;

        if(s_axi_tdata[15:08] == 8'hBC)
            gt_txcharisk_in[1] <= 1;
        else
            gt_txcharisk_in[1] <= 0;

        if(s_axi_tdata[23:16] == 8'hBC)
            gt_txcharisk_in[2] <= 1;
        else
            gt_txcharisk_in[2] <= 0;
        
        if(s_axi_tdata[31:24] == 8'hBC)
            gt_txcharisk_in[3] <= 1;
        else
            gt_txcharisk_in[3] <= 0;
    end
    else
        gt_txcharisk_in <= 0;
end
endmodule
