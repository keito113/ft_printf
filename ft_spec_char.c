/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_spec_char.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: keitabe <keitabe@student.42tokyo.jp>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/12 10:12:51 by keitabe           #+#    #+#             */
/*   Updated: 2025/05/14 16:39:55 by keitabe          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	handle_c(va_list *ap)
{
	char	c;

	c = va_arg(*ap, int);
	write(1, &c, 1);
	return (1);
}

int	handle_percent(va_list *ap)
{
	(void)ap;
	write(1, "%", 1);
	return (1);
}
