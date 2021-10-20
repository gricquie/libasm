#ifndef LIBASM_H
# define LIBASM_H

int		ft_strlen(const char *s);
char	*ft_strcpy(const char *s, char *d);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, char *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s);

typedef	struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

int		ft_atoi_base(char *s, char *base);
void	ft_list_push_front(t_list **begin, void *data);
int		ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin, int (*cmp)());
void	ft_list_remove_if(t_list **begin, void *data_ref,int(*cmp)());

#endif
