// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    local.key = false;
    with load_par_obj { if key_var { local.key = true; }}
    if local.key { instance_destroy(); exit; }
    // Prop
    if instance_exists(load_par_obj)
    { store_tex_var = background_get_texture(load_par_obj.bg_arr_var[10,0]); }
    event_inherited();
    solid_var = false;
    type_var = 4; // Floor
    w_var = 2;
    l_var = 1;
    z = 9.5;
    dist_var = 0.1;
    flesh_var = false;
    // Trigger
    ini_open(global.lang_var);
    str_var = ini_read_string("UI","keycard","UI_keycard");
    str_look_var = ini_read_string("UI","keycard_look","UI_keycard_look");
    ini_close();
    with instance_create(x,y,interact_trig_obj)
    {
        other.trig_var = id;
        par_var = other.id;
        str_var = other.str_look_var;
    }
    trig_var.par_var = id;
    trig_var.str_var = str_look_var;
');
// Trigger Event
object_event_add
(argument0,ev_other,ev_user0,'
    with load_par_obj { key_var = true; }
    with instance_create(0,0,txt_obj)
    {
        cam_id_var = -1;
        par_var = other.id;
        str_var = other.str_var;
    }
    with trig_var { instance_destroy(); }
    fmod_snd_play_scr(deny_snd);
    instance_destroy();
');