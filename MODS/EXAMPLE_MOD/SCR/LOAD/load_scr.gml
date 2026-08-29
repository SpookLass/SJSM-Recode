/*
Argument 0: Mod Directory
Translate can be set to false to use none, true to use the current file, and a string to use a custom translation file.
*/
globalvar example_directory_const;
example_directory_const = argument0;
// Description
    local.desc = "gurgle";
// This is not important, just something funny I wanted to include
    if frac_chance_scr(1,6) { local.desc += "_joke_"+string(irandom_range(1,6)) }
// Monster Group
    local.exgroup = global.mon_group_len_var;
    mon_group_arr[local.exgroup,0] = "example"; // Name
    mon_group_arr[local.exgroup,1] = "example"; // Translate
    global.mon_group_len_var += 1;
// Category
    local.type = 4; // You kinda just gotta know, sorry.
    local.exstate = custom_add_state_scr("example","example",local.type); // Label, Translate, Previous State.
    // Setting
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
        custom_add_scr(local.exstate,"example","example","example",custom_state_const,-1,-1,false,local.type,false);
        custom_arr_add_len_scr(0,1);
// Gurgle
    local.mon = type_add_scr("gurgle","example",true,local.exgroup,gurgle_obj,gurgle_load_rm,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
    local.mon_set = type_add_set_scr(local.mon,"gurgle",local.desc,local.exstate,true); /*ID, Variable Name, Description, Category, Can Disable*/
    // Types
        type_add_type_scr(local.mon,local.mon_set,"recode","recode","example"); /*Type ID, Setting ID, Label, Description, Translate*/
        type_add_type_scr(local.mon,local.mon_set,"og","og","example");
        type_add_type_scr(local.mon,local.mon_set,"hd","hd","example");
    // Defaults
        custom_arr_add_len_scr(0,1);
        custom_arr_set_scr(0,local.mon_set,-1,-1,-1); // Default (Recode)
        custom_arr_set_scr(-2,local.mon_set,-1,0,-1); // Story Mode (Off)
        custom_arr_set_scr(1,local.mon_set,-1,-1,1); // OG
        custom_arr_set_scr(2,local.mon_set,-1,-1,2); // HD
        custom_arr_set_scr(-1,local.mon_set,5,-1,-1); // :) (Random)