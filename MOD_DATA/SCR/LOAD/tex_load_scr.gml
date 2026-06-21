/*
Argument 0: Print
*/
globalvar tex_floor_arr;
globalvar tex_wall_arr;
globalvar tex_ceil_arr;
globalvar tex_light_floor_arr;
globalvar tex_light_wall_arr;
globalvar tex_len_arr;
global.tex_var = 0;
for (local.i=0; local.i<global.mode_len_var; local.i+=1;)
{ tex_len_arr[local.i] = 0; }
// Story Mode
    tex_add_scr(floor_01_bg_path,wall_01_bg_path,ceil_01_bg_path,light_floor_01_spr_path,light_wall_01_spr_path,-1);
    tex_add_scr(floor_02_bg_path,wall_02_bg_path,ceil_02_bg_path,light_floor_02_spr_path,light_wall_02_spr_path,-1);
    tex_add_scr(floor_03_bg_path,wall_03_bg_path,ceil_03_bg_path,light_floor_03_spr_path,light_wall_03_spr_path,-1);
    tex_add_scr(floor_04_bg_path,wall_04_bg_path,ceil_04_bg_path,light_floor_04_spr_path,light_wall_04_spr_path,-1);
    tex_add_scr(floor_05_bg_path,wall_05_bg_path,ceil_05_bg_path,light_floor_05_spr_path,light_wall_05_spr_path,-1);
    tex_add_scr(floor_06_bg_path,wall_06_bg_path,ceil_06_bg_path,light_floor_06_spr_path,light_wall_06_spr_path,-1);
    tex_add_scr(floor_07_bg_path,wall_07_bg_path,ceil_07_bg_path,light_floor_07_spr_path,light_wall_07_spr_path,-1);
    tex_add_scr(floor_07_bg_path,wall_07_bg_path,ceil_07_bg_path,light_floor_07_spr_path,light_wall_07_spr_path,0); // Extra one in story
    tex_add_scr(floor_08_bg_path,wall_08_bg_path,ceil_08_bg_path,light_floor_08_spr_path,light_wall_08_spr_path,-1);
    tex_add_scr(floor_09_bg_path,wall_09_bg_path,ceil_09_bg_path,light_floor_09_spr_path,light_wall_09_spr_path,-1);
    tex_add_scr(floor_10_bg_path,wall_10_bg_path,ceil_10_bg_path,light_floor_10_spr_path,light_wall_10_spr_path,-1);
    tex_add_scr(floor_11_bg_path,wall_11_bg_path,ceil_11_bg_path,light_floor_11_spr_path,light_wall_11_spr_path,-1);
// Endless Mode
    tex_add_scr(floor_em_01_bg_path,wall_em_01_bg_path,ceil_em_01_bg_path,light_floor_em_01_spr_path,light_wall_em_01_spr_path,1);
    tex_add_scr(floor_em_01_bg_path,wall_em_01_bg_path,ceil_em_01_bg_path,light_floor_em_01_spr_path,light_wall_em_01_spr_path,2);
    tex_add_scr(floor_em_02_bg_path,wall_em_02_bg_path,ceil_em_02_bg_path,light_floor_em_02_spr_path,light_wall_em_02_spr_path,1);
    tex_add_scr(floor_em_02_bg_path,wall_em_02_bg_path,ceil_em_02_bg_path,light_floor_em_02_spr_path,light_wall_em_02_spr_path,2);
    tex_add_scr(floor_em_03_bg_path,wall_em_03_bg_path,ceil_em_03_bg_path,light_floor_em_03_spr_path,light_wall_em_03_spr_path,1);
    tex_add_scr(floor_em_03_bg_path,wall_em_03_bg_path,ceil_em_03_bg_path,light_floor_em_03_spr_path,light_wall_em_03_spr_path,2);
    tex_add_scr(floor_em_04_bg_path,wall_em_04_bg_path,ceil_em_04_bg_path,light_floor_em_04_spr_path,light_wall_em_04_spr_path,1);
    tex_add_scr(floor_em_04_bg_path,wall_em_04_bg_path,ceil_em_04_bg_path,light_floor_em_04_spr_path,light_wall_em_04_spr_path,2);
    tex_add_scr(floor_em_05_bg_path,wall_em_05_bg_path,ceil_em_05_bg_path,light_floor_em_05_spr_path,light_wall_em_05_spr_path,1);
    tex_add_scr(floor_em_05_bg_path,wall_em_05_bg_path,ceil_em_05_bg_path,light_floor_em_05_spr_path,light_wall_em_05_spr_path,2);
