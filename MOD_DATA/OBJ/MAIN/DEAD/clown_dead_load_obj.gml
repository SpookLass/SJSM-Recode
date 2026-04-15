// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,load_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    menu_var = true;
    bg_len_var = 8;
    bg_arr_var[0,1] = dh_directory_const+"\TEX\DOLL\WALL_11.png";
    bg_arr_var[0,2] = false;
    bg_arr_var[0,3] = false;
    bg_arr_var[1,1] = dh_directory_const+"\TEX\DOLL\FLOOR_05.png";
    bg_arr_var[1,2] = false;
    bg_arr_var[1,3] = false;
    bg_arr_var[2,1] = dh_directory_const+"\TEX\DOLL\CEILING_01.png";
    bg_arr_var[2,2] = false;
    bg_arr_var[2,3] = false;
    bg_arr_var[3,1] = dh_directory_const+"\TEX\DOLL\MODELS\CAGE.png";
    bg_arr_var[3,2] = false;
    bg_arr_var[3,3] = false;
    bg_arr_var[4,1] = dh_directory_const+"\TEX\DOLL\DOOR_01.png";
    bg_arr_var[4,2] = false;
    bg_arr_var[4,3] = false;
    bg_arr_var[5,1] = dh_directory_const+"\TEX\DOLL\MODELS\TRIM_02.png";
    bg_arr_var[5,2] = false;
    bg_arr_var[5,3] = false;
    bg_arr_var[6,1] = dh_directory_const+"\TEX\DOLL\MODELS\WINDOW.png";
    bg_arr_var[6,2] = false;
    bg_arr_var[6,3] = false;
    bg_arr_var[7,1] = dh_directory_const+"\TEX\DOLL\MODELS\TABLE_01.png";
    bg_arr_var[7,2] = false;
    bg_arr_var[7,3] = false;
    spr_len_var = 1;
    spr_arr_var[0,1] = dh_directory_const+"\TEX\sprites\CLWN_SPR1.png";
    spr_arr_var[0,2] = 6;
    spr_arr_var[0,3] = false;
    spr_arr_var[0,4] = false;
    spr_arr_var[0,5] = 0;
    spr_arr_var[0,6] = 0;
    snd_len_var = 1;
    snd_arr_var[0,1] = main_directory_const+"\SND\DEAD\clown_dead_snd.mp3";
    snd_arr_var[0,2] = false;
    mdl_len_var = 8;
    mdl_arr_var[0,1] = main_directory_const+"\MDL\DH\clown_cage_mdl.gmmod";
    mdl_arr_var[1,1] = main_directory_const+"\MDL\DH\dh_door_01_mdl.gmmod";
    mdl_arr_var[2,1] = main_directory_const+"\MDL\DH\dh_doorframe_01_mdl.gmmod";
    mdl_arr_var[3,1] = main_directory_const+"\MDL\DH\dh_doorframe_02_mdl.gmmod";
    mdl_arr_var[4,1] = main_directory_const+"\MDL\DH\dh_pillar_01_mdl.gmmod";
    mdl_arr_var[5,1] = main_directory_const+"\MDL\DH\dh_window_01_mdl.gmmod";
    mdl_arr_var[6,1] = main_directory_const+"\MDL\DH\dh_window_02_mdl.gmmod";
    mdl_arr_var[7,1] = main_directory_const+"\MDL\DH\dh_table_01_mdl.gmmod";
    rm_var = clown_dead_rm;
    global.can_pause_var = false;
    event_inherited();
    fmod_snd_set_group_scr(snd_arr_var[0,0],snd_group_mus_const);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    global.can_pause_var = true;
    event_inherited();
');