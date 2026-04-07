/*
-----------------
Settings

Yet another array, this time for settings.
Type
    0 - Enum
    1 - Number
    2 - Clamped Number
    3 - Max Clamped Number
    4 - Min Clamped Number
    5 - String
    6 - Pointer
        Like an enum, but it points to another value
    7 - Input
    8 - Category
Category
    0 - Main
    1 - Gameplay
    2 - Visuals
    3 - Audio
    4 - Performance
    5 - HUD
    6 - Accessibility
    7 - Controls (Sub)
    8 - Inputs
    9 - Controls
-----------------
*/
draw_load_scr("Loading settings...");
globalvar set_arr;
globalvar set_label_arr;
globalvar set_default_arr;
globalvar set_pointer_arr;
globalvar set_state_arr;
global.set_len_var = 0;
global.set_state_len_var = 0;
/*
----------
Categories
----------
*/
// Main
set_state_arr[global.set_state_len_var,0] = "settings"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = -1; // Previous State (None)
global.set_state_len_var += 1;
// Gameplay
set_state_arr[global.set_state_len_var,0] = "gameplay"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = 0; // Previous State (Main)
global.set_state_len_var += 1;
// Visuals
set_state_arr[global.set_state_len_var,0] = "visual"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = 0; // Previous State (Main)
global.set_state_len_var += 1;
// Audio
set_state_arr[global.set_state_len_var,0] = "audio"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = 0; // Previous State (Main)
global.set_state_len_var += 1;
// Performance
set_state_arr[global.set_state_len_var,0] = "performance"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = 0; // Previous State (Main)
global.set_state_len_var += 1;
// HUD
set_state_arr[global.set_state_len_var,0] = "hud"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = 0; // Previous State (Main)
global.set_state_len_var += 1;
// Accessibility
set_state_arr[global.set_state_len_var,0] = "accessibility"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = 0; // Previous State (Main)
global.set_state_len_var += 1;
// Controls (Sub)
set_state_arr[global.set_state_len_var,0] = "control"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = 9; // Previous State (Main)
global.set_state_len_var += 1;
// Input
set_state_arr[global.set_state_len_var,0] = "input"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = 9; // Previous State (Main)
global.set_state_len_var += 1;
// Controls
set_state_arr[global.set_state_len_var,0] = "control"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = 0; // Previous State (Main)
global.set_state_len_var += 1;
// Fun!
set_state_arr[global.set_state_len_var,0] = "fun"; // Name
set_state_arr[global.set_state_len_var,1] = true; // Translate
set_state_arr[global.set_state_len_var,2] = 0; // Previous State (Main)
global.set_state_len_var += 1;
/*
----
Main
----
*/
// Gameplay Category
set_arr[global.set_len_var,0] = "gameplay"; // Variable name
set_arr[global.set_len_var,1] = "gameplay"; // Name
set_arr[global.set_len_var,2] = "gameplay"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 8; // Type (Category)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 0; // Category (Main)
set_arr[global.set_len_var,9] = false; // Player Specific
set_arr[global.set_len_var,10] = 1; // ID (category)
    // Default
set_default_arr[global.set_len_var,0] = 0; // Default
global.set_len_var += 1;
// Visual Category
set_arr[global.set_len_var,0] = "visual"; // Variable name
set_arr[global.set_len_var,1] = "visual"; // Name
set_arr[global.set_len_var,2] = "visual"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 8; // Type (Category)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 0; // Category (Main)
set_arr[global.set_len_var,9] = false; // Player Specific
set_arr[global.set_len_var,10] = 2; // ID (category)
    // Default
set_default_arr[global.set_len_var,0] = 0; // Default
global.set_len_var += 1;
// Audio Category
set_arr[global.set_len_var,0] = "audio"; // Variable name
set_arr[global.set_len_var,1] = "audio"; // Name
set_arr[global.set_len_var,2] = "audio"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 8; // Type (Category)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 0; // Category (Main)
set_arr[global.set_len_var,9] = false; // Player Specific
set_arr[global.set_len_var,10] = 3; // ID (category)
    // Default
set_default_arr[global.set_len_var,0] = 0; // Default
global.set_len_var += 1;
// Performance Category
set_arr[global.set_len_var,0] = "performance"; // Variable name
set_arr[global.set_len_var,1] = "performance"; // Name
set_arr[global.set_len_var,2] = "performance"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 8; // Type (Category)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 0; // Category (Main)
set_arr[global.set_len_var,9] = false; // Player Specific
set_arr[global.set_len_var,10] = 4; // ID (category)
    // Default
set_default_arr[global.set_len_var,0] = 0; // Default
global.set_len_var += 1;
// HUD Category
set_arr[global.set_len_var,0] = "hud"; // Variable name
set_arr[global.set_len_var,1] = "hud"; // Name
set_arr[global.set_len_var,2] = "hud"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 8; // Type (Category)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 0; // Category (Main)
set_arr[global.set_len_var,9] = false; // Player Specific
set_arr[global.set_len_var,10] = 5; // ID (category)
    // Default
set_default_arr[global.set_len_var,0] = 0; // Default
global.set_len_var += 1;
// Accessibility Category
set_arr[global.set_len_var,0] = "access"; // Variable name
set_arr[global.set_len_var,1] = "access"; // Name
set_arr[global.set_len_var,2] = "access"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 8; // Type (Category)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 0; // Category (Main)
set_arr[global.set_len_var,9] = false; // Player Specific
set_arr[global.set_len_var,10] = 6; // ID (category)
    // Default
set_default_arr[global.set_len_var,0] = 0; // Default
global.set_len_var += 1;
// Control Category
set_arr[global.set_len_var,0] = "control"; // Variable name
set_arr[global.set_len_var,1] = "control"; // Name
set_arr[global.set_len_var,2] = "control"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 8; // Type (Category)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 0; // Category (Main)
set_arr[global.set_len_var,9] = false; // Player Specific
set_arr[global.set_len_var,10] = 9; // ID (category)
    // Default
set_default_arr[global.set_len_var,0] = 0; // Default
global.set_len_var += 1;
// Fun Category
set_arr[global.set_len_var,0] = "fun"; // Variable name
set_arr[global.set_len_var,1] = "fun"; // Name
set_arr[global.set_len_var,2] = "fun"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 8; // Type (Category)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 0; // Category (Main)
set_arr[global.set_len_var,9] = false; // Player Specific
set_arr[global.set_len_var,10] = 10; // ID (category)
    // Default
