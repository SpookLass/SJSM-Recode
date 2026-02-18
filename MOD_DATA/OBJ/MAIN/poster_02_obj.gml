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
    if ((global.mode_var == 0 && global.rm_count_var > 100) 
    || (global.mode_var != 0 && file_exists(working_directory+"\Karamari_Hospital\KH.exe")))
    && frac_chance_scr(2,3)
    {
        if global.mode_var == 0
        {
            local.rand = 0;
            if global.rm_count_var >= 500 { local.rand = irandom(5); }
            else if global.rm_count_var >= 400 { local.rand = irandom(1); }
            switch local.rand
            {
                case 0: { local.path = vanilla_directory_const+"\TEX\sprites\POS_01_spr.png"; break; }
                case 1: { local.path = vanilla_directory_const+"\TEX\sprites\POS_02_spr.png"; break; }
                case 2: { local.path = vanilla_directory_const+"\TEX\sprites\POS_03_spr.png"; break; }
                case 3: { local.path = vanilla_directory_const+"\TEX\sprites\POS_04_spr.png"; break; }
                case 4: { local.path = vanilla_directory_const+"\TEX\sprites\POS_05_spr.png"; break; }
                case 5: { local.path = vanilla_directory_const+"\TEX\sprites\POS_06_spr.png"; break; }
            }
        }
        else
        {
            switch irandom(1)
            {
                case 0: { local.path = kh_directory_const+"\TEX\BGN_07.png"; break; }
                case 1: { local.path = kh_directory_const+"\TEX\BGN_07b.png"; break; } // I should probably make an array
            }
        }
        bg_var = background_add(local.path,false,false);
        bg_load_var = true;
        store_tex_var = background_get_texture(bg_var);
        event_inherited();
        type_var = 10;
        dist_var = 0.1;
        direction = 0;
        w_var = 12;
        h_var = 17.2;
        z = 11;
    }
    else { instance_destroy(); }
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