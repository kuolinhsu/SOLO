TARGET	= 	seqsolo
SOURCE	= 	cntProLSClass.cc readDataPC.cc MATRIX.cc seqsolo.cc

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
