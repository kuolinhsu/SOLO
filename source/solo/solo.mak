TARGET	= 	solo
SOURCE	= 	MATRIX.cc \
		cntProLSClass.cc LLSSearchClass.cc \
		matrixObj.cc solo.cc readDataPC.cc sofmFreqClass.cc \
		corrcoef.c eigsrt.c gaussj.c jacobi.c nrutil.c

TMPOBJ	=	$(SOURCE:%.cc=%.o)
OBJ	=	$(TMPOBJ:%.c=%.o)
CC 	= 	/usr/bin/gcc -g -Wall -I.
CXX 	= 	/usr/bin/g++ -g -Wall -I.
LIB	=	-lm
RM	=	rm -f

$(TARGET)	: $(OBJ)
		  $(CXX) -o $(TARGET) $(OBJ) $(LIB)

clean 		: $(RM) $(TARGET) $(OBJ)

%.o		: %.cc 
		  $(CXX) -c $< -o $@
%.o		: %.c 
		  $(CC) -c $< -o $@
