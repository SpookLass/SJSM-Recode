// Draw
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading particles...",1,1,0);
screen_refresh();
// Dollhouse
globalvar film_part_sys;
globalvar film_part_type;
globalvar film_part_emit;
film_part_sys = part_system_create()

film_part_type[0] = part_type_create();
part_type_sprite(film_part_type[0],film_grain_spr,0,0,1);
part_type_size(film_part_type[0],0.40,1.50,0,0);
part_type_scale(film_part_type[0],1,1);
part_type_blend(film_part_type[0],0);
part_type_life(film_part_type[0],2,4);

film_part_type[1] = part_type_create();
part_type_shape(film_part_type[1],pt_shape_line);
part_type_size(film_part_type[1],0.5,2,0,0);
part_type_scale(film_part_type[1],100,0.50);
part_type_color1(film_part_type[1],0);
part_type_speed(film_part_type[1],0,4,0,2);
part_type_direction(film_part_type[1],0,359,0,0);
part_type_orientation(film_part_type[1],90,90,0,0,0);
part_type_blend(film_part_type[1],0);
part_type_life(film_part_type[1],6,50);

film_part_type[2] = part_type_create();
part_type_shape(film_part_type[2],pt_shape_smoke);
part_type_size(film_part_type[2],0.50,2,0,0);
part_type_scale(film_part_type[2],1.80,5);
part_type_color1(film_part_type[2],0);
part_type_blend(film_part_type[2],0);
part_type_life(film_part_type[2],2,3);

part_type_alpha1(film_part_type[0],0.60);
part_type_alpha1(film_part_type[1],0.30);
part_type_alpha1(film_part_type[2],0.20);

film_part_emit = part_emitter_create(film_part_sys);
part_emitter_region(film_part_sys,film_part_emit,0,1280,0,720,ps_shape_rectangle,0);

part_system_automatic_draw(film_part_sys,false);
part_system_automatic_update(film_part_sys,false);
// Draw
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loaded particles!",1,1,0);
screen_refresh();