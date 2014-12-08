.PHONY: clean

%.gcode: %.stl
	slic3r $<

%-auto.stl: %.scad-gen %.scad-paths foremka.scad
	openscad  -o $@ $<

%.scad-gen: %.scad-paths template.scad
	cat template.scad | sed 's/FILENAME/$</g' > $@

%.scad-paths: %.svg
	./paths2openscad.py --smoothness=0.05 --fname=$@ $<

clean:
	rm -f *-auto.stl *.gcode *.scad-gen *.scad-paths
