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
    // Type handling
    ini_open("lang_"+global.lang_var+".ini");
    if global.diff_var == 0
    {
        type_var = 0;
        note_color_var = c_blue;
        note_str_var = ini_read_string("NOTE","gel_easy","NOTE_gel_easy");
        spawn_var = noone;
    }
    else
    {
        note_color_var = c_red;
        if global.gel_type_var == -1 { type_var = irandom(2); }
        else { type_var = global.gel_type_var; }
        switch type_var
        {
            case 0: { note_str_var = ini_read_string("NOTE","gel","NOTE_gel"); break; }
            case 2: { note_str_var = ini_read_string("NOTE","gel_hd","NOTE_gel_hd"); break; }
            default: { note_str_var = ini_read_string("NOTE","gel_og","NOTE_gel_og"); break; }
        }
        spawn_var = gel_obj;
    }
    ini_close();
    // Load
    menu_var = false;
    bg_len_var = 1;
    bg_arr_var[0,1] = gel_slime_bg_path;
    bg_arr_var[0,2] = false;
    bg_arr_var[0,3] = false;
    rm_len_var = 1;
    rm_arr_var[0,1] = gel_rm_path;
    rm_arr_var[0,2] = -1;
    rm_arr_var[0,3] = 0;
    obj_len_var = 2;
    obj_arr_var[0,1] = gel_note_obj_path;
    obj_arr_var[0,2] = -1;
    obj_arr_var[0,3] = 3;
    obj_arr_var[0,4] = spawn_var;
    obj_arr_var[0,5] = note_str_var;
    obj_arr_var[0,6] = note_color_var;
    obj_arr_var[1,1] = spawn_slime_obj_path;
    obj_arr_var[1,2] = -1;
    obj_arr_var[1,3] = 1;
    obj_arr_var[1,4] = 0;
    rm_var = 0;
    event_inherited();
');