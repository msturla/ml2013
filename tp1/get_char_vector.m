% returns the char vector filled for a target player
% vector has five variables
% 1: Number of instances where the own player has won (three in a row)
% 2: Number of instances where the other player has won (three in a row)
% 3: Number of instances where the own player is about to win (two in a row, no enemy)
% 4: Number of instances where the opposing player is about to win (two in a row, no own)
% 5: Number of instances where the own player could win (one own, two blanks)
% 6: Number of instances where the opposing player could win (one enemy, two blanks)
% 7: 1 (constant)
function V = get_char_vector(M, own)
	V = zeros(7,1);
	if (own == 1)
		other = 2;
	else
		other = 1;
    end
	for i = 1:3,
		r1 = M(1,i);
		r2 = M(2,i);
		r3 = M(3,i);
		c1 = M(i,1);
		c2 = M(i,2);
		c3 = M(i,3);
		V(1) = V(1) + has_won(r1, r2, r3, own) + has_won(c1, c2, c3, own);
        V(2) = V(2) + has_won(r1, r2, r3, other) + has_won(c1, c2, c3, other);
		V(3) = V(3) + close_win(r1, r2, r3, own) + close_win(c1, c2, c3, own);
		V(4) = V(4) + close_win(r1, r2, r3, other) + close_win(c1, c2, c3, other);
		V(5) = V(5) + free_dim(r1, r2, r3, own) + free_dim(c1, c2, c3, own);
		V(6) = V(6) + free_dim(r1, r2, r3, other) + free_dim(c1, c2, c3, other);
    end
	% diagonals
	V(1) = V(1) + has_won(M(1,1), M(2,2), M(3,3), own) + has_won(M(1,3), M(2,2), M(3,1), own);
    V(2) = V(2) + has_won(M(1,1), M(2,2), M(3,3), other) + has_won(M(1,3), M(2,2), M(3,1), other);
	V(3) = V(3) + close_win(M(1,1), M(2,2), M(3,3), own) + close_win(M(1,3), M(2,2), M(3,1), own);
	V(4) = V(4) + close_win(M(1,1), M(2,2), M(3,3), other) + close_win(M(1,3), M(2,2), M(3,1), other);
	V(5) = V(5) + free_dim(M(1,1), M(2,2), M(3,3), own) + free_dim(M(1,3), M(2,2), M(3,1), own);
	V(6) = V(6) + free_dim(M(1,1), M(2,2), M(3,3), other) + free_dim(M(1,3), M(2,2), M(3,1), other);
    V(7) = 1;
end