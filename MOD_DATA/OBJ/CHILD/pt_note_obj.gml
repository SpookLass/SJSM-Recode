// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,note_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,'
    bg_var = background_add(main_directory_const+"\BG\RM\asy_note_bg.png",false,false);
    bg_load_var = true;
    ini_open(global.lang_var);
    str_var = ini_read_string("NOTE","pt","NOTE_pt");
    ini_close();
    event_inherited();
    z += 9.5;
    trig_var.on_var = false;
');
// Delete Event
object_event_add
(argument0,ev_other,ev_user2,'
    event_inherited();
    if bg_load_var
    {
        background_delete(bg_var);
        bg_load_var = false;
    }
');
// Turn on
object_event_add
(argument0,ev_other,ev_user4,'
    on_var = true;
    trig_var.on_var = true;
    visible = true;
');