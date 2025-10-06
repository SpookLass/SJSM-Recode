// execute_file(main_directory_const+"\SCR\LOAD\scr_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\set_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\spr_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\bg_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\snd_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\mdl_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\coll_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\obj_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\rm_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\zone_load_scr.gml");
// Gay
global.pride_len_var = 30;
global.pride_arr[0] = pride_color_obj;
global.pride_arr[1] = abro_color_obj;
global.pride_arr[2] = ace_color_obj;
//global.pride_arr[0] = aceflux_color_obj;
global.pride_arr[3] = agender_color_obj;
global.pride_arr[4] = aro_color_obj;
global.pride_arr[5] = aroace_color_obj;
global.pride_arr[6] = bi_color_obj;
global.pride_arr[7] = bigender_color_obj;
global.pride_arr[8] = demiboy_color_obj;
global.pride_arr[9] = demigirl_color_obj;
global.pride_arr[10] = enby_color_obj;
global.pride_arr[11] = gay_color_obj;
global.pride_arr[12] = genderfluid_color_obj;
global.pride_arr[13] = genderflux_color_obj;
global.pride_arr[14] = genderqueer_color_obj;
global.pride_arr[15] = grayce_color_obj;
global.pride_arr[16] = grayro_color_obj;
global.pride_arr[17] = lesbian_color_obj;
global.pride_arr[18] = maverique_color_obj;
global.pride_arr[19] = omni_color_obj;
global.pride_arr[21] = pan_color_obj;
global.pride_arr[22] = pangender_color_obj;
global.pride_arr[23] = polyce_color_obj;
global.pride_arr[24] = queer_color_obj;
global.pride_arr[25] = trans_color_obj;
global.pride_arr[26] = transfem_color_obj;
global.pride_arr[27] = transmasc_color_obj;
global.pride_arr[28] = trigender_color_obj;
global.pride_arr[29] = xenogender_color_obj;
// Monster spawn
global.mon_list = ds_list_create();
ds_list_clear(global.mon_list);
ds_list_add(global.mon_list,bekka_obj);
ds_list_add(global.mon_list,brain_chase_obj);
ds_list_add(global.mon_list,fish_obj);
ds_list_add(global.mon_list,gc_obj);
ds_list_add(global.mon_list,gel_obj);
ds_list_add(global.mon_list,gurgle_obj);
ds_list_add(global.mon_list,otto_obj);
ds_list_add(global.mon_list,para_obj);
ds_list_add(global.mon_list,patient_obj);
ds_list_add(global.mon_list,pup_obj);
ds_list_add(global.mon_list,real_ringu_obj);
ds_list_add(global.mon_list,ringu_obj);
ds_list_add(global.mon_list,stem_obj);
if file_exists(working_directory+"\Karamari_Hospital\KH.exe")
{
    ds_list_add(global.mon_list,bodybag_obj);
}
global.mon_spawn_list = ds_list_create();
ds_list_clear(global.mon_spawn_list);
global.mon_curr_list = ds_list_create();
ds_list_clear(global.mon_curr_list);
// Set variables
texture_set_repeat(true);
action_set_cursor(-1,false);
draw_set_color(c_white);
draw_set_alpha(1);
d3d_set_lighting(false);
d3d_set_culling(false);
d3d_set_hidden(false);
draw_set_font(main_font);
// Load
instance_create(0,0,global.control_obj);
room_goto(menu_rm);