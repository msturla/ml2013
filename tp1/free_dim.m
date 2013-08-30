% returns 1 if player has a free dimension to win.
function b = free_dim(v1, v2, v3, player)
	v = sort([v1, v2, v3]);
	if (v(1) == 0 && v(2) == 0 && v(3) == player)
		b = 1;
	else
		b = 0;
    end
end