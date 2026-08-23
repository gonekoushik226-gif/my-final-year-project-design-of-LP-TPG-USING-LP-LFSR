# ============================================================
# LP-LFSR Complete Power Analysis - Single Paste Script
# ============================================================

# Close any existing SAIF or simulation first
catch {close_saif}
catch {close_sim}

# Step 1: Generate SAIF from simulation
set_property -name {xsim.simulate.saif} -value {tpgmain8.saif} -objects [get_filesets sim_1]
set_property -name {xsim.simulate.runtime} -value {2560ns} -objects [get_filesets sim_1]
launch_simulation
catch {close_saif}
open_saif tpgmain8.saif
log_saif [get_objects -r /tb_tpgmain8/*]
run 2560ns
close_saif
close_sim

# Step 2: Open impl and report power with SAIF
open_run impl_1
read_saif "D:/FINAL YEAR PROJECT/4-2 MY GROUP PROJECT/LPTPG USING LPLFSR/LP TPG USING LP LFSR/LP TPG USING LP LFSR.sim/sim_1/behav/xsim/tpgmain8.saif"
report_power -name power_lp_lfsr -file "D:/FINAL YEAR PROJECT/4-2 MY GROUP PROJECT/LPTPG USING LPLFSR/power_lp_lfsr.rpt"

puts "========================================"
puts "DONE: LP-LFSR power report saved"
puts "========================================"
