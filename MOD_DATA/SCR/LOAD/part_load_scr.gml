// Draw
draw_load_scr("Loading particles...");
// Rain
globalvar rain_part_sys;
globalvar rain_part_type;
globalvar rain_part_emit;
rain_part_sys = part_system_create();

rain_part_type[0] = part_type_create();
part_type_shape(rain_part_type[0],pt_shape_line);
part_type_size(rain_part_type[0],0.10,0.20,0,0);
part_type_scale(rain_part_type[0],2,1);
part_type_color1(rain_part_type[0],12632256);
part_type_alpha2(rain_part_type[0],0.50,0.10);
part_type_speed(rain_part_type[0],10,20,0,0);
part_type_direction(rain_part_type[0],270,270,0,0);
part_type_gravity(rain_part_type[0],0,270);
part_type_orientation(rain_part_type[0],90,90,0,0,0);
part_type_blend(rain_part_type[0],0);
part_type_life(rain_part_type[0],10,50);

rain_part_emit = part_emitter_create(rain_part_sys);
part_emitter_region(rain_part_sys,rain_part_emit,0,1280,-64,0,ps_shape_rectangle,0);

part_system_automatic_draw(rain_part_sys,false);
part_system_automatic_update(rain_part_sys,false);
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
draw_load_scr("Loaded particles!");