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
    par_var = '+string(argument2)+'
    store_tex_var = '+string(argument2.bg_arr_var[argument3,4])+'
    store_tex_02_var = '+string(argument2.bg_arr_var[argument4,4])+'
    tex_02_var = store_tex_02_var;
    // store_tex_var = machine_02_bg_tex;
    snap_var = 1;
    event_inherited();
    solid_var = true;
    w_var = 4;
    h_var = 28;
    l_var = 28;
    type_var = 7;
    tex_l_var = 4;
    // Collisions
    coll_var[0] = school_locker_coll[0];
    coll_var[1] = school_locker_coll[1];
    coll_var[2] = school_locker_coll[2];
    coll_var[3] = school_locker_coll[3];
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
    local.width = w_var/2;
    local.length = l_var/2;
    local.tex_height = tex_h_var*sign(h_var);
    d3d_draw_wall(-local.width,-local.length,h_var,local.width,-local.length,0,tex_var,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,local.length,h_var,local.width,local.length,0,tex_var,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,-local.length,h_var,-local.width,local.length,0,tex_var,tex_l_var,local.tex_height);
    d3d_draw_wall(local.width,-local.length,h_var,local.width,local.length,0,tex_02_var,tex_l_var,local.tex_height);
    d3d_draw_floor(-local.width,-local.length,0,local.width,local.length,0,tex_var,tex_w_var,tex_l_var);
    d3d_draw_floor(-local.width,-local.length,h_var,local.width,local.length,h_var,tex_var,tex_w_var,tex_l_var);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');
// Directions
if argument5
{
    local.obj = argument0;
    if string_pos("obj",argument1) >= 0
    {
        local.northname = string_replace(argument1,"obj","north_obj");
        local.eastname = string_replace(argument1,"obj","east_obj");
        local.southname = string_replace(argument1,"obj","south_obj");
        local.westname = string_replace(argument1,"obj","west_obj");
    }
    else
    {
        local.northname = argument1+"_north";
        local.eastname = argument1+"_east";
        local.southname = argument1+"_south";
        local.westname = argument1+"_west";
    }
    with argument2
    {
        obj_arr_var[obj_len_var,1] = spawn_north_obj_path;
        obj_arr_var[obj_len_var,2] = local.northname;
        obj_arr_var[obj_len_var,3] = 1;
        obj_arr_var[obj_len_var,4] = local.obj;
        obj_arr_var[obj_len_var+1,1] = spawn_vert_obj_path;
        obj_arr_var[obj_len_var+1,2] = local.eastname;
        obj_arr_var[obj_len_var+1,3] = 1;
        obj_arr_var[obj_len_var+1,4] = local.obj;
        obj_arr_var[obj_len_var+2,1] = spawn_hor_obj_path;
        obj_arr_var[obj_len_var+2,2] = local.southname;
        obj_arr_var[obj_len_var+2,3] = 1;
        obj_arr_var[obj_len_var+2,4] = local.obj;
        obj_arr_var[obj_len_var+3,1] = spawn_west_obj_path;
        obj_arr_var[obj_len_var+3,2] = local.westname;
        obj_arr_var[obj_len_var+3,3] = 1;
        obj_arr_var[obj_len_var+3,4] = local.obj;
        obj_len_var += 4;
    }
}