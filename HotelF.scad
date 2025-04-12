
//    $$$$$$\   $$$$$$\   $$$$$$\  $$\   $$\ $$$$$$\ $$$$$$$\  $$$$$$$$\ 
//    $$  __$$\ $$  __$$\ $$  __$$\ $$ |  $$ |\_$$  _|$$  __$$\ $$  _____|
//    $$ /  $$ |$$ /  \__|$$ /  $$ |$$ |  $$ |  $$ |  $$ |  $$ |$$ |      
//    $$$$$$$$ |$$ |      $$ |  $$ |$$ |  $$ |  $$ |  $$$$$$$  |$$$$$\    
//    $$  __$$ |$$ |      $$ |  $$ |$$ |  $$ |  $$ |  $$  __$$< $$  __|   
//    $$ |  $$ |$$ |  $$\ $$ $$\$$ |$$ |  $$ |  $$ |  $$ |  $$ |$$ |      
//    $$ |  $$ |\$$$$$$  |\$$$$$$ / \$$$$$$  |$$$$$$\ $$ |  $$ |$$$$$$$$\ 
//    \__|  \__| \______/  \___$$$\  \______/ \______|\__|  \__|\________|
//                            \___|                                      
//      
//       Print and play - OpenScad project - by Bekkalizer and ChatGPT

use <CommonModules.scad>

tent_height = 15;
tent_wall_height = 5;

// Parameters
bottom_width = 19.5;
bottom_height = 5;

tent_radius = bottom_width/2;


union () {
    cube_with_extruded_bottom([bottom_width, bottom_width, bottom_height]);

    translate([tent_radius,tent_radius,bottom_height])
        cylinder(h = tent_wall_height, r = tent_radius);
    translate([tent_radius,tent_radius,bottom_height+tent_wall_height])
        cylinder(h = tent_height-tent_wall_height, r1 = tent_radius, r2 = 0);
}

