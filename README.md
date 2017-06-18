# OpenSCAD-Library
Library for OpenSCAD, with three parts
## 'Z_library.scad' proposes extended functions.
Developed for my own projects (have a look on them as examples) with intent to have a more compact code, extrusions capabilities in all axis, limited use of vectors. Stable.<br>
Add mirror and duplicate functions (which are practically be the most frequent used functions of the library along the multi-axis cylinder extrusions).<br>
Manage a play parameter allowing increased or decreased size to take into account manufacturing specificities (3D printing reduce hole size or laser cut increase them).<br>
There is also a slotting library to assemble laser cut panels.<br>
See scad file to have a more detailed philosophy and practical use.

## 'X_utils.scad' defines a few basic objects.
Small ball bearings by references, Nema 17 steppers, Computer fans, RC servo, plates, multiline writing, signatures and licence marks, pen

## in 'Batch_example' directory, a batch generator to automatically creates .stl, .png or .echo files
This uses Openscad to creates system batch generators (Windows only) when parameters are modified.<br>
There is also an option to create parts according customizer dataset.<br>
This can be used to automatically creates parts (.stl), images (.png) or BOM, lists, specifications, datasheets (.echo).<br>
Parts are selected by a 'part' variable index.
