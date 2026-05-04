// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,note_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj) { bg_var = load_par_obj.bg_arr_var[11,0]; }
    ini_open(global.lang_var);
    if global.diff_var == 0 { str_var = ini_read_string("NOTE","brain_02_easy","NOTE_brain_02_easy"); }
    else { str_var = ini_read_string("NOTE","brain_02","NOTE_brain_02"); }
    ini_close();
    str_margin_x_var = 60;
    str_margin_y_var = 60;
    str_scale_var = 1; // 0.33
    font_var = dh_font;
    event_inherited();
    z += 9.5;
');