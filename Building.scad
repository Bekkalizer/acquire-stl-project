
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

// ============== Parameters ==============
//Change the below letter to generate the different STL files:
grid_letter = "A"; 

//Parameters normally not changed
grid_start = 1;
grid_end = 12;

grid_spacing = 2;
max_width = 19.2;  // Maximum width in mm
base_height = 10;

top_lip = 2;
top_height = 3;

//Program
top_width = max_width - 2 * top_lip;

base_size = [max_width, max_width, base_height];  // Base cube size
top_size = [top_width, top_width, top_height];   // Top cube size
font_name = "DIN Condensed:style=Bold";
font_size = 9;             // Adjusted to take up most of the top surface
depth = 0.5;               // Depth of etching

// Pyramid hole parameters
pyramid_base = [base_size[0] * 0.8, base_size[1] * 0.8];  // Slightly smaller than the base
pyramid_height = base_height;  // Matches base cube height

// Pyramid hole module
module pyramid_hole() {
    translate([0, 0, -base_size[2] / 2])
        linear_extrude(height=pyramid_height, scale=0)
        square(pyramid_base, center=true);
}

// Module for etched text
module etched_text(text_label) {
    linear_extrude(height=depth)
        text(text_label, size=font_size, font=font_name, halign="center", valign="center");
}

// Main structure
module aquire_house(text_label="T99") {
    difference() {
        // Base cube
        cube(base_size, center=true);
        
        // Pyramid hole inside base cube
        pyramid_hole();
    }
    
    // Top cube positioned above base
    translate([0, 0, (base_size[2] + top_size[2]) / 2])
        difference() {
            cube(top_size, center=true);
            
            // Letter and number etching
            translate([0, 0, top_size[2]/2 - depth]) // Move text down slightly for a proper cut
                etched_text(text_label);
        }
}

grid_size = grid_end - grid_start;
C = ceil(grid_size / floor(sqrt(grid_size)));  // Compute required columns

// Function to generate grid positions
grid_positions = [ for (i = [0:C-1], j = [0:C-1]) [i * (max_width + grid_spacing), j * (max_width + grid_spacing), 0] ];

for (i = [0:grid_size]) {
    label = str(grid_letter, (grid_start + i));
    translate(grid_positions[i]) aquire_house(label);
}

