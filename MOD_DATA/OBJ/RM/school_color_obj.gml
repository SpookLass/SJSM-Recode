// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,color_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if global.ringu_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.ringu_type_var; }
    switch local.type
    {
        case 0:
        case 1:
        {
            image_blend = make_color_rgb(63,63,63);
            break;
        }
        case 3:
        case 2:
        {
            image_blend = make_color_rgb(16,16,16);
            break;
        }
    }
    event_inherited();
');