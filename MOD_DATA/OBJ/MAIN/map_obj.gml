// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
p3dc_set_trimask_scr(mask_metal_const);
global.map_coll[1] = 32;
global.map_coll[2] = 4;
global.map_coll[3] = 32;
global.map_coll[0] = prop_to_coll_scr(7,'',global.map_coll[2],global.map_coll[3],global.map_coll[1]);
p3dc_set_trimask_scr(mask_basic_const);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = metal_01_bg_tex;
    event_inherited();
    solid_var = true;
    direction=180;
    z = 10;
    w_var = 4;
    h_var = 32;
    l_var = 32;
    type_var = 7;
    store_tex_02_var = machine_01_bg_tex;
    tex_02_var = store_tex_02_var;
    tex_l_var = -1;
    // Collisions
    coll_var[0] = global.map_coll[0];
    coll_var[1] = global.map_coll[1];
    coll_var[2] = global.map_coll[2];
    coll_var[3] = global.map_coll[3];
    // Map Drawing Stuff
    load_var = true;
    // Surface
    surf_var = surface_create(256,256);
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    surface_reset_target();
    store_tex_02_var = surface_get_texture(surf_var);
    tex_02_var = store_tex_02_var;
    // Paths
    path_len_var = 5;
    path_var[0] = path_add();
    for (local.i=0; local.i<path_len_var; local.i+=1;)
    {
        path_var[local.i] = path_add();
        path_set_kind(path_var[local.i],0); // Not Smooth
        path_set_closed(path_var[local.i],true);
        path_set_precision(path_var[local.i],4);
    }
    // Path 1
    path_add_point(path_var[0],0,0,100);
    path_add_point(path_var[0],-64,0,100);
    path_add_point(path_var[0],-64,32,100);
    path_add_point(path_var[0],80,32,100);
    path_add_point(path_var[0],80,0,100);
    // Path 2
    path_add_point(path_var[1],0,0,100);
    path_add_point(path_var[1],208,0,100);
    path_add_point(path_var[1],208,112,100);
    path_add_point(path_var[1],112,112,100);
    path_add_point(path_var[1],112,176,100);
    path_add_point(path_var[1],0,176,100);
    // Path 3
    path_add_point(path_var[2],0,0,100);
    path_add_point(path_var[2],0,-144,100);
    path_add_point(path_var[2],272,-144,100);
    path_add_point(path_var[2],272,-48,100);
    path_add_point(path_var[2],-112,-48,100);
    path_add_point(path_var[2],-112,0,100);
    // Path 4
    path_add_point(path_var[3],0,0,100);
    path_add_point(path_var[3],0,176,100);
    path_add_point(path_var[3],96,176,100);
    path_add_point(path_var[3],96,240,100);
    path_add_point(path_var[3],224,240,100);
    path_add_point(path_var[3],224,96,100);
    path_add_point(path_var[3],48,96,100);
    path_add_point(path_var[3],48,0,100);
    // Path 5
    path_add_point(path_var[4],0,0,100);
    path_add_point(path_var[4],0,240,100);
    path_add_point(path_var[4],176,240,100);
    path_add_point(path_var[4],176,-144,100);
    path_add_point(path_var[4],80,-144,100);
    path_add_point(path_var[4],80,96,100);
    path_add_point(path_var[4],-176,96,100);
    path_add_point(path_var[4],-176,0,100);
    // Draw objects
    for (local.i=0; local.i<7; local.i+=1;)
    {
        switch local.i
        {
            case 0: { local.xtmp = 0; local.ytmp = -16; break; }
            case 1: { local.xtmp = 160; local.ytmp = 80; break; }
            case 2: { local.xtmp = 32; local.ytmp = 48; break; }
            case 3: { local.xtmp = 64; local.ytmp = 144; break; }
            case 4: { local.xtmp = 96; local.ytmp = 48; break; }
            case 5: { local.xtmp = 176; local.ytmp = 176; break; }
            default: { local.xtmp = 224; local.ytmp = 16; break; }
        }
        local.path = path_var[irandom(path_len_var-1)];
        with instance_create(local.xtmp,local.ytmp,map_rm_obj)
        {
            par_var = other.id;
            path_start(local.path,path_spd_var*global.delta_time_var,0,false);
        }
    }
');
// Draw Surface
object_event_add
(argument0,ev_step,ev_step_normal,'
    // Draw Surface
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    d3d_set_projection_ortho(0,0,256,256,0);
    d3d_set_hidden(false);
    d3d_set_fog(false,c_black,0,0);
    draw_background_stretched(map_01_bg,0,0,256,256);
    with map_rm_obj { event_perform(ev_draw,0); }
    draw_background_stretched(map_02_bg,0,0,256,256);
    d3d_set_hidden(true);
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    surface_reset_target();
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Delete background
object_event_add
(argument0,ev_other,ev_user0,'
    if load_var
    {
        surface_free(surf_var);
        for (local.i=0; local.i<path_len_var; local.i+=1;)
        { path_delete(path_var[local.i]); }
        load_var = false;
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if tex_var == -1 { local.tex = wall_bg_tex; } 
    else { local.tex = tex_var; }
    d3d_transform_set_identity();
    // Check if billboard
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
    if color_var == 2
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Prop types (better cube only)
    local.width = w_var/2;
    local.length = l_var/2;
    local.tex_height = tex_h_var*sign(h_var);
    d3d_draw_wall(-local.width,-local.length,h_var,local.width,-local.length,0,local.tex,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,local.length,h_var,local.width,local.length,0,local.tex,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,-local.length,h_var,-local.width,local.length,0,local.tex,tex_l_var,local.tex_height);
    d3d_draw_wall(local.width,-local.length,h_var,local.width,local.length,0,tex_02_var,tex_l_var,local.tex_height);
    d3d_draw_floor(-local.width,-local.length,0,local.width,local.length,0,local.tex,tex_w_var,tex_l_var);
    d3d_draw_floor(-local.width,-local.length,h_var,local.width,local.length,h_var,local.tex,tex_w_var,tex_l_var);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');