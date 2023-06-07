NAME = libftprintf.a

CC = cc
CFLAGS = -Werror -Wall -Wextra

AR = ar
ARFLAGS = rcs

MAKE = make
MFLAGS = -C

RM = rm
RMFLAGS = -rf

CP = cp

LIBFT_SRCS = \
libft/ft_strlen.c

MANDATORY_DIR = mandatory
MANDATORY_SRCS = \
mandatory/ft_printf.c \
mandatory/print_addr.c \
mandatory/print_char.c \
mandatory/print_hex.c \
mandatory/print_nbr_u.c \
mandatory/print_nbr.c \
mandatory/print_str.c
MANDATORY_OBJS = $(MANDATORY_SRCS:.c=.o)

BONUS_DIR = bonus
BONUS_SRCS = \
bonus/check_options_bonus.c \
bonus/addr_bonus.c \
bonus/char_bonus.c \
bonus/hex_input_bonus.c \
bonus/hex_main_bonus.c \
bonus/nbr_check_options_bonus.c \
bonus/nbr_input_bonus.c \
bonus/nbr_main_bonus.c \
bonus/str_bonus.c \
bonus/ft_printf_bonus.c \
bonus/total_length_bonus.c
BONUS_OBJS = $(BONUS_SRCS:.c=.o)

ifdef WITH_BONUS
	FINAL_DIR = $(BONUS_DIR)
else
	FINAL_DIR = $(MANDATORY_DIR)
endif

ifdef WITH_BONUS
	FINAL_SRCS = $(BONUS_SRCS)
else
	FINAL_SRCS = $(MANDATORY_SRCS)
endif

ifdef WITH_BONUS
	FINAL_OBJS = $(BONUS_OBJS)
else
	FINAL_OBJS = $(MANDATORY_OBJS)
endif

all : $(NAME)
bonus : 
	make WITH_BONUS=1 all

$(NAME) : $(FINAL_OBJS) $(FINAL_SRCS) $(LIBFT_SRCS)

$(FINAL_OBJS) : $(FINAL_SRCS)
	$(MAKE) $(MFLAGS) $(FINAL_DIR) all

clean :
	$(MAKE) $(MFLAGS) $(MANDATORY_DIR) clean
	$(MAKE) $(MFLAGS) $(BONUS_DIR) clean


fclean : clean
	$(MAKE) $(MFLAGS) $(MANDATORY_DIR) fclean
	$(MAKE) $(MFLAGS) $(BONUS_DIR) fclean
	$(RM) $(RMFLAGS) $(NAME)

re : fclean all

.PHONY : all bonus clean fclean re