% gets the result of a game
function ret = get_game_result(M) 
	% 1 player 1 win, 2 player 2 win, 0 draw, -1 not finished
	for i = 1:3,
		% rows
		if (equal_and_non_zero(M(1,i), M(2,i), M(3,i)))
			ret = M(1,i);
			return;
        end
		% cols
		if (equal_and_non_zero(M(i,1), M(i,2), M(i,3)))
			ret = M(i,1);
			return;
        end
    end
	% diagonals
	if (equal_and_non_zero(M(1,1), M(2,2), M(3,3)) || equal_and_non_zero(M(3,1), M(2,2), M(1,3)))
		ret = M(2,2);
		return;
    end
	if (count_zeros(M) == 0)
		ret = 0;
	else
		ret = -1;
    end
end