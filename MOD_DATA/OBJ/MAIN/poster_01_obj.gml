object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    load_var = false;
    if global.mode_var == 0 { local.path = vanilla_directory_const+"\TEX\sprites\POS_"+choose("07","08","09","10")+"_spr.png"; }
    else
    {
        if file_exists(working_directory+"\Karamari_Hospital\KH.exe") { local.rand = irandom(18); }
        else { local.rand = irandom(17); }
        switch local.rand
        {
            case 0: { local.path = vanilla_directory_const+"\TEX\sprites\POS_07_spr.png"; break; }
            case 1: { local.path = vanilla_directory_const+"\TEX\sprites\POS_08_spr.png"; break; }
            case 2: { local.path = vanilla_directory_const+"\TEX\sprites\POS_09_spr.png"; break; }
            case 3: { local.path = vanilla_directory_const+"\TEX\sprites\POS_10_spr.png"; break; }
            case 4: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_01.png"; break; }
            case 5: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_02.png"; break; }
            case 6: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_03.png"; break; }
            case 7: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_04.png"; break; }
            case 8: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_05.png"; break; }
            case 9: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_06.png"; break; }
            case 10: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_07.png"; break; }
            case 11: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_08.png"; break; }
            case 12: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_09.png"; break; }
            case 13: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_10.png"; break; }
            case 14: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_11.png"; break; }
            case 15: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_12.png"; break; }
            case 16: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_13.png"; break; }
            case 17: { local.path = vanilla_directory_const+"\EM\TEX\EM_POS_14.png"; break; } // I should probably make an array
            case 18: { local.path = kh_directory_const+"\TEX\BGN_08.png"; break; }
        }
    }
    bg_var = background_add(local.path,false,false);
    bg_load_var = true;
    store_tex_var = background_get_texture(bg_var);
    event_inherited();
    type_var = 10;
    dist_var = 0.1;
    direction = 90;
    w_var = 11.4;
    h_var = 16;
    z = 14.5;
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Delete Event
object_event_add
(argument0,ev_other,ev_user0,'
    if load_var
    {
        background_delete(bg_var);
        load_var = false;
    }
');