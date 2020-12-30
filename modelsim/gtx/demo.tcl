quit -sim
set env(VIVADO_SIM)             F:/crack/vivado2017.4_questasim_10.6c_lib
set env(GTX_IP_SRC)             ../..
vmap secureip                   $env(VIVADO_SIM)/secureip
vmap simprims_ver               $env(VIVADO_SIM)/simprims_ver
vmap unifast                    $env(VIVADO_SIM)/unifast
vmap unifast_ver                $env(VIVADO_SIM)/unifast_ver
vmap unimacro                   $env(VIVADO_SIM)/unimacro
vmap unimacro_ver               $env(VIVADO_SIM)/unimacro_ver
vmap unisim                     $env(VIVADO_SIM)/unisim
vmap unisims_ver                $env(VIVADO_SIM)/unisims_ver

#工程所需要的文件
vlog -incr $env(VIVADO_SIM)/glbl.v;

vlog -incr $env(GTX_IP_SRC)/ip/sata/sata/example_design/sata_tx_startup_fsm.v
vlog -incr $env(GTX_IP_SRC)/ip/sata/sata/example_design/sata_rx_startup_fsm.v
vlog -incr $env(GTX_IP_SRC)/ip/sata/sata_init.v
vlog -incr $env(GTX_IP_SRC)/ip/sata/sata_cpll_railing.v
vlog -incr $env(GTX_IP_SRC)/ip/sata/sata_gt.v
vlog -incr $env(GTX_IP_SRC)/ip/sata/sata_multi_gt.v
vlog -incr $env(GTX_IP_SRC)/ip/sata/sata/example_design/sata_sync_block.v
vlog -incr $env(GTX_IP_SRC)/ip/sata/sata.v

vlog -sv -incr gtx_sim.sv

vlog -incr ../../src/gtx_drive/gtx_drive.v
#vlog -incr ../../src/gtx_drive/transceiver_config.v
#vlog -incr ../../src/gtx_drive/transceiver_clock.v
vlog -incr ../../src/gtx_drive/transceiver_write.v
vlog -incr ../../src/gtx_drive/example/*.v


vsim -t ps -novopt +notimingchecks \
                                    -L secureip \
                                    -L simprims_ver \
                                    -L unifast -L unifast_ver \
                                    -L unimacro -L unimacro_ver \
                                    -L unisim -L unisims_ver \
                                    glbl \
                                    work.gtx_sim

#vsim -t ns -novopt -sv_lib $env(UVM_DPI) work.hello_world_example 

log -r /*
radix 16

#view -title {wang} wave
#具体模块需要添加的信号
do wave.do

run 100us
