// Builtin Variables
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
    if instance_exists(load_par_obj)
    {
        store_tex_var = background_get_texture(load_par_obj.bg_arr_var[4,0]);
        store_tex_02_var = background_get_texture(load_par_obj.bg_arr_var[5,0]);
        store_tex_03_var = background_get_texture(load_par_obj.bg_arr_var[0,0]);
        tex_02_var = store_tex_02_var;
        tex_03_var = store_tex_03_var;
        mdl_var = load_par_obj.mdl_arr_var[1,0];
        mdl_02_var = load_par_obj.mdl_arr_var[2,0];
        mdl_03_var = load_par_obj.mdl_arr_var[3,0];
        mdl_path_var = load_par_obj.mdl_arr_var[1,1];
    }
    event_inherited();
    solid_var = false;
    direction = 90;
    // For grid (I dont really know how wide it is)
    w_var = 32;
    l_var = 32;
    h_var = 32;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    event_inherited();
    // Transform
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    // Reflection handling
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var,0,0); break; }
            case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var,0); break; }
            case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var); break; }
        }
    }
    // Draw
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Prop types
    d3d_model_draw(mdl_02_var,0,0,0,tex_02_var);
    d3d_model_draw(mdl_03_var,0,0,0,tex_03_var);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');