/*
Argument 0: Save to load
Loads a save with the specified name
This is NOT the same as game_load_scr, the script that initializes the game
*/
ini_open("save_"+argument0+".ini");
// Main
global.save_name_var = argument0;
global.rm_count_var = ini_read_real("MAIN","rm_count",0);
global.violence_var = ini_read_real("MAIN","violence",0);
global.note_var = ini_read_real("MAIN","note",0);
global.mode_var = ini_read_real("MAIN","mode",1);
global.diff_var = ini_read_real("MAIN","diff",0);
global.custom_var = ini_read_real("MAIN","custom",0);
global.zone_var = ini_read_real("MAIN","zone",global.zone_arr[0]);
global.count_var = ini_read_real("MAIN","count",0);
global.tex_var = ini_read_real("MAIN","tex",-1);
local.rm = ini_read_real("MAIN","room",0);
ds_list_clear(global.rm_list_var);
ds_list_read(global.rm_list_var,ini_read_string("MAIN","rm_list",""));
ds_list_clear(global.mon_curr_list);
ds_list_read(global.mon_curr_list,ini_read_string("MAIN","mon_curr_list",""));
// Settings
global.jump_var = ini_read_real("SETTING","jump",false);
global.crouch_var = ini_read_real("SETTING","crouch",false);
global.stam_per_var = ini_read_real("SETTING","stam_per",false);
global.fall_var = ini_read_real("SETTING","fall",false);
global.lock_var = ini_read_real("SETTING","lock",1);
global.dmg_shake_var = ini_read_real("SETTING","dmg_shake",false);
global.mult_type_var = ini_read_real("SETTING","multi_type",0);
global.mult_min_var = ini_read_real("SETTING","multi_min",1);
global.mult_max_var = ini_read_real("SETTING","multi_max",5);
global.mult_start_var = ini_read_real("SETTING","multi_start",0);
global.mult_end_var = ini_read_real("SETTING","multi_end",1000);
global.count_type_var = ini_read_real("SETTING","count_type",0);
global.count_min_var = ini_read_real("SETTING","count_min",0);
global.count_max_var = ini_read_real("SETTING","count_max",20);
global.count_start_var = ini_read_real("SETTING","count_start",0);
global.count_end_var = ini_read_real("SETTING","count_end",1000);
global.dupe_var = ini_read_real("SETTING","dupe",dupe_canon_const);
global.mon_chance_var = ini_read_real("SETTING","mon_chance",mon_chance_const);
global.mon_chance_mult_var = ini_read_real("SETTING","mon_chance_mult",mon_chance_mult_const);
global.js_chance_var = ini_read_real("SETTING","js_chance",js_chance_const);
global.ele_type_var = ini_read_real("SETTING","ele_type",ele_type_const);
global.ele_end_01_var = ini_read_real("SETTING","ele_end_01",ele_end_01_const);
global.ele_end_02_var = ini_read_real("SETTING","ele_end_02",ele_end_02_const);
global.ele_rate_01_var = ini_read_real("SETTING","ele_rate_01",ele_rate_01_const);
global.ele_rate_02_var = ini_read_real("SETTING","ele_rate_02",ele_rate_02_const);
global.ele_rate_03_var = ini_read_real("SETTING","ele_rate_03",ele_rate_03_const);
global.rare_chance_var = ini_read_real("SETTING","rare_chance",rare_chance_const);
// Behavior stuff
global.default_type_var = ini_read_real("BEHAVIOR","type",0);
global.player_type_var = ini_read_real("BEHAVIOR","player_type",global.default_type_var);
global.axe_type_var = ini_read_real("BEHAVIOR","axe_type",global.default_type_var);
global.gel_type_var = ini_read_real("BEHAVIOR","gel_type",global.default_type_var);
global.bug_type_var = ini_read_real("BEHAVIOR","bug_type",global.default_type_var);
global.ringu_type_var = ini_read_real("BEHAVIOR","ringu_type",global.default_type_var);
global.bab_type_var = ini_read_real("BEHAVIOR","bab_type",global.default_type_var);
global.pup_type_var = ini_read_real("BEHAVIOR","pup_type",global.default_type_var);
global.flesh_type_var = ini_read_real("BEHAVIOR","flesh_type",global.default_type_var);
global.dl_type_var = ini_read_real("BEHAVIOR","dl_type",global.default_type_var);
global.taker_type_var = ini_read_real("BEHAVIOR","taker_type",global.default_type_var);
global.eel_type_var = ini_read_real("BEHAVIOR","eel_type",global.default_type_var);
global.para_type_var = ini_read_real("BEHAVIOR","para_type",global.default_type_var);
global.fd_type_var = ini_read_real("BEHAVIOR","fd_type",global.default_type_var);
global.killer_type_var = ini_read_real("BEHAVIOR","killer_type",global.default_type_var);
global.mur_type_var = ini_read_real("BEHAVIOR","mur_type",global.default_type_var);
global.sg_type_var = ini_read_real("BEHAVIOR","sg_type",global.default_type_var);
global.body_type_var = ini_read_real("BEHAVIOR","body_type",global.default_type_var);
global.stem_type_var = ini_read_real("BEHAVIOR","stem_type",global.default_type_var);
global.patient_type_var = ini_read_real("BEHAVIOR","patient_type",global.default_type_var);
global.cow_type_var = ini_read_real("BEHAVIOR","cow_type",global.default_type_var);
global.bekka_type_var = ini_read_real("BEHAVIOR","bekka_type",global.default_type_var);
global.husk_type_var = ini_read_real("BEHAVIOR","husk_type",global.default_type_var);
global.wc_type_var = ini_read_real("BEHAVIOR","wc_type",global.default_type_var);
global.clown_type_var = ini_read_real("BEHAVIOR","clown_type",global.default_type_var);
global.hd_type_var = ini_read_real("BEHAVIOR","hd_type",global.default_type_var);
global.frenzy_type_var = ini_read_real("BEHAVIOR","frenzy_type",global.default_type_var);
global.real_ringu_type_var = ini_read_real("BEHAVIOR","real_ringu_type",global.default_type_var);
global.tiri_type_var = ini_read_real("BEHAVIOR","tiri_type",global.default_type_var);
global.lisa_type_var = ini_read_real("BEHAVIOR","lisa_type",global.default_type_var);
global.otto_type_var = ini_read_real("BEHAVIOR","otto_type",global.default_type_var);
global.spooper_type_var = ini_read_real("BEHAVIOR","spooper_type",global.default_type_var);
global.wf_type_var = ini_read_real("BEHAVIOR","wf_type",global.default_type_var);
global.js_type_var = ini_read_real("BEHAVIOR","js_type",global.default_type_var);
ini_close();

global.player_len_var = 1;
local.player = instance_create(0,0,player_obj);
local.hud = instance_create(0,0,global.hud_obj);
local.hud.par_var = local.player;
local.axe = instance_create(0,0,global.axe_obj);
local.axe.par_var = local.player;
instance_create(0,0,mus_control_obj);
// Spawn present specimens
for (local.i=0; local.i<ds_list_size(global.mon_curr_list); local.i+=1;)
{ instance_create(0,0,ds_list_find_value(global.mon_curr_list,local.i)); }
// Other stuff
tex_scr(global.tex_var);
if argument0 == "1987" { instance_create(0,0,otter8_js_obj); }

rm_goto_scr(local.rm);