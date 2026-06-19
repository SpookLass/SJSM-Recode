/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Print
Argument 3:
    Sprite: Number
    Sound: 3D
Argument 4:
    Sprite: Remove Background
    Sound: Group
Argument 5:
    Sprite: Smooth
    Sound: Volume
Argument 6:
    Sprite: X origin
    Sound: Minimum Distance
Argument 7:
    Sprite: Y origin
    Sound: Maximum Distance
ONLY USE THIS WHEN THE GAME LOADS
*/
if !variable_global_exists(argument1)
{
    local.asset = execute_file(argument0+".gml",argument0,argument3,argument4,argument5,argument6,argument7);
    globalvar_scr(local.asset,argument1,false);
    if argument2 { show_message("Initialized asset "+argument0+" at variable "+argument1); }
}
else if argument2 { show_message("Variable "+argument1+" already in use!"); }