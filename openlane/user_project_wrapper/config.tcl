# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin

set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "gf180mcu_fd_sc_mcu7t5v0"

# YOU CAN CHANGE ANY VARIABLES DEFINED IN THE DEFAULT WRAPPER CFGS BY OVERRIDING THEM IN THIS CONFIG.TCL
source $::env(DESIGN_DIR)/fixed_dont_change/default_wrapper_cfgs.tcl

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations

## Source Verilog Files
set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/user_project_wrapper.v"

## Clock configurations
set ::env(CLOCK_PORT) "user_clock2"
#set ::env(CLOCK_NET) "mprj.clk"

set ::env(CLOCK_PERIOD) "50.0"

## Internal Macros
### Macro PDN Connections
set ::env(FP_PDN_MACRO_HOOKS) "\
	wfg_top_inst                            vdd vss vdd vss, \
	merge_memory_inst                       vdd vss vdd vss, \
	wb_mux_inst                             vdd vss vdd vss, \
	wb_memory_inst                          vdd vss vdd vss, \
	dffram_1rw1r_32_64_inst                 vdd vss vdd vss"

### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) $::env(DESIGN_DIR)/macro.cfg

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$::env(DESIGN_DIR)/../../verilog/gl/wfg_top.v \
	$::env(DESIGN_DIR)/../../verilog/gl/merge_memory.v \
	$::env(DESIGN_DIR)/../../verilog/gl/wb_mux.v \
	$::env(DESIGN_DIR)/../../verilog/gl/wb_memory.v \
	$::env(DESIGN_DIR)/../../verilog/gl/dffram_1rw1r_32_64.v"

set ::env(EXTRA_LEFS) "\
	$::env(DESIGN_DIR)/../../lef/wfg_top.lef \
	$::env(DESIGN_DIR)/../../lef/merge_memory.lef \
	$::env(DESIGN_DIR)/../../lef/wb_mux.lef \
	$::env(DESIGN_DIR)/../../lef/wb_memory.lef \
	$::env(DESIGN_DIR)/../../lef/dffram_1rw1r_32_64.lef"

set ::env(EXTRA_GDS_FILES) "\
	$::env(DESIGN_DIR)/../../gds/wfg_top.gds \
	$::env(DESIGN_DIR)/../../gds/merge_memory.gds \
	$::env(DESIGN_DIR)/../../gds/wb_mux.gds \
	$::env(DESIGN_DIR)/../../gds/wb_memory.gds \
	$::env(DESIGN_DIR)/../../gds/dffram_1rw1r_32_64.gds"

set ::env(RT_MAX_LAYER) {Metal4}

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0

# The following is because there are no std cells in the example wrapper project.
set ::env(SYNTH_ELABORATE_ONLY) 1
set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

set ::env(FP_PDN_ENABLE_RAILS) 0

set ::env(DIODE_INSERTION_STRATEGY) 0
set ::env(RUN_FILL_INSERTION) 0
set ::env(RUN_TAP_DECAP_INSERTION) 0
set ::env(CLOCK_TREE_SYNTH) 0

# YOU ARE NOT ALLOWED TO CHANGE ANY VARIABLES DEFINED IN THE FIXED WRAPPER CFGS 
source $::env(DESIGN_DIR)/fixed_dont_change/fixed_wrapper_cfgs.tcl
