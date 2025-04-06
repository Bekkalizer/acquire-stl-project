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


//Uncomment the draw_board option relevant:

//3X3 test:
//draw_board( rows = 3, cols = 3, start_row = 0, start_col = 0);

//3X3 test with connectors on all sides:
draw_board( rows = 3, cols = 3, start_row = 0, start_col = 0, right_male = true, top_male = true, left_female = true, bottom_female = true);

//Full board:
//draw_board( rows = 9, cols = 12, start_row = 0, start_col = 0);

//4 Split, bottom left:
//draw_board( rows = 4, cols = 6, start_row = 0, start_col = 0, right_male = true, top_male = true, left_female = false, bottom_female = false);
//4 Split, bottom right:
//draw_board( rows = 4, cols = 6, start_row = 0, start_col = 6, right_male = false, top_male = true, left_female = false, bottom_female = false);
//4 Split, top left:
//draw_board( rows = 5, cols = 6, start_row = 4, start_col = 0, right_male = true, top_male = false, left_female = false, bottom_female = true);
//4 Split, top right:
//draw_board( rows = 5, cols = 6, start_row = 4, start_col = 6, right_male = false, top_male = false, left_female = true, bottom_female = true);


// ===== Parameters =====
board_thickness = 2;
font_name = "DIN Condensed:style=Bold";
font_size = 6.5;
etch_depth = 0.5;

$fn = 20;
connector_radius = 2.5;
connector_margin = 0.4;
connector_brim_margin = 0.4;

row_labels = ["I", "H", "G", "F", "E", "D", "C", "B", "A"];
col_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];


//Globally alined sizes and margins, change with care:
building_width = 19.2;
pyramid_hole_in_building_width = building_width*0.8;
pyramid_hole_in_building_height = 10;

inside_margin_factor = 0.93;

pyramid_height = 3;
spacing_margin = 1.8;

module draw_board(rows = 9,cols = 12, start_row = 0, start_col = 0, right_male = false, top_male = false, left_female = false, bottom_female = false) {
    union() {
        // Base board
        spacing = building_width - pyramid_hole_in_building_width + spacing_margin;
        pyramid_base = pyramid_hole_in_building_width * inside_margin_factor; //Same dimensions as pyramid hole in buildings, minus an inside margin
        board_width = cols * (pyramid_base + spacing);
        board_depth = rows * (pyramid_base + spacing);
        
        difference() {
            cube([board_width, board_depth, board_thickness]);
            female_connectors(true, true, cols, rows, spacing + pyramid_base);
        }

        //male connector top:
        if( top_male ) {
            for(i = [1 : cols - 1]) {
                translate([i * (spacing + pyramid_base), board_depth + connector_radius * 2 / 3 + connector_margin/2 + connector_brim_margin, 0 ])
                    cylinder(h = board_thickness, r = connector_radius );
            }
        }
        
        //male connector right:
        if( right_male ) {
            for(i = [1 : rows - 1]) {
                translate([board_width + connector_radius * 2 / 3 + connector_margin/2 + connector_brim_margin, i * (spacing + pyramid_base), 0 ])
                    cylinder(h = board_thickness, r = connector_radius );
            }
        }

        // Grid of pyramids
        //Calculate pyramid top width at given height
        t = pyramid_height / pyramid_hole_in_building_height;
        pyramid_top = pyramid_hole_in_building_width * (1 - t) * inside_margin_factor;
//        translate([spacing/2, spacing/2, 0]) {
//            for (row = [0 : rows - 1]) {
//                for (col = [0 : cols - 1]) {
//                    label = str(row_labels[start_row + row], col_labels[start_col + col]);
//
//                    translate([
//                        col * (pyramid_base + spacing) + pyramid_base / 2,
//                        row * (pyramid_base + spacing) + pyramid_base / 2,
//                        board_thickness
//                    ])
//                        flat_top_pyramid(pyramid_base, pyramid_top, pyramid_height, label);
//                }
//            }
//        }
    }
}

module female_connectors(bottom_female = true, left_female = true, cols = 12, rows = 9, connector_spacing = 1) {
    //female radius must have a some room to fit male
    female_connector_radius = connector_radius + connector_margin;
    //female connector bottom:
    if( bottom_female ) {
        for(i = [1 : cols - 1]) {
            translate([i * (connector_spacing), female_connector_radius * 2 / 3, 0 ])
                cylinder(h = board_thickness, r = female_connector_radius );
        }
    }
    
    //female connector left:
    if( left_female ) {
        for(i = [1 : rows - 1]) {
            translate([female_connector_radius * 2 / 3, i * (connector_spacing), 0 ])
                cylinder(h = board_thickness, r = female_connector_radius );
        }
    }
}


// ===== Flat-Top Pyramid (Frustum) with Etched Text =====
module flat_top_pyramid(base_size, top_size, height, label = "") {
    base = base_size / 2;
    top = top_size / 2;

    p = [
        // Bottom square (z=0)
        [-base, -base, 0], // 0
        [ base, -base, 0], // 1
        [ base,  base, 0], // 2
        [-base,  base, 0], // 3
        // Top square (z=height)
        [-top, -top, height], // 4
        [ top, -top, height], // 5
        [ top,  top, height], // 6
        [-top,  top, height]  // 7
    ];

    f = [
        [0, 1, 2], [0, 2, 3],         // bottom
        [0, 5, 1], [0, 4, 5],         // side 1
        [1, 5, 2], [2, 5, 6],         // side 2
        [2, 6, 3], [3, 6, 7],         // side 3
        [0, 3, 7], [7, 4, 0],         // side 4
        [4, 7, 6], [4, 6, 5]          // top
    ];
    //For debugging and ordering of the sides
    //showPoints(p);
    
    //polyhedron(points = p, faces = f);
    
    difference() {
        // Frustum shape
        polyhedron(points = p, faces = f);
        
        // Etched text on top
        translate([0, 0, height - etch_depth])
            linear_extrude(height = etch_depth + 0.1)
                text(label, size = font_size, font = font_name, halign = "center", valign = "center");
    }

}

// show the index of all points at the corresponding location
module showPoints(v) {
    for (i = [0: len(v)-1]) {
        translate(v[i]) color("red") 
        text(str(i), font = "Courier New", size=1.5);
    }
}