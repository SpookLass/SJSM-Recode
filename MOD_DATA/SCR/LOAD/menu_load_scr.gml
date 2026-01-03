/*
Customize menu stuff
Type
    0 - Enum
    1 - Number
    2 - Clamped Number
    3 - Max Clamped Number
    4 - Min Clamped Number
    5 - String
Default
    custom_default_arr[0,0] - Setting index & Difficulty + 1
    ds_grid_add(custom_default_arr[0,0],0,0,true) - Mode + 1 & Behavior + 1
    0 is always default. If there is no value it will go to Behavior first, then Mode, then difficulty last
*/
globalvar custom_name_arr;
globalvar custom_label_arr;
globalvar custom_desc_arr;
globalvar custom_type_arr;
globalvar custom_default_arr;
globalvar custom_clamp_arr;
// Name
custom_name_arr[0,0] = "example"
custom_name_arr[0,1] = true; // Translate?
// Description
custom_desc_arr[0,0] = "example"
custom_desc_arr[0,1] = true; // Translate?
// Type
custom_type_arr[0] = 0;
// Label
custom_label_arr[0,0] = "example"; // Value 1
custom_label_arr[0,1] = true; // Translate
custom_label_arr[0,2] = "example"; // Value 2
custom_label_arr[0,3] = true; // Translate
// Clamp
custom_clamp_arr[0,0] = 0;
custom_clamp_arr[0,1] = 1;
// Default
custom_default_arr[0,0] = ds_grid_create(); ds_grid_clear(custom_default_arr[0,0]);
ds_grid_add(custom_default_arr[0,0],0,0,true);
/*
Monster lists
0 - Story
    0 - None
    1 - All
    2 - Story
    3 - Beta
    4 - No Ringu
1 - Karamari
    0 - None
    1 - All Available
    2 - OG Endless
    3 - HD Endless
2 - Dollhouse
    0 - None
    1 - All Available
    2 - HD Endless
3 - Unknown
    0 - None
    1 - All
4 - Endless
    0 - None
    1 - All
*/
globalvar mon_list_arr;
// Story
// All
mon_list_arr[0,1] = ds_list_create();
ds_list_clear(mon_list_arr[0,1]);
ds_list_add(mon_list_arr[0,1],gel_obj);
ds_list_add(mon_list_arr[0,1],bug_obj);
ds_list_add(mon_list_arr[0,1],ringu_obj);
ds_list_add(mon_list_arr[0,1],bab_obj);
ds_list_add(mon_list_arr[0,1],pup_obj);
ds_list_add(mon_list_arr[0,1],flesh_obj);
ds_list_add(mon_list_arr[0,1],dl_obj);
ds_list_add(mon_list_arr[0,1],eel_obj);
ds_list_add(mon_list_arr[0,1],para_obj);
ds_list_add(mon_list_arr[0,1],fd_obj);
ds_list_add(mon_list_arr[0,1],killer_obj);
// ds_list_add(mon_list_arr[0,1],mur_obj);
// Story Mode
mon_list_arr[0,2] = ds_list_create();
ds_list_clear(mon_list_arr[0,2]);
ds_list_add(mon_list_arr[0,2],gel_obj);
ds_list_add(mon_list_arr[0,2],bug_obj);
ds_list_add(mon_list_arr[0,2],ringu_obj);
ds_list_add(mon_list_arr[0,2],bab_obj);
ds_list_add(mon_list_arr[0,2],pup_obj);
ds_list_add(mon_list_arr[0,2],flesh_obj);
ds_list_add(mon_list_arr[0,2],dl_obj);
ds_list_add(mon_list_arr[0,2],para_obj);
ds_list_add(mon_list_arr[0,2],fd_obj);
ds_list_add(mon_list_arr[0,2],killer_obj);
// ds_list_add(mon_list_arr[0,2],mur_obj);
// Beta
mon_list_arr[0,3] = ds_list_create();
ds_list_clear(mon_list_arr[0,3]);
ds_list_add(mon_list_arr[0,3],gel_obj);
ds_list_add(mon_list_arr[0,3],brain_obj);
ds_list_add(mon_list_arr[0,3],ringu_obj);
ds_list_add(mon_list_arr[0,3],bab_obj);
ds_list_add(mon_list_arr[0,3],pup_obj);
ds_list_add(mon_list_arr[0,3],flesh_obj);
ds_list_add(mon_list_arr[0,3],dl_obj);
ds_list_add(mon_list_arr[0,3],eel_obj);
ds_list_add(mon_list_arr[0,3],fd_obj);
ds_list_add(mon_list_arr[0,3],killer_obj);
// ds_list_add(mon_list_arr[0,3],mur_obj);
// No Ringu
mon_list_arr[0,4] = ds_list_create();
ds_list_clear(mon_list_arr[0,4]);
ds_list_add(mon_list_arr[0,4],gel_obj);
ds_list_add(mon_list_arr[0,4],bug_obj);
ds_list_add(mon_list_arr[0,4],bab_obj);
ds_list_add(mon_list_arr[0,4],pup_obj);
ds_list_add(mon_list_arr[0,4],flesh_obj);
ds_list_add(mon_list_arr[0,4],dl_obj);
ds_list_add(mon_list_arr[0,4],eel_obj);
ds_list_add(mon_list_arr[0,4],para_obj);
ds_list_add(mon_list_arr[0,4],fd_obj);
ds_list_add(mon_list_arr[0,4],killer_obj);
// ds_list_add(mon_list_arr[0,4],mur_obj);
// Karamari
// OG Endless
mon_list_arr[1,2] = ds_list_create();
ds_list_clear(mon_list_arr[1,2]);
ds_list_add(mon_list_arr[1,2],stem_obj);
ds_list_add(mon_list_arr[1,2],patient_obj);
ds_list_add(mon_list_arr[1,2],gc_obj);
ds_list_add(mon_list_arr[1,2],bekka_obj);
// HD Endless
mon_list_arr[1,3] = ds_list_create();
ds_list_clear(mon_list_arr[1,3]);
ds_list_copy(mon_list_arr[1,3],mon_list_arr[1,2]);
if file_exists(working_directory+"\Karamari_Hospital\KH.exe")
{ ds_list_add(mon_list_arr[1,3],bodybag_obj); }
// All
mon_list_arr[1,1] = ds_list_create();
ds_list_clear(mon_list_arr[1,1]);
ds_list_copy(mon_list_arr[1,1],mon_list_arr[1,3]);
if file_exists(working_directory+"\Karamari_Hospital\KH.exe")
{ ds_list_add(mon_list_arr[1,3],sg_obj); }
// Dollhouse
if file_exists(working_directory+"\The_Doll_House\SDH.exe")
{
    // HD Endless
    mon_list_arr[2,2] = ds_list_create();
    ds_list_clear(mon_list_arr[2,2]);
    ds_list_add(mon_list_arr[2,2],wc_obj);
    ds_list_add(mon_list_arr[2,2],clown_obj);
    ds_list_add(mon_list_arr[2,2],hk_obj);
    // All
    mon_list_arr[2,1] = ds_list_create();
    ds_list_clear(mon_list_arr[2,1]);
    ds_list_copy(mon_list_arr[2,1],mon_list_arr[2,2]);
    ds_list_add(mon_list_arr[2,1],frenzy_obj);
}
// Endless
mon_list_arr[3,1] = ds_list_create();
ds_list_clear(mon_list_arr[3,1]);
ds_list_add(mon_list_arr[3,1],real_ringu_obj);
// Unknown
mon_list_arr[4,1] = ds_list_create();
ds_list_clear(mon_list_arr[4,1]);
ds_list_add(mon_list_arr[4,1],tiri_obj);
ds_list_add(mon_list_arr[4,1],lisa_obj);
ds_list_add(mon_list_arr[4,1],otto_obj);
ds_list_add(mon_list_arr[4,1],spooper_obj);
ds_list_add(mon_list_arr[4,1],wf_obj);
// Modes
globalvar mode_name_arr;
global.mode_len_var = 3;
mode_name_arr[0,0] = "story"; // Name / Translation Key
mode_name_arr[0,1] = true; // Is Translation Key
mode_name_arr[1,0] = "endless";
mode_name_arr[1,1] = true;
mode_name_arr[2,0] = "sandbox";
mode_name_arr[2,1] = true;
// Behavior
globalvar type_name_arr;
global.type_len_var = 3;
type_name_arr[0,0] = "recode"; // Name / Translation Key
type_name_arr[0,1] = true; // Is Translation Key
type_name_arr[1,0] = "og";
type_name_arr[1,1] = true;
type_name_arr[2,0] = "hd";
type_name_arr[2,1] = true;
// Monster specific
globalvar mon_type_arr;
globalvar mon_type_name_arr;
global.mon_type_len_var = 30;
mon_type_arr[0,0] = "js"; // Name / Translation Key
mon_type_arr[1,0] = "gel";
mon_type_arr[2,0] = "bug";
mon_type_arr[2,1] = 1; // Number of extra behaviors
mon_type_name_arr[2,0] = "rouge";
mon_type_name_arr[2,1] = true;
mon_type_arr[3,0] = "ringu";
mon_type_arr[3,1] = 1;
mon_type_name_arr[3,0] = "old";
mon_type_name_arr[3,1] = true;
mon_type_arr[4,0] = "bab";
mon_type_arr[4,1] = 1;
mon_type_name_arr[4,0] = "old";
mon_type_name_arr[4,1] = true;
mon_type_arr[5,0] = "pup";
mon_type_arr[5,1] = 3;
mon_type_name_arr[5,0] = "old";
mon_type_name_arr[5,1] = true;
mon_type_name_arr[5,2] = "dh";
mon_type_name_arr[5,3] = true;
mon_type_name_arr[5,4] = "dh_hd";
mon_type_name_arr[5,5] = true;
mon_type_arr[6,0] = "flesh";
mon_type_arr[7,0] = "dl";
mon_type_arr[7,1] = 3;
mon_type_name_arr[7,0] = "old";
mon_type_name_arr[7,1] = true;
mon_type_name_arr[7,2] = "rouge";
mon_type_name_arr[7,3] = true;
mon_type_name_arr[7,4] = "remodeled";
mon_type_name_arr[7,5] = true;
mon_type_arr[8,0] = "eel";
mon_type_arr[8,1] = 1;
mon_type_name_arr[8,0] = "remodeled";
mon_type_name_arr[8,1] = true;
mon_type_arr[9,0] = "para";
mon_type_arr[10,0] = "fd";
mon_type_arr[11,0] = "killer";
mon_type_arr[11,1] = 5;
mon_type_name_arr[11,0] = "old";
mon_type_name_arr[11,1] = true;
mon_type_name_arr[11,4] = "remodeled";
mon_type_name_arr[11,5] = true;
mon_type_name_arr[11,2] = "rouge";
mon_type_name_arr[11,3] = true;
mon_type_name_arr[11,2] = "alt1";
mon_type_name_arr[11,3] = true;
mon_type_name_arr[11,2] = "alt2";
mon_type_name_arr[11,3] = true;
mon_type_arr[12,0] = "mur";
mon_type_arr[13,0] = "sg";
mon_type_arr[14,0] = "body";
mon_type_arr[14,1] = 3;
mon_type_name_arr[14,0] = "old";
mon_type_name_arr[14,1] = true;
mon_type_name_arr[14,4] = "kh";
mon_type_name_arr[14,5] = true;
mon_type_name_arr[14,2] = "alt";
mon_type_arr[15,0] = "stem";
mon_type_arr[15,1] = 4;
mon_type_arr[16,0] = "patient";
mon_type_arr[16,1] = 1;
mon_type_arr[17,0] = "gc";
mon_type_arr[17,1] = 4;
mon_type_arr[18,0] = "bekka";
mon_type_arr[18,1] = 3;
mon_type_arr[19,0] = "husk";
mon_type_arr[20,0] = "wc";
mon_type_arr[20,1] = 1;
mon_type_arr[21,0] = "clown";
mon_type_arr[21,1] = 1;
mon_type_arr[22,0] = "hk";
mon_type_arr[22,1] = 1;
mon_type_arr[23,0] = "frenzy";
mon_type_arr[24,0] = "real_ringu";
mon_type_arr[24,1] = 1;
mon_type_arr[25,0] = "tiri";
mon_type_arr[25,1] = 1;
mon_type_arr[26,0] = "lisa";
mon_type_arr[27,0] = "otto";
mon_type_arr[27,1] = 1;
mon_type_arr[28,0] = "spooper";
mon_type_arr[29,0] = "wf";
mon_type_arr[29,1] = 5;