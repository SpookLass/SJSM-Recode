/*
Argument 0: Save to load
Loads a save with the specified name
This is NOT the same as game_load_scr, the script that initializes the game
*/
ini_open("save_"+argument0+".ini");
// Main
    // Saved variables
global.save_name_var = argument0;
global.rm_count_var = ini_read_real("MAIN","rm_count",0);
global.count_var = ini_read_real("MAIN","count",0);
global.mon_fail_var = ini_read_real("MAIN","mon_fail_var",0);
global.tex_var = ini_read_real("MAIN","tex",-1);
local.rm = ini_read_real("MAIN","room",hall_01_rm);
global.note_var = ini_read_real("MAIN","note",0);
global.zone_var = ini_read_real("MAIN","zone",global.zone_arr[0]);
global.zone_num_var = ini_read_real("MAIN","zone_num",-1);
    // Main settings
global.mode_var = ini_read_real("MAIN","mode",1);
global.main_type_var = ini_read_real("MAIN","type",0);
global.diff_var = ini_read_real("MAIN","diff",0);
global.custom_var = ini_read_real("MAIN","custom",0);
    // Lists
ds_list_clear(global.rm_list_var);
ds_list_read(global.rm_list_var,ini_read_string("MAIN","rm_list","2F01000000000000"));
ds_list_clear(global.mon_curr_list);
ds_list_read(global.mon_curr_list,ini_read_string("MAIN","mon_curr_list","2F01000000000000"));
// Settings
for (local.i=0; local.i<global.custom_len_var; local.i+=1)
{
    if custom_arr[local.i,4] != 6 // Not Monster List
    {
        if custom_arr[local.i,4] == 5 // String
        { local.value = ini_read_string("SETTING",custom_arr[local.i,0],custom_arr_get_scr(local.i,global.diff_var,global.mode_var,global.main_type_var)); }
        // Number
        { local.value = ini_read_real("SETTING",custom_arr[local.i,0],custom_arr_get_scr(local.i,global.diff_var,global.mode_var,global.main_type_var)); }
        execute_string("global."+custom_arr[local.i,0]+"_var = argument0",local.value);
    }
}
// Behavior stuff
for (local.i=0; local.i<global.mon_len_var; local.i+=1;)
{ execute_string("global."+mon_arr[local.i,0]+"_type_var = argument0",ini_read_real("BEHAVIOR",mon_arr[local.i,0]+"_type",global.main_type_var)); }
// Players
for (local.i=0; local.i<global.player_len_var; local.i+=1;)
{
    with instance_create(0,0,player_obj)
    {
        local.player = id;
        global.player_arr[local.i] = id;
        player_id_var = local.i;
        cam_id_var = local.i;
        hp_var = ini_read_real("PLAYER","hp_"+string(local.i),hp_var);
        violence_var = ini_read_real("PLAYER","violence_"+string(local.i),violence_var);
        with instance_create(0,0,hud_obj) { par_var = local.player; }
        with instance_create(0,0,axe_obj) { par_var = local.player; }
        if global.player_len_var > 1
        {
            with instance_create(0,0,player_render_obj)
            {
                player_id_var = local.i;
                par_var = local.player;
                event_user(0);
            }
        }
    }
}
ini_close();
instance_create(0,0,mus_control_obj);
// Spawn present specimens
for (local.i=0; local.i<ds_list_size(global.mon_curr_list); local.i+=1;)
{ instance_create(0,0,ds_list_find_value(global.mon_curr_list,local.i)); }
// Other stuff
tex_scr(global.tex_var);
if argument0 == "1987" { instance_create(0,0,otter8_js_obj); }

rm_goto_scr(local.rm);