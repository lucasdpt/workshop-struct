##
## EPITECH PROJECT, 2023
## workshop-struct
## File description:
## Makefile - Lucas Dupont
##

NAME = my_struct

SRC =	src/main.c

OBJ = $(SRC:.c=.o)

CFLAGS = -I./include -Wall -Wextra

all: $(NAME)

$(NAME): $(OBJ)
	gcc -o $(NAME) $(OBJ) $(CFLAGS)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all