onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {tx channal}
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txusrclk_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txdata_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txcharisk_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_gtxtxp_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_gtxtxn_out
add wave -noupdate -divider {rx channal}
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxusrclk_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxdata_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxcharisk_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_gtxrxp_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_gtxrxn_in
add wave -noupdate -divider complete
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_tx_fsm_reset_done_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rx_fsm_reset_done_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_data_valid_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxresetdone_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txresetdone_out
add wave -noupdate -divider {New Divider}
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/sysclk_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/soft_reset_tx_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/soft_reset_rx_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/dont_reset_on_data_error_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_cpllfbclklost_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_cplllock_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_cplllockdetclk_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_cpllreset_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_gtrefclk0_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_gtrefclk1_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_drpaddr_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_drpclk_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_drpdi_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_drpdo_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_drpen_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_drprdy_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_drpwe_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_dmonitorout_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_eyescanreset_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxuserrdy_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_eyescandataerror_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_eyescantrigger_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxcdrhold_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxclkcorcnt_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxusrclk2_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxdisperr_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxnotintable_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxbyteisaligned_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxbyterealign_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxcommadet_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxdfelpmreset_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxmonitorout_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxmonitorsel_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxoutclk_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxoutclkfabric_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_gtrxreset_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxpmareset_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxcomsasdet_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxcomwakedet_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxcominitdet_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxelecidle_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxslide_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_rxchariscomma_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_gttxreset_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txuserrdy_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txusrclk2_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txelecidle_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txoutclk_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txoutclkfabric_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txoutclkpcs_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txcomfinish_out
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txcominit_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txcomsas_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_txcomwake_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_qplloutclk_in
add wave -noupdate /gtx_sim/gtx_driveEx01/sataEx01/gt0_qplloutrefclk_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70038085 ps} 1} {{Cursor 2} {70151082 ps} 1} {{Cursor 3} {57002756 ps} 0}
quietly wave cursor active 3
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {84 us}
