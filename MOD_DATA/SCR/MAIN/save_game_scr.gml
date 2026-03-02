if ds_list_find_index(global.save_list,global.save_name_var) == -1
{
    ds_list_add(global.save_list,string(global.save_name_var));
    
    ini_open("saves.ini");
    
    ini_write_string("SAVES","SAVES",ds_list_write(global.save_list));
    
    ini_close();
}
ini_open("save_"+string(global.save_name_var)+".ini");
// Main
    // Saved variables
ini_write_real("MAIN","rm_count",global.rm_count_var);
ini_write_real("MAIN","note",global.note_var);
ini_write_real("MAIN","room",room);
ini_write_real("MAIN","tex",global.tex_var);
ini_write_real("MAIN","count",global.count_var);
ini_write_real("MAIN","mon_fail_var",global.mon_fail_var);
ini_write_real("MAIN","zone",global.zone_var);
ini_write_real("MAIN","zone_num",global.zone_num_var);
    // Main settings
ini_write_real("MAIN","mode",global.mode_var);
ini_write_real("MAIN","type",global.main_type_var);
ini_write_real("MAIN","diff",global.diff_var);
ini_write_real("MAIN","custom",global.custom_var);
if ds_list_size(global.mod_list)>0 { ini_write_string("MAIN","mod",true); }
else { ini_write_string("MAIN","mod",false); }
    // Lists
ini_write_string("MAIN","rm_list",ds_list_write(global.rm_list_var));
ini_write_string("MAIN","mon_curr_list",ds_list_write(global.mon_curr_list));
ini_write_string("MAIN","mod_list",ds_list_write(global.mod_list));
// Settings
for (local.i=0; local.i<global.custom_len_var; local.i+=1)
{
    if custom_arr[local.i,4] != 6 // Not Monster List
    {
        if custom_arr[local.i,4] == 5 // String
        { ini_write_string("SETTING",custom_arr[local.i,0],variable_global_get(custom_arr[local.i,0]+"_var")); }
        // Number
        else { ini_write_real("SETTING",custom_arr[local.i,0],variable_global_get(custom_arr[local.i,0]+"_var")); }
    }
}
// Behavior stuff
for (local.i=0; local.i<global.mon_len_var; local.i+=1;)
{ ini_write_real("BEHAVIOR",mon_arr[local.i,0]+"_type",variable_global_get(mon_arr[local.i,0]+"_type_var")); }
// Players
for (local.i=0; local.i<global.player_len_var; local.i+=1;)
{
    ini_write_real("PLAYER","violence_"+string(local.i),global.player_arr[local.i].violence_var);
    ini_write_real("PLAYER","hp_"+string(local.i),global.player_arr[local.i].hp_var);
}
ini_close();