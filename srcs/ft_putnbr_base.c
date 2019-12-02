/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr_base.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ahouel <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/08/13 15:12:00 by ahouel            #+#    #+#             */
/*   Updated: 2019/11/07 18:47:08 by ahouel           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static void	prefix_nbr(char *buff, int size_base)
{
	if (size_base == 2)
	{
		buff[0] = '0';
		buff[1] = 'b';
	}
	else if (size_base == 16)
	{
		buff[0] = '0';
		buff[1] = 'x';
	}
}

void		ft_putnbr_base(size_t nb, int size_base)
{
	static const char	base[16] = {"0123456789abcdef"};
	char				buff[150];
	long				power;
	size_t				tmp;
	int					i;

	if (size_base < 2 || size_base > 16)
		return ;
	power = 1;
	tmp = nb;
	while (tmp /= size_base)
		power *= size_base;
	i = size_base == 2 || size_base == 16 ? 2 : 0;
	prefix_nbr(buff, size_base);
	while (power)
	{
		buff[i++] = base[nb / power];
		nb -= (nb / power) * power;
		power /= size_base;
	}
	write(1, buff, i);
}
