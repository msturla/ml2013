% returns 1 if player is about to win in the three values.
function b = close_win(v1, v2, v3, player)
	v = sort([v1, v2, v3]);
	if (v(1) == 0 && v(2) == player && v(3) == player)
		b = 1;
	else
		b = 0;
    end
end
