# OpenSCAD-Toolbox
PRZ toolbox for OpenSCAD, with five main tools
1/ 'Z_library.scad' is a general purpose library extending OpenSCAD functions.
 Developed for my own projects (have a look on them as examples) with
 intent to have a more compact code, extrusions capabilities in all axis,
 limited use of vectors. This libray is four years old and stable (but still
 maintained in 2019).
 It Add mirror and duplicate functions (which are practically the most
 frequently used functions of the library along the multi-axis cylinder
 extrusions)
 This manage a 'play' parameter allowing increased or decreased size to take
 into account manufacturing specificities (3D printing reduce hole size or
 laser cut increase them).
 There is also a slotting library to assemble laser cut panels.
 See my own OpenSCAD programs to have a more detailed philosophy and
 example of practical use. Note that recent version of OpenSCAD use shortcuts
 in the editor and transform them in Legit OpenSCAD functions. Unfortunately
 this shortcuts are the same as some functions of this library, so the
 shorcuts shall be deactivated.

2/'X_utils.scad' is a library which defines a few basic objects and general
 tools, mostly useful for 3D printers, but also for small mechanical
 equipment. Small ball bearings by references, Nema 17 steppers, Computer
 fans, RC servo, plates, multiline writing, signatures and licence marks, pen.
 
3/ The 'Localization_macro.odt' file is a Libre Office file (which won't work
 on Microsoft Office) which create a language specific version of an OpenSCAD
 program, using a specifically developped grammar in the OpenSCAD comments.
 See the file itself for the grammar description.
 It can be used to localize Customizer messages or more generally any output
 from the OpenSCAD program. This is used in my repositories 'Protected
 Crossing', 'BentSim' and 'Bike symbols' and you can test them to see how
 they produce the localized version (french).
 
4/ In 'Batch_example' directory, a batch generator to automatically creates
 multiple stl, png or echo files.
 This uses Openscad to creates system batch generators (Windows only) to
 output multiple parts according modified parameters. 
 There is also an option to create parts according customizer dataset.
 This can be used to automatically creates parts (.stl), images (.png) or
 BOM, lists, specifications or datasheets (.echo) Read local
 'Readme_first.txt' and 'create_batch.bat' to have more information.

5/ A Libre office file 'Dataset_macros.odt' (won't work on Microsoft office)
 with two macros to extract and merge individual datasets from a global 
 customizer dataset file. In present OpenSCAD version (oct. 2019), you can't
 transfer or save individually dataset and these macros allow that.
 Read detailed information in the file itself.  

Copyright (c) 2017-2019 Pierre ROUZEAU, AKA "PRZ"
Program license GPL v3
documentation licence cc BY-SA 4.0 and GFDL 1.2
