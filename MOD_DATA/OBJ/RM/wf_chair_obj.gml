// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collision
global.chair_coll[0] = prop_to_coll_scr(0,chair_mdl_path);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = wood_03_bg_tex;
    event_inherited();
    solid_var = true;
    mdl_var = chair_mdl;
    mdl_path_var = chair_mdl_path;
    z += 5;
    // For grid
    w_var = 8;
    l_var = w_var;
    h_var = 12; // Not sure
    // Collisions
    coll_var[0] = global.chair_coll[0];
    coll_var[1] = h_var;
    coll_var[2] = w_var;
    coll_var[3] = l_var;
    // Rotate
    angle_var = 270;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if tex_var == -1 { local.tex = wall_bg_tex; } 
    else { local.tex = tex_var; }
    d3d_transform_set_identity();
    // Check if billboard
    d3d_transform_add_rotation_x(angle_var);
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    // Draw
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Prop types
    d3d_model_draw(mdl_var,0,0,0,local.tex);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');