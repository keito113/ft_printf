/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_spec_string_ptr.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: keitabe <keitabe@student.42tokyo.jp>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/12 10:27:44 by keitabe           #+#    #+#             */
/*   Updated: 2025/05/15 10:55:45 by keitabe          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	handle_s(va_list *ap)
{
	char	*str;
	size_t	i;

	str = va_arg(*ap, char *);
	if (!str)
	{
		write(1, "(null)", 6);
		return (6);
	}
	i = 0;
	while (str[i])
	{
		write(1, &str[i], 1);
		i++;
	}
	return ((int)i);
}

int	handle_p(va_list *ap)
{
	unsigned long	ptr;
	size_t			count;
	size_t			len;
	const char		*base;
	char			buf[sizeof(unsigned long) * 2];

	ptr = (unsigned long)va_arg(*ap, void *);
	if (!ptr)
	{
		ft_putstr_fd("(nil)", 1);
		return (5);
	}
	len = 0;
	base = "0123456789abcdef";
	while (ptr != 0)
	{
		buf[len++] = base[ptr % 16];
		ptr /= 16;
	}
	count = len;
	ft_putstr_fd("0x", 1);
	while (len != 0)
		ft_putchar_fd(buf[--len], 1);
	count += 2;
	return ((int)count);
}
