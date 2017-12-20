TARGET	= 	sofm
SOURCE	= 	readDataPC.cc MATRIX.cc sofm.cc

OBJ	=	$(SOURCE:%.cc=%.o)
CXX 	= 	/usr/bin/g++ -g -Wall -I.
LIB	=	-lm
RM	=	rm -f

$(TARGET)	: $(OBJ)
		  $(CXX) -o $(TARGET) $(OBJ) $(LIB)

clean 		: $(RM) $(TARGET) $(OBJ)

%.o		: %.cc 
		  $(CXX) -c $< -o $@
