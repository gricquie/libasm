#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

#include <libasm.h>

void	test_strlen()
{
	printf("\n== test ft_strlen ==\n");
	printf("%d\n", ft_strlen("potat"));
	printf("%d\n", ft_strlen("potato"));
}

void	test_strcpy()
{
	char	*d = malloc(64);

	printf("\n== test ft_strcpy ==\n");
	ft_strcpy("potat", d);
	printf("%s\n", d);

	free(d);
}

void	test_strcmp()
{
	printf("\n== test ft_strcmp ==\n");
	printf("%d\n", ft_strcmp("potat", "potat"));
	printf("%d\n", ft_strcmp("potat", "potato"));
	printf("%d\n", ft_strcmp("potatn", "potato"));
	printf("%d\n", ft_strcmp("potat", "pota"));
}

void	test_write()
{
	printf("\n== test ft_write ==\n");
	printf("%zd\n", ft_write(1, "potat\n", 6));
	printf("%zd\n", ft_write(1, "potat\n", 4));
	printf("%zd - %d\n", ft_write(9, "potat\n", 6), errno);
	printf("%zd - %d\n", ft_write(1, 0, 6), errno);
	printf("%zd - %d\n", ft_write(1, "potat\n", -1), errno);
	printf("%zd - %d\n", ft_write(300, "potat\n", 6), errno);
}

void	test_read()
{
	int		fd;
	char	buf[128];

	printf("\n== test ft_read ==\n");
	fd = open("test.c", O_RDONLY);

	printf("%zd\n", ft_read(fd, buf, 18));
	printf("%.18s\n", buf);
	printf("%zd - %d\n", ft_read(9, buf, 18), errno);
	printf("%zd - %d\n", ft_read(fd, 0, 18), errno);
	printf("%zd - %d\n", ft_read(fd, buf, -1), errno);

	close(fd);
}

void	test_strdup()
{
	char	*s;

	printf("\n== test ft_strdup ==\n");
	s = ft_strdup("potat");
	printf("%s\n", s);
	free(s);
	s = ft_strdup(0);
	printf("%p\n", s);
	free(s);
}

void	test_atoi_base()
{
	printf("\n== test ft_atoi_base ==\n");
	printf("%d\n", ft_atoi_base("ee", 0));
	printf("%d\n", ft_atoi_base(0, "er"));
	printf("%d\n", ft_atoi_base("ee", "e"));
	printf("%d\n", ft_atoi_base("ee", "ee"));
	printf("%d\n", ft_atoi_base("ee", "+e"));
	printf("%d\n", ft_atoi_base("ee", "-e"));
	printf("%d\n", ft_atoi_base("ee", "e+"));
	printf("%d\n", ft_atoi_base("ee", "e-"));
	printf("%d\n", ft_atoi_base("ee", "ei"));
	printf("%d\n", ft_atoi_base("re", "ei"));
	printf("%d\n", ft_atoi_base("ii", "ei"));
	printf("%d\n", ft_atoi_base("yy", "eity"));
	printf("%d\n", ft_atoi_base("18", "0123456789"));
	printf("%d\n", ft_atoi_base("FF", "0123456789ABCDEF"));
	printf("test signs\n");
	printf("%d\n", ft_atoi_base("+", "ei"));
	printf("%d\n", ft_atoi_base("+r", "eir"));
	printf("%d\n", ft_atoi_base("-r", "eir"));
	printf("%d\n", ft_atoi_base("-FF", "0123456789ABCDEF"));
}

void	test_list_push_front()
{
	t_list	*l;

	printf("\n== test ft_list_push_front ==\n");
	l = 0;
	ft_list_push_front(&l, (void *)3);
	printf("%p\n", l->data);
	ft_list_push_front(&l, (void *)15);
	printf("%p -> %p\n", l->data, l->next->data);
}

void	test_list_size()
{
	t_list	*l;

	printf("\n== test ft_list_size ==\n");
	l = 0;
	ft_list_push_front(&l, (void *)10);
	ft_list_push_front(&l, (void *)10);
	ft_list_push_front(&l, (void *)10);
	printf("%d\n", ft_list_size(l));
	printf("%d\n", ft_list_size(0));
	free(l->next->next);
	free(l->next);
	free(l);
}

int		cmp_test(void *l, void *r)
{
	printf("cmp %p - %p\n", l, r);
	return (l - r);
}

void	test_list_sort()
{
	t_list	*l;

	printf("\n== test ft_list_sort ==\n");
	l = 0;
	ft_list_push_front(&l, (void *)1);
	ft_list_push_front(&l, (void *)2);
	ft_list_push_front(&l, (void *)3);
	ft_list_push_front(&l, (void *)4);
	ft_list_push_front(&l, (void *)5);
	ft_list_sort(&l, &cmp_test);
	printf("%p -> %p -> %p -> %p -> %p\n", l->data, l->next->data, l->next->next->data,
		   l->next->next->next->data, l->next->next->next->next->data);
	free(l->next->next->next->next);
	free(l->next->next->next);
	free(l->next->next);
	free(l->next);
	free(l);
}

void	test_list_remove_if()
{
	t_list	*l;

	printf("\n== test ft_list_remove_if ==\n");
	l = 0;
	ft_list_remove_if(&l, 0, cmp_test);
	ft_list_remove_if(0, 0, 0);
	ft_list_push_front(&l, (void *)1);
	ft_list_push_front(&l, (void *)2);
	ft_list_push_front(&l, (void *)3);
	ft_list_push_front(&l, (void *)4);
	ft_list_remove_if(&l, (void *)3, cmp_test);
	printf("%p -> %p -> %p\n", l->data, l->next->data,
			l->next->next->data);
	free(l->next->next);
	free(l->next);
	free(l);
}

int		main()
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();
	test_atoi_base();
	test_list_push_front();
	test_list_size();
	test_list_sort();
	test_list_remove_if();
}

