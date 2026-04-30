// Builtin Variables
object_set_depth(argument0,-4);
object_set_mask(argument0,noone);
object_set_parent(argument0,wall_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    {
        local.bg = load_par_obj.bg_arr_var[8,0];
        store_tex_var = background_get_texture(local.bg);
        event_inherited();
        tex_h_var = background_get_width(local.bg)/background_get_height(local.bg);
    }
    else { event_inherited(); }
    with instance_create(x,y,lab_tank_back_obj)
    {
        par_var = other.id;
        z += other.z;
        direction = other.direction;
    }
    if frac_chance_scr(1,2)
    {
        local.xtmp = x+lengthdir_x(-4,direction)+lengthdir_x(8,direction-90);
        local.ytmp = y+lengthdir_y(-4,direction)+lengthdir_y(8,direction-90);
        with instance_create(local.xtmp,local.ytmp,lab_subject_obj)
        {
            par_var = other.id;
            z_base_var += other.z;
            z = z_base_var;
            direction = other.direction;
        }
    }
');