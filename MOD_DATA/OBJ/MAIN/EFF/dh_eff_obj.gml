// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    alarm_len_var = 3;
    set_alarm_scr(0,1);
    set_alarm_scr(1,irandom_range(16,30));
    set_alarm_scr(2,irandom_range(6,12));
    part_emitter_region(film_part_sys,film_part_emit,0,view_wview[0],0,view_hview[0],ps_shape_rectangle,0);
    /*for (local.i=0; local.i<alarm_len_var; local.i+=1;)
    { event_perform(ev_alarm,local.i); }*/
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    part_system_update(film_part_sys);
');

// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
	part_type_alpha1(film_part_type[0],random_range(0.2,0.7));
	part_type_alpha1(film_part_type[1],random_range(0.2,0.7));
	part_type_alpha1(film_part_type[2],random_range(0.03,0.1));
	set_alarm_scr(0,1);
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
	if !irandom(2) { part_emitter_burst(film_part_sys,film_part_emit,film_part_type[1],random_range(0,1)); }
	set_alarm_scr(1,irandom_range(16,30));
');
// Alarm 2
object_event_add
(argument0,ev_alarm,2,'
	if !irandom(1) { part_emitter_burst(film_part_sys,film_part_emit,film_part_type[0],random_range(0,2)); }
	if !irandom(1) { part_emitter_burst(film_part_sys,film_part_emit,film_part_type[2],random_range(0,5)); }
	set_alarm_scr(2,irandom_range(6,12));
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    part_system_drawit(film_part_sys);
    d3d_set_hidden(true);
');
