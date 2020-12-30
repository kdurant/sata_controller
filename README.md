# 软件环境
* questasim 10.6c
* vivado2017.4

# 相关文档
* pg168
* ug476
* XAPP870
* [gtx配置](https://blog.csdn.net/u010161493/article/details/77658599)

# gtx_drive封装
为了修改IP选项时，对工程做尽可能小的改动，gtx驱动是对IP example的二次封装，从里面提取出数据读写接口，具体流程如下

1. copy
* 从demo 工程的 `../example_design`从copy出
> sata_exdes.v
* 从demo 工程的 `../example_design/support`从copy出
> sata_common.v
> sata_common_reset.v
> sata_gt_usrclk_source.v
> sata_support.v

2. 在`sata_exdes.v`中添加数据输入，输出端口信号
    * 添加写数据端口
    ```verilog 
    output  wire                txdata_clk,     // IP输出的gt0_txusrclk2，75MHz
    input   wire [31:00]        gt_txdata_in,
    input   wire [03:00]        gt_txcharisk_in,
    ```
    * 添加数据输出端口, 并注释掉代码里已有的类型声明
    ```verilog 
    output  wire                gt0_rxusrclk_i,
    output  wire                gt0_rxusrclk2_i,
    output  wire [31:00]        gt0_rxdata_i,
    output  wire [03:00]        gt0_rxcharisk_i,
    ```

    * 注释掉`sata_GT_FRAME_GEN`和`sata_GT_FRAME_CHECK`模块
    * 设置信号默认值
    ```verilog
    /*
     * user code 
     */
    assign                  txdata_clk = gt0_txusrclk2_i;
    assign                  gt0_txdata_i = gt_txdata_in;
    assign                  gt0_txcharisk_i = gt_txcharisk_in;
    assign                  gtx_ready = gt0_txfsmresetdone_i & gt0_rxresetdone_i;
    ```
# IP信号说明 
```verilog
    input wire  Q0_CLK1_GTREFCLK_PAD_N_IN,      // IP设置里的 TX参考时钟 150MHz
    input wire  Q0_CLK1_GTREFCLK_PAD_P_IN,
    input wire  DRP_CLK_IN_P,                   // IP设置里的 DRP/System Clock Frequency, 60MHz
    input wire  DRP_CLK_IN_N,
    output wire TRACK_DATA_OUT,
```

# OOB数据格式
> Gen1 1.5Gbps/s   0.667ns

## COMREST/COMINT数据格式
单次突发发送数据为：`ALIGN(32'h7B4A4ABC), ALIGN, ALIGN, ALIGN, IDLE, IDLE, IDLE, IDLE, IDLE, IDLE, IDLE, IDLE`
> 每个word需要：40*0.667 = 26.68ns
> 40*0.667*4 = 106.72ns
包含6个突发
> SATA 2.6 PLUS.pdf  page 137

## COMWAKE
单次突发发送数据为：`ALIGN(32'h7B4A4ABC), ALIGN, ALIGN, ALIGN, IDLE, IDLE, IDLE, IDLE`
包含6个突发
> SATA 2.6 PLUS.pdf  page 137

# 注意
1. 不要选择IP生成选项里的`RX_SLIDE`，否则需要手动控制`gt0_rxslide_in`，而在文档里没有找到这个信号具体如何控制
