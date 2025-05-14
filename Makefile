# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: keitabe <keitabe@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/14 17:09:03 by keitabe           #+#    #+#              #
#    Updated: 2025/05/14 18:31:43 by keitabe          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libftprintf.a
LIBFT_DIR := ../libft
LIBFT := $(LIBFT_DIR)/libft.a
CC := cc
CFLAGS := -Wall -Wextra -Werror
CFLAGS += -I. -I$(LIBFT_DIR)
AR := ar
ARFLAGS := rcs

SRCS =  ft_printf.c \
		ft_spec_char.c \
		ft_spec_hex.c \
		ft_spec_num.c \
		ft_spec_string_ptr.c \
		main.c
OBJS = $(SRCS:.c=.o)

all: $(NAME)

$(NAME):$(OBJS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

test: all
	$(MAKE) -C $(LIBFT_DIR)
	$(CC) $(CFLAGS) main.c $(NAME) $(LIBFT) -o test_printf

%.o: %.c ft_printf.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
