#!/usr/bin/python

import sys
import os
from numpy import matrix
from numpy import linalg
from numpy import sort
import math

if len(sys.argv)<2:
    print(sys.argv[0]," <inputFile> <outputFile> ")
    sys.exit()


# Location of triangle corners
x1c = matrix( [ 0.0 , 0.0 ] )
x2c = matrix( [ 1.0 , 0.0 ] )
x3c = matrix( [ 0.5 , math.sqrt(3.0)/2.0 ] )


# Open inputFile for pre-processing
inputFile = open(sys.argv[1],'rb')

# List of y-points
yGridPoints = []

# Number of gridPoints
numGridPoints = 0

counter = 0
# Read input file for pre-processing
for string in inputFile:
    splitString = str(string).split(',')
    
    if counter > 0:
        yCoordinate = float(splitString[26]) 
	#if ((yCoordinate > 1.0e-9) and (yCoordinate < (2.0 - 1.0e-9))):
        if ((yCoordinate > 1.0e-9) and (yCoordinate < (1.0 + 1.0e-9))):
            notInTheList = True
            for v in yGridPoints:
               if abs(v - yCoordinate) < 1.0e-9:
                  notInTheList = False
            if notInTheList:      
               yGridPoints.append(yCoordinate)
               numGridPoints += 1

    counter += 1

#print 'Number of gridpoints in y-direction:'
#print numGridPoints
#print 'Y-coordinate of gridpoints:'
#yGridPoints.sort()
#for v in yGridPoints:
#   print v

# Close input file for pre-processing
inputFile.close()


# Open output file
outputFile = open(sys.argv[2],'w')

# Header line
headerString = '# X  Y  Z  STRESS_X  STRESS_Y'
#print headerString

outputFile.write(headerString)
outputFile.write('\n') 


