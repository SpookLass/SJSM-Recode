

// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
global.brain_coll[1] = 10;
global.brain_coll[2] = 10;
global.brain_coll[0] = prop_to_coll_scr(5,'',global.brain_coll[2],0,global.brain_coll[1],true,8);
// Create event
object_event_add
(argument0,ev_create,0,"
    stored_tex_var = brain_bg_tex;
    event_inherited();
    solid_var = false;
    type_var = 5; // Billboard
    w_var = 10;
    h_var = 10;
    step_var = 8;
    color_var = false;
    // Collisions
    coll_var[0] = global.brain_coll[0];
    coll_var[1] = global.brain_coll[1];
    coll_var[2] = global.brain_coll[2];
    // sine
    z_time_var=0;
    z_mult_var=2;
    z_rate_var=480;
    z_base_var=5;
    z = z_base_var;
");
// Draw
object_event_add
(argument0,ev_draw,0,"
    if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
    event_inherited();
    if global.fog_dark_var 
    { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
");
// Step
object_event_add
(argument0,ev_step,ev_step_normal,"
    z_time_var = (z_time_var+global.delta_time_var) mod z_rate_var;
    z = z_base_var+(sin(2*z_time_var*pi/z_rate_var)*z_mult_var);
");

