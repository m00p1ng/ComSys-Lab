**Your task:**

Create count_grey.py that reads images below,
and count the number of pixels that have  rgb values
more than grey. Report the total number of pixels totally for all these files.

Code to read into rgb 

http://knowpapa.com/opencv-rgb-split/

Note there are some errors in this code. You have to fix it.
Then modify it  to look for  the pixel that have grey color whose rgb is rgb(128,128,128) in decimal.
Your program will only report on the number of pixels that has rgb values more than 128,128,128.

Test on the directory containing  image files below.

Run the python code using docker command.

1. submit Dockfile

2. submit python code named "countgrey.py" which counts all grey pixels for all image files below.
(Either 1) run pythonfile with one filename argument and put the shell script to iterate to all the files (here you need to submit the shell script too)
or 2) run pythonfile for the whole files in a given input directory.)

3. submit the command line to run your python code and/or shell script via docker in textfile called "command.txt".

4. README file containing  student ID and student name
Gzip all into zip file and send the link to zip file.

(More reading:
https://docs.python.org/3/library/functions.html
https://docs.scipy.org/doc/numpy/reference/generated/numpy.ndarray.shape.html
)
