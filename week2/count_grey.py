#!/usr/bin/env python2
import sys
import os
import numpy as np
import cv2

def split_into_rgb_channels(image):
    red = image[:,:,2]
    green = image[:,:,1]
    blue = image[:,:,0]
    return red, green, blue

def main():
    imagesdir = os.path.abspath(os.path.join(os.curdir, 'images'))
    print "Searching for images in {} Directory".format(imagesdir)
    exts = ['.bmp', '.pbm', '.pgm', '.ppm', '.sr', '.ras', '.jpeg', '.jpg', '.jpe', '.jp2', '.tiff', '.tif', '.png']

    for dirname, dirnames, filenames in os.walk(imagesdir):
        for filename in filenames:
            name, ext = os.path.splitext(filename)

            if ext in exts:
                img = cv2.imread(os.path.join(dirname, filename))
                red, green, blue = split_into_rgb_channels(img)

                row, col = red.shape

                print "\nFilename:", filename
                print "Dimension: %dx%d" % (row, col)
                print "Total point: {:,}".format(row*col)
                count_grey = 0

                for i in range(row):
                    for j in range(col):
                        if red[i,j] > 128 and green[i,j] > 128 and blue[i,j] > 128:
                            count_grey += 1
                            sys.stdout.write('\rGrey point: {:,}'.format(count_grey))
                            sys.stdout.flush()
                print

if __name__ == "__main__":
    main()
