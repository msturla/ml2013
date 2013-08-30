% chooses a move given a certain weight vector and player.
% returns a copy of the old matrix with the changes.
function retM = choose_coord(M, W, player)
	best_result = -Inf;
	for i = 1:3,
		for j = 1:3,
			if (M(i,j) == 0)
				% make a change and test results
				M(i,j) = player;
				res = get_score(M, W, player);
				if (res > best_result || (res == best_result && rand() > 0.5))
					ci = i;
					cj = j;
					best_result = res;
                end
				% undo changes
				M(i,j) = 0;
            end
        end
    end
	% best move
	M(ci, cj) = player;
	retM = M;
end