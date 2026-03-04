/*
--------------------
Customize menu stuff

This massive array can be confusing, but is very versatile.
Number and string types will simply display their value, while enums display an array of labels.
Names, descriptions, and labels can all be translated, but you can also change them manually.abs

Type
    0 - Enum
    1 - Number
    2 - Clamped Number
    3 - Max Clamped Number
    4 - Min Clamped Number
    5 - String
    6 - Monster list
        Functionally identical to an enum, but is initialized entirely differently

Default
    Uses specific functions
    Dimensions
        0 - Setting
        1 - Difficulty
        2 - Mode
        3 - Behavior
    Default is -1

--------------------
*/
draw_load_scr("Loading config...");
// Difficulties
globalvar diff_arr;
global.diff_len_var = 6;
global.diff_default_var = 2;
diff_arr[0,0] = "easiest"; // Name
diff_arr[0,1] = "easiest"; // Description
diff_arr[0,2] = true; // Translate
diff_arr[0,3] = false; // Custom Only
diff_arr[0,4] = global.diff_default_var;
diff_arr[1,0] = "easy";
diff_arr[1,1] = "easy";
diff_arr[1,2] = true;
diff_arr[1,3] = false;
diff_arr[1,4] = global.diff_default_var;
diff_arr[2,0] = "normal";
diff_arr[2,1] = "normal";
diff_arr[2,2] = true;
diff_arr[2,3] = false;
diff_arr[2,4] = global.diff_default_var;
diff_arr[3,0] = "hard";
diff_arr[3,1] = "hard";
diff_arr[3,2] = true;
diff_arr[3,3] = false;
diff_arr[3,4] = global.diff_default_var;
diff_arr[4,0] = "hardest";
diff_arr[4,1] = "hardest";
diff_arr[4,2] = true;
diff_arr[4,3] = false;
diff_arr[4,4] = global.diff_default_var;
diff_arr[5,0] = "evil";
diff_arr[5,1] = "evil";
diff_arr[5,2] = true;
diff_arr[5,3] = true;
diff_arr[5,4] = 4;
// Modes
globalvar mode_arr;
global.mode_len_var = 3;
global.mode_default_var = 1;
mode_arr[0,0] = "story"; // Name
mode_arr[0,1] = "story"; // Description
mode_arr[0,2] = true; // Translate
mode_arr[0,3] = false; // Custom Only
mode_arr[0,4] = global.mode_default_var; // Defaults to
mode_arr[1,0] = "endless";
mode_arr[1,1] = "endless";
mode_arr[1,2] = true;
mode_arr[1,3] = false;
mode_arr[1,4] = global.mode_default_var;
mode_arr[2,0] = "sandbox";
mode_arr[2,1] = "sandbox";
mode_arr[2,2] = true;
mode_arr[2,3] = true;
mode_arr[2,4] = 1;
// Behavior
globalvar type_arr;
global.type_len_var = 3;
global.type_default_var = 0;
type_arr[0,0] = "recode"; // Name
type_arr[0,1] = "recode"; // Description
type_arr[0,2] = true; // Translate
type_arr[0,3] = false; // Custom Only
type_arr[0,4] = global.type_default_var; // Defaults to
type_arr[1,0] = "og";
type_arr[1,1] = "og";
type_arr[1,2] = true;
type_arr[1,3] = false;
type_arr[1,4] = global.type_default_var;
type_arr[2,0] = "hd";
type_arr[2,1] = "hd";
type_arr[2,2] = true;
type_arr[2,3] = false;
type_arr[2,4] = global.type_default_var;
// Setup
globalvar custom_arr
globalvar custom_name_arr;
globalvar custom_label_arr;
globalvar custom_desc_arr;
globalvar custom_type_arr;
globalvar custom_clamp_arr;
global.custom_len_var = 0;
global.diff_len_var = 6;
global.mode_len_var = 3;
global.behavior_len_var = 3;
// Default array
arr_create_scr("custom_default",4,0,global.diff_len_var+1,global.mode_len_var+1,global.behavior_len_var+1);
    // Jump
