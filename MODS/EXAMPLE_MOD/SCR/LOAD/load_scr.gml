/*
Argument 0: Mod Directory
*/
globalvar example_directory_const;
example_directory_const = argument0;
// Funny
    if frac_chance_scr(1,6)
    {
        switch (irandom(5))
        {
            case 0: { local.desc = "Shoutouts to YoshiCraft64!"; break; }
            case 1: { local.desc = "So retro!"; break; }
            case 2: { local.desc = "It's a Gurgle! Don't think about it too hard."; break; }
            case 3: { local.desc = "Hear it hurgling!"; break; }
            case 4: { local.desc = "Thumbs up!"; break; }
            case 5: { local.desc = "Members have access to more Gurgle and can earn more Acheesements!"; break; }
        }
    }
    else { local.desc = "The creature from a bygone era."; }
// Monster Group
    local.exgroup = global.mon_group_len_var;
    mon_group_arr[local.exgroup,0] = "EXAMPLE";
    mon_group_arr[local.exgroup,1] = false;
    global.mon_group_len_var += 1;
// Category
    local.type = 4; // You kinda just gotta know, sorry.
    local.exstate = custom_add_state_scr("EXAMPLE",false,local.type);
    // Setting
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Has Descriptions*/
        custom_add_scr(local.exstate,"EXAMPLE","Example monsters for the example mod",false,custom_state_const,-1,-1,false,local.type,false);
        custom_arr_add_len_scr(0,1);
// Gurgle
    local.gurgle = type_add_scr("Gurgle",false,true,local.exgroup,gurgle_obj,noone,noone,noone); /*Name, Translate, Chase, Group, Object, Room, CAT-DOS Object, Wiki Object*/
    local.gurgle_set = type_add_set_scr(local.gurgle,"gurgle",local.desc,local.exstate,true); /*ID, Variable Name, Description, Category, Can Disable*/
    // Types
        type_add_type_scr(local.gurgle,local.gurgle_set,"RECODE","Deals less damage and has a smaller hitbox.",false); /*Type ID, Setting ID, Label, Description, Translate*/
        type_add_type_scr(local.gurgle,local.gurgle_set,"ORIGINAL","Deals more damage and has a bigger hitbox.",false);
        type_add_type_scr(local.gurgle,local.gurgle_set,"RENOVATION","Inherits all the oddities of your average Renovation enemy.",false);
    // Defaults
        custom_arr_add_len_scr(0,1);
        custom_arr_set_scr(0,local.gurgle_set,-1,-1,-1); // Default (Recode)
        custom_arr_set_scr(-2,local.gurgle_set,-1,0,-1); // Story Mode (Off)
        custom_arr_set_scr(1,local.gurgle_set,-1,-1,1); // OG
        custom_arr_set_scr(2,local.gurgle_set,-1,-1,2); // HD
        custom_arr_set_scr(-1,local.gurgle_set,5,-1,-1); // :) (Random)