// Draw
draw_load_scr("Loaded texture sets!");
// Jumpscares
globalvar js_type_arr;
globalvar js_front_arr;
globalvar js_back_arr;
globalvar js_sp_snd_arr;
globalvar js_len_arr;
globalvar js_snd_arr;
globalvar js_snd_len_arr;
for (local.i=0; local.i<global.mode_len_var; local.i+=1;)
{
    js_len_arr[local.i] = 0;
    js_snd_len_arr[local.i] = 0;
}
// Story
    js_add_scr(0,js_slime_01_bg_path,js_slime_02_bg_path,-1,noone);
    js_add_scr(0,js_ghost_01_bg_path,js_ghost_02_bg_path,-1,noone);
    js_add_scr(0,js_skeleton_01_bg_path,js_skeleton_02_bg_path,-1,noone);
    js_add_scr(0,js_spider_01_bg_path,js_spider_02_bg_path,-1,noone);
    js_add_scr(0,js_pumpkin_01_bg_path,js_pumpkin_02_bg_path,-1,noone);
    js_add_scr(0,js_stump_01_bg_path,js_stump_02_bg_path,-1,noone);
    js_add_scr(0,js_lump_01_bg_path,js_lump_02_bg_path,-1,noone);
    js_add_scr(0,js_coffee_01_bg_path,js_coffee_02_bg_path,-1,noone);
    js_add_scr(0,js_toast_01_bg_path,js_toast_02_bg_path,-1,noone);
    js_add_scr(0,js_cone_01_bg_path,js_cone_02_bg_path,-1,noone);
    js_add_scr(0,js_skull_01_bg_path,js_skull_02_bg_path,-1,noone);
    js_add_scr(0,js_slime_scary_01_bg_path,js_slime_02_bg_path,-1,noone);
    // Sound
        js_snd_add_scr(js_01_snd_path,-1);
        js_snd_add_scr(js_02_snd_path,-1);
        js_snd_add_scr(js_03_snd_path,-1);
        js_snd_add_scr(js_04_snd_path,-1);
        js_snd_add_scr(js_05_snd_path,-1);
        js_snd_add_scr(js_06_snd_path,-1);
        js_snd_add_scr(js_07_snd_path,-1);
        js_snd_add_scr(js_08_snd_path,-1);
        js_snd_add_scr(js_09_snd_path,-1);
        js_snd_add_scr(js_10_snd_path,-1);
        js_snd_add_scr(js_11_snd_path,-1);
        js_snd_add_scr(js_12_snd_path,-1);
