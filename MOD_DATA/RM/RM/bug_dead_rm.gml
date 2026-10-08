/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","dead","ROOM_dead");
    ini_close();
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Exit
    with instance_create(400,128,lab_door_obj) { direction = 270; }
    with instance_create(400,352,lab_door_obj) { direction = 90; }
    with instance_create(544,240,lab_door_obj) { direction = 180; }
    with instance_create(448,208,bug_dead_light_obj) { light_var = 1; event_user(0); }
    with instance_create(400,160,bug_dead_light_obj) { light_var = 1; event_user(0); }
');
// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Effects
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,reflect_eff_obj);
// Floors
room_instance_add(argument0,176,240,argument1.lab_floor_obj);
room_instance_add(argument0,208,240,argument1.lab_floor_obj);
room_instance_add(argument0,240,240,argument1.lab_floor_obj);
room_instance_add(argument0,272,240,argument1.lab_floor_obj);
room_instance_add(argument0,304,240,argument1.lab_floor_obj);
room_instance_add(argument0,336,240,argument1.lab_floor_obj);
room_instance_add(argument0,368,240,argument1.lab_floor_obj);
room_instance_add(argument0,400,240,argument1.lab_floor_obj);
room_instance_add(argument0,336,208,argument1.lab_floor_obj);
room_instance_add(argument0,368,208,argument1.lab_floor_obj);
room_instance_add(argument0,400,208,argument1.lab_floor_obj);
room_instance_add(argument0,400,272,argument1.lab_floor_obj);
room_instance_add(argument0,368,272,argument1.lab_floor_obj);
room_instance_add(argument0,336,272,argument1.lab_floor_obj);
room_instance_add(argument0,432,208,argument1.lab_floor_obj);
room_instance_add(argument0,432,240,argument1.lab_floor_obj);
room_instance_add(argument0,432,272,argument1.lab_floor_obj);
room_instance_add(argument0,464,208,argument1.lab_floor_obj);
room_instance_add(argument0,464,240,argument1.lab_floor_obj);
room_instance_add(argument0,496,240,argument1.lab_floor_obj);
room_instance_add(argument0,528,240,argument1.lab_floor_obj);
room_instance_add(argument0,400,176,argument1.lab_floor_obj);
room_instance_add(argument0,400,144,argument1.lab_floor_obj);
room_instance_add(argument0,400,304,argument1.lab_floor_obj);
room_instance_add(argument0,400,336,argument1.lab_floor_obj);
room_instance_add(argument0,464,272,argument1.lab_floor_obj);
// Ceilings
room_instance_add(argument0,176,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,208,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,240,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,272,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,304,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,336,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,368,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,336,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,368,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,368,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,336,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,432,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,432,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,432,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,464,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,464,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,496,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,528,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,176,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,144,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,304,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,336,argument1.lab_ceil_high_obj);
room_instance_add(argument0,464,272,argument1.lab_ceil_high_obj);
// Walls (Horizontal)
room_instance_add(argument0,304,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,304,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,272,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,240,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,208,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,176,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,176,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,208,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,240,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,272,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,336,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,368,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,496,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,528,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,528,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,496,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,464,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,432,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,368,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,336,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,400,128,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,400,352,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,432,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,464,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,304,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,304,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,272,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,240,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,208,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,176,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,176,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,208,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,240,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,272,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,336,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,368,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,496,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,528,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,528,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,496,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,464,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,432,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,368,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,336,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,400,128,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,400,352,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,432,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,464,192,argument1.lab_wall_up_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,320,272,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,160,240,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,320,208,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,480,208,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,480,272,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,384,176,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,384,304,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,416,304,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,416,336,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,384,336,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,416,176,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,416,144,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,384,144,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,544,240,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,320,272,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,160,240,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,320,208,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,480,208,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,480,272,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,384,176,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,384,304,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,416,304,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,416,336,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,384,336,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,416,176,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,416,144,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,384,144,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,544,240,argument1.lab_wall_up_vert_obj);
// Props
/*room_instance_add(argument0,304,240,lab_light_obj);
room_instance_add(argument0,240,240,lab_light_obj);
room_instance_add(argument0,176,240,lab_light_obj);
room_instance_add(argument0,352,208,lab_light_obj);
room_instance_add(argument0,448,208,lab_light_obj);
room_instance_add(argument0,448,272,lab_light_obj);
room_instance_add(argument0,352,272,lab_light_obj);
room_instance_add(argument0,400,240,lab_light_obj);
room_instance_add(argument0,400,160,lab_light_obj);
room_instance_add(argument0,400,320,lab_light_obj);
room_instance_add(argument0,512,240,lab_light_obj);*/
room_instance_add(argument0,464,208,table_metal_obj);
room_instance_add(argument0,464,272,table_metal_obj);
room_instance_add(argument0,461.8667,241.0667,argument1.lab_hole_obj); // 461.8r6, 241.0r6
room_instance_add(argument0,405.8667,261.8667,argument1.lab_hole_obj); // 405.8r6, 261.8r6
room_instance_add(argument0,424.5333,230.5067,argument1.lab_hole_obj); // 424.5r3, 230.50r6
room_instance_add(argument0,376.4267,240.8533,argument1.lab_hole_obj); // 376.42r6, 240.85r3
room_instance_add(argument0,401.7067,207.8933,argument1.bug_dead_hole_big_obj); // 401.70r6, 207.89r3
room_instance_add(argument0,445.9733,229.2267,argument1.bug_dead_hole_small_obj); // 445.97r3, 229.22r6
room_instance_add(argument0,401.28,240.32,argument1.bug_dead_hole_small_obj);
room_instance_add(argument0,480,272.32,argument1.bug_dead_hole_wall_obj);
// Please dont fail me!
room_instance_add(argument0,0,0,argument1.bug_dead_obj);