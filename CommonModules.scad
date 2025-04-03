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

module cube_with_extruded_bottom( cube_size = [19.5, 19.5, 5] ) {
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