# Start processing
for yGridPoint_i in range(0, numGridPoints):

    yGridPoint_value = yGridPoints[yGridPoint_i]
    #print yGridPoint_value		    

    # Open inputFile for processing
    inputFile = open(sys.argv[1],'rb')

    numRows = 0.0

    avgVariable_0 = 0.0
    avgVariable_1 = 0.0
    avgVariable_2 = 0.0
    avgVariable_3 = 0.0
    avgVariable_4 = 0.0
    avgVariable_5 = 0.0
    avgVariable_6 = 0.0
    avgVariable_7 = 0.0
    avgVariable_8 = 0.0
    avgVariable_9 = 0.0
    avgVariable_10 = 0.0
    avgVariable_11 = 0.0
    avgVariable_12 = 0.0
    avgVariable_13 = 0.0
    avgVariable_14 = 0.0
    avgVariable_15 = 0.0
    avgVariable_16 = 0.0
    avgVariable_17 = 0.0
    avgVariable_18 = 0.0
    avgVariable_19 = 0.0
    avgVariable_20 = 0.0
    avgVariable_21 = 0.0
    avgVariable_22 = 0.0
    avgVariable_23 = 0.0
    avgVariable_24 = 0.0
    avgVariable_25 = 0.0
    avgVariable_26 = 0.0
    avgVariable_27 = 0.0

    counter = 0
    # Read input file for processing
    for string in inputFile:
        splitString = str(string).split(',')
    
        if counter > 0:
            if abs(yGridPoint_value - float(splitString[26])) < 1.0e-9:
                avgVariable_0 += float(splitString[0])
                avgVariable_1 += float(splitString[1])
                avgVariable_2 += float(splitString[2])
                avgVariable_3 += float(splitString[3])
                avgVariable_4 += float(splitString[4])
                avgVariable_5 += float(splitString[5])
                avgVariable_6 += float(splitString[6])
                avgVariable_7 += float(splitString[7])
                avgVariable_8 += float(splitString[8])
                avgVariable_9 += float(splitString[9])
                avgVariable_10 += float(splitString[10])
                avgVariable_11 += float(splitString[11])
                avgVariable_12 += float(splitString[12])
                avgVariable_13 += float(splitString[13])
                avgVariable_14 += float(splitString[14])
                avgVariable_15 += float(splitString[15])
                avgVariable_16 += float(splitString[16])
                avgVariable_17 += float(splitString[17])
                avgVariable_18 += float(splitString[18])
                avgVariable_19 += float(splitString[19])
                avgVariable_20 += float(splitString[20])
                avgVariable_21 += float(splitString[21])
                avgVariable_22 += float(splitString[22])
                avgVariable_23 += float(splitString[23])
                avgVariable_24 += float(splitString[24])
                avgVariable_25 += float(splitString[25])
                avgVariable_26 += float(splitString[26])
                avgVariable_27 += float(splitString[27])

                numRows += 1.0

        counter += 1

    avgVariable_0 *= 1.0/numRows
    avgVariable_1 *= 1.0/numRows
    avgVariable_2 *= 1.0/numRows
    avgVariable_3 *= 1.0/numRows
    avgVariable_4 *= 1.0/numRows
    avgVariable_5 *= 1.0/numRows
    avgVariable_6 *= 1.0/numRows
    avgVariable_7 *= 1.0/numRows
    avgVariable_8 *= 1.0/numRows
    avgVariable_9 *= 1.0/numRows
    avgVariable_10 *= 1.0/numRows
    avgVariable_11 *= 1.0/numRows
    avgVariable_12 *= 1.0/numRows
    avgVariable_13 *= 1.0/numRows
    avgVariable_14 *= 1.0/numRows
    avgVariable_15 *= 1.0/numRows
    avgVariable_16 *= 1.0/numRows
    avgVariable_17 *= 1.0/numRows
    avgVariable_18 *= 1.0/numRows
    avgVariable_19 *= 1.0/numRows
    avgVariable_20 *= 1.0/numRows
    avgVariable_21 *= 1.0/numRows
    avgVariable_22 *= 1.0/numRows
    avgVariable_23 *= 1.0/numRows
    avgVariable_24 *= 1.0/numRows
    avgVariable_25 *= 1.0/numRows
    avgVariable_26 *= 1.0/numRows
    avgVariable_27 *= 1.0/numRows

    # Reynolds stresses stuff

    # Calculate Reynolds stress tensor
    reynolds_stress_tensor = matrix( [[ avgVariable_8 , avgVariable_9 , avgVariable_10 ],[ avgVariable_9 , avgVariable_11 , avgVariable_12 ],[ avgVariable_10 , avgVariable_12 , avgVariable_13 ]])

    # Calculate trace
    trace = avgVariable_8 + avgVariable_11 + avgVariable_13 + 1.0e-20

    # Calculate anisotropy tensor
    anisotropy_tensor = (1.0/trace)*reynolds_stress_tensor - (1.0/3.0)*matrix( [[ 1.0 , 0.0 , 0.0 ],[ 0.0 , 1.0 , 0.0 ],[ 0.0 , 0.0 , 1.0 ]])

    # Calculate tensor eigenvalues
    eigenvalues_anisotropy_tensor = linalg.eigvalsh(anisotropy_tensor)
    sorted_eigenvalues_anisotropy_tensor = sorted(eigenvalues_anisotropy_tensor, reverse=True)

    # Calculate barycentric map points
    x = x1c*( sorted_eigenvalues_anisotropy_tensor[0] - sorted_eigenvalues_anisotropy_tensor[1] ) + x2c*( 2.0*sorted_eigenvalues_anisotropy_tensor[1] - 2.0*sorted_eigenvalues_anisotropy_tensor[2] ) + x3c*( 3.0*sorted_eigenvalues_anisotropy_tensor[2] + 1 )

    # Create string
    string = '%f  %f  %f  %f  %f' %(avgVariable_25, avgVariable_26, avgVariable_27, x.item(0), x.item(1))
    print(string)

    outputFile.write(string)
    outputFile.write('\n')


    # Close input file for processing
    inputFile.close()


# Close output file
outputFile.close()