set_default_arr[global.set_len_var,0] = 0; // Default
global.set_len_var += 1;
/*
--------
Gameplay
--------
*/
// Reset Speed
set_arr[global.set_len_var,0] = "reset_spd"; // Variable name
set_arr[global.set_len_var,1] = "reset_spd"; // Name
set_arr[global.set_len_var,2] = "reset_spd"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 2; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 1; // Category (Gameplay)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "mon"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "locale"; // Value 3
set_label_arr[global.set_len_var,5] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = reset_spd_const; // Default
global.set_len_var += 1;
/*
-------
Visuals
-------
*/
// FOV
set_arr[global.set_len_var,0] = "fov"; // Variable name
set_arr[global.set_len_var,1] = "fov"; // Name
set_arr[global.set_len_var,2] = "fov"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 2; // Type (Clamped)
set_arr[global.set_len_var,5] = 1; // Min
set_arr[global.set_len_var,6] = 179; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = fov_const; // Default
global.set_len_var += 1;
// Dynamic FOV
set_arr[global.set_len_var,0] = "dynamic_fov"; // Variable name
set_arr[global.set_len_var,1] = "dynamic_fov"; // Name
set_arr[global.set_len_var,2] = "dynamic_fov"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 2; // Type (Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 100; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = dynamic_fov_const; // Default
global.set_len_var += 1;
// Anti Aliasing
set_arr[global.set_len_var,0] = "anti_alias"; // Variable name
set_arr[global.set_len_var,1] = "anti_alias"; // Name
set_arr[global.set_len_var,2] = "anti_alias"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = anti_alias_const; // Default
global.set_len_var += 1;
// Vertical Sync
set_arr[global.set_len_var,0] = "vsync"; // Variable name
set_arr[global.set_len_var,1] = "vsync"; // Name
set_arr[global.set_len_var,2] = "vsync"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = vsync_const; // Default
global.set_len_var += 1;
// Fullscreen
set_arr[global.set_len_var,0] = "fullscreen"; // Variable name
set_arr[global.set_len_var,1] = "fullscreen"; // Name
set_arr[global.set_len_var,2] = "fullscreen"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = fullscreen_const; // Default
global.set_len_var += 1;
// Splitscreen
set_arr[global.set_len_var,0] = "splitscreen"; // Variable name
set_arr[global.set_len_var,1] = "splitscreen"; // Name
set_arr[global.set_len_var,2] = "splitscreen"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "hor"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "vert"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = splitscreen_const; // Default
global.set_len_var += 1;
// Color
set_arr[global.set_len_var,0] = "color"; // Variable name
set_arr[global.set_len_var,1] = "color"; // Name
set_arr[global.set_len_var,2] = "color"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 2; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "all"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "rm"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "screen"; // Value 3
set_label_arr[global.set_len_var,5] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = color_const; // Default
global.set_len_var += 1;
// Move Bob
set_arr[global.set_len_var,0] = "move_bob"; // Variable name
set_arr[global.set_len_var,1] = "move_bob"; // Name
set_arr[global.set_len_var,2] = "move_bob"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 4; // Type (Min Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = -1; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = move_bob_const; // Default
global.set_len_var += 1;
// Idle Bob
set_arr[global.set_len_var,0] = "idle_bob"; // Variable name
set_arr[global.set_len_var,1] = "idle_bob"; // Name
set_arr[global.set_len_var,2] = "idle_bob"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 4; // Type (Min Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = -1; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = idle_bob_const; // Default
global.set_len_var += 1;
// Shake Type
set_arr[global.set_len_var,0] = "shake_type"; // Variable name
set_arr[global.set_len_var,1] = "shake_type"; // Name
set_arr[global.set_len_var,2] = "shake_type"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 2; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "old"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "modern"; // Value 3
set_label_arr[global.set_len_var,5] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = shake_type_const; // Default
global.set_len_var += 1;
// Resolution Width
set_arr[global.set_len_var,0] = "res_w"; // Variable name
set_arr[global.set_len_var,1] = "res_w"; // Name
set_arr[global.set_len_var,2] = "res_w"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 4; // Type (Min Clamped)
set_arr[global.set_len_var,5] = 1; // Min
set_arr[global.set_len_var,6] = -1; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = res_w_const; // Default
global.set_len_var += 1;
// Resolution Height
set_arr[global.set_len_var,0] = "res_h"; // Variable name
set_arr[global.set_len_var,1] = "res_h"; // Name
set_arr[global.set_len_var,2] = "res_h"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 4; // Type (Min Clamped)
set_arr[global.set_len_var,5] = 1; // Min
set_arr[global.set_len_var,6] = -1; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 2; // Category (Visuals)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = res_h_const; // Default
global.set_len_var += 1;
/*
-----
Audio
-----
*/
// Master Volume
set_arr[global.set_len_var,0] = "vol"; // Variable name
set_arr[global.set_len_var,1] = "vol"; // Name
set_arr[global.set_len_var,2] = "vol"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 2; // Type (Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 100; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = vol_const; // Default
global.set_len_var += 1;
// Music Volume
set_arr[global.set_len_var,0] = "mus_vol"; // Variable name
set_arr[global.set_len_var,1] = "mus_vol"; // Name
set_arr[global.set_len_var,2] = "mus_vol"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 2; // Type (Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 100; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = mus_vol_const; // Default
global.set_len_var += 1;
// Enemy Volume
set_arr[global.set_len_var,0] = "mon_vol"; // Variable name
set_arr[global.set_len_var,1] = "mon_vol"; // Name
set_arr[global.set_len_var,2] = "mon_vol"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 2; // Type (Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 100; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = mon_vol_const; // Default
global.set_len_var += 1;
// SFX Volume
set_arr[global.set_len_var,0] = "sfx_vol"; // Variable name
set_arr[global.set_len_var,1] = "sfx_vol"; // Name
set_arr[global.set_len_var,2] = "sfx_vol"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 2; // Type (Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 100; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = sfx_vol_const; // Default
global.set_len_var += 1;
// Voice Volume
set_arr[global.set_len_var,0] = "voice_vol"; // Variable name
set_arr[global.set_len_var,1] = "voice_vol"; // Name
set_arr[global.set_len_var,2] = "voice_vol"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 2; // Type (Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 100; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = voice_vol_const; // Default
global.set_len_var += 1;
// Killer Voice
set_arr[global.set_len_var,0] = "killer_voice"; // Variable name
set_arr[global.set_len_var,1] = "killer_voice"; // Name
set_arr[global.set_len_var,2] = "killer_voice"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 3; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "og"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "hd"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "mod"; // Value 3
set_label_arr[global.set_len_var,5] = true; // Translate
set_label_arr[global.set_len_var,6] = "ryan"; // Value 4
set_label_arr[global.set_len_var,7] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = killer_voice_const; // Default
global.set_len_var += 1;
// Random theme
set_arr[global.set_len_var,0] = "rand_theme"; // Variable name
set_arr[global.set_len_var,1] = "rand_theme"; // Name
set_arr[global.set_len_var,2] = "rand_theme"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = rand_theme_const; // Default
global.set_len_var += 1;
// Attenuate Wake Sounds
set_arr[global.set_len_var,0] = "wake_3d"; // Variable name
set_arr[global.set_len_var,1] = "wake_3d"; // Name
set_arr[global.set_len_var,2] = "wake_3d"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = wake_3d_const; // Default
global.set_len_var += 1;
// Pitch bending
set_arr[global.set_len_var,0] = "pitch_bend"; // Variable name
set_arr[global.set_len_var,1] = "pitch_bend"; // Name
set_arr[global.set_len_var,2] = "pitch_bend"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = pitch_bend_const; // Default
global.set_len_var += 1;
// Doppler
set_arr[global.set_len_var,0] = "doppler"; // Variable name
set_arr[global.set_len_var,1] = "doppler"; // Name
set_arr[global.set_len_var,2] = "doppler"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = doppler_const; // Default
global.set_len_var += 1;
// Pause Theme
set_arr[global.set_len_var,0] = "pause_theme"; // Variable name
set_arr[global.set_len_var,1] = "pause_theme"; // Name
set_arr[global.set_len_var,2] = "pause_theme"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = pause_theme_const; // Default
global.set_len_var += 1;
// Themes
set_arr[global.set_len_var,0] = "old_theme"; // Variable name
set_arr[global.set_len_var,1] = "theme"; // Name
set_arr[global.set_len_var,2] = "theme"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 2; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 3; // Category (Audio)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "mod"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "old"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "romm"; // Value 2
set_label_arr[global.set_len_var,5] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = old_theme_const; // Default
global.set_len_var += 1;
/*
-----------
Performance
-----------
*/
// FPS
set_arr[global.set_len_var,0] = "fps"; // Variable name
set_arr[global.set_len_var,1] = "fps"; // Name
set_arr[global.set_len_var,2] = "fps"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 4; // Type (Min Clamped)
set_arr[global.set_len_var,5] = 1; // Min
set_arr[global.set_len_var,6] = -1; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 4; // Category (Performance)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = fps_const; // Default
global.set_len_var += 1;
// TPS
set_arr[global.set_len_var,0] = "tps"; // Variable name
set_arr[global.set_len_var,1] = "tps"; // Name
set_arr[global.set_len_var,2] = "tps"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 4; // Type (Min Clamped)
set_arr[global.set_len_var,5] = 1; // Min
set_arr[global.set_len_var,6] = -1; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 4; // Category (Performance)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = tps_const; // Default
global.set_len_var += 1;
// Maximum particle count
set_arr[global.set_len_var,0] = "max_part"; // Variable name
set_arr[global.set_len_var,1] = "max_part"; // Name
set_arr[global.set_len_var,2] = "max_part"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 4; // Type (Min Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = -1; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 4; // Category (Performance)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = max_part_const; // Default
global.set_len_var += 1;
// Collision Precision
set_arr[global.set_len_var,0] = "coll_prec"; // Variable name
set_arr[global.set_len_var,1] = "coll_prec"; // Name
set_arr[global.set_len_var,2] = "coll_prec"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 4; // Category (Performance)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = coll_prec_const; // Default
global.set_len_var += 1;
// Memory Saving
set_arr[global.set_len_var,0] = "mem_save"; // Variable name
set_arr[global.set_len_var,1] = "mem_save"; // Name
set_arr[global.set_len_var,2] = "mem_save"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 4; // Category (Performance)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = mem_save_const; // Default
global.set_len_var += 1;
/*
---
HUD
---
*/
// Language
set_arr[global.set_len_var,0] = "lang"; // Variable name
set_arr[global.set_len_var,1] = "lang"; // Name
set_arr[global.set_len_var,2] = "lang"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 5; // Type (String)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 5; // Category (HUD)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = "en_us.ini"; // Default
global.set_len_var += 1;
// Names
set_arr[global.set_len_var,0] = "name"; // Variable name
set_arr[global.set_len_var,1] = "name"; // Name
set_arr[global.set_len_var,2] = "name"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 4; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 5; // Category (HUD)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "og"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "hd"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "fanon"; // Value 3
set_label_arr[global.set_len_var,5] = true; // Translate
set_label_arr[global.set_len_var,6] = "og_num"; // Value 4
set_label_arr[global.set_len_var,7] = true; // Translate
set_label_arr[global.set_len_var,8] = "hd_num"; // Value 5
set_label_arr[global.set_len_var,9] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = name_hd_const; // Default
global.set_len_var += 1;
// Monster Hud
set_arr[global.set_len_var,0] = "mon_hud"; // Variable name
set_arr[global.set_len_var,1] = "mon_hud"; // Name
set_arr[global.set_len_var,2] = "mon_hud"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 2; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 5; // Category (HUD)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "dur"; // Value 2
set_label_arr[global.set_len_var,5] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = mon_hud_const; // Default
global.set_len_var += 1;
// Room Hud
set_arr[global.set_len_var,0] = "rm_hud"; // Variable name
set_arr[global.set_len_var,1] = "rm_hud"; // Name
set_arr[global.set_len_var,2] = "rm_hud"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 5; // Category (HUD)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = rm_hud_const; // Default
global.set_len_var += 1;
// TPS & FPS hud
set_arr[global.set_len_var,0] = "tps_hud"; // Variable name
set_arr[global.set_len_var,1] = "tps_hud"; // Name
set_arr[global.set_len_var,2] = "tps_hud"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 5; // Category (HUD)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = tps_hud_const; // Default
global.set_len_var += 1;
// Time hud
set_arr[global.set_len_var,0] = "time_hud"; // Variable name
set_arr[global.set_len_var,1] = "time_hud"; // Name
set_arr[global.set_len_var,2] = "time_hud"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 5; // Category (HUD)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = time_hud_const; // Default
global.set_len_var += 1;
// Bar Hud
set_arr[global.set_len_var,0] = "bar_hud"; // Variable name
set_arr[global.set_len_var,1] = "bar_hud"; // Name
set_arr[global.set_len_var,2] = "bar_hud"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 2; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 5; // Category (HUD)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "old"; // Value 2
set_label_arr[global.set_len_var,5] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = bar_hud_const; // Default
global.set_len_var += 1;
// FPS Update Rate
set_arr[global.set_len_var,0] = "fps_update"; // Variable name
set_arr[global.set_len_var,1] = "fps_update"; // Name
set_arr[global.set_len_var,2] = "fps_update"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 4; // Type (Min Clamped)
set_arr[global.set_len_var,5] = 1; // Min
set_arr[global.set_len_var,6] = -1; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 5; // Category (HUD)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = fps_update_const; // Default
global.set_len_var += 1;
/*
-------------
Accessibility
-------------
*/
// Reduce Flashing
set_arr[global.set_len_var,0] = "reduce_flash"; // Variable name
set_arr[global.set_len_var,1] = "reduce_flash"; // Name
set_arr[global.set_len_var,2] = "reduce_flash"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 6; // Category (Accessibility)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = reduce_flash_const; // Default
global.set_len_var += 1;
// Subtitles
set_arr[global.set_len_var,0] = "sub"; // Variable name
set_arr[global.set_len_var,1] = "sub"; // Name
set_arr[global.set_len_var,2] = "sub"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 2; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 6; // Category (Accessibility)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "voice"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "all"; // Value 3
set_label_arr[global.set_len_var,5] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = sub_const; // Default
global.set_len_var += 1;
/*
--------------
Controls (Sub)
--------------
*/
// Crouch Toggle
set_arr[global.set_len_var,0] = "crouch_toggle"; // Variable name
set_arr[global.set_len_var,1] = "crouch_toggle"; // Name
set_arr[global.set_len_var,2] = "crouch_toggle"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 7; // Category (Control)
set_arr[global.set_len_var,9] = true; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = crouch_toggle_const; // Player 1
set_default_arr[global.set_len_var,1] = crouch_toggle_const; // Player 2
set_default_arr[global.set_len_var,2] = crouch_toggle_const; // Player 3
set_default_arr[global.set_len_var,3] = crouch_toggle_const; // Player 4
set_default_arr[global.set_len_var,4] = crouch_toggle_const; // Player 5
set_default_arr[global.set_len_var,5] = crouch_toggle_const; // Player 6
set_default_arr[global.set_len_var,6] = crouch_toggle_const; // Player 7
set_default_arr[global.set_len_var,7] = crouch_toggle_const; // Player 8
global.set_len_var += 1;
// Joystick ID
set_arr[global.set_len_var,0] = "joy_id"; // Variable name
set_arr[global.set_len_var,1] = "joy_id"; // Name
set_arr[global.set_len_var,2] = "joy_id"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 2; // Type (Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 7; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 7; // Category (Control)
set_arr[global.set_len_var,9] = true; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = 0; // Player 1
set_default_arr[global.set_len_var,1] = 0; // Player 2
set_default_arr[global.set_len_var,2] = 1; // Player 3
set_default_arr[global.set_len_var,3] = 2; // Player 4
set_default_arr[global.set_len_var,4] = 3; // Player 5
set_default_arr[global.set_len_var,5] = 4; // Player 6
set_default_arr[global.set_len_var,6] = 5; // Player 7
set_default_arr[global.set_len_var,7] = 6; // Player 8
global.set_len_var += 1;
// Sensitivity
set_arr[global.set_len_var,0] = "sens"; // Variable name
set_arr[global.set_len_var,1] = "sens"; // Name
set_arr[global.set_len_var,2] = "sens"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 4; // Type (Min Clamped)
set_arr[global.set_len_var,5] = 1; // Min
set_arr[global.set_len_var,6] = -1; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 7; // Category (Control)
set_arr[global.set_len_var,9] = true; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = sens_const; // Player 1
set_default_arr[global.set_len_var,1] = sens_const; // Player 2
set_default_arr[global.set_len_var,2] = sens_const; // Player 3
set_default_arr[global.set_len_var,3] = sens_const; // Player 4
set_default_arr[global.set_len_var,4] = sens_const; // Player 5
set_default_arr[global.set_len_var,5] = sens_const; // Player 6
set_default_arr[global.set_len_var,6] = sens_const; // Player 7
set_default_arr[global.set_len_var,7] = sens_const; // Player 8
global.set_len_var += 1;
// Joystick Sensitivity
set_arr[global.set_len_var,0] = "joy_sens"; // Variable name
set_arr[global.set_len_var,1] = "joy_sens"; // Name
set_arr[global.set_len_var,2] = "joy_sens"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 2; // Type (Clamped)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 100; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 7; // Category (Control)
set_arr[global.set_len_var,9] = true; // Player Specific
    // Default
