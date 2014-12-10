// Moduł do robienia foremek.

module foremka(outer_height=7, thickness=3, inner_height=10) {
 difference() {
  for(z = [0.1:0.1:1]) {
   extrude(outer_height*z+inner_height*(1-z), thickness*z) children();
  }
  translate([0,0,-inner_height]) linear_extrude(3*inner_height) children();
 }
}

module extrude(height, thickness) {
 linear_extrude(height) {
   minkowski() {
    children();
    circle(r=thickness);
   }
 }
}
