# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gricquie <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/21 20:51:53 by gricquie          #+#    #+#              #
#    Updated: 2021/11/08 17:13:44 by gricquie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
HEADER = libasm.h

HDIR = .
SDIR = src
ODIR = obj

SRCS_RAW = ft_strlen.s \
	   ft_strcpy.s \
	   ft_strcmp.s \
	   ft_write.s \
	   ft_read.s \
	   ft_strdup.s \

OBJS_RAW = $(SRCS_RAW:.s=.o)

SRCS = $(addprefix $(SDIR)/, $(SRCS_RAW))

OBJS = $(addprefix $(ODIR)/, $(OBJS_RAW))

BONUSSRCS_RAW = ft_atoi_base.s \
		ft_list_push_front.s \
		ft_list_size.s \
		ft_list_sort.s \
		ft_list_remove_if.s \

BONUSOBJS_RAW = $(BONUSSRCS_RAW:.s=.o)

BONUSSRCS = $(addprefix $(SDIR)/, $(BONUSSRCS_RAW))

BONUSOBJS = $(addprefix $(ODIR)/, $(BONUSOBJS_RAW))

TESTSRC = test.c
TESTOBJ = $(TESTSRC:.c=.o)
TEST = test

all : $(NAME)

$(NAME) : $(OBJS) $(BONUSOBJS)
	ar -rc $(NAME) $^
	ranlib $(NAME)

$(ODIR)/%.o : $(SDIR)/%.s
	@mkdir -p $(ODIR)
	nasm -f elf64 $< -o $@

bonus : $(NAME) $(BONUSOBJS)
	ar -rc $(NAME) $(BONUSOBJS)
	ranlib $(NAME)

$(TESTOBJ) : $(TESTSRC) $(HEADER) 
	gcc -c $< -o $@ -I$(HDIR)

$(TEST) : $(NAME) $(TESTOBJ) $(HEADER)
	gcc $(TESTOBJ) $(NAME) -o $@

run : $(TEST)
	./$(TEST)

cleantest:
	rm -f $(TESTOBJ)

fcleantest: cleantest
	rm -f $(TEST)

clean : cleantest
	rm -f $(OBJS) $(BONUSOBJS)
	rmdir $(ODIR)

fclean : clean fcleantest
	rm -f $(NAME)

re : fclean all

.PHONY: all clean clean re bonus
