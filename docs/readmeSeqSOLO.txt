DISTRIBUTION DISKETTE OF SEQUENTIAL TRAINING OF SELF-ORGANIZING FEATURE MAP 
WITH LINEAR OUTPUT (SeqSOLO) TRAINING ALGORITHM

Kuo-lin Hsu, Hoshin V. Gupta, Xiaogang Gao, and  Soroosh Sorooshian
Department of Hydrology and Water Resources
The University of Arizona, Tucson, AZ 85721
E-mail:   hsu@hwr.arizona.edu
          hoshin@hwr.arizona.edu
          gao@hwr.arizona.edu
          soroosh@hwr.arizona.edu

This package is used for the sequential training (or validation) 
of a Self-Organizing feature map with Linear Output (SOLO) network.

I. DESCRIPTION OF THIS PROGRAM:
To use this program, you need to assign the number of input variables (nVars),
the size of self-organizing feature map (n1 x n1), trained SOFM weights SOFM
program, etc.

II. FILES CONTAINED IN THIS PACKAGE:
	.txt	readmeSeqSOLO.txt
	.cc	MATRIX.cc
		cntProLSClass.cc
		readDataPC.cc
		seqSOLO.cc
	.h	MATRIX.h
		cntProLSClass.h
		readDataPC.h
	.inf	learningRate.inf
		seqSOLO.inf
	.mak	seqSOLO.mak


III. HOW TO RUN THIS PROGRAM:
1. open a directory

2. copy files above in the directory

3. compile cc files
   A "seqSOLO.mak" is included in the package.  If you use UNIX system with g++
        compiler, you may type "make -f seqSOLO.mak" in the above created directory.
        An executable file named "seqSOLO" will be generated.

4. Prepare input data:
   * First you need to create an input data file.  You may assign any name to
     your input data file.
   * This program is designed to approxiamte one output variable from multi-input
     variables.
   * If the data file contain "nVars" input variables, one output variable, and "nda"
     amount of data, the data file is arranged as "nVars+1" columns and "nda"
     rows, where data on [1 .. nVars] columns are realted to the input data and
     column nVars+1 is associated to the output data.
   * If partially or all output data are not available, you can set a special float 
     value (such as -9999.0) in the output data fields.  This "no observation data"
     flag can be defined by the user and then assign it in the input field of 
     "seqSOLO.inf" file later.
   * A data example "Hat.dat" is listed in the "./HatData/ subdirectory.
     This data set contains two input and one output variables and 1681 data.

5. Prepare an information file:
   Two seperated files are required in setting "seqSOLO" program.
   Theeir file names are defaulted as:  "learningRate.inf" and "seqSOLO.inf".

   ++++++++++++++++++++
   seqSOLO.inf:
   ++++++++++++++++++++
   The "seqSOLO.inf" contains data fields below:
     1) nVars: total number of input variables. 
     2) node:  size of SOFM (node x node)
     3) ndaFactor: 
	* This variable won't be used in seqentail training program (seqSOLO).
	  so, just put any integer number (e.g. 0) in this data field.
     4) fNameSOFM: path and name of trained SOFM.  This file basically 
	is obtained from the training result of SOFM package.  You may assign the 
	path and file name of the "SOFM" training result of the "SOFM" 
	package in this field. (e.g. ./example/SOFM/som.o4)
     5) Nda: number of simulation data.
     6) fNameData: path and file name of training or validation data
	(e.g. ./HatData/Hat.dat).
     7) fNameRange: a file name contains data used to normalize input variables 
        (e.g. ./HatData/rangeMaxMin.dat)
        This file contains "nVars" columns and two rows.  Where, "nVars" is the total
        number of input variables.  The first row is related to the maximum value and
        the second row contains the minimum value of each input varible for normalizing
        each input variable.
     8) typeOfSimu: training or simulation? 
        Always put "simulation" in executing "seqSOLO" program.
     9) iniSeed: a random seed for random number generation. (Any integer number will do)
    10) calThreshold: Set "0" means all the SOFM nodes are used in the simulation.  
        This variable is used in the simulation case.  If a value such as
	"3" is set in this variable, it means that at the SOFM nodes with at least 3 data 
	available in the "SOLO" training are selected in the simulation.  All the SOFM 
	nodes with data number less than "3" in the training process will not be used.
	The program automatically find the next closest SOFM node that has SOLO data number 
	higher than "3" for generating model output.
        Set "0" means all the SOFM nodes are used in the simulation.  
    11) fNameEignValue: data path and the file name of the eigen values from
	the SOLO training program. (e.g. ./example/SOLO/eigenValue.out)
    12) fNameEignVector: data path and the file name of the eigen vectors 
        from the SOLO training program. (e.g. ./example/SOLO/eigenVector.out)
    13) fNameWout: data path and the file name of the linear regression parameters 
        from the SOLO training program. (e.g. ./example/SOLO/trainWout.out)
    14) fNameFreq: a file that stores a data table showing how many input data is located 
        in each SOFM node for SOLO training (e.g. ./example/SOLO/freqTable.out)
    15) fNameErrMap: a file that stores matching error of each SOFM node. 
    16) fNameFinResult: a file that stores the simulation results of seqSOLO.  
	Just put any name on this field and this file won't be used from the 
	"seqSOLO" program.
    17) noObsData: a float value showing the condition that
	observation data is not available.  (e.g. -9999.0)
	For consistency, be sure to put the same flag value in the data file 
	when the observation is not available.  

   ++++++++++++++++++++
   leaninfRate.inf
   ++++++++++++++++++++
    The "learningRate.inf" contains information below:
    1) 	learningRate: learning step size of sequential training; value is in [0.0  1.0].
	Put 0.0 if you want to generate a simulation results from fixed parameters.
    2)	iteration: the number of iterations for sequential training the data.

6. Run seqSOLO program:
   To run seqSOLO, just type "seqSOLO" in this directory.

IV: SIMULATION OUTPUT FILES:
    Several output files are generated from "SOLO".  The following output files will
    be used for later simulation study are described below:


    1)	seqOut0.out: This file produce output from fixed parameters (connection weights)
	before sequential training.  The first column is the observation (target), the
	second column is the simulated output, and the third column is the simulation
	error.  When the observation is not available, the missing data flag is 
	placed and the simulation error is set to 0.0.

    2) seqOut1.out: This file produce output during the sequential training prcess with
	training parameters varys according to the training data order and the seting
	learning rate. The first column is the observation (target), the
        second column is the simulated output, and the third column is the simulation 
        error.  When the observation is not available, the missing data flag is 
        placed and the simulation error is set to 0.0.

    3) seqOut2.out: This file produce output from fixed parameters (connection weights)
        after sequential training is completed. 
	The first column is the observation (target), the 
        second column is the simulated output, and the third column is the simulation 
        error.  When the observation data is not available, the missing data flag is 
        placed and the simulation error is set to 0.0.

    4) seqFreqMap.out: This file contains information about the number of
       simulation data located in each SOFM node.

    5) seqHidOutW.out: This file contains the updated linear 
	regression parameters on each SOFM node after sequential training.



