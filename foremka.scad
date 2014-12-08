// Moduł do robienia foremek.

module foremka(height=5, thickness=2, last_height = 0.3, last_thickness=0.5) {
 union() {
  extrude_shell(height, thickness) children();
  translate([0, 0, height])
   extrude_shell(last_height, last_thickness) children();
 }
}

module extrude_shell(height, thickness) {
 linear_extrude(height) {
  difference() {
   minkowski() {
    children();
    circle(r=thickness);
   }
   children();
  }
 }
}
