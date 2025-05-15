# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: keitabe <keitabe@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/14 17:09:03 by keitabe           #+#    #+#              #
#    Updated: 2025/05/15 17:26:13 by keitabe          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME       := libftprintf.a
LIBFT_DIR  := libft
LIBFT      := $(LIBFT_DIR)/libft.a

CC         := cc
CFLAGS     := -Wall -Wextra -Werror -I. -Ilibft
AR         := ar
ARFLAGS    := rcs

SRCS =  ft_printf.c \
		ft_spec_char.c \
		ft_spec_hex.c \
		ft_spec_num.c \
		ft_spec_string_ptr.c

LIBFT_SRCS := \
	libft/ft_atoi.c \
	libft/ft_calloc.c \
	libft/ft_isalnum.c \
	libft/ft_isalpha.c \
	libft/ft_isprint.c \
	libft/ft_bzero.c \
	libft/ft_itoa.c \
	libft/ft_memchr.c \
	libft/ft_memcmp.c \
	libft/ft_memcpy.c \
	libft/ft_memmove.c \
	libft/ft_memset.c \
	libft/ft_putchar_fd.c \
	libft/ft_putendl_fd.c \
	libft/ft_putnbr_fd.c \
	libft/ft_putstr_fd.c \
	libft/ft_split.c \
	libft/ft_strchr.c \
	libft/ft_strdup.c \
	libft/ft_striteri.c \
	libft/ft_strjoin.c \
	libft/ft_strlcat.c \
	libft/ft_strlcpy.c \
	libft/ft_strlen.c \
	libft/ft_strmapi.c \
	libft/ft_strncmp.c \
	libft/ft_strnstr.c \
	libft/ft_strrchr.c \
	libft/ft_strtrim.c \
	libft/ft_substr.c \
	libft/ft_toupper.c \
	libft/ft_tolower.c \
	libft/ft_isdigit.c \
	libft/ft_isascii.c \
	libft/ft_lstnew_bonus.c \
	libft/ft_lstadd_front_bonus.c \
	libft/ft_lstsize_bonus.c \
	libft/ft_lstlast_bonus.c \
	libft/ft_lstadd_back_bonus.c \
	libft/ft_lstdelone_bonus.c \
	libft/ft_lstclear_bonus.c \
	libft/ft_lstiter_bonus.c \
	libft/ft_lstmap_bonus.c

OBJS := $(SRCS:%.c=%.o)

LIBFT_OBJ := $(LIBFT_SRCS:%.c=%.o)

all: $(NAME)

$(NAME):$(OBJS) $(LIBFT_OBJ)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS) $(LIBFT_OBJ)

%.o: %.c ft_printf.h libft/libft.h
	$(CC) $(CFLAGS) -c $< -o $@

libft/%.o: libft/%.c libft/libft.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(LIBFT_OBJ)

fclean: clean
	rm -f $(NAME) $(LIBFT_OBJ)

re: fclean all

.PHONY: all clean fclean re $(LIBFT_DIR)
