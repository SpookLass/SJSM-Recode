/*
Argument 0: Print
This is no longer used, and is not recommended. 
Running code from a file lags the game like crazy.
I left the scripts in the files for demonstration and editing purposes.
*/
// Get the first file in the function directory
local.file = file_find_first(main_directory_const+"\SCR\FN\*.gml",-1);
// Not sure why, but it doesn't include the path.
execute_file(main_directory_const+"\SCR\FN\file_to_var_scr.gml",main_directory_const+"\SCR\FN\"+local.file,filename_change_ext(local.file,""),argument0);
while (local.file != "")
{
    local.file = file_find_next();
    execute_file(main_directory_const+"\SCR\FN\file_to_var_scr.gml",main_directory_const+"\SCR\FN\"+local.file,filename_change_ext(local.file,""),argument0);
}
file_find_close();
// Get the first file in the object directory
local.file = file_find_first(main_directory_const+"\SCR\OBJ\*.gml",-1);
execute_file(global.file_to_var_scr,main_directory_const+"\SCR\OBJ\"+local.file,filename_change_ext(local.file,""),argument0);
while (local.file != "")
{
    local.file = file_find_next();
    execute_file(global.file_to_var_scr,main_directory_const+"\SCR\OBJ\"+local.file,filename_change_ext(local.file,""),argument0);
}

// Load DLLs
// Get the first file in the P3DC directory
execute_string()
local.file = file_find_first(main_directory_const+"\DLL\P3DC\*.gml",-1);
execute_file(global.file_to_var_scr,main_directory_const+"\DLL\P3DC\"+local.file,filename_change_ext(local.file,""),argument0);
while (local.file != "")
{
    local.file = file_find_next();
    execute_file(global.file_to_var_scr,main_directory_const+"\DLL\P3DC\"+local.file,filename_change_ext(local.file,""),argument0);
}