// Endless
    js_add_scr(0,js_eggplant_01_bg_path,js_eggplant_02_bg_path,1,noone); js_add_scr(0,js_eggplant_01_bg_path,js_eggplant_02_bg_path,2,noone);
    js_add_scr(0,js_donut_01_bg_path,js_donut_02_bg_path,1,noone); js_add_scr(0,js_donut_01_bg_path,js_donut_02_bg_path,2,noone);
    js_add_scr(0,js_tooth_01_bg_path,js_tooth_02_bg_path,1,noone); js_add_scr(0,js_tooth_01_bg_path,js_tooth_02_bg_path,2,noone);
    js_add_scr(0,js_soap_01_bg_path,js_soap_02_bg_path,1,noone); js_add_scr(0,js_soap_01_bg_path,js_soap_02_bg_path,2,noone);
    js_add_scr(0,js_lollipop_01_bg_path,js_lollipop_02_bg_path,1,noone); js_add_scr(0,js_lollipop_01_bg_path,js_lollipop_02_bg_path,2,noone);
    js_add_scr(0,js_todo_01_bg_path,js_todo_02_bg_path,1,noone); js_add_scr(0,js_todo_01_bg_path,js_todo_02_bg_path,2,noone);
    js_add_scr(0,js_moose_01_bg_path,js_moose_02_bg_path,1,noone); js_add_scr(0,js_moose_01_bg_path,js_moose_02_bg_path,2,noone);
    js_add_scr(0,js_potato_01_bg_path,js_potato_02_bg_path,1,noone); js_add_scr(0,js_potato_01_bg_path,js_potato_02_bg_path,2,noone);
    js_add_scr(0,js_bucket_01_bg_path,js_bucket_02_bg_path,1,noone); js_add_scr(0,js_bucket_01_bg_path,js_bucket_02_bg_path,2,noone);
    js_add_scr(0,js_cake_01_bg_path,js_cake_02_bg_path,1,noone); js_add_scr(0,js_cake_01_bg_path,js_cake_02_bg_path,2,noone);
    js_add_scr(0,js_boot_01_bg_path,js_boot_02_bg_path,1,noone); js_add_scr(0,js_boot_01_bg_path,js_boot_02_bg_path,2,noone);
    js_add_scr(0,js_slimecat_01_bg_path,js_slimecat_02_bg_path,1,noone); js_add_scr(0,js_slimecat_01_bg_path,js_slimecat_02_bg_path,2,noone);
    js_add_scr(0,js_candycorn_01_bg_path,js_candycorn_02_bg_path,1,noone); js_add_scr(0,js_candycorn_01_bg_path,js_candycorn_02_bg_path,2,noone);
    js_add_scr(0,js_jaff_01_bg_path,js_jaff_02_bg_path,1,noone); js_add_scr(0,js_jaff_01_bg_path,js_jaff_02_bg_path,2,noone);
    js_add_scr(0,js_scream_01_bg_path,js_scream_02_bg_path,1,noone); js_add_scr(0,js_scream_01_bg_path,js_scream_02_bg_path,2,noone);
    js_add_scr(0,js_alien_01_bg_path,js_alien_02_bg_path,1,noone); js_add_scr(0,js_alien_01_bg_path,js_alien_02_bg_path,2,noone);
    js_add_scr(0,js_monster_01_bg_path,js_monster_02_bg_path,1,noone); js_add_scr(0,js_monster_01_bg_path,js_monster_02_bg_path,2,noone);
    js_add_scr(0,js_face_01_bg_path,js_face_02_bg_path,1,noone); js_add_scr(0,js_face_01_bg_path,js_face_02_bg_path,2,noone);
    js_add_scr(0,js_toastertart_01_bg_path,js_toastertart_02_bg_path,1,noone); js_add_scr(0,js_toastertart_01_bg_path,js_toastertart_02_bg_path,2,noone);
    if global.kh_var
    {
        js_add_scr(0,js_can_01_bg_path,js_can_02_bg_path,1,js_oho_snd_path);
        js_add_scr(0,js_can_01_bg_path,js_can_02_bg_path,2,js_oho_snd_path);
    }
    // Sound
        js_snd_add_scr(js_em_01_snd_path,1); js_snd_add_scr(js_em_01_snd_path,2);
        js_snd_add_scr(js_em_02_snd_path,1); js_snd_add_scr(js_em_02_snd_path,2);
        js_snd_add_scr(js_em_03_snd_path,1); js_snd_add_scr(js_em_03_snd_path,2);
        js_snd_add_scr(js_em_04_snd_path,1); js_snd_add_scr(js_em_04_snd_path,2);
        js_snd_add_scr(js_em_05_snd_path,1); js_snd_add_scr(js_em_05_snd_path,2);
        js_snd_add_scr(js_em_06_snd_path,1); js_snd_add_scr(js_em_06_snd_path,2);
        js_snd_add_scr(js_em_07_snd_path,1); js_snd_add_scr(js_em_07_snd_path,2);
        js_snd_add_scr(js_em_08_snd_path,1); js_snd_add_scr(js_em_08_snd_path,2);
// Draw
draw_load_scr("Loaded jumpscares!");
// Art
globalvar art_list;
art_list = ds_list_create();
ds_list_clear(art_list);
ds_list_add(art_list,art_01_bg_tex);
ds_list_add(art_list,art_02_bg_tex);
ds_list_add(art_list,art_03_bg_tex);
ds_list_add(art_list,art_04_bg_tex);
ds_list_add(art_list,art_05_bg_tex);
ds_list_add(art_list,art_06_bg_tex);
ds_list_add(art_list,art_07_bg_tex);
ds_list_add(art_list,art_08_bg_tex);
ds_list_add(art_list,art_09_bg_tex);
ds_list_add(art_list,art_10_bg_tex);
ds_list_add(art_list,art_11_bg_tex);
ds_list_add(art_list,art_12_bg_tex);
ds_list_add(art_list,art_13_bg_tex);
ds_list_add(art_list,art_14_bg_tex);
ds_list_add(art_list,art_15_bg_tex);
// Draw
draw_load_scr("Loaded art!");
// Posters
globalvar poster_01_arr;
globalvar poster_02_arr;
for (local.i=0; local.i<global.mode_len_var; local.i+=1;)
{
    poster_01_arr[local.i] = ds_list_create();
    poster_02_arr[local.i] = ds_list_create();
    ds_list_clear(poster_01_arr[local.i]);
    ds_list_clear(poster_02_arr[local.i]);
}
// Story 1
    poster_add_scr(poster_coffee_bg_path,0,-1);
    poster_add_scr(poster_heart_bg_path,0,-1);
    poster_add_scr(poster_cat_bg_path,0,-1);
    poster_add_scr(poster_hang_bg_path,0,-1);
