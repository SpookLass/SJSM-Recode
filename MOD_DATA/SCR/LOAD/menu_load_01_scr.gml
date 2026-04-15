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
mode_arr[0,3] = true; // Custom Only
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
custom_arr_set_scr(0,global.custom_len_var,0,-1,-1); // Easiest
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
custom_label_arr[global.custom_len_var,6] = "beta"; // Value 4
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
draw_load_scr("Loaded config!");
/*
-----------------
Monster array

This is used for the behavior settings in the main menu.
It will also be used for the CAT-DOS, chase pool, and locale pool in the future.

-----------------
*/
draw_load_scr("Loading monsters...");
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
mon_type_arr[global.mon_len_var,0] = "rogue";
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
mon_type_arr[global.mon_len_var,2] = "rogue";
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
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = para_obj; // Object
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
mon_arr[global.mon_len_var,8] = 2; // Extra behaviors
mon_arr[global.mon_len_var,9] = fd_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "dh";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "dh_hd";
mon_type_arr[global.mon_len_var,3] = true; // Translate
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
mon_type_arr[global.mon_len_var,4] = "rogue";
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
mon_arr[global.mon_len_var,8] = 1; // Extra behaviors
mon_arr[global.mon_len_var,9] = sg_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Types
mon_type_arr[global.mon_len_var,0] = "kh";
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

mon_type_arr[global.mon_len_var,0] = "kh";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "old";
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
mon_type_arr[global.mon_len_var,0] = "kh_hd";
mon_type_arr[global.mon_len_var,1] = true; // Translate
mon_type_arr[global.mon_len_var,2] = "alt";
mon_type_arr[global.mon_len_var,3] = true; // Translate
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
mon_type_arr[global.mon_len_var,2] = "rogue";
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
mon_type_arr[global.mon_len_var,0] = "rogue";
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
// Reverse array
globalvar mon_obj_arr;
globalvar mon_rm_arr;
for (local.i=0; local.i<global.mon_len_var; local.i+=1;)
{
    if mon_arr[local.i,9] != noone { mon_obj_arr[mon_arr[local.i,9]] = local.i; }
    if mon_arr[local.i,10] != noone { mon_rm_arr[mon_arr[local.i,10]] = local.i; }
}
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
global.mon_list_len_var = 0;
// Blank
mon_list_arr[global.mon_list_len_var,0] = noone;
global.mon_list_len_var += 1;
// Story
mon_list_arr[global.mon_list_len_var,0] = noone;
// All
mon_list_arr[global.mon_list_len_var,1] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,1]);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.gel);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.brain);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.bug);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.ringu);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.bab);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.pup);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.flesh);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.dl);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.eel);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.para);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.fd);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.killer);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.mur);
// Story Mode
mon_list_arr[global.mon_list_len_var,2] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,2]);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.gel);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.bug);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.ringu);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.bab);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.pup);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.flesh);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.dl);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.para);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.fd);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.killer);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.mur);
// Beta
mon_list_arr[global.mon_list_len_var,3] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,3]);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.gel);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.brain);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.ringu);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.bab);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.pup);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.flesh);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.dl);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.eel);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.fd);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.killer);
ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.mur);
// No Ringu
mon_list_arr[global.mon_list_len_var,4] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,4]);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.gel);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.brain);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.bug);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.bab);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.pup);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.flesh);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.dl);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.eel);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.para);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.fd);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.killer);
ds_list_add(mon_list_arr[global.mon_list_len_var,4],local.mur);
// OG Endless
mon_list_arr[global.mon_list_len_var,5] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,5]);
ds_list_add(mon_list_arr[global.mon_list_len_var,5],local.gel);
ds_list_add(mon_list_arr[global.mon_list_len_var,5],local.bug);
ds_list_add(mon_list_arr[global.mon_list_len_var,5],local.ringu);
ds_list_add(mon_list_arr[global.mon_list_len_var,5],local.bab);
ds_list_add(mon_list_arr[global.mon_list_len_var,5],local.pup);
ds_list_add(mon_list_arr[global.mon_list_len_var,5],local.dl);
ds_list_add(mon_list_arr[global.mon_list_len_var,5],local.para);
ds_list_add(mon_list_arr[global.mon_list_len_var,5],local.fd);
ds_list_add(mon_list_arr[global.mon_list_len_var,5],local.killer);
global.mon_list_len_var += 1;
// Karamari
mon_list_arr[global.mon_list_len_var,0] = noone;
// OG Endless
mon_list_arr[global.mon_list_len_var,2] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,2]);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.stem);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.patient);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.gc);
ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.bekka);
// HD Endless
mon_list_arr[global.mon_list_len_var,3] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,3]);
ds_list_copy(mon_list_arr[global.mon_list_len_var,3],mon_list_arr[global.mon_list_len_var,2]);
if file_exists(working_directory+"\Karamari_Hospital\KH.exe")
{ ds_list_add(mon_list_arr[global.mon_list_len_var,3],local.body); }
// All
mon_list_arr[global.mon_list_len_var,1] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,1]);
ds_list_copy(mon_list_arr[global.mon_list_len_var,1],mon_list_arr[global.mon_list_len_var,3]);
if file_exists(working_directory+"\Karamari_Hospital\KH.exe")
{ ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.sg); }
global.mon_list_len_var += 1;
// Dollhouse
mon_list_arr[global.mon_list_len_var,0] = noone;
if file_exists(working_directory+"\The_Doll_House\SDH.exe")
{
    // HD Endless
    mon_list_arr[global.mon_list_len_var,2] = ds_list_create();
    ds_list_clear(mon_list_arr[global.mon_list_len_var,2]);
    ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.husk);
    ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.wc);
    ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.clown);
    ds_list_add(mon_list_arr[global.mon_list_len_var,2],local.hk);
    // All
    mon_list_arr[global.mon_list_len_var,1] = ds_list_create();
    ds_list_clear(mon_list_arr[global.mon_list_len_var,1]);
    ds_list_copy(mon_list_arr[global.mon_list_len_var,1],mon_list_arr[global.mon_list_len_var,2]);
    ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.frenzy);
}
else
{
    mon_list_arr[global.mon_list_len_var,1] = noone;
    mon_list_arr[global.mon_list_len_var,2] = noone;
}
global.mon_list_len_var += 1; // Weird but kinda required?
// Endless
mon_list_arr[global.mon_list_len_var,0] = noone;
mon_list_arr[global.mon_list_len_var,1] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,1]);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.real_ringu);
global.mon_list_len_var += 1;
// Unknown
mon_list_arr[global.mon_list_len_var,0] = noone;
mon_list_arr[global.mon_list_len_var,1] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,1]);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.tiri);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.lisa);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.otto);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.spooper);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.wf);
global.mon_list_len_var += 1;
draw_load_scr("Loaded monsters!");