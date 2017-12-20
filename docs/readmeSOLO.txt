DISTRIBUTION DISKETTE OF SELF-ORGANIZING FEATURE MAP WITH LINEAR OUTPUT (SOLO) 
TRAINING ALGORITHM
 
Kuo-lin Hsu, Hoshin V. Gupta, Xiaogang Gao, and  Soroosh Sorooshian
Department of Hydrology and Water Resources
The University of Arizona, Tucson, AZ 85721
E-mail:   hsu@hwr.arizona.edu
          hoshin@hwr.arizona.edu
          gao@hwr.arizona.edu
          soroosh@hwr.arizona.edu
 
I. DESCRIPTION OF THIS PROGRAM:

To use this program, you need to assign the number of input variables (nVars), 
the size of self-organizing feature map (n1 x n1), trained final SOFM weights 
from SOFM program, etc.  

II. FILES CONTAINED IN THIS PACKAGE:
    .txt:	readmeSOLO.txt (This file).
    .cc files:  LLSSearchClass.cc
		MATRIX.cc
		SOLO.cc
		cntProLSClass.cc
		matrixObj.cc
		readDataPC.cc
		sofmFreqClass.cc
    .c files:	corrcoef.c
		eigsrt.c
		gaussj.c
		jacobi.c
		nrutil.c
    .h files:	LLSSearchClass.h
		MATRIX.h
		cntProLSClass.h
		matrixObj.h
		nrutil.h
		readDataPC.h
		sofmFreqClass.h
    .inf file:	SOLO.inf
    .mak file:	SOLO.mak

III. HOW TO RUN THIS PROGRAM:
1. open a directory
 
2. copy files above in the directory
 
3. compile c files
   A "SOLO.mak" is included in the package.  If you use UNIX system with gcc and g++
        compilers, you may type "make -f SOLO.mak" in the above created directory.
        An executable file named "SOLO" will be generated.
 
4. Prepare input data:
   * Firstly, you need to create an input data file.  You may assign any name to
     your input data file.
   * This program is designed to approxiamte one output variable from multi-input 
     variables.
   * Data file contain "nVars" input variables, one output variable, and "nda"
     amount of data.  Format of the data file is arranged with "nVars+1" columns and "nda"
     rows, where data on [1 .. nVars] columns are associated to the input data and 
     the column nVars+1 is the output data.
   * An example shown in the accompanyed data file, "Hat.dat" in "./HatData"
     directory. This file contains two input and one output variables and 1681 data.
     
5. Prepare a file contains parameters used in the program:
   * In the next step, you need to prepare a "SOLO.inf" file that contains some 
     parameters used to control the SOLO program.
   * The name of this file is defaulted as "SOLO.inf".  Please see the 
     attached "SOLO.inf" file in this directory.
   * The "SOLO.inf" file contains data field below:
     1) nVars: total number of input variables.
     2) node:  size of SOFM (node x node)
     3) ndaFactor: At least a the number of data = ndaFactor * (nVars+1) should be
	included in the calculation of the connection weights of output linear weights.
	To find more reliable regression parameters, in general, we need to set
        training data with several (e.g. 5) times higher than the number
        regression parameters.  You may set the ndaFactor=5.
     4) fNameSOFM: a file name that stores the final trained weights of SOFM.  This file
        is obtained from the training result of SOFM package.  You may assign the 
        directory and file name (e.g. ./example/SOFM/som.o4) from the training result
	of the "SOFM" package.
     5) Nda: total number of training data.
     6) fNameData: a file name that stores training data (including the path of 
        the data file).
     7) fNameRange: a data file that stores the upper and lower bounds used for 
        normalizing input variables (including the path of the data file).
	This file contains "nVars" columns and two rows.  Where, "nVars" is the total
	number of input variables.  The first row is related to the maximum value and
	the second row contains the minimum value of each input varible.  Input data are
	normalized according to these Max-Min values.
     8) typeOfSimu: training or simulation? Type "training" in the training case.
	Always put "training" in executing "SOLO" program.
     9) iniSeed: a random seed for random number generation. (Any integer number will do)
    10) calThreshold: This variable is used in the "seqSOLO" program.  The "SOLO" package
	doesn't use this variable.  Just put "0" in the field.
    11) fNameEignValue: a file that stores output eigen values.  This file will be used to 
	store eigen values of orthogonal transformed input data.
    12) fNameEignVector: a file that stores output eigen vectors.  This file will be used to 
        store eigen vectors which are used to transfer input variables to orthogonal
        variables.
    13) fNameWout: a file that stores the calculated regression parameters.  This file store
	regression parameters of a linear input-output function of each SOFM node.
    14) fNameFreq: a file name that shows how many input data are classified in each SOFM node.
    15) fNameErrMap: a file name that stores the matching error of output data on each SOFM node.
    16) fNameFinResult: a file name that stores the training results of SOLO.  There are 
	three columns in this file.  The first column is the target data, the second 
	column is the simulated SOLO output, and the third column is the simulation error 
	of each data.

6. Run SOLO program:
   To run SOLO, just type "SOLO" in this directory.

IV: SIMULATION OUTPUT FILES:
    Several output files are generated from "SOLO".  The following output files will 
    be used for "validation" case study are listed below:

    trainWin.out: 
	This file contains the SOFM connection weights of inputs to each SOFM node.  
	Data in this file is the same as the connection weights trained SOFM network 
	("som.o4" in the example) in the "sofm" package.

    trainWout.out:
        This file name is assigned according to the name given in the field (13) of 
        "SOLO.inf". This file contains the training results of linear regression
        parameters of input and output variables on each SOFM node.
	
    freqTable.out: 
        This file name is assigned according to the name given in the field (14) 
	of "SOLO.inf". This file contains information about the number of 
	data located in each SOFM node, total number of trainin data, and the 
	root mean square error after tarining.

    eigenValue.out: 
        This file is assigned according to the name given in the field (11) 
	of the "SOLO.inf".  This file contains information about the eigen 
	values of input variables at each SOFM node.

    eigenVector.out: 
        This file is assigned according to the name given in the field (12) 
	of the "SOLO.inf". This file contains information about the eighen 
	vectors of inputs variable at each SOFM node.

