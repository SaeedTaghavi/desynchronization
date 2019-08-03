# adding some comment
#
#by Saeed Taghavi

COMPILER = gfortran
FLAGS = -O0 
EXEFILE = main.exe
default: main clean

BASE = $(shell pwd)

clean: cleanPlots
	@echo "Cleaning ......"
	@rm -f $(BASE)/*.txt
	@rm -f $(BASE)/$(EXEFILE)
	@rm -f $(BASE)/output/*.txt
cleanPlots:
	@rm -f $(BASE)/plots/*.svg
	@rm -f $(BASE)/plots/*.eps
plot:
	@gnuplot $(BASE)/plots/plot.gpt
	@mv $(BASE)/*.svg $(BASE)/plots
	@mv $(BASE)/*.eps $(BASE)/plots
	
compile:
	@echo  "Compiling ...."
	@echo
	$(COMPILER) $(BASE)/src/*.f90 -o $(EXEFILE)

run: 
	@echo "running ...."
	$(BASE)/$(EXEFILE)
	@mkdir -p $(BASE)/output
	@mv $(BASE)/*.txt $(BASE)/output

# library directory

#LIBS = $(BASE)/lib

#sources directory

#SRC = $(BASE)/src

# include directory

#INCLDS = -I$(BASE)/include/ 

#LIB_FILE = $(LIBS)/lib_finazs.$(VERSION).a

#Sources = $(shell ls $(SRC))

#OBJS = $(Sources:.cpp=.o)

#SRC_CMP = $(Sources:%.cpp=$(SRC)/%.cpp)

#EXEFILE = $(BASE)/bin/FinAzS


#MAIN_SRC= $(BASE)/main/main.cpp
#MOBJ = main.o

# print:
# 	@echo $(Sources)
# 	@echo "--------------"
# 	@echo $(SRC_CMP)

# main: $(MOBJ) 
# 	@echo  "Compiling the main"
# 	@echo
# 	$(CC) $(LINK_FLAGS) $(MOBJ) $(LIB_FILE) -o $(EXEFILE)
# $(MOBJ):
# 	$(CC) $(CFLAGS) $(INCLDS) -c $(MAIN_SRC)

# lib:write libclean libmake clean

# write:
# 	@echo 
# 	@echo "-------------------------------------------"
# 	@echo 

# libclean:
# 	@echo "Removing the old library file......."
# 	rm -f $(LIB_FILE)

# libmake: makelib
# 	@echo "Making radom access to the library files ....."
# 	ranlib $(LIB_FILE)

# makelib:compile $(OBJS)
# 	@echo "Making library file ....."
# 	ar  $(LIBFLAGS) $(LIB_FILE) $(OBJS)

# compile:
# 	@echo "Compiling files for making library....."
# 	$(CC) $(CFLAGS) $(INCLDS) -c $(SRC_CMP)
# clean:
# 	@echo "Cleaning ......"
# 	@rm -f $(OBJS) $(MOBJ)

