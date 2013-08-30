% makes a random move on a matrix for player
% returns a new matrix with the modified cell
function retM = random_move(M, player)
	v = randi(count_zeros(M)) - 1;
	k = 0;
	for i = 1:3,
		for j = 1:3,
			if (M(i,j) == 0)
				if (k == v)
					M(i,j) = player;
					retM = M;
					return;
                end
				k = k + 1;
            end
        end
    end
	error('could not find free slot');
end