set_default_arr[global.set_len_var,0] = joy_sens_const; // Player 1
set_default_arr[global.set_len_var,1] = joy_sens_const; // Player 2
set_default_arr[global.set_len_var,2] = joy_sens_const; // Player 3
set_default_arr[global.set_len_var,3] = joy_sens_const; // Player 4
set_default_arr[global.set_len_var,4] = joy_sens_const; // Player 5
set_default_arr[global.set_len_var,5] = joy_sens_const; // Player 6
set_default_arr[global.set_len_var,6] = joy_sens_const; // Player 7
set_default_arr[global.set_len_var,7] = joy_sens_const; // Player 8
global.set_len_var += 1;
// Invert Yaw
set_arr[global.set_len_var,0] = "invert_yaw"; // Variable name
set_arr[global.set_len_var,1] = "invert_yaw"; // Name
set_arr[global.set_len_var,2] = "invert_yaw"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 7; // Category (Control)
set_arr[global.set_len_var,9] = true; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = invert_yaw_const; // Player 1
set_default_arr[global.set_len_var,1] = invert_yaw_const; // Player 2
set_default_arr[global.set_len_var,2] = invert_yaw_const; // Player 3
set_default_arr[global.set_len_var,3] = invert_yaw_const; // Player 4
set_default_arr[global.set_len_var,4] = invert_yaw_const; // Player 5
set_default_arr[global.set_len_var,5] = invert_yaw_const; // Player 6
set_default_arr[global.set_len_var,6] = invert_yaw_const; // Player 7
set_default_arr[global.set_len_var,7] = invert_yaw_const; // Player 8
global.set_len_var += 1;
// Invert Pitch
set_arr[global.set_len_var,0] = "invert_pitch"; // Variable name
set_arr[global.set_len_var,1] = "invert_pitch"; // Name
set_arr[global.set_len_var,2] = "invert_pitch"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 7; // Category (Control)
set_arr[global.set_len_var,9] = true; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = invert_pitch_const; // Player 1
set_default_arr[global.set_len_var,1] = invert_pitch_const; // Player 2
set_default_arr[global.set_len_var,2] = invert_pitch_const; // Player 3
set_default_arr[global.set_len_var,3] = invert_pitch_const; // Player 4
set_default_arr[global.set_len_var,4] = invert_pitch_const; // Player 5
set_default_arr[global.set_len_var,5] = invert_pitch_const; // Player 6
set_default_arr[global.set_len_var,6] = invert_pitch_const; // Player 7
set_default_arr[global.set_len_var,7] = invert_pitch_const; // Player 8
global.set_len_var += 1;
// Camera Controls
set_arr[global.set_len_var,0] = "input_cam"; // Variable name
set_arr[global.set_len_var,1] = "input_cam"; // Name
set_arr[global.set_len_var,2] = "input_cam"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 5; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 7; // Category (Control)
set_arr[global.set_len_var,9] = true; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "mouse"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "rjoy"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "rjoys"; // Value 3
set_label_arr[global.set_len_var,5] = true; // Translate
set_label_arr[global.set_len_var,6] = "ljoy"; // Value 4
set_label_arr[global.set_len_var,7] = true; // Translate
set_label_arr[global.set_len_var,8] = "button"; // Value 5
set_label_arr[global.set_len_var,9] = true; // Translate
set_label_arr[global.set_len_var,10] = "dpad"; // Value 6
set_label_arr[global.set_len_var,11] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = cam_const; // Player 1
set_default_arr[global.set_len_var,1] = cam_joy_r_const; // Player 2
set_default_arr[global.set_len_var,2] = cam_joy_r_const; // Player 3
set_default_arr[global.set_len_var,3] = cam_joy_r_const; // Player 4
set_default_arr[global.set_len_var,4] = cam_joy_r_const; // Player 5
set_default_arr[global.set_len_var,5] = cam_joy_r_const; // Player 6
set_default_arr[global.set_len_var,6] = cam_joy_r_const; // Player 7
set_default_arr[global.set_len_var,7] = cam_joy_r_const; // Player 8
global.set_len_var += 1;
// Movement Controls
set_arr[global.set_len_var,0] = "input_move"; // Variable name
set_arr[global.set_len_var,1] = "input_move"; // Name
set_arr[global.set_len_var,2] = "input_move"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 4; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 7; // Category (Control)
set_arr[global.set_len_var,9] = true; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "button"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "ljoy"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "dpad"; // Value 3
set_label_arr[global.set_len_var,5] = true; // Translate
set_label_arr[global.set_len_var,6] = "rjoy"; // Value 4
set_label_arr[global.set_len_var,7] = true; // Translate
set_label_arr[global.set_len_var,8] = "rjoys"; // Value 5
set_label_arr[global.set_len_var,9] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = move_const; // Player 1
set_default_arr[global.set_len_var,1] = move_joy_l_const; // Player 2
set_default_arr[global.set_len_var,2] = move_joy_l_const; // Player 3
set_default_arr[global.set_len_var,3] = move_joy_l_const; // Player 4
set_default_arr[global.set_len_var,4] = move_joy_l_const; // Player 5
set_default_arr[global.set_len_var,5] = move_joy_l_const; // Player 6
set_default_arr[global.set_len_var,6] = move_joy_l_const; // Player 7
set_default_arr[global.set_len_var,7] = move_joy_l_const; // Player 8
global.set_len_var += 1;
// Menu Controls
set_arr[global.set_len_var,0] = "input_menu"; // Variable name
set_arr[global.set_len_var,1] = "input_menu"; // Name
set_arr[global.set_len_var,2] = "input_menu"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 4; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 7; // Category (Control)
set_arr[global.set_len_var,9] = true; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "pc"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "dpad"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "ljoy"; // Value 3
set_label_arr[global.set_len_var,5] = true; // Translate
set_label_arr[global.set_len_var,6] = "rjoy"; // Value 4
set_label_arr[global.set_len_var,7] = true; // Translate
set_label_arr[global.set_len_var,8] = "rjoys"; // Value 5
set_label_arr[global.set_len_var,9] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = menu_const; // Player 1
set_default_arr[global.set_len_var,1] = menu_dpad_const; // Player 2
set_default_arr[global.set_len_var,2] = menu_dpad_const; // Player 3
set_default_arr[global.set_len_var,3] = menu_dpad_const; // Player 4
set_default_arr[global.set_len_var,4] = menu_dpad_const; // Player 5
set_default_arr[global.set_len_var,5] = menu_dpad_const; // Player 6
set_default_arr[global.set_len_var,6] = menu_dpad_const; // Player 7
set_default_arr[global.set_len_var,7] = menu_dpad_const; // Player 8
global.set_len_var += 1;
/*
------
Inputs
------
*/
// Menu Up
set_arr[global.set_len_var,0] = "up"; // Variable name
set_arr[global.set_len_var,1] = "up_input"; // Name
set_arr[global.set_len_var,2] = "up_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = up_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = up_key_const; // Player 1
set_default_arr[global.set_len_var,1] = up_button_const; // Player 2
set_default_arr[global.set_len_var,2] = up_button_const; // Player 3
set_default_arr[global.set_len_var,3] = up_button_const; // Player 4
set_default_arr[global.set_len_var,4] = up_button_const; // Player 5
set_default_arr[global.set_len_var,5] = up_button_const; // Player 6
set_default_arr[global.set_len_var,6] = up_button_const; // Player 7
set_default_arr[global.set_len_var,7] = up_button_const; // Player 8
global.set_len_var += 1;
// Menu Down
set_arr[global.set_len_var,0] = "down"; // Variable name
set_arr[global.set_len_var,1] = "down_input"; // Name
set_arr[global.set_len_var,2] = "down_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = down_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = down_key_const; // Player 1
set_default_arr[global.set_len_var,1] = down_button_const; // Player 2
set_default_arr[global.set_len_var,2] = down_button_const; // Player 3
set_default_arr[global.set_len_var,3] = down_button_const; // Player 4
set_default_arr[global.set_len_var,4] = down_button_const; // Player 5
set_default_arr[global.set_len_var,5] = down_button_const; // Player 6
set_default_arr[global.set_len_var,6] = down_button_const; // Player 7
set_default_arr[global.set_len_var,7] = down_button_const; // Player 8
global.set_len_var += 1;
// Menu Left
set_arr[global.set_len_var,0] = "left"; // Variable name
set_arr[global.set_len_var,1] = "left_input"; // Name
set_arr[global.set_len_var,2] = "left_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = left_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = left_key_const; // Player 1
set_default_arr[global.set_len_var,1] = left_button_const; // Player 2
set_default_arr[global.set_len_var,2] = left_button_const; // Player 3
set_default_arr[global.set_len_var,3] = left_button_const; // Player 4
set_default_arr[global.set_len_var,4] = left_button_const; // Player 5
set_default_arr[global.set_len_var,5] = left_button_const; // Player 6
set_default_arr[global.set_len_var,6] = left_button_const; // Player 7
set_default_arr[global.set_len_var,7] = left_button_const; // Player 8
global.set_len_var += 1;
// Menu Right
set_arr[global.set_len_var,0] = "right"; // Variable name
set_arr[global.set_len_var,1] = "right_input"; // Name
set_arr[global.set_len_var,2] = "right_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = right_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = right_key_const; // Player 1
set_default_arr[global.set_len_var,1] = right_button_const; // Player 2
set_default_arr[global.set_len_var,2] = right_button_const; // Player 3
set_default_arr[global.set_len_var,3] = right_button_const; // Player 4
set_default_arr[global.set_len_var,4] = right_button_const; // Player 5
set_default_arr[global.set_len_var,5] = right_button_const; // Player 6
set_default_arr[global.set_len_var,6] = right_button_const; // Player 7
set_default_arr[global.set_len_var,7] = right_button_const; // Player 8
global.set_len_var += 1;
// Confirm
set_arr[global.set_len_var,0] = "confirm"; // Variable name
set_arr[global.set_len_var,1] = "confirm_input"; // Name
set_arr[global.set_len_var,2] = "confirm_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = confirm_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = confirm_key_const; // Player 1
set_default_arr[global.set_len_var,1] = confirm_button_const; // Player 2
set_default_arr[global.set_len_var,2] = confirm_button_const; // Player 3
set_default_arr[global.set_len_var,3] = confirm_button_const; // Player 4
set_default_arr[global.set_len_var,4] = confirm_button_const; // Player 5
set_default_arr[global.set_len_var,5] = confirm_button_const; // Player 6
set_default_arr[global.set_len_var,6] = confirm_button_const; // Player 7
set_default_arr[global.set_len_var,7] = confirm_button_const; // Player 8
global.set_len_var += 1;
// Back
set_arr[global.set_len_var,0] = "back"; // Variable name
set_arr[global.set_len_var,1] = "back_input"; // Name
set_arr[global.set_len_var,2] = "back_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = back_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = back_key_const; // Player 1
set_default_arr[global.set_len_var,1] = back_button_const; // Player 2
set_default_arr[global.set_len_var,2] = back_button_const; // Player 3
set_default_arr[global.set_len_var,3] = back_button_const; // Player 4
set_default_arr[global.set_len_var,4] = back_button_const; // Player 5
set_default_arr[global.set_len_var,5] = back_button_const; // Player 6
set_default_arr[global.set_len_var,6] = back_button_const; // Player 7
set_default_arr[global.set_len_var,7] = back_button_const; // Player 8
global.set_len_var += 1;
// Forward
set_arr[global.set_len_var,0] = "forward"; // Variable name
set_arr[global.set_len_var,1] = "forward_input"; // Name
set_arr[global.set_len_var,2] = "forward_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = forward_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = forward_key_const; // Player 1
set_default_arr[global.set_len_var,1] = forward_button_const; // Player 2
set_default_arr[global.set_len_var,2] = forward_button_const; // Player 3
set_default_arr[global.set_len_var,3] = forward_button_const; // Player 4
set_default_arr[global.set_len_var,4] = forward_button_const; // Player 5
set_default_arr[global.set_len_var,5] = forward_button_const; // Player 6
set_default_arr[global.set_len_var,6] = forward_button_const; // Player 7
set_default_arr[global.set_len_var,7] = forward_button_const; // Player 8
global.set_len_var += 1;
// Backward
set_arr[global.set_len_var,0] = "backward"; // Variable name
set_arr[global.set_len_var,1] = "backward_input"; // Name
set_arr[global.set_len_var,2] = "backward_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = backward_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = backward_key_const; // Player 1
set_default_arr[global.set_len_var,1] = backward_button_const; // Player 2
set_default_arr[global.set_len_var,2] = backward_button_const; // Player 3
set_default_arr[global.set_len_var,3] = backward_button_const; // Player 4
set_default_arr[global.set_len_var,4] = backward_button_const; // Player 5
set_default_arr[global.set_len_var,5] = backward_button_const; // Player 6
set_default_arr[global.set_len_var,6] = backward_button_const; // Player 7
set_default_arr[global.set_len_var,7] = backward_button_const; // Player 8
global.set_len_var += 1;
// Strafe Left
set_arr[global.set_len_var,0] = "strafe_left"; // Variable name
set_arr[global.set_len_var,1] = "strafe_left_input"; // Name
set_arr[global.set_len_var,2] = "strafe_left_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = strafe_left_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = strafe_left_key_const; // Player 1
set_default_arr[global.set_len_var,1] = strafe_left_button_const; // Player 2
set_default_arr[global.set_len_var,2] = strafe_left_button_const; // Player 3
set_default_arr[global.set_len_var,3] = strafe_left_button_const; // Player 4
set_default_arr[global.set_len_var,4] = strafe_left_button_const; // Player 5
set_default_arr[global.set_len_var,5] = strafe_left_button_const; // Player 6
set_default_arr[global.set_len_var,6] = strafe_left_button_const; // Player 7
set_default_arr[global.set_len_var,7] = strafe_left_button_const; // Player 8
global.set_len_var += 1;
// Strafe Right
set_arr[global.set_len_var,0] = "strafe_right"; // Variable name
set_arr[global.set_len_var,1] = "strafe_right_input"; // Name
set_arr[global.set_len_var,2] = "strafe_right_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = strafe_right_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = strafe_right_key_const; // Player 1
set_default_arr[global.set_len_var,1] = strafe_right_button_const; // Player 2
set_default_arr[global.set_len_var,2] = strafe_right_button_const; // Player 3
set_default_arr[global.set_len_var,3] = strafe_right_button_const; // Player 4
set_default_arr[global.set_len_var,4] = strafe_right_button_const; // Player 5
set_default_arr[global.set_len_var,5] = strafe_right_button_const; // Player 6
set_default_arr[global.set_len_var,6] = strafe_right_button_const; // Player 7
set_default_arr[global.set_len_var,7] = strafe_right_button_const; // Player 8
global.set_len_var += 1;
// Interact
set_arr[global.set_len_var,0] = "interact"; // Variable name
set_arr[global.set_len_var,1] = "interact_input"; // Name
set_arr[global.set_len_var,2] = "interact_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = interact_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = interact_key_const; // Player 1
set_default_arr[global.set_len_var,1] = interact_button_const; // Player 2
set_default_arr[global.set_len_var,2] = interact_button_const; // Player 3
set_default_arr[global.set_len_var,3] = interact_button_const; // Player 4
set_default_arr[global.set_len_var,4] = interact_button_const; // Player 5
set_default_arr[global.set_len_var,5] = interact_button_const; // Player 6
set_default_arr[global.set_len_var,6] = interact_button_const; // Player 7
set_default_arr[global.set_len_var,7] = interact_button_const; // Player 8
global.set_len_var += 1;
// Sprint
set_arr[global.set_len_var,0] = "sprint"; // Variable name
set_arr[global.set_len_var,1] = "sprint_input"; // Name
set_arr[global.set_len_var,2] = "sprint_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = sprint_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = sprint_key_const; // Player 1
set_default_arr[global.set_len_var,1] = sprint_button_const; // Player 2
set_default_arr[global.set_len_var,2] = sprint_button_const; // Player 3
set_default_arr[global.set_len_var,3] = sprint_button_const; // Player 4
set_default_arr[global.set_len_var,4] = sprint_button_const; // Player 5
set_default_arr[global.set_len_var,5] = sprint_button_const; // Player 6
set_default_arr[global.set_len_var,6] = sprint_button_const; // Player 7
set_default_arr[global.set_len_var,7] = sprint_button_const; // Player 8
global.set_len_var += 1;
// Jump
set_arr[global.set_len_var,0] = "jump"; // Variable name
set_arr[global.set_len_var,1] = "jump_input"; // Name
set_arr[global.set_len_var,2] = "jump_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = jump_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = jump_key_const; // Player 1
set_default_arr[global.set_len_var,1] = jump_button_const; // Player 2
set_default_arr[global.set_len_var,2] = jump_button_const; // Player 3
set_default_arr[global.set_len_var,3] = jump_button_const; // Player 4
set_default_arr[global.set_len_var,4] = jump_button_const; // Player 5
set_default_arr[global.set_len_var,5] = jump_button_const; // Player 6
set_default_arr[global.set_len_var,6] = jump_button_const; // Player 7
set_default_arr[global.set_len_var,7] = jump_button_const; // Player 8
global.set_len_var += 1;
// Crouch
set_arr[global.set_len_var,0] = "crouch"; // Variable name
set_arr[global.set_len_var,1] = "crouch_input"; // Name
set_arr[global.set_len_var,2] = "crouch_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = crouch_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = crouch_key_const; // Player 1
set_default_arr[global.set_len_var,1] = crouch_button_const; // Player 2
set_default_arr[global.set_len_var,2] = crouch_button_const; // Player 3
set_default_arr[global.set_len_var,3] = crouch_button_const; // Player 4
set_default_arr[global.set_len_var,4] = crouch_button_const; // Player 5
set_default_arr[global.set_len_var,5] = crouch_button_const; // Player 6
set_default_arr[global.set_len_var,6] = crouch_button_const; // Player 7
set_default_arr[global.set_len_var,7] = crouch_button_const; // Player 8
global.set_len_var += 1;
// Attack
set_arr[global.set_len_var,0] = "attack"; // Variable name
set_arr[global.set_len_var,1] = "attack_input"; // Name
set_arr[global.set_len_var,2] = "attack_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = attack_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = attack_key_const; // Player 1
set_default_arr[global.set_len_var,1] = attack_button_const; // Player 2
set_default_arr[global.set_len_var,2] = attack_button_const; // Player 3
set_default_arr[global.set_len_var,3] = attack_button_const; // Player 4
set_default_arr[global.set_len_var,4] = attack_button_const; // Player 5
set_default_arr[global.set_len_var,5] = attack_button_const; // Player 6
set_default_arr[global.set_len_var,6] = attack_button_const; // Player 7
set_default_arr[global.set_len_var,7] = attack_button_const; // Player 8
global.set_len_var += 1;
// Pause
set_arr[global.set_len_var,0] = "pause"; // Variable name
set_arr[global.set_len_var,1] = "pause_input"; // Name
set_arr[global.set_len_var,2] = "pause_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = pause_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = pause_key_const; // Player 1
set_default_arr[global.set_len_var,1] = pause_button_const; // Player 2
set_default_arr[global.set_len_var,2] = pause_button_const; // Player 3
set_default_arr[global.set_len_var,3] = pause_button_const; // Player 4
set_default_arr[global.set_len_var,4] = pause_button_const; // Player 5
set_default_arr[global.set_len_var,5] = pause_button_const; // Player 6
set_default_arr[global.set_len_var,6] = pause_button_const; // Player 7
set_default_arr[global.set_len_var,7] = pause_button_const; // Player 8
global.set_len_var += 1;
// Debug
set_arr[global.set_len_var,0] = "debug"; // Variable name
set_arr[global.set_len_var,1] = "debug_input"; // Name
set_arr[global.set_len_var,2] = "debug_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = debug_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = debug_key_const; // Player 1
set_default_arr[global.set_len_var,1] = debug_button_const; // Player 2
set_default_arr[global.set_len_var,2] = debug_button_const; // Player 3
set_default_arr[global.set_len_var,3] = debug_button_const; // Player 4
set_default_arr[global.set_len_var,4] = debug_button_const; // Player 5
set_default_arr[global.set_len_var,5] = debug_button_const; // Player 6
set_default_arr[global.set_len_var,6] = debug_button_const; // Player 7
set_default_arr[global.set_len_var,7] = debug_button_const; // Player 8
global.set_len_var += 1;
// Turnaround
set_arr[global.set_len_var,0] = "turnaround"; // Variable name
set_arr[global.set_len_var,1] = "turnaround_input"; // Name
set_arr[global.set_len_var,2] = "turnaround_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = turnaround_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = turnaround_key_const; // Player 1
set_default_arr[global.set_len_var,1] = turnaround_button_const; // Player 2
set_default_arr[global.set_len_var,2] = turnaround_button_const; // Player 3
set_default_arr[global.set_len_var,3] = turnaround_button_const; // Player 4
set_default_arr[global.set_len_var,4] = turnaround_button_const; // Player 5
set_default_arr[global.set_len_var,5] = turnaround_button_const; // Player 6
set_default_arr[global.set_len_var,6] = turnaround_button_const; // Player 7
set_default_arr[global.set_len_var,7] = turnaround_button_const; // Player 8
global.set_len_var += 1;
// Fast Forward
set_arr[global.set_len_var,0] = "ff"; // Variable name
set_arr[global.set_len_var,1] = "ff_input"; // Name
set_arr[global.set_len_var,2] = "ff_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = ff_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = ff_key_const; // Player 1
set_default_arr[global.set_len_var,1] = ff_button_const; // Player 2
set_default_arr[global.set_len_var,2] = ff_button_const; // Player 3
set_default_arr[global.set_len_var,3] = ff_button_const; // Player 4
set_default_arr[global.set_len_var,4] = ff_button_const; // Player 5
set_default_arr[global.set_len_var,5] = ff_button_const; // Player 6
set_default_arr[global.set_len_var,6] = ff_button_const; // Player 7
set_default_arr[global.set_len_var,7] = ff_button_const; // Player 8
global.set_len_var += 1;
// Slow
set_arr[global.set_len_var,0] = "slow"; // Variable name
set_arr[global.set_len_var,1] = "slow_input"; // Name
set_arr[global.set_len_var,2] = "slow_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = slow_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = slow_key_const; // Player 1
set_default_arr[global.set_len_var,1] = slow_button_const; // Player 2
set_default_arr[global.set_len_var,2] = slow_button_const; // Player 3
set_default_arr[global.set_len_var,3] = slow_button_const; // Player 4
set_default_arr[global.set_len_var,4] = slow_button_const; // Player 5
set_default_arr[global.set_len_var,5] = slow_button_const; // Player 6
set_default_arr[global.set_len_var,6] = slow_button_const; // Player 7
set_default_arr[global.set_len_var,7] = slow_button_const; // Player 8
global.set_len_var += 1;
// Camera Up
set_arr[global.set_len_var,0] = "cam_up"; // Variable name
set_arr[global.set_len_var,1] = "cam_up_input"; // Name
set_arr[global.set_len_var,2] = "cam_up_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = cam_up_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = cam_up_key_const; // Player 1
set_default_arr[global.set_len_var,1] = cam_up_button_const; // Player 2
set_default_arr[global.set_len_var,2] = cam_up_button_const; // Player 3
set_default_arr[global.set_len_var,3] = cam_up_button_const; // Player 4
set_default_arr[global.set_len_var,4] = cam_up_button_const; // Player 5
set_default_arr[global.set_len_var,5] = cam_up_button_const; // Player 6
set_default_arr[global.set_len_var,6] = cam_up_button_const; // Player 7
set_default_arr[global.set_len_var,7] = cam_up_button_const; // Player 8
global.set_len_var += 1;
// Camera Down
set_arr[global.set_len_var,0] = "cam_down"; // Variable name
set_arr[global.set_len_var,1] = "cam_down_input"; // Name
set_arr[global.set_len_var,2] = "cam_down_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = cam_down_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = cam_down_key_const; // Player 1
set_default_arr[global.set_len_var,1] = cam_down_button_const; // Player 2
set_default_arr[global.set_len_var,2] = cam_down_button_const; // Player 3
set_default_arr[global.set_len_var,3] = cam_down_button_const; // Player 4
set_default_arr[global.set_len_var,4] = cam_down_button_const; // Player 5
set_default_arr[global.set_len_var,5] = cam_down_button_const; // Player 6
set_default_arr[global.set_len_var,6] = cam_down_button_const; // Player 7
set_default_arr[global.set_len_var,7] = cam_down_button_const; // Player 8
global.set_len_var += 1;
// Camera Left
set_arr[global.set_len_var,0] = "cam_left"; // Variable name
set_arr[global.set_len_var,1] = "cam_left_input"; // Name
set_arr[global.set_len_var,2] = "cam_left_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = cam_left_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = cam_left_key_const; // Player 1
set_default_arr[global.set_len_var,1] = cam_left_button_const; // Player 2
set_default_arr[global.set_len_var,2] = cam_left_button_const; // Player 3
set_default_arr[global.set_len_var,3] = cam_left_button_const; // Player 4
set_default_arr[global.set_len_var,4] = cam_left_button_const; // Player 5
set_default_arr[global.set_len_var,5] = cam_left_button_const; // Player 6
set_default_arr[global.set_len_var,6] = cam_left_button_const; // Player 7
set_default_arr[global.set_len_var,7] = cam_left_button_const; // Player 8
global.set_len_var += 1;
// Camera Right
set_arr[global.set_len_var,0] = "cam_right"; // Variable name
set_arr[global.set_len_var,1] = "cam_right_input"; // Name
set_arr[global.set_len_var,2] = "cam_right_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = cam_right_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = cam_right_key_const; // Player 1
set_default_arr[global.set_len_var,1] = cam_right_button_const; // Player 2
set_default_arr[global.set_len_var,2] = cam_right_button_const; // Player 3
set_default_arr[global.set_len_var,3] = cam_right_button_const; // Player 4
set_default_arr[global.set_len_var,4] = cam_right_button_const; // Player 5
set_default_arr[global.set_len_var,5] = cam_right_button_const; // Player 6
set_default_arr[global.set_len_var,6] = cam_right_button_const; // Player 7
set_default_arr[global.set_len_var,7] = cam_right_button_const; // Player 8
global.set_len_var += 1;
// Fullscreen
set_arr[global.set_len_var,0] = "fullscreen"; // Variable name
set_arr[global.set_len_var,1] = "fullscreen_input"; // Name
set_arr[global.set_len_var,2] = "fullscreen_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = fullscreen_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = fullscreen_key_const; // Player 1
set_default_arr[global.set_len_var,1] = fullscreen_button_const; // Player 2
set_default_arr[global.set_len_var,2] = fullscreen_button_const; // Player 3
set_default_arr[global.set_len_var,3] = fullscreen_button_const; // Player 4
set_default_arr[global.set_len_var,4] = fullscreen_button_const; // Player 5
set_default_arr[global.set_len_var,5] = fullscreen_button_const; // Player 6
set_default_arr[global.set_len_var,6] = fullscreen_button_const; // Player 7
set_default_arr[global.set_len_var,7] = fullscreen_button_const; // Player 8
global.set_len_var += 1;
// Screenshot
set_arr[global.set_len_var,0] = "screenshot"; // Variable name
set_arr[global.set_len_var,1] = "screenshot_input"; // Name
set_arr[global.set_len_var,2] = "screenshot_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 7; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 8; // Category (Input)
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = screenshot_input_const; // ID (Input Only)
    // Default
