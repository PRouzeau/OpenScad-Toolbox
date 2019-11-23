PRZ OpenSCAD Toolbox

Batch generator to automatically creates stl, png or echo files.
 This uses Openscad to creates system batch generators (Windows only) when
 parameters are modified. 
 There is also an option to create parts according customizer dataset.
 This can be used to automatically creates parts (.stl), images (.png) or
 BOM, lists, specifications or datasheets (.echo)
 
 The overall processus take a moment but it will save a lot of time later:
 * Modify the 'batch_create.scad' according your needs (your program shall use
 the 'part' input to produce a different part.) Note that you can use
 multiple OpenSCAD program and run all of them in one go. However, it is
 advisable to separate part output from BOM generation, etc.
 *Run the Windows batch '_batch_create.bat' Which will execute 
 'batch_create.scad' to produce the windows batches, but with '.echo'
 extensions.
 *Change the created file extensions from '.echo' to '.bat'
 *Run the batch files which will run your program as parametered in your 
 own version of 'batch_create.scad' (the batch run one OpenSCAD session per
 part, so this may takes some time for the whole generation process).
 
 You have more information in the file '_batch_create.bat'.
 
This generator began initially with a Libre office macro, but with the 
 (then) new possibility to output '.echo' files from an OpenSCAD program,
 the LIbre Office macro was transformed in an OpenSCAD program, removing the
 need of an external application.
 
Copyright (c) 2017-2019 Pierre ROUZEAU, AKA "PRZ"
Program license GPL v3
documentation licence cc BY-SA 4.0 and GFDL 1.2