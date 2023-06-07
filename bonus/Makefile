NAME = ../libftprintf.a

CC = cc
CFLAGS = -Werror -Wall -Wextra

AR = ar
ARFLAGS = rcs

MAKE = make
MFLAGS = -C

RM = rm
RMFLAGS = -rf

CP = cp

BONUS_SRCS = \
check_options_bonus.c \
addr_bonus.c \
char_bonus.c \
hex_input_bonus.c \
hex_main_bonus.c \
nbr_check_options_bonus.c \
nbr_input_bonus.c \
nbr_main_bonus.c \
str_bonus.c \
ft_printf_bonus.c \
total_length_bonus.c
BONUS_OBJS = $(BONUS_SRCS:.c=.o)

LIBFT_DIR = ../libft
LIBFT_SRCS = \
../libft/ft_strlen.c
LIBFT_LIB = libft.a

all : $(NAME)

$(NAME) : $(BONUS_OBJS) $(LIBFT_SRCS)
	$(MAKE) $(MFLAGS) $(LIBFT_DIR) all
	$(CP) $(LIBFT_DIR)/$(LIBFT_LIB) ./$(NAME)
	$(AR) $(ARFLAGS) $@ $(BONUS_OBJS)

$(BONUS_OBJS) : $(BONUS_SRCS)
	$(CC) $(CFLAGS) -c $(BONUS_SRCS)

clean :
	$(MAKE) $(MFLAGS) $(LIBFT_DIR) clean
	$(RM) $(RMFLAGS) $(BONUS_OBJS)

fclean : clean
	$(MAKE) $(MFLAGS) $(LIBFT_DIR) fclean
	$(RM) $(RMFLAGS) $(NAME)

re : fclean all

.PHONY : all clean fclean re