set_default_arr[global.set_len_var,0] = screenshot_key_const; // Player 1
set_default_arr[global.set_len_var,1] = screenshot_button_const; // Player 2
set_default_arr[global.set_len_var,2] = screenshot_button_const; // Player 3
set_default_arr[global.set_len_var,3] = screenshot_button_const; // Player 4
set_default_arr[global.set_len_var,4] = screenshot_button_const; // Player 5
set_default_arr[global.set_len_var,5] = screenshot_button_const; // Player 6
set_default_arr[global.set_len_var,6] = screenshot_button_const; // Player 7
set_default_arr[global.set_len_var,7] = screenshot_button_const; // Player 8
global.set_len_var += 1;
/*
--------
Controls
--------
*/
// Control Category
set_arr[global.set_len_var,0] = "control"; // Variable name
set_arr[global.set_len_var,1] = "control"; // Name
set_arr[global.set_len_var,2] = "control"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 8; // Type (Category)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 9; // Category (Controls)
set_arr[global.set_len_var,9] = false; // Player Specific
set_arr[global.set_len_var,10] = 7; // ID (category)
    // Default
set_default_arr[global.set_len_var,0] = 0; // Default
global.set_len_var += 1;
// Input Category
set_arr[global.set_len_var,0] = "input"; // Variable name
set_arr[global.set_len_var,1] = "input"; // Name
set_arr[global.set_len_var,2] = "input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 8; // Type (Category)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = 9; // Category (Controls)
set_arr[global.set_len_var,9] = false; // Player Specific
set_arr[global.set_len_var,10] = 8; // ID (category)
    // Default
