// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
execute_string
("
    global.brain_tank_coll[1] = 24;
    global.brain_tank_coll[2] = 24;
    global.brain_tank_coll[3] = 24;
    global.brain_tank_coll[0] = prop_to_coll_scr(3,'',global.brain_tank_coll[2],global.brain_tank_coll[3],global.brain_tank_coll[1],true,8);
");
// Create event
object_event_add
(argument0,ev_create,0,"
    stored_tex_var = glass_bg_tex;
    event_inherited();
    solid_var = true;
    type_var = 3;
    w_var = 24;
    l_var = 24;
    h_var = 24;
    tex_w_var = 4;
    step_var = 8;
    close_var = true;
    image_alpha = 0.6;
    color_var = false
    // Collisions
    coll_var[0] = global.brain_tank_coll[0];
    coll_var[1] = global.brain_tank_coll[1];
    coll_var[2] = global.brain_tank_coll[2];
    coll_var[3] = global.brain_tank_coll[3];
");
// Draw
object_event_add
(argument0,ev_draw,0,"
    if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
    event_inherited();
    if global.fog_dark_var 
    { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
");