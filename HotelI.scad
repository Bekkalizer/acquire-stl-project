
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

//Parameters
crown_body_bottom_radius = 7;
crown_body_top_radius = 9;
crown_body_height = 8;
crown_sphere_radius = 3;

bottom_width = 19.5;
bottom_height = 5;

cage_width = 2;
cage_height = 1;


union () {
    cube_with_extruded_bottom([bottom_width, bottom_width, bottom_height]);

    //crown_body
    translate([bottom_width/2,bottom_width/2,bottom_height]) {
        difference () {
            cylinder(crown_body_height, crown_body_bottom_radius, crown_body_top_radius);
            translate([cage_width/2, cage_width/2, crown_body_height-cage_height])
                cube([crown_body_top_radius,crown_body_top_radius,cage_height]);
            translate([-cage_width/2-crown_body_top_radius, cage_width/2, crown_body_height-cage_height])
                cube([crown_body_top_radius,crown_body_top_radius,cage_height]);
            translate([-cage_width/2-crown_body_top_radius, -cage_width/2-crown_body_top_radius, crown_body_height-cage_height])
                cube([crown_body_top_radius,crown_body_top_radius,cage_height]);
            translate([cage_width/2, -cage_width/2-crown_body_top_radius, crown_body_height-cage_height])
                cube([crown_body_top_radius,crown_body_top_radius,cage_height]);
        }
    }
    
    translate([bottom_width/2,bottom_width/2,bottom_height+crown_body_height+crown_sphere_radius-cage_height])
        sphere(crown_sphere_radius);
}
