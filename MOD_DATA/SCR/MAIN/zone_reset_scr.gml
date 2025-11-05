/*
Resets the room list, mostly used for specimens like White Face, Flesh, and Mermaid
*/
ds_list_clear(global.rm_list_var);
ds_list_copy(global.rm_list_var,global.zone_var);
ds_list_shuffle(global.rm_list_var);