set_default_arr[global.set_len_var,0] = 0; // Default
global.set_len_var += 1;
/*
----
Fun!
----
*/
// Pride
set_arr[global.set_len_var,0] = "pride"; // Variable name
set_arr[global.set_len_var,1] = "pride"; // Name
set_arr[global.set_len_var,2] = "pride"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 2; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 10; // Category (fun)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
set_label_arr[global.set_len_var,4] = "trans"; // Value 3
set_label_arr[global.set_len_var,5] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = false; // Default
global.set_len_var += 1;
// Halloween
set_arr[global.set_len_var,0] = "halloween"; // Variable name
set_arr[global.set_len_var,1] = "halloween"; // Name
set_arr[global.set_len_var,2] = "halloween"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 10; // Category (fun)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = false; // Default
global.set_len_var += 1;
// Christmas
set_arr[global.set_len_var,0] = "christmas"; // Variable name
set_arr[global.set_len_var,1] = "christmas"; // Name
set_arr[global.set_len_var,2] = "christmas"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 10; // Category (fun)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = false; // Default
global.set_len_var += 1;
// Easter
set_arr[global.set_len_var,0] = "easter"; // Variable name
set_arr[global.set_len_var,1] = "easter"; // Name
set_arr[global.set_len_var,2] = "easter"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = 0; // Type (Enum)
set_arr[global.set_len_var,5] = false; // Min
set_arr[global.set_len_var,6] = true; // Max
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = 10; // Category (fun)
set_arr[global.set_len_var,9] = false; // Player Specific
    // Label
set_label_arr[global.set_len_var,0] = "off"; // Value 1
set_label_arr[global.set_len_var,1] = true; // Translate
set_label_arr[global.set_len_var,2] = "on"; // Value 2
set_label_arr[global.set_len_var,3] = true; // Translate
    // Default
set_default_arr[global.set_len_var,0] = false; // Default
global.set_len_var += 1;
// Draw (hope this works)
draw_load_scr("Loaded settings!");