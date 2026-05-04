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
    if !variable_local_exists("bg_var") { bg_var = note_bg; }
    cam_id_var = -1;
    player_id_var = 0;
    // String
    if !variable_local_exists("str_margin_x_var") { str_margin_x_var = 30; }
    if !variable_local_exists("str_margin_y_var") { str_margin_y_var = 96; }
    if !variable_local_exists("str_scale_var") { str_scale_var = 0.4; }
    if !variable_local_exists("str_color_var") { str_color_var = c_black; }
    if !variable_local_exists("font_var") { font_var = main_font; }
    if !variable_local_exists("str_var")
    {
        str_var = note_scr();
        story_var = !global.note_override_var;
    }
    else { story_var = false; }
    read_var = false;
    // Surface
    surf_w_var = 600;
    surf_h_var = 680;
    surf_var = surface_create(surf_w_var,surf_h_var);
    event_user(1);
    store_tex_var = surface_get_texture(surf_var);
    // Sound
    snd_len_var = 4;
    snd_arr[0] = paper_01_snd;
    snd_arr[1] = paper_02_snd;
    snd_arr[2] = paper_03_snd;
    snd_arr[3] = paper_04_snd;
    // Prop
    event_inherited();
    solid_var = false;
    type_var = 4; // Floor
    w_var = 3;
    l_var = 4;
    dist_var = 0.1;
    flesh_var = false;
    // Trigger
    with instance_create(x,y,note_trig_obj)
    {
        par_var = other.id;
        z = other.z;
        str_var = "Read";
        other.trig_var = id;
    }
    // Main type
    if global.main_type_var == 0 { color_var = 3; }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_user(2);
');
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(2);
');
// Delete Event
object_event_add
(argument0,ev_other,ev_user2,'
    if read_var && story_var { global.note_var += 1; }
    with note_read_obj { if par_var == other.id { instance_destroy(); }}
    with note_trig_obj { if par_var == other.id { instance_destroy(); }}
    surface_free(surf_var);
');
// Redraw Surface
object_event_add
(argument0,ev_other,ev_user1,'
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    d3d_set_projection_ortho(0,0,surf_w_var,surf_h_var,0);
    d3d_set_hidden(false);
    d3d_set_fog(false,c_black,0,0);
    draw_background_stretched(bg_var,0,0,surf_w_var,surf_h_var);
    draw_set_font(font_var);
    draw_set_color(str_color_var);
    draw_text_ext_transformed(str_margin_x_var,str_margin_y_var,str_var,-1,(surf_w_var-(str_margin_x_var*2))/str_scale_var,str_scale_var,str_scale_var,0);
    draw_set_color(c_white);
    draw_set_font(main_font);
    d3d_set_hidden(true);
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    surface_reset_target();
');
// Pick up note
object_event_add
(argument0,ev_other,ev_user0,'
    player_id_var = interact_target_var.player_id_var;
    global.input_press_arr[interact_input_const,player_id_var] = 0;
    trig_var.on_var = false;
    trig_var.read_var = true;
    read_var = true;
    cam_id_var = interact_target_var.cam_id_var;
    with instance_create(0,0,note_read_obj)
    {
        par_var = other.id;
        player_id_var = other.player_id_var;
        cam_id_var = other.cam_id_var;
        surf_var = other.surf_var;
        image_blend = other.image_blend;
        image_alpha = other.image_alpha;
    }
    fmod_snd_play_scr(snd_arr[irandom(snd_len_var-1)]);
');
// Put down note
object_event_add
(argument0,ev_other,ev_user3,'
    global.input_press_arr[interact_input_const,player_id_var] = 0;
    trig_var.on_var = true;
    trig_var.read_var = false;
    cam_id_var = -1;
    with note_read_obj { if par_var == other.id { instance_destroy(); }}
    fmod_snd_play_scr(snd_arr[irandom(snd_len_var-1)]);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if cam_id_var != view_current { event_inherited(); }
');
