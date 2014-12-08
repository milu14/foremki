// Moduł do robienia foremek.

fudge = 0.01;

module foremka(height=5, thickness=2, last_height = 0.3, last_thickness=0.5) {
 union() {
  extrude_shell(height, thickness) children();
  translate([0, 0, height])
   extrude_shell(last_height, last_thickness) children();
 }
}

module extrude_shell(height, thickness) {
 difference() {
  minkowski() {
   linear_extrude(height*fudge) children();
   linear_extrude(height) circle(r=thickness);
  }
  translate ([0, 0, -height*fudge])
   linear_extrude(height+3*height*fudge) children();
 }
}
