# RXVALID
* 方向：输出
* 作用：显示RXDATA上符合锁定和数据有效

# RXCHARISK
* 方向：输出
* 作用：当`RXDATA`是K码的时候，接收器将`RXCHARISK`置高

# RXUSERRDY
* 方向：输入
* 作用：当`RXUSRCLK`和`RXUSRCLK2`稳定的时候，用户程序将此信号置高

# EYESCANDATAERROR

# RXCDRLOCK
* 方向：输出
* 作用：保留

# RXUSRCLK
* 方向：输入
* 作用：

# RXDISPERR
* 方向：输出
* 作用：高电平有效表示RXDATA上显示的相应字节有不一致错误。
    1. RXDISPERR[7] 对应 RXDATA[63:56]
    2. RXDISPERR[6] 对应 RXDATA[55:48]
    3. RXDISPERR[5] 对应 RXDATA[47:40]
    4. RXDISPERR[4] 对应 RXDATA[39:32]
    5. RXDISPERR[3] 对应 RXDATA[31:24]
    6. RXDISPERR[2] 对应 RXDATA[23:16]
    7. RXDISPERR[1] 对应 RXDATA[15:8]
    8. RXDISPERR[0] 对应 RXDATA[7:0]

# RXNOTINTABLE
* 方向：输出
* 作用：高电平有效表示RXDATA上显示的相应字节不是8B / 10B表中的有效字符
    1. RXNOTINTABLE[7] 对应 RXDATA[63:56]
    2. RXNOTINTABLE[6] 对应 RXDATA[55:48]
    3. RXNOTINTABLE[5] 对应 RXDATA[47:40]
    4. RXNOTINTABLE[4] 对应 RXDATA[39:32]
    5. RXNOTINTABLE[3] 对应 RXDATA[31:24]
    6. RXNOTINTABLE[2] 对应 RXDATA[23:16]
    7. RXNOTINTABLE[1] 对应 RXDATA[15:8]
    8. RXNOTINTABLE[0] 对应 RXDATA[7:0]

# RXSLIDE
* 方向：输入
* 作用：可以取代comma对齐功能，实现手动comma对齐功能

# TXCHARISK
* 方向：输入
* 作用：高电平有效表示TXDATA上显示的相应字节是不是K码
    1. TXCHARISK[7] 对应 TXDATA[63:56]
    2. TXCHARISK[6] 对应 TXDATA[55:48]
    3. TXCHARISK[5] 对应 TXDATA[47:40]
    4. TXCHARISK[4] 对应 TXDATA[39:32]
    5. TXCHARISK[3] 对应 TXDATA[31:24]
    6. TXCHARISK[2] 对应 TXDATA[23:16]
    7. TXCHARISK[1] 对应 TXDATA[15:8]
    8. TXCHARISK[0] 对应 TXDATA[7:0] 
    当来自TXDATA的相应数据字节被设置为旁路8B / 10B编码器时，TXCHARISK位应该被驱动为低电平


# GTREFCLK0_COMMON
* 方向：输入
* 作用：时钟输入（SATA 75MHz）

# QPLLLOCKDETCLK
* 方向：输入
* 作用：暂时总结不好

# QPLLRESET
* 方向：输入
* 作用：复位，可一直为0

# RXELECIDLE
* 方向：输出
* 作用：指示OOB信号检测的状态，仅对PCIe，SATA / SAS和使用OOB的协议/应用程序有效。 在这些情况下，OOB电路必须通电。
    1. 0 : 在接收器上看到活动
    2. 1 : 没有看到活动

# IP使用设置
## 注意
```verilog
(* CORE_GENERATION_INFO = "sata,gtwizard_v2_7,{protocol_file=Start_from_scratch}" *) module sata #
(
    // Simulation attributes
    parameter   WRAPPER_SIM_GTRESET_SPEEDUP    =   "FALSE",     // Set to "true" to speed up sim reset
    parameter   RX_DFE_KL_CFG2_IN              =   32'h301148AC,
    parameter   PMA_RSV_IN                     =   32'h00018480
)
```
IP顶层文件参数RX_DFE_KL_CFG2_IN和PMA_RSV_IN在不需要指定

## 时钟
1. 设置GTREFCLK0_COMMON和QPLLLOCKDETCLK，两者缺一不可。QPLLRESET（高电平复位）
2. 正确的设置之后，TXOUTCLK，TXOUTCLKFABRIC，TXOUTCLKPCS即有时钟信号输出（频率一致）
3. 使用TXOUTCLK作为GTX 收发的时钟

## 发送
1. 使用TXOUTCLK作为GTX 发送的时钟
2. 高电平复位
3. 给有效的TXUSERRDY
4. TXRESETDONE信号会被置高，可以进行正常的写操作
5. TXCHARISK和TXDATA完成对数据的写入