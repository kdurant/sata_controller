`timescale  1 ns/1 ps

module gtx_sim ();

logic                s_axi_tvalid = 0;
logic                s_axi_tlast = 0;
logic                s_axi_tready;
logic [31:00]        s_axi_tdata = 0;

logic                       TXP_OUT;
logic                       TXN_OUT;
logic                       RXP_IN;
logic                       RXN_IN;

assign                  RXP_IN = TXP_OUT;
assign                  RXN_IN = TXN_OUT;

reg                     clk_60m = 0;
always
    #(16.667ns/2) clk_60m = ~clk_60m;

reg                     clk_150m = 0;
always
    #(6.667ns/2) clk_150m = ~clk_150m;

logic                       rst = 0;
initial
begin
    rst = 1; #1us;
    rst = 0;
    $readmemh("txdata.dat",rom,0,511);
end

reg     [31:0] rom [0:511];
task gtx_write_demo();
    @ (posedge gtx_sim.sendEx01.txdata_clk);
    #1ps
    s_axi_tvalid = 1;
    s_axi_tdata = rom[0];
    forever
    begin
        for(int i = 0; i < 512; i = i + 1 )
        begin
            @ (posedge gtx_sim.sendEx01.txdata_clk);
            #1ps
            s_axi_tvalid = 1;
            s_axi_tdata = rom[i];
        end
        @ (posedge gtx_sim.sendEx01.txdata_clk);
        #1ps
        s_axi_tvalid = 0;
        s_axi_tdata = 0;
    end
endtask

task gtx_write_data(input bit [31:00] data);
    @ (posedge gtx_sim.sendEx01.txdata_clk);
    #1ps
    s_axi_tvalid = 1;
    s_axi_tdata = data;
endtask

task sata_comrest();
    gtx_write_data(32'h7B4A4ABC);
    gtx_write_data(32'h7B4A4ABC);
    gtx_write_data(32'h7B4A4ABC);
    gtx_write_data(32'h7B4A4ABC);
    gtx_write_data(32'h7B4A4ABC);
    gtx_write_data(32'h7B4A4ABC);
    gtx_write_data(32'h7B4A4ABC);
    gtx_write_data(32'h7B4A4ABC);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
    gtx_write_data(32'h00000000);
endtask

initial
begin
    wait(gtx_sim.sendEx01.gtx_ready); 
    @ (posedge gtx_sim.sendEx01.txdata_clk);
    @ (posedge gtx_sim.sendEx01.txdata_clk);
    @ (posedge gtx_sim.sendEx01.txdata_clk);
    force gtx_sim.sendEx01.sata_exdesEx01.sata_support_i.sata_init_i.gt0_txcominit_in = 1;
    @ (posedge gtx_sim.sendEx01.txdata_clk);
    force gtx_sim.sendEx01.sata_exdesEx01.sata_support_i.sata_init_i.gt0_txcominit_in = 0;
    //gtx_write_demo();
    //sata_comrest();
    //sata_comrest();
    //sata_comrest();
    //sata_comrest();
    //sata_comrest();
    //sata_comrest();
end

gtx_drive sendEx01
(
    .clk                   (    clk             ),
    .rst                   (    rst             ),
    .gtr_refclk_p          (    clk_150m        ),
    .gtr_refclk_n          (    ~clk_150m       ),
    .drp_clk_p             (    clk_60m         ),
    .drp_clk_n             (    ~clk_60m        ),
    .s_axi_tvalid          (    s_axi_tvalid    ),
    .s_axi_tlast           (    s_axi_tlast     ),
    .s_axi_tready          (    s_axi_tready    ),
    .s_axi_tdata           (    s_axi_tdata     ),
    .RXN_IN                (    RXN_IN          ),
    .RXP_IN                (    RXP_IN          ),
    .TXN_OUT               (    TXN_OUT         ),
    .TXP_OUT               (    TXP_OUT         )
);



gtx_drive receiveEx01
(
    .clk                   (    clk             ),
    .rst                   (    rst             ),
    .gtr_refclk_p          (    clk_150m        ),
    .gtr_refclk_n          (    ~clk_150m       ),
    .drp_clk_p             (    clk_60m         ),
    .drp_clk_n             (    ~clk_60m        ),
    .s_axi_tvalid          (                    ),
    .s_axi_tlast           (                    ),
    .s_axi_tready          (                    ),
    .s_axi_tdata           (                    ),
    .RXN_IN                (    RXN_IN          ),
    .RXP_IN                (    RXP_IN          ),
    .TXN_OUT               (                    ),
    .TXP_OUT               (                    )
);
endmodule
