// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = candle_bg_tex
    event_inherited();
    solid_var = false;
    type_var = 5; // Billboard
    w_var = 2;
    h_var = 3;
    step_var = 8;
    on_var = !irandom(1);
    with instance_create(x,y,light_torch_obj)
    {
        par_var = other.id;
        z = other.z+other.h_var;
        other.light_var = id;
        w_var = 1;
        h_var = 1.6;
        visible = other.on_var;
    }
');