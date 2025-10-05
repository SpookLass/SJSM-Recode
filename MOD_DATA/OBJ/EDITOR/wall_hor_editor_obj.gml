// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,noone);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,wall_hor_editor_spr);
object_set_visible(argument0,true);
// Create
object_event_add(argument0,ev_create,0,"
    type_var = 3;
    w_var = 1;
");
// Draw
object_event_add(argument0,ev_draw,0,"
    if w_var > 1
    {
        for (local.i=0; local.i<w_var; local.i+=1;)
        {
            draw_sprite_ext(sprite_index,image_index,x+(local.i*32),y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
        }
    }
    else { draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha); }
");