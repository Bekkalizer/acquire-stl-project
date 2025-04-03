
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

// Parameters
bottom_hotel = [19.5, 19.5, 5]; // Main cube dimensions
step_height_dimension = 2;
step_width_dimension = 2;
number_of_steps = 4;

module cube_with_extruded_bottom( cube_size = [1,1,1] ) {
    //Main build script parameters:
    max_width = 19.2;
    top_lip = 2;
    top_height = 3;
    //Calculated hole size:
    inside_margins = 1;
    hole_width = max_width - 2 * (top_lip) + inside_margins;
    hole_height = top_height + inside_margins;
    
    hole_size = [hole_width, hole_width, hole_height]; // Hole dimensions (same height as cube)
    hole_offset = [(cube_size[0] - hole_size[0]) / 2, (cube_size[1] - hole_size[1]) / 2, -0.1]; // Centered on bottom
    difference() {
        // Main Cube
        cube(cube_size);
       
        // Hole Cube (subtracting from bottom)
        translate(hole_offset)
            cube(hole_size);
    }
}

// Draw the main hotel lobby 
cube_with_extruded_bottom(bottom_hotel);
for( i = [0 : number_of_steps] ) {
    step_height = step_height_dimension;
    step_width = step_width_dimension;
    translate([step_width*i,step_width * i,bottom_hotel[2] + step_height * i]) {
        cube([bottom_hotel[0]-step_width*2*i, bottom_hotel[1]-step_width*2*i, step_height]);
    }
}

