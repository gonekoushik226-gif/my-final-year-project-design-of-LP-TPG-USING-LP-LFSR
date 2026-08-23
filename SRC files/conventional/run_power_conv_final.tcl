# ============================================================
# Conv LFSR Complete Power Analysis - Single Paste Script
# ============================================================

# Close any existing SAIF or simulation first
catch {close_saif}
catch {close_sim}

# Step 1: Generate SAIF from simulation
set_property -name {xsim.simulate.saif} -value {tpgmain8_conv.saif} -objects [get_filesets sim_1]
set_property -name {xsim.simulate.runtime} -value {2560ns} -objects [get_filesets sim_1]
launch_simulation
catch {close_saif}
open_saif tpgmain8_conv.saif
log_saif [get_objects -r /tb_tpgmain8_conv/*]
run 2560ns
close_saif
close_sim

# Step 2: Open impl and report power with SAIF
open_run impl_1
read_saif "D:/FINAL YEAR PROJECT/4-2 MY GROUP PROJECT/conv tpg using conv lfsr/CONV TPG USING CONV LFSR/CONV TPG USING CONV LFSR.sim/sim_1/behav/xsim/tpgmain8_conv.saif"
report_power -name power_conv -file "D:/FINAL YEAR PROJECT/4-2 MY GROUP PROJECT/conv tpg using conv lfsr/power_conv.rpt"

puts "========================================"
puts "DONE: Conv LFSR power report saved"
puts "========================================"
