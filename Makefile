# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ahouel <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/03 08:37:55 by ahouel            #+#    #+#              #
#    Updated: 2019/08/07 18:25:02 by ahouel           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################# NAMES ########################################

CC = clang
CFLAGS = -Wall -Wextra -Werror
NAME = libft.a
SRC_PATH	= ./srcs/
OBJ_PATH	= ./objs/
INC_PATH	= ./includes/
INC_FILES	= ft_printf.h		\
			  get_next_line.h	\
			  libft.h

FCTS = ft_memset ft_bzero ft_memcpy ft_memccpy \
	   ft_memmove ft_memchr ft_memrchr ft_memcmp \
	   ft_strlen ft_strdup ft_strndup ft_strcpy \
	   ft_strncpy ft_strcat ft_strncat ft_strlcat \
	   ft_strchr ft_strrchr ft_strstr ft_strnstr \
	   ft_strcmp ft_strncmp ft_atoi ft_isalpha \
	   ft_isdigit ft_isalnum ft_isascii ft_isprint \
	   ft_toupper ft_tolower ft_memalloc ft_memdel \
	   ft_strnew ft_strdel ft_strclr ft_striter \
	   ft_striteri ft_strmap ft_strmapi ft_strequ \
	   ft_strnequ ft_strsub ft_strjoin ft_strtrim \
	   ft_strsplit ft_itoa ft_putchar ft_putstr \
	   ft_putendl ft_putnbr ft_putchar_fd ft_putstr_fd \
	   ft_putendl_fd ft_putnbr_fd ft_lstnew ft_lstdelone \
	   ft_lstdel ft_lstadd ft_lstiter ft_lstmap \
	   ft_swap ft_sqrt ft_cswap ft_strrev ft_div_mod \
	   ft_factorial ft_putlst get_next_line \
	   ft_lldtoa_base ft_ulldtoa_base ft_wctomb \
	   ft_wstrtostr ft_wstrlen ft_strnlen ft_abs \
	   ft_stradd ft_memjoin \
	   ft_printf pf_args pf_get_convert pf_get_flags \
	   pf_get_lenght pf_get_precision pf_get_width \
	   pf_convert_nbr pf_convert_char pf_convert_ptr \
	   pf_apply_flag pf_apply_precision pf_apply_width \
	   pf_apply_color pf_memjoin2 pf_dispatch_convert \
	   ft_reader ft_malloc_2d ft_free_2d ft_str_isdigit \
	   ft_bswap ft_iswhitespace ft_tablen ft_strfulltrim

SRCS_FILES = $(addsuffix .c, $(FCTS))
SRC = $(addprefix $(SRC_PATH), $(SRCS))

OBJ_NAMES = $(SRCS_FILES:.c=.o)
OBJ_FILES = $(addprefix $(OBJ_PATH), $(OBJ_NAMES))


################################ COLORS #######################################

NORMAL = "\033[0m"
BOLD = "\033[1m"
YELLOW = "\033[0;33m"
RED = "\033[0;31m"
GREEN = "\033[0;32m"
BLUE = "\033[0;34m"
CYAN = "\033[0;36m"
MAGENTA = "\033[0;35m"
UP = "\033[A"
CUT = "\033[K"

################################ RULES ########################################

all : $(NAME)

$(OBJ_PATH):
	@mkdir $(OBJ_PATH) 2> /dev/null || true

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@echo $(BLUE)Compilation of $(BOLD)$(notdir $<)$(BLUE) ...$(NORMAL)
	@$(CC) $(CFLAGS) -MMD -c $< -o $@ -I $(INC_PATH)
	@echo $(UP)$(CUT)$(UP)

$(NAME) : $(LIB) $(OBJ_PATH) $(OBJ_FILES) $(addprefix $(INC_PATH), $(INC_FILES))
	@ar rc $(NAME) $(OBJ_FILES)
	@ranlib $(NAME)
	@echo $(GREEN)Compilation of $(BOLD)$(notdir $(NAME))$(GREEN) done.$(NORMAL)

clean :
	@rm -rf $(OBJ_PATH)

fclean : clean
	@rm -f $(NAME)

re : fclean all

.PHONY: all clean fclean re
