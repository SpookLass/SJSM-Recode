// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,light_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    w_var = 32;
    h_var = 32;
    tex_w_var = 1;
    tex_h_var = 1;
    store_spr_var = -1;
    spr_var = store_spr_var;
");
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if spr_var == -1 { local.spr = light_floor_obj_spr; }
    else { local.spr = spr_var; }
    spr_id_var = (spr_id_var+(global.delta_time_var/6)) mod sprite_get_number(local.spr);
    if gold_var && image_blend != c_white { image_blend = c_white; }
    visible = torch_var.on_var;
")
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if spr_var == -1 { local.tex = sprite_get_texture(light_floor_obj_spr,spr_id_var); }
    else { local.tex = sprite_get_texture(spr_var,spr_id_var); }
    local.tex_w = tex_w_var*(w_var/32);
    local.tex_h = tex_h_var*(h_var/32);
    if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
    d3d_transform_set_identity();
    d3d_transform_add_translation(x,y,z+0.1);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_draw_floor(-w_var/2,-h_var/2,0,w_var/2,h_var/2,0,local.tex,local.tex_w,local.tex_h);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
    if global.fog_dark_var
    { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
");