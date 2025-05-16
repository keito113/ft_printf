# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: keitabe <keitabe@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/14 17:09:03 by keitabe           #+#    #+#              #
#    Updated: 2025/05/16 10:07:51 by keitabe          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME       := libftprintf.a
LIBFT_DIR  := libft_submit
LIBFT      := $(LIBFT_DIR)/libft_submit.a

CC         := cc
CFLAGS     := -Wall -Wextra -Werror -I. -Ilibft_submit
AR         := ar
ARFLAGS    := rcs

SRCS =  ft_printf.c \
		ft_spec_char.c \
		ft_spec_hex.c \
		ft_spec_num.c \
		ft_spec_string_ptr.c

LIBFT_SRCS := \
	libft_submit/ft_atoi.c \
	libft_submit/ft_calloc.c \
	libft_submit/ft_isalnum.c \
	libft_submit/ft_isalpha.c \
	libft_submit/ft_isprint.c \
	libft_submit/ft_bzero.c \
	libft_submit/ft_itoa.c \
	libft_submit/ft_memchr.c \
	libft_submit/ft_memcmp.c \
	libft_submit/ft_memcpy.c \
	libft_submit/ft_memmove.c \
	libft_submit/ft_memset.c \
	libft_submit/ft_putchar_fd.c \
	libft_submit/ft_putendl_fd.c \
	libft_submit/ft_putnbr_fd.c \
	libft_submit/ft_putstr_fd.c \
	libft_submit/ft_split.c \
	libft_submit/ft_strchr.c \
	libft_submit/ft_strdup.c \
	libft_submit/ft_striteri.c \
	libft_submit/ft_strjoin.c \
	libft_submit/ft_strlcat.c \
	libft_submit/ft_strlcpy.c \
	libft_submit/ft_strlen.c \
	libft_submit/ft_strmapi.c \
	libft_submit/ft_strncmp.c \
	libft_submit/ft_strnstr.c \
	libft_submit/ft_strrchr.c \
	libft_submit/ft_strtrim.c \
	libft_submit/ft_substr.c \
	libft_submit/ft_toupper.c \
	libft_submit/ft_tolower.c \
	libft_submit/ft_isdigit.c \
	libft_submit/ft_isascii.c \
	libft_submit/ft_lstnew_bonus.c \
	libft_submit/ft_lstadd_front_bonus.c \
	libft_submit/ft_lstsize_bonus.c \
	libft_submit/ft_lstlast_bonus.c \
	libft_submit/ft_lstadd_back_bonus.c \
	libft_submit/ft_lstdelone_bonus.c \
	libft_submit/ft_lstclear_bonus.c \
	libft_submit/ft_lstiter_bonus.c \
	libft_submit/ft_lstmap_bonus.c

OBJS := $(SRCS:%.c=%.o)

LIBFT_OBJ := $(LIBFT_SRCS:%.c=%.o)

all: $(NAME)

$(NAME):$(OBJS) $(LIBFT_OBJ)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS) $(LIBFT_OBJ)

%.o: %.c ft_printf.h libft_submit/libft.h
	$(CC) $(CFLAGS) -c $< -o $@

libft_submit/%.o: libft_submit/%.c libft_submit/libft.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(LIBFT_OBJ)

fclean: clean
	rm -f $(NAME) $(LIBFT_OBJ)

re: fclean all

.PHONY: all clean fclean re $(LIBFT_DIR)
