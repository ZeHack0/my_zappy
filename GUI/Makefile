## ----------------------------------------------------------------------------------- ##
##                                                                                     ##
## EPITECH PROJECT - Sat, Jun, 2026                                                    ##
## Title           - my_zappy                                                          ##
## Description     -                                                                   ##
##     Makefile                                                                        ##
##                                                                                     ##
## ----------------------------------------------------------------------------------- ##
##                                                                                     ##
##         ░        ░       ░░        ░        ░        ░░      ░░  ░░░░  ░            ##
##         ▒  ▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒  ▒  ▒▒▒▒  ▒            ##
##         ▓      ▓▓▓       ▓▓▓▓▓  ▓▓▓▓▓▓▓  ▓▓▓▓      ▓▓▓  ▓▓▓▓▓▓▓        ▓            ##
##         █  ███████  ██████████  ███████  ████  ███████  ████  █  ████  █            ##
##         █        █  ███████        ████  ████        ██      ██  ████  █            ##
##                                                                                     ##
## ----------------------------------------------------------------------------------- ##

NAME    = gui

CXX     = g++
CXXFLAGS = -Wall -Wextra -std=c++17

UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
	CXXFLAGS += -I/usr/local/include -I/opt/homebrew/include
	LDFLAGS = -L/usr/local/lib -L/opt/homebrew/lib -lraylib -framework OpenGL -framework Cocoa -lm -lpthread
else
	CXXFLAGS += -I/usr/include -I/usr/local/include
	LDFLAGS = -L/usr/lib -L/usr/local/lib -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
endif

SRCS    = src/Main.cpp
OBJS    = $(SRCS:.cpp=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(CXX) $(OBJS) -o $(NAME) $(LDFLAGS)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re