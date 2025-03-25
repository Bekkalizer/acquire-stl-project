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


// ===== Parameters =====
rows = 9;
cols = 12;
start_row = 0;
start_col = 0;

building_width = 19.2;
pyramid_hole_in_building_width = building_width*0.8;
pyramid_hole_in_building_height = 10;

inside_margin_factor = 0.93;

pyramid_base = pyramid_hole_in_building_width * inside_margin_factor; //Same dimensions as pyramid hole in buildings, minus an inside margin
pyramid_height = 3;
spacing_margin = 1.8;
spacing = building_width - pyramid_hole_in_building_width + spacing_margin;
board_thickness = 2;
font_name = "DIN Condensed:style=Bold";
font_size = 6.5;             // Adjusted to take up most of the top surface
etch_depth = 0.5;               // Depth of etching


//Calculate pyramid top width at given height, with a 
t = pyramid_height / pyramid_hole_in_building_height;
pyramid_top = pyramid_hole_in_building_width * (1 - t) * inside_margin_factor; 
        

// ===== Main Model =====
board_width = cols * (pyramid_base + spacing);
board_depth = rows * (pyramid_base + spacing);

row_labels = ["I", "H", "G", "F", "E", "D", "C", "B", "A"];
col_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];

union() {
    // Base board
    cube([board_width, board_depth, board_thickness]);

    // Grid of pyramids
    translate([spacing/2, spacing/2, 0]) {
        for (row = [0 : rows - 1]) {
            for (col = [0 : cols - 1]) {
                label = str(row_labels[start_row + row], col_labels[start_col + col]);

                translate([
                    col * (pyramid_base + spacing) + pyramid_base / 2,
                    row * (pyramid_base + spacing) + pyramid_base / 2,
                    board_thickness
                ])
                    flat_top_pyramid(pyramid_base, pyramid_top, pyramid_height, label);
            }
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

// dummy cubes for debugging purpose
module showDebugCubes() {
    translate([3,-5, 5]) cube([3,20,3]);
    translate([-10, 5, 5]) cube([30,3,3]);
    translate([3, 3, 0]) cube([3,3,45]);
}