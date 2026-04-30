// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    { store_tex_var = sprite_get_texture(load_par_obj.spr_arr_var[0,0],irandom(sprite_get_number(load_par_obj.spr_arr_var[0,0])-1)); }
    event_inherited();
    solid_var = false;
    type_var = 1; // Plane
    w_var = 20;
    h_var = 20;
    step_var = 8;
    color_var = 3;
    // sine
    z_mult_var=1.8;
    z_rate_var=120;
    z_base_var=4; // 5.1
    z_time_var=random(z_rate_var);
    z = z_base_var;
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if global.fog_dark_var
    {
        d3d_set_fog(false,c_black,0,0);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    }
    else { event_inherited(); }
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    z_time_var = (z_time_var+global.delta_time_var) mod z_rate_var;
    z = z_base_var-(sin(2*z_time_var*pi/z_rate_var)*z_mult_var*0.5);
');