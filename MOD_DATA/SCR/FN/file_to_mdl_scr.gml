/*
Argument 0: File path
Argument 1: Variable name
Argument 3: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
// If the file exists
if argument0 != "" && file_exists(argument0)
{
    // Add the model
    local.mdl = d3d_model_create();
    d3d_model_load(local.mdl,argument0);
    // Add sprite to variable using execute_string
    execute_string
    (
        // If variable has not been set previously, set it.
        "if "+argument1+" == 0
        {
            globalvar "+argument1+";
            globalvar "+argument1+"_path;
            "+argument1+" = "+string(local.mdl)+";
            "+argument1+"_path = '"+argument0+"';
        }
        else if "+string(argument2)+"
        { show_error('Variable "+argument1+" already in use!',false); }"
    );
}
else if argument2 { show_error("File "+argument1+" doesn't exist at path "+argument0,false); }