// Story 2
    poster_add_scr(poster_gl_bg_path,1,0);
    poster_add_scr(poster_axe_bg_path,1,0);
    poster_add_scr(poster_papa_bg_path,1,0);
    poster_add_scr(poster_pillar_bg_path,1,0);
    poster_add_scr(poster_depo_bg_path,1,0);
    poster_add_scr(poster_beef_bg_path,1,0);
// Endless 1
    poster_add_scr(poster_smile_bg_path,0,1);
    poster_add_scr(poster_ghost_bg_path,0,1);
    poster_add_scr(poster_pizza_bg_path,0,1);
    poster_add_scr(poster_hedgehog_bg_path,0,1);
    poster_add_scr(poster_home_bg_path,0,1);
    poster_add_scr(poster_freedom_bg_path,0,1);
    poster_add_scr(poster_tlc_bg_path,0,1);
    poster_add_scr(poster_cactus_bg_path,0,1);
    poster_add_scr(poster_pout_bg_path,0,1);
    poster_add_scr(poster_bunnee_bg_path,0,1);
    poster_add_scr(poster_broccoli_bg_path,0,1);
    poster_add_scr(poster_sports_bg_path,0,1);
    poster_add_scr(poster_team_bg_path,0,1);
    poster_add_scr(poster_spiral_bg_path,0,1);
    if global.kh_var { poster_add_scr(poster_worm_bg_path,0,1); }
// Endless 2
    if global.kh_var
    {
        poster_add_scr(poster_wednesday_01_bg_path,0,1);
        poster_add_scr(poster_wednesday_02_bg_path,0,1);
    }
// Draw
draw_load_scr("Loaded art!");
// Gay
globalvar pride_list;
ds_list_clear(pride_list);
ds_list_add(pride_list,pride_color_obj);
ds_list_add(pride_list,abro_color_obj);
ds_list_add(pride_list,ace_color_obj);
ds_list_add(pride_list,aceflux_color_obj);
ds_list_add(pride_list,agender_color_obj);
ds_list_add(pride_list,aro_color_obj);
ds_list_add(pride_list,aroace_color_obj);
ds_list_add(pride_list,bi_color_obj);
ds_list_add(pride_list,bigender_color_obj);
ds_list_add(pride_list,demiboy_color_obj);
ds_list_add(pride_list,demigirl_color_obj);
ds_list_add(pride_list,enby_color_obj);
ds_list_add(pride_list,gay_color_obj);
ds_list_add(pride_list,genderfluid_color_obj);
ds_list_add(pride_list,genderflux_color_obj);
ds_list_add(pride_list,genderqueer_color_obj);
ds_list_add(pride_list,grayce_color_obj);
ds_list_add(pride_list,grayro_color_obj);
ds_list_add(pride_list,lesbian_color_obj);
ds_list_add(pride_list,maverique_color_obj);
ds_list_add(pride_list,omni_color_obj);
ds_list_add(pride_list,pan_color_obj);
ds_list_add(pride_list,pangender_color_obj);
ds_list_add(pride_list,polyce_color_obj);
ds_list_add(pride_list,queer_color_obj);
ds_list_add(pride_list,trans_color_obj);
ds_list_add(pride_list,transfem_color_obj);
ds_list_add(pride_list,transmasc_color_obj);
ds_list_add(pride_list,trigender_color_obj);
ds_list_add(pride_list,xenogender_color_obj);
// Trans
globalvar trans_list;
ds_list_clear(trans_list);
ds_list_add(trans_list,agender_color_obj);
ds_list_add(trans_list,bigender_color_obj);
ds_list_add(trans_list,demiboy_color_obj);
ds_list_add(trans_list,demigirl_color_obj);
ds_list_add(trans_list,enby_color_obj);
ds_list_add(trans_list,genderfluid_color_obj);
ds_list_add(trans_list,genderflux_color_obj);
ds_list_add(trans_list,genderqueer_color_obj);
ds_list_add(trans_list,pangender_color_obj);
ds_list_add(trans_list,trans_color_obj);
ds_list_add(trans_list,transfem_color_obj);
ds_list_add(trans_list,transmasc_color_obj);
ds_list_add(trans_list,trigender_color_obj);
ds_list_add(trans_list,xenogender_color_obj);
// Draw
draw_load_scr("Loaded Pride!");