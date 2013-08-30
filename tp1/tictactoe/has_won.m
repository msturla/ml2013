% returns 1 if player has won in the three values.
function b = has_won(v1, v2, v3, player)
	if (v1 == v2 && v2 == v3 && v3 == player)
		b = 1;
	else
		b = 0;
    end
end