// Name
custom_arr[global.custom_len_var,0] = "jump"; // Variable name
custom_arr[global.custom_len_var,1] = "jump"; // Name
custom_arr[global.custom_len_var,2] = "jump"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "off"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "on"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(true,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(false,global.custom_len_var,-1,-1,1); // OG
custom_arr_set_scr(false,global.custom_len_var,-1,-1,2); // HD
global.custom_len_var += 1;
    // Crouch
// Name
custom_arr[global.custom_len_var,0] = "crouch"; // Variable name
custom_arr[global.custom_len_var,1] = "crouch"; // Name
custom_arr[global.custom_len_var,2] = "crouch"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "off"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "on"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(true,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(false,global.custom_len_var,-1,-1,1); // OG
custom_arr_set_scr(false,global.custom_len_var,-1,-1,2); // HD
global.custom_len_var += 1;
    // Stamina Persist
// Name
custom_arr[global.custom_len_var,0] = "stam_per"; // Variable name
custom_arr[global.custom_len_var,1] = "stam_per"; // Name
custom_arr[global.custom_len_var,2] = "stam_per"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "off"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "on"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(false,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(true,global.custom_len_var,3,-1,-1); // Hard
custom_arr_set_scr(true,global.custom_len_var,4,-1,-1); // Hardest
custom_arr_set_scr(true,global.custom_len_var,5,-1,-1); // :)
custom_arr_set_scr(false,global.custom_len_var,-1,-1,1); // OG
custom_arr_set_scr(false,global.custom_len_var,-1,-1,2); // HD
global.custom_len_var += 1;
    // Fall
// Name
custom_arr[global.custom_len_var,0] = "fall"; // Variable name
custom_arr[global.custom_len_var,1] = "fall"; // Name
custom_arr[global.custom_len_var,2] = "fall"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "off"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "on"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(false,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(true,global.custom_len_var,5,-1,-1); // :)
custom_arr_set_scr(false,global.custom_len_var,-1,-1,1); // OG
custom_arr_set_scr(false,global.custom_len_var,-1,-1,2); // HD
global.custom_len_var += 1;
    // Lock
// Name
custom_arr[global.custom_len_var,0] = "lock"; // Variable name
custom_arr[global.custom_len_var,1] = "lock"; // Name
custom_arr[global.custom_len_var,2] = "lock"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "off"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "alone"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
custom_label_arr[global.custom_len_var,4] = "on"; // Value 3
custom_label_arr[global.custom_len_var,5] = true; // Translate
custom_label_arr[global.custom_len_var,6] = "evil"; // Value 4
custom_label_arr[global.custom_len_var,7] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 3; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(2,global.custom_len_var,-1,-1,-1); // Default (Gold)
custom_arr_set_scr(0,global.custom_len_var,0,-1,-1); // Easiest (Never)
custom_arr_set_scr(1,global.custom_len_var,1,-1,-1); // Easy (Alone)
custom_arr_set_scr(3,global.custom_len_var,5,-1,-1); // :) (Evil)
custom_arr_set_scr(3,global.custom_len_var,-1,-1,1); // OG (Evil)
custom_arr_set_scr(3,global.custom_len_var,-1,-1,2); // HD (Evil)
global.custom_len_var += 1;
    // Damage Shake
// Name
custom_arr[global.custom_len_var,0] = "dmg_shake"; // Variable name
custom_arr[global.custom_len_var,1] = "dmg_shake"; // Name
custom_arr[global.custom_len_var,2] = "dmg_shake"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "off"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "on"; // Value 3
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(false,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(true,global.custom_len_var,4,-1,-1); // Hardest
custom_arr_set_scr(true,global.custom_len_var,5,-1,-1); // :)
custom_arr_set_scr(true,global.custom_len_var,-1,-1,1); // OG
custom_arr_set_scr(false,global.custom_len_var,-1,-1,1); // HD
global.custom_len_var += 1;
    // Permadeath
// Name
custom_arr[global.custom_len_var,0] = "permadeath"; // Variable name
custom_arr[global.custom_len_var,1] = "permadeath"; // Name
custom_arr[global.custom_len_var,2] = "permadeath"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "off"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "on"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(false,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(true,global.custom_len_var,5,-1,-1); // :)
custom_arr_set_scr(true,global.custom_len_var,-1,1,-1); // Endless
global.custom_len_var += 1;
    // Locales
// Name
custom_arr[global.custom_len_var,0] = "locale"; // Variable name
custom_arr[global.custom_len_var,1] = "locale"; // Name
custom_arr[global.custom_len_var,2] = "locale"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "off"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "on"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(true,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(false,global.custom_len_var,5,-1,-1); // :)
custom_arr_set_scr(false,global.custom_len_var,-1,1,1); // OG Endless
global.custom_len_var += 1;
    // Dupe
// Name
custom_arr[global.custom_len_var,0] = "dupe"; // Variable name
custom_arr[global.custom_len_var,1] = "dupe"; // Name
custom_arr[global.custom_len_var,2] = "dupe"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "always"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "canon"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
custom_label_arr[global.custom_len_var,4] = "never"; // Value 3
custom_label_arr[global.custom_len_var,5] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 2; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(dupe_canon_const,global.custom_len_var,-1,-1,-1); // Default (Canon)
custom_arr_set_scr(dupe_never_const,global.custom_len_var,0,-1,-1); // Easiest (Never)
custom_arr_set_scr(dupe_always_const,global.custom_len_var,4,-1,-1); // Hardest (Always)
custom_arr_set_scr(dupe_always_const,global.custom_len_var,5,-1,-1); // :) (Always)
custom_arr_set_scr(dupe_always_const,global.custom_len_var,-1,-1,1); // OG (Always)
custom_arr_set_scr(dupe_always_const,global.custom_len_var,-1,-1,2); // HD (Always)
global.custom_len_var += 1;
    // Multichase Type
// Name
custom_arr[global.custom_len_var,0] = "mult_type"; // Variable name
custom_arr[global.custom_len_var,1] = "mult_type"; // Name
custom_arr[global.custom_len_var,2] = "mult_type"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "max"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "min"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
custom_label_arr[global.custom_len_var,4] = "taper"; // Value 3
custom_label_arr[global.custom_len_var,5] = true; // Translate
custom_label_arr[global.custom_len_var,6] = "always"; // Value 4
custom_label_arr[global.custom_len_var,7] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 3; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(0,global.custom_len_var,-1,-1,-1); // Default (Max)
custom_arr_set_scr(1,global.custom_len_var,0,-1,-1); // Easiest (Min)
custom_arr_set_scr(1,global.custom_len_var,1,-1,-1); // Easy (Min)
custom_arr_set_scr(3,global.custom_len_var,4,-1,-1); // Hardest (Always)
custom_arr_set_scr(3,global.custom_len_var,5,-1,-1); // :) (Always)
custom_arr_set_scr(1,global.custom_len_var,-1,-1,1); // OG (Min)
custom_arr_set_scr(0,global.custom_len_var,-1,-1,2); // HD (Max)
global.custom_len_var += 1;
    // Multichase Min
// Name
custom_arr[global.custom_len_var,0] = "mult_min"; // Variable name
custom_arr[global.custom_len_var,1] = "mult_min"; // Name
custom_arr[global.custom_len_var,2] = "mult_min"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = -1; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(1,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Multichase Max
// Name
custom_arr[global.custom_len_var,0] = "mult_max"; // Variable name
custom_arr[global.custom_len_var,1] = "mult_max"; // Name
custom_arr[global.custom_len_var,2] = "mult_max"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = -1; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(5,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Multichase Start
// Name
custom_arr[global.custom_len_var,0] = "mult_start"; // Variable name
custom_arr[global.custom_len_var,1] = "mult_start"; // Name
custom_arr[global.custom_len_var,2] = "mult_start"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(0,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Multichase End
// Name
custom_arr[global.custom_len_var,0] = "mult_end"; // Variable name
custom_arr[global.custom_len_var,1] = "mult_end"; // Name
custom_arr[global.custom_len_var,2] = "mult_end"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(1000,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Count Type
// Name
custom_arr[global.custom_len_var,0] = "count_type"; // Variable name
custom_arr[global.custom_len_var,1] = "count_type"; // Name
custom_arr[global.custom_len_var,2] = "count_type"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "rand"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "max"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
custom_label_arr[global.custom_len_var,4] = "min"; // Value 3
custom_label_arr[global.custom_len_var,5] = true; // Translate
custom_label_arr[global.custom_len_var,6] = "taper"; // Value 4
custom_label_arr[global.custom_len_var,7] = true; // Translate
custom_label_arr[global.custom_len_var,8] = "taper_rand"; // Value 5
custom_label_arr[global.custom_len_var,9] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 4; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(0,global.custom_len_var,-1,-1,-1); // Default (Random)
custom_arr_set_scr(1,global.custom_len_var,0,-1,-1); // Easiest (Max)
custom_arr_set_scr(1,global.custom_len_var,1,-1,-1); // Easy (Max)
custom_arr_set_scr(2,global.custom_len_var,3,-1,-1); // Hard (Min)
custom_arr_set_scr(2,global.custom_len_var,4,-1,-1); // Hardest (Min)
custom_arr_set_scr(2,global.custom_len_var,5,-1,-1); // :) (Min)
custom_arr_set_scr(1,global.custom_len_var,-1,-1,1); // OG (Max)
custom_arr_set_scr(2,global.custom_len_var,-1,-1,2); // HD (Min)
global.custom_len_var += 1;
    // Count Min
// Name
custom_arr[global.custom_len_var,0] = "count_min"; // Variable name
custom_arr[global.custom_len_var,1] = "count_min"; // Name
custom_arr[global.custom_len_var,2] = "count_min"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(0,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Count Max
// Name
custom_arr[global.custom_len_var,0] = "count_max"; // Variable name
custom_arr[global.custom_len_var,1] = "count_max"; // Name
custom_arr[global.custom_len_var,2] = "count_max"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(20,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Count Start
// Name
custom_arr[global.custom_len_var,0] = "count_start"; // Variable name
custom_arr[global.custom_len_var,1] = "count_start"; // Name
custom_arr[global.custom_len_var,2] = "count_start"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(0,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Count End
// Name
custom_arr[global.custom_len_var,0] = "count_end"; // Variable name
custom_arr[global.custom_len_var,1] = "count_end"; // Name
custom_arr[global.custom_len_var,2] = "count_end"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(1000,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Monster Chance
// Name
custom_arr[global.custom_len_var,0] = "mon_chance"; // Variable name
custom_arr[global.custom_len_var,1] = "mon_chance"; // Name
custom_arr[global.custom_len_var,2] = "mon_chance"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = -1; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(mon_chance_const,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Monster Chance Multiplayer
// Name
custom_arr[global.custom_len_var,0] = "mon_chance_mult"; // Variable name
custom_arr[global.custom_len_var,1] = "mon_chance_mult"; // Name
custom_arr[global.custom_len_var,2] = "mon_chance_mult"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = -1; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(mon_chance_mult_const,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Jumpscare Chance
// Name
custom_arr[global.custom_len_var,0] = "js_chance"; // Variable name
custom_arr[global.custom_len_var,1] = "js_chance"; // Name
custom_arr[global.custom_len_var,2] = "js_chance"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = -1; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(js_chance_const,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Elevator Type
// Name
custom_arr[global.custom_len_var,0] = "ele_type"; // Variable name
custom_arr[global.custom_len_var,1] = "ele_type"; // Name
custom_arr[global.custom_len_var,2] = "ele_type"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type (Enum)
// Label
custom_label_arr[global.custom_len_var,0] = "1"; // Value 1
custom_label_arr[global.custom_len_var,1] = false; // Translate
custom_label_arr[global.custom_len_var,2] = "2"; // Value 2
custom_label_arr[global.custom_len_var,3] = false; // Translate
custom_label_arr[global.custom_len_var,4] = "3"; // Value 3
custom_label_arr[global.custom_len_var,5] = false; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 2; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(ele_type_const,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(2,global.custom_len_var,-1,-1,1); // OG
custom_arr_set_scr(1,global.custom_len_var,-1,0,2); // HD Story
custom_arr_set_scr(0,global.custom_len_var,-1,1,2); // HD Endless
global.custom_len_var += 1;
    // Elevator End 1
// Name
custom_arr[global.custom_len_var,0] = "ele_end_01"; // Variable name
custom_arr[global.custom_len_var,1] = "ele_end_01"; // Name
custom_arr[global.custom_len_var,2] = "ele_end_01"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(ele_end_01_const,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Elevator End 2
// Name
custom_arr[global.custom_len_var,0] = "ele_end_02"; // Variable name
custom_arr[global.custom_len_var,1] = "ele_end_02"; // Name
custom_arr[global.custom_len_var,2] = "ele_end_02"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(ele_end_02_const,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Elevator Rate 1
// Name
custom_arr[global.custom_len_var,0] = "ele_rate_01"; // Variable name
custom_arr[global.custom_len_var,1] = "ele_rate_01"; // Name
custom_arr[global.custom_len_var,2] = "ele_rate_01"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(ele_rate_01_const,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(100,global.custom_len_var,-1,1,2); // HD Endless
global.custom_len_var += 1;
    // Elevator Rate 2
// Name
custom_arr[global.custom_len_var,0] = "ele_rate_02"; // Variable name
custom_arr[global.custom_len_var,1] = "ele_rate_02"; // Name
custom_arr[global.custom_len_var,2] = "ele_rate_02"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(ele_rate_02_const,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Elevator Rate 3
// Name
custom_arr[global.custom_len_var,0] = "ele_rate_03"; // Variable name
custom_arr[global.custom_len_var,1] = "ele_rate_03"; // Name
custom_arr[global.custom_len_var,2] = "ele_rate_03"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(ele_rate_03_const,global.custom_len_var,-1,-1,-1); // Default
global.custom_len_var += 1;
    // Rare Chance
// Name
custom_arr[global.custom_len_var,0] = "rare_chance"; // Variable name
custom_arr[global.custom_len_var,1] = "rare_chance"; // Name
custom_arr[global.custom_len_var,2] = "rare_chance"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 4; // Type (Min Clamped)
// Clamp
custom_clamp_arr[global.custom_len_var,0] = -1; // Min
custom_clamp_arr[global.custom_len_var,1] = -1; // Max
custom_clamp_arr[global.custom_len_var,2] = false; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(rare_chance_const,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(16,global.custom_len_var,-1,1,-1); // Endless
custom_arr_set_scr(16,global.custom_len_var,-1,2,-1); // Sandbox
custom_arr_set_scr(0,global.custom_len_var,-1,1,1); // OG Endless
custom_arr_set_scr(8,global.custom_len_var,-1,1,2); // HD Endless
global.custom_len_var += 1;
    // Specimen List
// Name
custom_arr[global.custom_len_var,0] = "spec_list"; // Variable name
custom_arr[global.custom_len_var,1] = "spec_list"; // Name
custom_arr[global.custom_len_var,2] = "spec_list"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 6; // Type (Monster list)
custom_arr[global.custom_len_var,5] = 1; // Special (Array index)
// Label
custom_label_arr[global.custom_len_var,0] = "none"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "all"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
custom_label_arr[global.custom_len_var,4] = "story"; // Value 3
custom_label_arr[global.custom_len_var,5] = true; // Translate
custom_label_arr[global.custom_len_var,6] = "old"; // Value 4
custom_label_arr[global.custom_len_var,7] = true; // Translate
custom_label_arr[global.custom_len_var,8] = "no_ringu"; // Value 5
custom_label_arr[global.custom_len_var,9] = true; // Translate
custom_label_arr[global.custom_len_var,10] = "og"; // Value 6
custom_label_arr[global.custom_len_var,11] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 5; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(1,global.custom_len_var,-1,-1,-1); // Default (All)
custom_arr_set_scr(2,global.custom_len_var,-1,0,-1); // Story
custom_arr_set_scr(5,global.custom_len_var,-1,1,1); // OG Endless
custom_arr_set_scr(2,global.custom_len_var,-1,1,2); // HD Endless
global.custom_len_var += 1;
    // Monster List / KH
// Name
custom_arr[global.custom_len_var,0] = "mon_list"; // Variable name
custom_arr[global.custom_len_var,1] = "mon_list"; // Name
custom_arr[global.custom_len_var,2] = "mon_list"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 6; // Type (Monster list)
custom_arr[global.custom_len_var,5] = 2; // Special (Array index)
// Label
custom_label_arr[global.custom_len_var,0] = "none"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "all"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
custom_label_arr[global.custom_len_var,4] = "og"; // Value 3
custom_label_arr[global.custom_len_var,5] = true; // Translate
custom_label_arr[global.custom_len_var,6] = "hd"; // Value 4
custom_label_arr[global.custom_len_var,7] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Max
if file_exists(working_directory+"\Karamari_Hospital\KH.exe") { custom_clamp_arr[global.custom_len_var,1] = 3; }
else { custom_clamp_arr[global.custom_len_var,1] = 1; }
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(1,global.custom_len_var,-1,-1,-1); // Default (All)
custom_arr_set_scr(0,global.custom_len_var,-1,0,-1); // Story (None)
custom_arr_set_scr(2,global.custom_len_var,-1,-1,1); // OG
custom_arr_set_scr(3,global.custom_len_var,-1,-1,2); // HD
global.custom_len_var += 1;
    // Doll List
if file_exists(working_directory+"\The_Doll_House\SDH.exe")
{
    // Name
    custom_arr[global.custom_len_var,0] = "doll_list"; // Variable name
    custom_arr[global.custom_len_var,1] = "doll_list"; // Name
    custom_arr[global.custom_len_var,2] = "doll_list"; // Description
    custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
    custom_arr[global.custom_len_var,4] = 6; // Type (Monster list)
    custom_arr[global.custom_len_var,5] = 3; // Special (Array index)
    // Label
    custom_label_arr[global.custom_len_var,0] = "none"; // Value 1
    custom_label_arr[global.custom_len_var,1] = true; // Translate
    custom_label_arr[global.custom_len_var,2] = "all"; // Value 2
    custom_label_arr[global.custom_len_var,3] = true; // Translate
    custom_label_arr[global.custom_len_var,4] = "hd"; // Value 4
    custom_label_arr[global.custom_len_var,5] = true; // Translate
    // Clamp
    custom_clamp_arr[global.custom_len_var,0] = 0; // Min
    custom_clamp_arr[global.custom_len_var,1] = 2; // Max
    custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
    // Defaults
    custom_arr_add_len_scr(0,1);
    custom_arr_set_scr(1,global.custom_len_var,-1,-1,-1); // Default (All)
    custom_arr_set_scr(0,global.custom_len_var,-1,0,-1); // Story (None)
    custom_arr_set_scr(0,global.custom_len_var,-1,-1,1); // OG (None)
    custom_arr_set_scr(2,global.custom_len_var,-1,-1,2); // HD
    global.custom_len_var += 1;
}
    // Endless Specimen List
// Name
custom_arr[global.custom_len_var,0] = "endless_list"; // Variable name
custom_arr[global.custom_len_var,1] = "endless_list"; // Name
custom_arr[global.custom_len_var,2] = "endless_list"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 6; // Type (Monster list)
custom_arr[global.custom_len_var,5] = 4; // Special (Array index)
// Label
custom_label_arr[global.custom_len_var,0] = "none"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "all"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(1,global.custom_len_var,-1,-1,-1); // Default (All)
custom_arr_set_scr(0,global.custom_len_var,-1,0,-1); // Story (None)
global.custom_len_var += 1;
    // Unknown Specimen List
// Name
custom_arr[global.custom_len_var,0] = "unknown_list"; // Variable name
custom_arr[global.custom_len_var,1] = "unknown_list"; // Name
custom_arr[global.custom_len_var,2] = "unknown_list"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 6; // Type (Monster list)
custom_arr[global.custom_len_var,5] = 5; // Special (Array index)
// Label
custom_label_arr[global.custom_len_var,0] = "none"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "all"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(1,global.custom_len_var,-1,-1,-1); // Default (All)
custom_arr_set_scr(0,global.custom_len_var,-1,0,-1); // Story (None)
global.custom_len_var += 1;
    // One Shot
// Name
custom_arr[global.custom_len_var,0] = "one_shot"; // Variable name
custom_arr[global.custom_len_var,1] = "one_shot"; // Name
custom_arr[global.custom_len_var,2] = "one_shot"; // Description
custom_arr[global.custom_len_var,3] = true; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 0; // Type
// Label
custom_label_arr[global.custom_len_var,0] = "off"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "on"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(false,global.custom_len_var,-1,-1,-1); // Default
custom_arr_set_scr(true,global.custom_len_var,5,-1,-1); // :)
global.custom_len_var += 1;
/*
-----------------
Monster array

This is used for the behavior settings in the main menu.
It will also be used for the CAT-DOS, chase pool, and locale pool in the future.

-----------------
*/
// Monster specific
globalvar mon_arr;
globalvar mon_group_arr;
globalvar mon_type_arr;
globalvar mon_desc_arr;
global.mon_len_var = 0;
    // Groups
global.mon_group_len_var = 6;
mon_group_arr[0,0] = "none"; // Name
mon_group_arr[0,1] = true; // Translate
mon_group_arr[1,0] = "spec";
mon_group_arr[1,1] = true;
mon_group_arr[2,0] = "mon";
mon_group_arr[2,1] = true;
mon_group_arr[3,0] = "doll";
mon_group_arr[3,1] = true;
mon_group_arr[4,0] = "endless";
mon_group_arr[4,1] = true;
mon_group_arr[5,0] = "unknown";
mon_group_arr[5,1] = true;
    // Player (yes I know this doesn't make any sense, this is just for player_type_var)
mon_arr[global.mon_len_var,0] = "player"; // Variable
mon_arr[global.mon_len_var,1] = "player"; // Name
mon_arr[global.mon_len_var,2] = "player"; // Description
mon_arr[global.mon_len_var,3] = "player"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = false; // Chases
mon_arr[global.mon_len_var,6] = false; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 0; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = player_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
global.mon_len_var += 1;
    // Axe
mon_arr[global.mon_len_var,0] = "axe"; // Variable
mon_arr[global.mon_len_var,1] = "axe"; // Name
mon_arr[global.mon_len_var,2] = "axe"; // Description
mon_arr[global.mon_len_var,3] = "axe"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = false; // Chases
mon_arr[global.mon_len_var,6] = false; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 0; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = axe_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
global.mon_len_var += 1;
    // Jumpscare
mon_arr[global.mon_len_var,0] = "js"; // Variable
mon_arr[global.mon_len_var,1] = "js"; // Name
mon_arr[global.mon_len_var,2] = "js"; // Description
mon_arr[global.mon_len_var,3] = "js"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = false; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = js_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "alt";
mon_type_arr[global.mon_len_var,1] = true; // Translate
local.bug = global.mon_len_var;
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
global.mon_len_var += 1;
    // Howard
mon_arr[global.mon_len_var,0] = "howard"; // Variable
mon_arr[global.mon_len_var,1] = "howard"; // Name
mon_arr[global.mon_len_var,2] = "howard"; // Description
mon_arr[global.mon_len_var,3] = "howard"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = false; // Chases
mon_arr[global.mon_len_var,6] = false; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 0; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = howard_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
global.mon_len_var += 1;
    // Gel
mon_arr[global.mon_len_var,0] = "gel"; // Variable
mon_arr[global.mon_len_var,1] = "gel"; // Name
mon_arr[global.mon_len_var,2] = "gel"; // Description
mon_arr[global.mon_len_var,3] = "gel"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = gel_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
local.gel = global.mon_len_var;
global.mon_len_var += 1;
    // Brain
mon_arr[global.mon_len_var,0] = "brain"; // Variable
mon_arr[global.mon_len_var,1] = "brain"; // Name
mon_arr[global.mon_len_var,2] = "brain"; // Description
mon_arr[global.mon_len_var,3] = "brain"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = brain_chase_obj; // Object
mon_arr[global.mon_len_var,10] = rare_07_rm; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
local.brain = global.mon_len_var;
global.mon_len_var += 1;
    // Bug
mon_arr[global.mon_len_var,0] = "bug"; // Variable
mon_arr[global.mon_len_var,1] = "bug"; // Name
mon_arr[global.mon_len_var,2] = "bug"; // Description
mon_arr[global.mon_len_var,3] = "bug"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = bug_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "rouge";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.bug = global.mon_len_var;
global.mon_len_var += 1;
    // Ringu
mon_arr[global.mon_len_var,0] = "ringu"; // Variable
mon_arr[global.mon_len_var,1] = "ringu"; // Name
mon_arr[global.mon_len_var,2] = "ringu"; // Description
mon_arr[global.mon_len_var,3] = "ringu"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = ringu_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "old";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.ringu = global.mon_len_var;
global.mon_len_var += 1;
    // Bab
mon_arr[global.mon_len_var,0] = "bab"; // Variable
mon_arr[global.mon_len_var,1] = "bab"; // Name
mon_arr[global.mon_len_var,2] = "bab"; // Description
mon_arr[global.mon_len_var,3] = "bab"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = bab_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "old";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.bab = global.mon_len_var;
global.mon_len_var += 1;
    // Puppet
mon_arr[global.mon_len_var,0] = "pup"; // Variable
mon_arr[global.mon_len_var,1] = "pup"; // Name
mon_arr[global.mon_len_var,2] = "pup"; // Description
mon_arr[global.mon_len_var,3] = "pup"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 3; // Extra behaviors
mon_arr[global.mon_len_var,9] = pup_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "old";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "dh";
mon_type_arr[global.mon_len_var,3] = true; // Translate
mon_type_arr[global.mon_len_var,4] = "dh_hd";
mon_type_arr[global.mon_len_var,5] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
mon_desc_arr[global.mon_len_var,8] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,2];
mon_desc_arr[global.mon_len_var,9] = true;
mon_desc_arr[global.mon_len_var,10] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,4];
mon_desc_arr[global.mon_len_var,11] = true;
local.pup = global.mon_len_var;
global.mon_len_var += 1;
    // Flesh
mon_arr[global.mon_len_var,0] = "flesh"; // Variable
mon_arr[global.mon_len_var,1] = "flesh"; // Name
mon_arr[global.mon_len_var,2] = "flesh"; // Description
mon_arr[global.mon_len_var,3] = "flesh"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = flesh_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "alt";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.flesh = global.mon_len_var;
global.mon_len_var += 1;
    // Taker
mon_arr[global.mon_len_var,0] = "taker"; // Variable
mon_arr[global.mon_len_var,1] = "taker"; // Name
mon_arr[global.mon_len_var,2] = "taker"; // Description
mon_arr[global.mon_len_var,3] = "taker"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = false; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = taker_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "dh";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
global.mon_len_var += 1;
    // Deer Lord
mon_arr[global.mon_len_var,0] = "dl"; // Variable
mon_arr[global.mon_len_var,1] = "dl"; // Name
mon_arr[global.mon_len_var,2] = "dl"; // Description
mon_arr[global.mon_len_var,3] = "dl"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 3; // Extra behaviors
mon_arr[global.mon_len_var,9] = dl_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "old";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "rouge";
mon_type_arr[global.mon_len_var,3] = true; // Translate
mon_type_arr[global.mon_len_var,4] = "remodeled";
mon_type_arr[global.mon_len_var,5] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
mon_desc_arr[global.mon_len_var,8] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,2];
mon_desc_arr[global.mon_len_var,9] = true;
mon_desc_arr[global.mon_len_var,10] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,4];
mon_desc_arr[global.mon_len_var,11] = true;
local.dl = global.mon_len_var;
global.mon_len_var += 1;
    // Eel
mon_arr[global.mon_len_var,0] = "eel"; // Variable
mon_arr[global.mon_len_var,1] = "eel"; // Name
mon_arr[global.mon_len_var,2] = "eel"; // Description
mon_arr[global.mon_len_var,3] = "eel"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = eel_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "remodeled";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.eel = global.mon_len_var;
global.mon_len_var += 1;
    // Parasite
mon_arr[global.mon_len_var,0] = "para"; // Variable
mon_arr[global.mon_len_var,1] = "para"; // Name
mon_arr[global.mon_len_var,2] = "para"; // Description
mon_arr[global.mon_len_var,3] = "para"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = para_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
local.para = global.mon_len_var;
global.mon_len_var += 1;
    // Food Demon
mon_arr[global.mon_len_var,0] = "fd"; // Variable
mon_arr[global.mon_len_var,1] = "fd"; // Name
mon_arr[global.mon_len_var,2] = "fd"; // Description
mon_arr[global.mon_len_var,3] = "fd"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = fd_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
local.fd = global.mon_len_var;
global.mon_len_var += 1;
    // Killer
mon_arr[global.mon_len_var,0] = "killer"; // Variable
mon_arr[global.mon_len_var,1] = "killer"; // Name
mon_arr[global.mon_len_var,2] = "killer"; // Description
mon_arr[global.mon_len_var,3] = "killer"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 5; // Extra behaviors
mon_arr[global.mon_len_var,9] = killer_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "old";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "remodeled";
mon_type_arr[global.mon_len_var,3] = true; // Translate
mon_type_arr[global.mon_len_var,4] = "rouge";
mon_type_arr[global.mon_len_var,5] = true; // Translate
mon_type_arr[global.mon_len_var,6] = "alt_01";
mon_type_arr[global.mon_len_var,7] = true; // Translate
mon_type_arr[global.mon_len_var,8] = "alt_02";
mon_type_arr[global.mon_len_var,9] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
mon_desc_arr[global.mon_len_var,8] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,2];
mon_desc_arr[global.mon_len_var,9] = true;
mon_desc_arr[global.mon_len_var,10] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,4];
mon_desc_arr[global.mon_len_var,11] = true;
mon_desc_arr[global.mon_len_var,12] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,6];
mon_desc_arr[global.mon_len_var,13] = true;
mon_desc_arr[global.mon_len_var,14] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,8];
mon_desc_arr[global.mon_len_var,15] = true;
local.killer = global.mon_len_var;
global.mon_len_var += 1;
    // Mermaid
mon_arr[global.mon_len_var,0] = "mur"; // Variable
mon_arr[global.mon_len_var,1] = "mur"; // Name
mon_arr[global.mon_len_var,2] = "mur"; // Description
mon_arr[global.mon_len_var,3] = "mur"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 1; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = noone; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
local.mur = global.mon_len_var;
global.mon_len_var += 1;
    // Security Guard
mon_arr[global.mon_len_var,0] = "sg"; // Variable
mon_arr[global.mon_len_var,1] = "sg"; // Name
mon_arr[global.mon_len_var,2] = "sg"; // Description
mon_arr[global.mon_len_var,3] = "sg"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 2; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = sg_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
local.sg = global.mon_len_var;
global.mon_len_var += 1;
    // Bodybag
mon_arr[global.mon_len_var,0] = "body"; // Variable
mon_arr[global.mon_len_var,1] = "body"; // Name
mon_arr[global.mon_len_var,2] = "body"; // Description
mon_arr[global.mon_len_var,3] = "body"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 2; // Group
mon_arr[global.mon_len_var,8] = 3; // Extra behaviors
mon_arr[global.mon_len_var,9] = bodybag_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "old";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "kh";
mon_type_arr[global.mon_len_var,3] = true; // Translate
mon_type_arr[global.mon_len_var,4] = "alt";
mon_type_arr[global.mon_len_var,5] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
mon_desc_arr[global.mon_len_var,8] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,2];
mon_desc_arr[global.mon_len_var,9] = true;
mon_desc_arr[global.mon_len_var,10] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,4];
mon_desc_arr[global.mon_len_var,11] = true;
local.body = global.mon_len_var;
global.mon_len_var += 1;
    // Stem
mon_arr[global.mon_len_var,0] = "stem"; // Variable
mon_arr[global.mon_len_var,1] = "stem"; // Name
mon_arr[global.mon_len_var,2] = "stem"; // Description
mon_arr[global.mon_len_var,3] = "stem"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 2; // Group
mon_arr[global.mon_len_var,8] = 4; // Extra behaviors
mon_arr[global.mon_len_var,9] = stem_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "kh";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "kh_hd";
mon_type_arr[global.mon_len_var,3] = true; // Translate
mon_type_arr[global.mon_len_var,4] = "old";
mon_type_arr[global.mon_len_var,5] = true; // Translate
mon_type_arr[global.mon_len_var,6] = "alt";
mon_type_arr[global.mon_len_var,7] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
mon_desc_arr[global.mon_len_var,8] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,2];
mon_desc_arr[global.mon_len_var,9] = true;
mon_desc_arr[global.mon_len_var,10] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,4];
mon_desc_arr[global.mon_len_var,11] = true;
mon_desc_arr[global.mon_len_var,12] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,6];
mon_desc_arr[global.mon_len_var,13] = true;
local.stem = global.mon_len_var;
global.mon_len_var += 1;
    // Patient
mon_arr[global.mon_len_var,0] = "patient"; // Variable
mon_arr[global.mon_len_var,1] = "patient"; // Name
mon_arr[global.mon_len_var,2] = "patient"; // Description
mon_arr[global.mon_len_var,3] = "patient"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 2; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = patient_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "alt";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.patient = global.mon_len_var;
global.mon_len_var += 1;
    // Ghost Cow
mon_arr[global.mon_len_var,0] = "gc"; // Variable
mon_arr[global.mon_len_var,1] = "gc"; // Name
mon_arr[global.mon_len_var,2] = "gc"; // Description
mon_arr[global.mon_len_var,3] = "gc"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 2; // Group
mon_arr[global.mon_len_var,8] = 4; // Extra behaviors
mon_arr[global.mon_len_var,9] = gc_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "kh";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "kh_hd";
mon_type_arr[global.mon_len_var,3] = true; // Translate
mon_type_arr[global.mon_len_var,4] = "alt";
mon_type_arr[global.mon_len_var,5] = true; // Translate
mon_type_arr[global.mon_len_var,6] = "kh_recode";
mon_type_arr[global.mon_len_var,7] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
mon_desc_arr[global.mon_len_var,8] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,2];
mon_desc_arr[global.mon_len_var,9] = true;
mon_desc_arr[global.mon_len_var,10] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,4];
mon_desc_arr[global.mon_len_var,11] = true;
mon_desc_arr[global.mon_len_var,12] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,6];
mon_desc_arr[global.mon_len_var,13] = true;
local.gc = global.mon_len_var;
global.mon_len_var += 1;
    // Bekka
mon_arr[global.mon_len_var,0] = "bekka"; // Variable
mon_arr[global.mon_len_var,1] = "bekka"; // Name
mon_arr[global.mon_len_var,2] = "bekka"; // Description
mon_arr[global.mon_len_var,3] = "bekka"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 2; // Group
mon_arr[global.mon_len_var,8] = 3; // Extra behaviors
mon_arr[global.mon_len_var,9] = bekka_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "remodeled";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "rouge";
mon_type_arr[global.mon_len_var,3] = true; // Translate
mon_type_arr[global.mon_len_var,4] = "alt";
mon_type_arr[global.mon_len_var,5] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
mon_desc_arr[global.mon_len_var,8] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,2];
mon_desc_arr[global.mon_len_var,9] = true;
mon_desc_arr[global.mon_len_var,10] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,4];
mon_desc_arr[global.mon_len_var,11] = true;
local.bekka = global.mon_len_var;
global.mon_len_var += 1;
    // Husks
mon_arr[global.mon_len_var,0] = "husk"; // Variable
mon_arr[global.mon_len_var,1] = "husk"; // Name
mon_arr[global.mon_len_var,2] = "husk"; // Description
mon_arr[global.mon_len_var,3] = "husk"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 3; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = noone; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
local.husk = global.mon_len_var;
global.mon_len_var += 1;
    // Woormy Charles
mon_arr[global.mon_len_var,0] = "wc"; // Variable
mon_arr[global.mon_len_var,1] = "wc"; // Name
mon_arr[global.mon_len_var,2] = "wc"; // Description
mon_arr[global.mon_len_var,3] = "wc"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 3; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = wc_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "remodeled";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.wc = global.mon_len_var;
global.mon_len_var += 1;
    // Clown
mon_arr[global.mon_len_var,0] = "clown"; // Variable
mon_arr[global.mon_len_var,1] = "clown"; // Name
mon_arr[global.mon_len_var,2] = "clown"; // Description
mon_arr[global.mon_len_var,3] = "clown"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 3; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = clown_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "alt";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.clown = global.mon_len_var;
global.mon_len_var += 1;
    // Hooked Doll
mon_arr[global.mon_len_var,0] = "hk"; // Variable
mon_arr[global.mon_len_var,1] = "hk"; // Name
mon_arr[global.mon_len_var,2] = "hk"; // Description
mon_arr[global.mon_len_var,3] = "hk"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 3; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = hk_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "rouge";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.hk = global.mon_len_var;
global.mon_len_var += 1;
    // Frenzy
mon_arr[global.mon_len_var,0] = "frenzy"; // Variable
mon_arr[global.mon_len_var,1] = "frenzy"; // Name
mon_arr[global.mon_len_var,2] = "frenzy"; // Description
mon_arr[global.mon_len_var,3] = "frenzy"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 3; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = frenzy_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
local.frenzy = global.mon_len_var;
global.mon_len_var += 1;
    // Real Ringu
mon_arr[global.mon_len_var,0] = "real_ringu"; // Variable
mon_arr[global.mon_len_var,1] = "real_ringu"; // Name
mon_arr[global.mon_len_var,2] = "real_ringu"; // Description
mon_arr[global.mon_len_var,3] = "real_ringu"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 4; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = real_ringu_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "old";
mon_type_arr[global.mon_len_var,1] = true; // Translate
local.real_ringu = global.mon_len_var;
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
global.mon_len_var += 1;
    // Tirsiak
mon_arr[global.mon_len_var,0] = "tiri"; // Variable
mon_arr[global.mon_len_var,1] = "tiri"; // Name
mon_arr[global.mon_len_var,2] = "tiri"; // Description
mon_arr[global.mon_len_var,3] = "tiri"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 5; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = tiri_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "old";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.tiri = global.mon_len_var;
global.mon_len_var += 1;
    // Lisa
mon_arr[global.mon_len_var,0] = "lisa"; // Variable
mon_arr[global.mon_len_var,1] = "lisa"; // Name
mon_arr[global.mon_len_var,2] = "lisa"; // Description
mon_arr[global.mon_len_var,3] = "lisa"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 5; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = lisa_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "alt";
mon_type_arr[global.mon_len_var,1] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
local.lisa = global.mon_len_var;
global.mon_len_var += 1;
    // Otto
mon_arr[global.mon_len_var,0] = "otto"; // Variable
mon_arr[global.mon_len_var,1] = "otto"; // Name
mon_arr[global.mon_len_var,2] = "otto"; // Description
mon_arr[global.mon_len_var,3] = "otto"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 5; // Group
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = otto_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "old";
mon_type_arr[global.mon_len_var,1] = true; // Translate
local.otto = global.mon_len_var;
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
global.mon_len_var += 1;
    // Spooper
mon_arr[global.mon_len_var,0] = "spooper"; // Variable
mon_arr[global.mon_len_var,1] = "spooper"; // Name
mon_arr[global.mon_len_var,2] = "spooper"; // Description
mon_arr[global.mon_len_var,3] = "spooper"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 5; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = spooper_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
local.spooper = global.mon_len_var;
global.mon_len_var += 1;
    // White Face
mon_arr[global.mon_len_var,0] = "wf"; // Variable
mon_arr[global.mon_len_var,1] = "wf"; // Name
mon_arr[global.mon_len_var,2] = "wf"; // Description
mon_arr[global.mon_len_var,3] = "wf"; // CAT-DOS
mon_arr[global.mon_len_var,4] = true; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = 5; // Group
mon_arr[global.mon_len_var,8] = 5; // Extra behaviors
mon_arr[global.mon_len_var,9] = wf_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "old";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "old_hd";
mon_type_arr[global.mon_len_var,3] = true; // Translate
mon_type_arr[global.mon_len_var,4] = "imscared";
mon_type_arr[global.mon_len_var,5] = true; // Translate
mon_type_arr[global.mon_len_var,6] = "alt";
mon_type_arr[global.mon_len_var,7] = true; // Translate
mon_type_arr[global.mon_len_var,8] = "imscared_recode";
mon_type_arr[global.mon_len_var,9] = true; // Translate
// Descriptions
mon_desc_arr[global.mon_len_var,0] = mon_arr[global.mon_len_var,2]+"_"+type_arr[0,1];
mon_desc_arr[global.mon_len_var,1] = true;
mon_desc_arr[global.mon_len_var,2] = mon_arr[global.mon_len_var,2]+"_"+type_arr[1,1];
mon_desc_arr[global.mon_len_var,3] = true;
mon_desc_arr[global.mon_len_var,4] = mon_arr[global.mon_len_var,2]+"_"+type_arr[2,1];
mon_desc_arr[global.mon_len_var,5] = true;
mon_desc_arr[global.mon_len_var,6] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,0];
mon_desc_arr[global.mon_len_var,7] = true;
mon_desc_arr[global.mon_len_var,8] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,2];
mon_desc_arr[global.mon_len_var,9] = true;
mon_desc_arr[global.mon_len_var,10] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,4];
mon_desc_arr[global.mon_len_var,11] = true;
mon_desc_arr[global.mon_len_var,12] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,6];
mon_desc_arr[global.mon_len_var,13] = true;
mon_desc_arr[global.mon_len_var,14] = mon_arr[global.mon_len_var,2]+"_"+mon_type_arr[global.mon_len_var,8];
mon_desc_arr[global.mon_len_var,15] = true;
local.wf = global.mon_len_var;
global.mon_len_var += 1;
/*
-------------
Monster lists

A 4D array of lists, good god.
Let's just hope this doesn't use up too much memory.

0 - None
    0 - Literally nothing lol

-------------
*/
globalvar mon_list_arr;
// Blank
mon_list_arr[0,0] = noone;
// Story
mon_list_arr[1,0] = noone;
// All
mon_list_arr[1,1] = ds_list_create();
ds_list_clear(mon_list_arr[1,1]);
ds_list_add(mon_list_arr[1,1],local.gel);
ds_list_add(mon_list_arr[1,1],local.brain);
ds_list_add(mon_list_arr[1,1],local.bug);
ds_list_add(mon_list_arr[1,1],local.ringu);
ds_list_add(mon_list_arr[1,1],local.bab);
ds_list_add(mon_list_arr[1,1],local.pup);
ds_list_add(mon_list_arr[1,1],local.flesh);
ds_list_add(mon_list_arr[1,1],local.dl);
ds_list_add(mon_list_arr[1,1],local.eel);
ds_list_add(mon_list_arr[1,1],local.para);
ds_list_add(mon_list_arr[1,1],local.fd);
ds_list_add(mon_list_arr[1,1],local.killer);
ds_list_add(mon_list_arr[1,1],local.mur);
// Story Mode
mon_list_arr[1,2] = ds_list_create();
ds_list_clear(mon_list_arr[1,2]);
ds_list_add(mon_list_arr[1,2],local.gel);
ds_list_add(mon_list_arr[1,2],local.bug);
ds_list_add(mon_list_arr[1,2],local.ringu);
ds_list_add(mon_list_arr[1,2],local.bab);
ds_list_add(mon_list_arr[1,2],local.pup);
ds_list_add(mon_list_arr[1,2],local.flesh);
ds_list_add(mon_list_arr[1,2],local.dl);
ds_list_add(mon_list_arr[1,2],local.para);
ds_list_add(mon_list_arr[1,2],local.fd);
ds_list_add(mon_list_arr[1,2],local.killer);
ds_list_add(mon_list_arr[1,2],local.mur);
// Beta
mon_list_arr[1,3] = ds_list_create();
ds_list_clear(mon_list_arr[1,3]);
ds_list_add(mon_list_arr[1,3],local.gel);
ds_list_add(mon_list_arr[1,3],local.brain);
ds_list_add(mon_list_arr[1,3],local.ringu);
ds_list_add(mon_list_arr[1,3],local.bab);
ds_list_add(mon_list_arr[1,3],local.pup);
ds_list_add(mon_list_arr[1,3],local.flesh);
ds_list_add(mon_list_arr[1,3],local.dl);
ds_list_add(mon_list_arr[1,3],local.eel);
ds_list_add(mon_list_arr[1,3],local.fd);
ds_list_add(mon_list_arr[1,3],local.killer);
ds_list_add(mon_list_arr[1,3],local.mur);
// No Ringu
mon_list_arr[1,4] = ds_list_create();
ds_list_clear(mon_list_arr[1,4]);
ds_list_add(mon_list_arr[1,4],local.gel);
ds_list_add(mon_list_arr[1,4],local.brain);
ds_list_add(mon_list_arr[1,4],local.bug);
ds_list_add(mon_list_arr[1,4],local.bab);
ds_list_add(mon_list_arr[1,4],local.pup);
ds_list_add(mon_list_arr[1,4],local.flesh);
ds_list_add(mon_list_arr[1,4],local.dl);
ds_list_add(mon_list_arr[1,4],local.eel);
ds_list_add(mon_list_arr[1,4],local.para);
ds_list_add(mon_list_arr[1,4],local.fd);
ds_list_add(mon_list_arr[1,4],local.killer);
ds_list_add(mon_list_arr[1,4],local.mur);
// OG Endless
mon_list_arr[1,5] = ds_list_create();
ds_list_clear(mon_list_arr[1,5]);
ds_list_add(mon_list_arr[1,5],local.gel);
ds_list_add(mon_list_arr[1,5],local.bug);
ds_list_add(mon_list_arr[1,5],local.ringu);
ds_list_add(mon_list_arr[1,5],local.bab);
ds_list_add(mon_list_arr[1,5],local.pup);
ds_list_add(mon_list_arr[1,5],local.dl);
ds_list_add(mon_list_arr[1,5],local.para);
ds_list_add(mon_list_arr[1,5],local.fd);
ds_list_add(mon_list_arr[1,5],local.killer);
// Karamari
mon_list_arr[2,0] = noone;
// OG Endless
mon_list_arr[2,2] = ds_list_create();
ds_list_clear(mon_list_arr[2,2]);
ds_list_add(mon_list_arr[2,2],local.stem);
ds_list_add(mon_list_arr[2,2],local.patient);
ds_list_add(mon_list_arr[2,2],local.gc);
ds_list_add(mon_list_arr[2,2],local.bekka);
// HD Endless
mon_list_arr[2,3] = ds_list_create();
ds_list_clear(mon_list_arr[2,3]);
ds_list_copy(mon_list_arr[2,3],mon_list_arr[2,2]);
if file_exists(working_directory+"\Karamari_Hospital\KH.exe")
{ ds_list_add(mon_list_arr[2,3],local.body); }
// All
mon_list_arr[2,1] = ds_list_create();
ds_list_clear(mon_list_arr[2,1]);
ds_list_copy(mon_list_arr[2,1],mon_list_arr[2,3]);
if file_exists(working_directory+"\Karamari_Hospital\KH.exe")
{ ds_list_add(mon_list_arr[2,1],local.sg); }
// Dollhouse
mon_list_arr[3,0] = noone;
if file_exists(working_directory+"\The_Doll_House\SDH.exe")
{
    // HD Endless
    mon_list_arr[3,2] = ds_list_create();
    ds_list_clear(mon_list_arr[3,2]);
    ds_list_add(mon_list_arr[3,2],local.husk);
    ds_list_add(mon_list_arr[3,2],local.wc);
    ds_list_add(mon_list_arr[3,2],local.clown);
    ds_list_add(mon_list_arr[3,2],local.hk);
    // All
    mon_list_arr[3,1] = ds_list_create();
    ds_list_clear(mon_list_arr[3,1]);
    ds_list_copy(mon_list_arr[3,1],mon_list_arr[3,2]);
    ds_list_add(mon_list_arr[3,1],local.frenzy);
}
else
{
    mon_list_arr[3,1] = noone;
    mon_list_arr[3,2] = noone;
}
// Endless
mon_list_arr[4,0] = noone;
mon_list_arr[4,1] = ds_list_create();
ds_list_clear(mon_list_arr[4,1]);
ds_list_add(mon_list_arr[4,1],local.real_ringu);
// Unknown
mon_list_arr[5,0] = noone;
mon_list_arr[5,1] = ds_list_create();
ds_list_clear(mon_list_arr[5,1]);
ds_list_add(mon_list_arr[5,1],local.tiri);
ds_list_add(mon_list_arr[5,1],local.lisa);
ds_list_add(mon_list_arr[5,1],local.otto);
ds_list_add(mon_list_arr[5,1],local.spooper);
ds_list_add(mon_list_arr[5,1],local.wf);
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
set_label_arr[global.set_len_var,2] = "classic"; // Value 2
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
// Classic Theme
set_arr[global.set_len_var,0] = "old_theme"; // Variable name
set_arr[global.set_len_var,1] = "old_theme"; // Name
set_arr[global.set_len_var,2] = "old_theme"; // Description
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
set_label_arr[global.set_len_var,4] = "classic"; // Value 2
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
// Draw (hope this works)
draw_load_scr("Loaded config!");