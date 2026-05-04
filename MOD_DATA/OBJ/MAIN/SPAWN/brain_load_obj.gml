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
    menu_var = false;
    bg_len_var = 14;
    bg_arr_var[0,1] = vanilla_directory_const+"\TEX\mobile\MB_01_tex.png";
    bg_arr_var[0,2] = false;
    bg_arr_var[0,3] = false;
    bg_arr_var[1,1] = vanilla_directory_const+"\TEX\mobile\MB_08_tex.png";
    bg_arr_var[1,2] = false;
    bg_arr_var[1,3] = false;
    bg_arr_var[2,1] = vanilla_directory_const+"\TEX\mobile\MB_00_tex.png";
    bg_arr_var[2,2] = false;
    bg_arr_var[2,3] = false;
    bg_arr_var[3,1] = vanilla_directory_const+"\TEX\mobile\MB_02_tex.png";
    bg_arr_var[3,2] = false;
    bg_arr_var[3,3] = false;
    bg_arr_var[4,1] = main_directory_const+"\BG\RM\lab_door_bg.png";
    bg_arr_var[4,2] = false;
    bg_arr_var[4,3] = false;
    bg_arr_var[5,1] = vanilla_directory_const+"\TEX\mobile\MB_09_tex.png";
    bg_arr_var[5,2] = false;
    bg_arr_var[5,3] = false;
    bg_arr_var[6,1] = vanilla_directory_const+"\TEX\mobile\MB_04_tex.png";
    bg_arr_var[6,2] = false;
    bg_arr_var[6,3] = false;
    bg_arr_var[7,1] = vanilla_directory_const+"\TEX\mobile\MB_05_tex.png";
    bg_arr_var[7,2] = false;
    bg_arr_var[7,3] = false;
    bg_arr_var[8,1] = vanilla_directory_const+"\TEX\mobile\MB_07_tex.png";
    bg_arr_var[8,2] = false;
    bg_arr_var[8,3] = false;
    bg_arr_var[9,1] = vanilla_directory_const+"\TEX\mobile\MB_06_tex.png";
    bg_arr_var[9,2] = false;
    bg_arr_var[9,3] = false;
    bg_arr_var[10,1] = main_directory_const+"\BG\RM\lab_key_bg.png";
    bg_arr_var[10,2] = false;
    bg_arr_var[10,3] = false;
    bg_arr_var[11,1] = main_directory_const+"\BG\RM\lab_note_bg.png";
    bg_arr_var[11,2] = false;
    bg_arr_var[11,3] = false;
    bg_arr_var[12,1] = main_directory_const+"\BG\MON\bug_hole_bg.png";
    bg_arr_var[12,2] = false;
    bg_arr_var[12,3] = false;
    bg_arr_var[13,1] = main_directory_const+"\BG\RM\lab_subject_05_bg.png";
    bg_arr_var[13,2] = false;
    bg_arr_var[13,3] = false;
    spr_len_var = 1;
    spr_arr_var[0,1] = vanilla_directory_const+"\TEX\sprites\EX_01_spr.png";
    spr_arr_var[0,2] = 4;
    spr_arr_var[0,3] = false;
    spr_arr_var[0,4] = false;
    spr_arr_var[0,5] = 0;
    spr_arr_var[0,6] = 0;
    snd_len_var = 3;
    snd_arr_var[0,1] = main_directory_const+"\SND\RM\brain_rm_mus_snd.ogg";
    snd_arr_var[0,2] = false;
    snd_arr_var[1,1] = main_directory_const+"\SND\DEAD\bug_light_snd.wav";
    snd_arr_var[1,2] = true;
    snd_arr_var[2,1] = main_directory_const+"\SND\DEAD\bug_light_blink_snd.wav";
    snd_arr_var[2,2] = true;
    mdl_len_var = 4;
    mdl_arr_var[0,1] = main_directory_const+"\MDL\RM\lab_door_mdl.gmmod"
    mdl_arr_var[1,1] = main_directory_const+"\MDL\RM\lab_doorframe_mdl.gmmod"
    mdl_arr_var[2,1] = main_directory_const+"\MDL\RM\lab_door_down_mdl.gmmod"
    mdl_arr_var[3,1] = main_directory_const+"\MDL\RM\lab_doorframe_down_mdl.gmmod"
    rm_var = brain_01_rm;
    event_inherited();
    fmod_snd_set_group_scr(snd_arr_var[0,0],snd_group_mus_const);
    door_var = false;
    broke_var = false;
');