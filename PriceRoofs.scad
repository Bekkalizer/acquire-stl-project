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
// Acquire stl project is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License,
// or (at your option) any later version.
//
// Acquire stl project is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.

use <CommonModules.scad>

//Draw hotel roofs with starting price 2 for Luxor and Tower. Increase for other hotels.
price_roof_grid(2);

// ============== Parameters ==============
bottom_width = 19.5;
bottom_height = 5;
font_name = "DIN Condensed:style=Bold";
text_height = 0.5;
top_height = 3;
top_width = 15.2;
grid_spacing = 4;
grid_columns = 3;

hotelSizes  = ["2^", "3^", "4^", "5^", "6-10^", "11-20^", "21-30^","31-40^", "41+^"];

//Calculated dimensions
top_lip = (bottom_width - top_width)/2;

module price_roof_grid (starting_price) {
    grid_size = len(hotelSizes)-1;

    // Function to generate grid positions
    grid_positions = [ for (i = [0:grid_columns-1], j = [0:grid_columns-1]) [i * (bottom_width + grid_spacing), j * (bottom_width + grid_spacing), 0] ];

    for (i = [0:grid_size]) {
        translate(grid_positions[i]) price_roof(str(i+starting_price, "M$"), hotelSizes[i]);
    }
}

module price_roof(price_text = "2M$", size_text = "2^") {
    union () {
        cube_with_extruded_bottom([bottom_width, bottom_width, bottom_height]);
        
        // Top cube positioned above base
        translate([top_lip, top_lip, bottom_height - text_height]){
            
            cube([top_width,top_width,top_height]);
            
            // Letter and number etching
            translate([0,0, top_height]){
                translate([top_width/2,top_width/2-2,0])
                    etched_text(price_text,6);
                translate([top_width/2,top_width-3,0])
                    etched_text(size_text,4);
            }
        }
    }
}

module etched_text(text_label, font_size) {
    linear_extrude(height=text_height)
        text(text_label, size=font_size, font=font_name, halign="center", valign="center");
}




