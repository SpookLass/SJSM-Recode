// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar asy_matt_man_01_coll;
asy_matt_man_01_coll[1] = 28;
asy_matt_man_01_coll[2] = 3;
asy_matt_man_01_coll[3] = 12;
asy_matt_man_01_coll[0] = prop_to_coll_scr(2,"",asy_matt_man_01_coll[2],asy_matt_man_01_coll[3],asy_matt_man_01_coll[1],true,0,0);
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    {
        store_tex_var = background_get_texture(load_par_obj.bg_arr_var[17,0]);
        store_tex_02_var = background_get_texture(load_par_obj.bg_arr_var[18,0]);
        tex_02_var = store_tex_02_var;
    }
    snap_var = 1;
    event_inherited();
    solid_var = true;
    w_var = 3;
    h_var = 28;
    l_var = 12;
    type_var = 7; // I guess?
    // Collisions
    coll_var[0] = asy_matt_man_01_coll[0];
    coll_var[1] = asy_matt_man_01_coll[1];
    coll_var[2] = asy_matt_man_01_coll[2];
    coll_var[3] = asy_matt_man_01_coll[3];
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_transform_set_identity();
    // Check if billboard
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    // Reflection handling
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var*2,0,0); break; }
            case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var*2,0); break; }
            case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var*2); break; }
        }
    }
    // Draw
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Mattress Man
    d3d_draw_wall(-w_var*0.5,l_var*0.5,h_var,w_var*0.5,0,0,tex_var,1,1);
    d3d_draw_wall(w_var*0.5,0,h_var,-w_var*0.5,-l_var*0.5,0,tex_02_var,1,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');