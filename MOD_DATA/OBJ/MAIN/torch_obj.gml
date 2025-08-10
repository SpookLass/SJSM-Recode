// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,"
    mdl_var = torch_mdl;
    mdl_path_var = torch_mdl_path;
    stored_tex_var = torch_bg_tex;
    tex_var = stored_tex_var;
    solid_var = false;
    on_var = true;
    // Light stuff
    local.light = instance_create(x+lengthdir_x(-1.5,direction+90),y+lengthdir_y(-1.5,direction+90),light_torch_obj);
    local.light.z += z;
    local.light.gold_var = gold_var;
    local.light.torch_var = id;
    if auto_var { event_perform(ev_other,ev_user0); }
");
// Step
object_event_add
(argument0,ev_step,ev_step_normal,"
    if gold_var
    {
        if image_blend != c_white { image_blend = c_white; }
        on_var = !door_var.lock_var;
    }
");
// Draw
object_event_add
(argument0,ev_draw,0,"
    if gold_var && on_var
    {
        d3d_set_fog(false,c_black,0,0);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    }
    else { event_inherited(); }
");
// User
object_event_add
(argument0,ev_other,ev_user0,"
    local.xtmp = x+lengthdir_x(-16,direction+90);
    local.ytmp = y+lengthdir_y(-16,direction+90);
    local.ztmp = z+16;
    with wall_par_obj
    {
        if abs(x-local.xtmp) <= 16
        && abs(y-local.ytmp) <= 16
        && local.ztmp > z && local.ztmp < z+h_var
        && !instance_position(x,y,light_wall_vert_obj)
        {
            local.light = instance_create(x,y,light_wall_vert_obj);
            local.light.direction = direction;
            local.light.z = other.z;
            local.light.gold_var = other.gold_var;
            local.light.torch_var = other.id;
        }
    }
    with floor_par_obj
    {
        local.wtmp = w_var/2;
        local.htmp = h_var/2;
        if local.xtmp > x-16 && local.xtmp < x+16
        && local.ytmp > y-16 && local.ytmp < y+16
        && abs(z-local.ztmp) <= 16
        && !instance_position(x,y,light_floor_obj)
        {
            local.light = instance_create(x,y,light_floor_obj);
            local.light.direction = direction;
            local.light.z = z;
            local.light.gold_var = other.gold_var;
            local.light.torch_var = other.id;
        }
    }
");