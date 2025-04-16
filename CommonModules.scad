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
// 
// This file is part of the Acquire stl project.
// Copyright (C) 2025 Bekkalizer
//
// MyOpenGame is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License,
// or (at your option) any later version.
//
// MyOpenGame is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.

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