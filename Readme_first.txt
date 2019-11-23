PRZ OpenSCAD Toolbox, with five main tools:

1/ Z_library.scad is a general purpose library extending OpenSCAD functions.
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

2/ X_utils defines a few basic objects, mostly useful for 3D printers, but
 not only. Small ball bearings by references, Nema 17 steppers, Computer
 fans, RC servo, plates, multiline writing, signatures and licence marks,
 pen. Note that wen including it in your own program, you shall add:
 xpart=0; // neutralize library examples 
 
3/ The Localization_macro.odt file is a Libre Office file (which won't work
 on Microsoft Office) which create a language specific version of an OpenSCAD
 program, using a specifically developped grammar in the OpenSCAD comments.
 See the file itself for the grammar description. 
 It can be used to localize Customizer messages or more generally any output
 from the OpenSCAD program. This is used in my repositories Protected Crossing,
 BentSim and Bike symbols and you can test them to see how they produce the 
 localized version (french).
 
4/ In Batch_example directory, a batch generator to automatically create
 stl, png or echo files.
 This uses Openscad to creates system batch generators (Windows only) when
 parameters are modified. 
 There is also an option to create parts according customizer dataset.
 This can be used to automatically creates parts (.stl), images (.png) or
 BOM, lists, specifications or datasheets (.echo)
 See the local 'Readme_first.txt' file and also the comments in 
 'create_batch.bat' to have more explanations about the processus.
  
5/ A Libre office file 'Dataset_macros.odt' (won't work on Microsoft office)
 with two macros to extract and merge individual datasets from a global 
 customizer dataset file. In present OpenSCAD version (oct. 2019), you can't
 transfer or save individually dataset and these macros allow that.
 Read detailed information in the file itself.

6/ Other useful information:
 In order to set the camera to the appropriate position, you shall define
 the special variables $vpd,$vpt,$vpr. However, it these variables are forced
 to a given value, the image camera is reset to this value every time you 
 make a new run, which is rarely a desirable behaviour. 
 In order to detect the very first run, we examine the $vpr vector default
 value ([55,0,25]), which if modified will never be seen again and so we can
 impose the camera position at the first run only. Note: to help you to know 
 the actual camera position value use the 'echo_camera()' function available
 in the library which will output the camera vectors in the console windows.
 
 A basic example of this is (impose top view here rotation:[0,0,0]):
//Position camera at the program opening
first_view = $vpr==[55,0,25]; // Hack: default rotation vector signals program opening
//Camera distance
$vpd=first_view?4600:$vpd; 
//Camera translation
$vpt=first_view?[500,400,0]:$vpt; 
//Camera rotation
$vpr=first_view?[0,0,0]:$vpr;  
 
A more sophisticated exemple with multiples views defined in the customizer panel
/*[Camera]*/
//Enforce the camera position defined below - could be unactivated for animations
Enforce_camera_position=false; 
// The camera variables shall NOT be included in a module - a module CANNOT export variables
//View type if camera position is enforced
iview_type=0; //[0:3D view, 1:Top view, 2: Side view]
//X translation when view imposed
iview_x = -450;
//Impose camera position if rotation vector is default - to detect first startup
Cimp = Enforce_camera_position||$vpr==[55,0,25]; 
//Camera distance
//$vpd=Cimp?iview_type?8200:7200:$vpd; //with editor and console windows
$vpd=Cimp?iview_type?5500:4500:$vpd; //no window
//Camera translation 
$vpt=Cimp?[iview_x,0,750]:$vpt; 
//Camera rotation
$vpr=Cimp?(iview_type?(iview_type==1?[0,0,0]:[90,0,0]):[76,0,30]):(view_type?[0,0,0]:$vpr); 
//above force top view if we are displaying a projection
echo_camera(); // output actual camera vectors

Copyright (c) 2017-2019 Pierre ROUZEAU, AKA "PRZ"
Program license GPL v3
documentation licence cc BY-SA 4.0 and GFDL 1.2
