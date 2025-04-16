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

// ============== Parameters ==============
bottom_width = 19.5;
bottom_height = 5;

column_height = 20;
column_radius = 3.3;
column_flutes = 10;
column_margin = 1.5 + column_radius;

union () {
    cube_with_extruded_bottom([bottom_width, bottom_width, bottom_height]);
    translate([column_margin,column_margin,bottom_height])
        roman_column(column_height, column_radius, column_flutes);
    translate([bottom_width-column_margin,column_margin,bottom_height])
        roman_column(column_height, column_radius, column_flutes);
    translate([bottom_width-column_margin,bottom_width-column_margin,bottom_height])
        roman_column(column_height, column_radius, column_flutes);
    translate([column_margin,bottom_width-column_margin,bottom_height])
        roman_column(column_height, column_radius, column_flutes);
    
}

module roman_column(height = 100, radius = 10, flutes = 12) {
    base_height = height * 0.1;
    shaft_height = height * 0.8;
    capital_height = height * 0.1;

    // Base
    cylinder(h = base_height, r1 = radius * 1.2, r2 = radius * 1.1, $fn=64);

    // Shaft (with flutes)
    translate([0,0,base_height])
        fluted_shaft(h = shaft_height, r = radius, flutes = flutes);

    // Capital
    translate([0,0,base_height + shaft_height])
        cylinder(h = capital_height, r1 = radius * 1.1, r2 = radius * 1.3, $fn=64);
}

module fluted_shaft(h, r, flutes) {
    difference() {
        // Main shaft
        cylinder(h = h, r = r, $fn = flutes);

        // Carve flutes (inward slightly)
        for (i = [0 : flutes - 1]) {
            angle = 360 * i / flutes;
            rotate([0, 0, angle])
                translate([r - 0.2, 0, 0])  // push in slightly to intersect shaft
                    cylinder(h = h, r = 0.5, $fn = 24);
        }
    }
}




