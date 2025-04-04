
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

// Parameters
bottom_hotel = [19.5, 19.5, 5]; // Main cube dimensions
step_height_dimension = 2;
step_width_dimension = 2;
number_of_steps = 4;

// Draw the main hotel lobby 
cube_with_extruded_bottom(bottom_hotel);
for( i = [0 : number_of_steps] ) {
    step_height = step_height_dimension;
    step_width = step_width_dimension;
    translate([step_width*i,step_width * i,bottom_hotel[2] + step_height * i]) {
        cube([bottom_hotel[0]-step_width*2*i, bottom_hotel[1]-step_width*2*i, step_height]);
    }
}

