rem printable/cuttable part batch generator for OpenSCAD (Windows)
rem Author: Pierre ROUZEAU AKA 'PRZ' licence GPL 2 or above for this generator and Openscad associated modules
rem you can create .stl for printing, .dxf for cutting, .png images or .echo for boms, lists or specifications
rem this use batch generator in the openscad files themselves - have a look in .scad file
rem this can also use customizer data sets, provided you remove the 'part' variable in datasets in '.json' file
rem customizer dataset name shall be empty when no dataset is used
rem to extract multiple customizer datasets, you can create multiples batches as dataset is a variable which shall be set in the part selector
rem /w option in 'start' command command wait the end of execution before continuing next line
rem you have to run the batch to create stl, dxf or png files after creating them
rem note that if you scad file cannot parse, the files won't be created
rem you shall not "echo" anything else than the batch commands when creating them 
rem - so you can create a "myecho" module to not display echo when needed
rem note that sometimes when having a scad file calling another scad, the selector variable name shall be modified in a specific file (e.g. being 'spart' instead of 'part') and the scad generator module shall be adapted
rem some modifications may be done for this to work on Linux (Or Apple OS) - tested only on Windows
rem openscad export work only when directory exists, hence create them first in this batch file ('md' command)
rem remember when naming files/directories that openscad IS case sensitive
rem This is an example that you shall modify to your needs. This files may be placed in same directory as your .scad files
rem you can create as many directories or sets as needed for sizes, alternatives or options

md STL
md DXF
md TEXTS
md PNG
md DATA1
start /w c:"\Program Files\OpenSCAD\openscad.exe" -o batch_parts_set.echo -D batchnum=1 batch_create.scad
start /w c:"\Program Files\OpenSCAD\openscad.exe" -o batch_dxfs.echo -D batchnum=2 batch_create.scad
start /w c:"\Program Files\OpenSCAD\openscad.exe" -o batch_texts.echo -D batchnum=3 batch_create.scad
start /w c:"\Program Files\OpenSCAD\openscad.exe" -o batch_images.echo -D batchnum=4 batch_create.scad
start /w c:"\Program Files\OpenSCAD\openscad.exe" -o batch_dataset1.echo -D batchnum=5 batch_create.scad
del batch_parts_set.bat
ren batch_parts_set.echo batch_parts_set.bat
del batch_dxfs.bat
ren batch_dxfs.echo batch_dxfs.bat
del batch_texts.bat
ren batch_texts.echo batch_texts.bat
del batch_images.bat
ren batch_images.echo batch_images.bat
del batch_dataset1.bat
ren batch_dataset1.echo batch_dataset1.bat
