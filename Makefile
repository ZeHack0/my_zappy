## ----------------------------------------------------------------------------------- ##
##                                                                                     ##
## EPITECH PROJECT - Wed, May, 2026                                                    ##
## Title           - my_zappy                                                          ##
## Description     -                                                                   ##
##     Makefile                                                                        ##
##                                                                                     ##
## ----------------------------------------------------------------------------------- ##
##                                                                                     ##
##       _|_|_|_|  _|_|_|    _|_|_|  _|_|_|_|_|  _|_|_|_|    _|_|_|  _|    _|          ##
##       _|        _|    _|    _|        _|      _|        _|        _|    _|          ##
##       _|_|_|    _|_|_|      _|        _|      _|_|_|    _|        _|_|_|_|          ##
##       _|        _|          _|        _|      _|        _|        _|    _|          ##
##       _|_|_|_|  _|        _|_|_|      _|      _|_|_|_|    _|_|_|  _|    _|          ##
##                                                                                     ##
## ----------------------------------------------------------------------------------- ##

CXX      = g++
CXXFLAGS = -Wall -Wextra -g -std=c++17

UNAME := $(shell uname -s)

ifeq ($(UNAME), Darwin)
    BREW_PREFIX := $(shell brew --prefix 2>/dev/null || echo /usr/local)
    RAYLIB_CFLAGS := $(shell pkg-config --cflags raylib 2>/dev/null || echo -I$(BREW_PREFIX)/include)
    RAYLIB_LIBS   := $(shell pkg-config --libs   raylib 2>/dev/null || \
                       echo -L$(BREW_PREFIX)/lib -lraylib \
                            -framework OpenGL -framework Cocoa \
                            -framework IOKit -framework CoreVideo)
else
    RAYLIB_CFLAGS := $(shell pkg-config --cflags raylib 2>/dev/null || echo "")
    RAYLIB_LIBS   := $(shell pkg-config --libs   raylib 2>/dev/null || \
                       echo -lraylib -lGL -lm -lpthread -ldl -lrt -lX11)
endif

GUI_DIR    = GUI
IA_DIR     = IA
SERVER_DIR = SERVER

GUI_EXE    = $(GUI_DIR)/gui
IA_EXE     = $(IA_DIR)/ia
SERVER_EXE = $(SERVER_DIR)/server

GUI_SRC    = $(wildcard $(GUI_DIR)/src/*.cpp)
IA_SRC     = $(wildcard $(IA_DIR)/src/*.cpp)
SERVER_SRC = $(wildcard $(SERVER_DIR)/src/*.cpp)

GUI_OBJ    = $(GUI_SRC:.cpp=.o)
IA_OBJ     = $(IA_SRC:.cpp=.o)
SERVER_OBJ = $(SERVER_SRC:.cpp=.o)

GUI_INC    = -I$(GUI_DIR)/include    $(RAYLIB_CFLAGS)
IA_INC     = -I$(IA_DIR)/include
SERVER_INC = -I$(SERVER_DIR)/include

all: $(GUI_EXE) $(IA_EXE) $(SERVER_EXE)

$(GUI_EXE): $(GUI_OBJ)
	@mkdir -p $(GUI_DIR)
	$(CXX) -o $@ $^ $(RAYLIB_LIBS)
	@echo "✓ Built: $(GUI_EXE)"

$(IA_EXE): $(IA_OBJ)
	@mkdir -p $(IA_DIR)
	$(CXX) -o $@ $^
	@echo "✓ Built: $(IA_EXE)"

$(SERVER_EXE): $(SERVER_OBJ)
	@mkdir -p $(SERVER_DIR)
	$(CXX) -o $@ $^
	@echo "✓ Built: $(SERVER_EXE)"

$(GUI_DIR)/src/%.o: $(GUI_DIR)/src/%.cpp
	$(CXX) $(CXXFLAGS) $(GUI_INC) -c -o $@ $<

$(IA_DIR)/src/%.o: $(IA_DIR)/src/%.cpp
	$(CXX) $(CXXFLAGS) $(IA_INC) -c -o $@ $<

$(SERVER_DIR)/src/%.o: $(SERVER_DIR)/src/%.cpp
	$(CXX) $(CXXFLAGS) $(SERVER_INC) -c -o $@ $<

gui:    $(GUI_EXE)
ia:     $(IA_EXE)
server: $(SERVER_EXE)

clean:
	rm -f $(GUI_OBJ) $(IA_OBJ) $(SERVER_OBJ)
	@echo "✓ Cleaned: object files"

fclean: clean
	rm -f $(GUI_EXE) $(IA_EXE) $(SERVER_EXE)
	@echo "✓ Cleaned: all executables"

re: fclean all

.PHONY: all gui ia server clean fclean re
