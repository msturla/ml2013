

function b = equal_and_non_zero(v1, v2, v3)
	b = v1 == v2 & v2 == v3 & v1 != 0;
endfunction



% counts the number of zeros in M
function k = count_zeros(M)
	k = 0;
	for i = 1:3
		for j = 1:3
			if (M(i,j) == 0)
				k = k + 1;
			endif
		endfor
	endfor
endfunction

% gets the result of a game
function ret = get_game_result(M) 
	% 1 player 1 win, 2 player 2 win, 0 draw, -1 not finished
	for i = 1:3
		% rows
		if (equal_and_non_zero(M(1,i), M(2,i), M(3,i)))
			ret = M(1,i);
			return;
		endif
		% cols
		if (equal_and_non_zero(M(i,1), M(i,2), M(i,3)))
			ret = M(i,1);
			return;
		endif
	endfor
	% diagonals
	if (equal_and_non_zero(M(1,1), M(2,2), M(3,3)) | equal_and_non_zero(M(3,1), M(2,2), M(1,3)))
		ret = M(2,2);
		return;
	endif
	if (count_zeros(M) == 9)
		ret = 0;
	else
		ret = -1;
	endif
endfunction

function ret = game_finished(M)
	res = get_game_result(M);
	ret = res >= 0;
endfunction

% makes a random move on a matrix for player
% returns a new matrix with the modified cell
function M' = random_move(M, player)
	v = randint(1,1,count_zeros(M));
	k = 0;
	for i = 1:3
		for j = 1:3
			if (M(i,j) == 0)
				if (k == v)
					M(i,j) = player;
					M' = M;
					return;
				endif
				k = k + 1;
			endif
		endfor
	endfor
	error("could not find free slot");
endfunction

% returns the char vector filled for a target player
% vector has five variables
% 1: Number of instances where the own player has won (three in a row)
% 2: Number of instances where the own player is about to win (two in a row, no enemy)
% 3: Number of instances where the opposing player is about to win (two in a row, no own)
% 4: Number of instances where the own player could win (one own, two blanks)
% 5: Number of instances where the opposing player could win (one enemy, two blanks)
function V = get_char_vector(M, own)
	V = zeros(4,1);
	if (own == 1)
		other == 2;
	else
		other = 1;
	endif
	for i = 1:3
		r1 = M(1,i);
		r2 = M(2,i);
		r3 = M(3,i);
		c1 = M(i,1);
		c2 = M(i,2);
		c3 = M(i,3);
		V(1) = V(1) + has_won(r1, r2, r3, own) + has_won(c1, c2, c3, own);
		V(2) = V(2) + close_win(r1, r2, r3, own) + close_win(c1, c2, c3, own);
		v(3) = V(3) + close_win(r1, r2, r3, other) + close_win(c1, c2, c3, other);
		V(4) = V(4) + free_dim(r1, r2, r3, own) + free_dim(c1, c2, c3, own);
		V(5) = V(5) + free_dim(r1, r2, r3, other) + free_dim(c1, c2, c3, other);
	endfor
	% diagonals
	V(1) = V(1) + has_won(M(1,1), M(2,2), M(3,3), own) + has_won(M(1,3), M(2,2), M(3,1), own);
	V(2) = V(2) + close_win(M(1,1), M(2,2), M(3,3), own) + close_win(M(1,3), M(2,2), M(3,1), own);
	v(3) = V(3) + close_win(M(1,1), M(2,2), M(3,3), other) + close_win(M(1,3), M(2,2), M(3,1), other);
	V(4) = V(4) + free_dim(M(1,1), M(2,2), M(3,3), own) + free_dim(M(1,3), M(2,2), M(3,1), own);
	V(5) = V(5) + free_dim(M(1,1), M(2,2), M(3,3), other) + free_dim(M(1,3), M(2,2), M(3,1), other);
endfunction

% returns 1 if player is about to win in the three values.
function b = close_win(v1, v2, v3, player)
	v = sort([v1, v2, v3]);
	if (v(1) == 0 && v(2) == player && v(3) == player)
		b = 1;
	else
		b = 0;
	endif
endfunction

% returns 1 if player has a free dimension to win.
function b = free_dim(v1, v2, v3, player)
	v = sort([v1, v2, v3]);
	if (v(1) == 0 && v(2) == 0 && v(3) == player)
		b = 1;
	else
		b = 0;
	endif
endfunction

% returns 1 if player has won in the three values.
function b = has_won(v1, v2, v3, player)
	if (v1 == v2 && v2 == v3 && v3 == player)
		b = 1;
	else
		b = 0;
	endif
endfunction

% chooses a move given a certain weight vector and player.
% returns a copy of the old matrix with the changes.
function M' = choose_coord(M, W, player)
	best_result = -100000
	for i = 1:3
		for j = 1:3
			if (M(i,j) == 0)
				% make a change and test results
				M(i,j) = player;
				V = get_char_vector(M, own);
				res = V * W;
				if (res > best_result)
					ci = i;
					cj = j;
					best_result = res;
				endif
				% undo changes
				M(i,j) = 0;
			endif
		endfor
	endfor
	% best move
	M(ci, cj) = player;
	M' = M;
endfunction


% plays a tic-tac-toe game against a random selecting opponent
function W' = rand_game(W)
	G = cell(1,10);
	curr = 1;
	G{1} = zeros(3,3);
	while (~game_finished(G{curr}))
		if (curr mod 2 == 0)
			% random opponent
			M = random_move(G{curr}, 2);
		else
			M = choose_coord(G{curr}, W, 1);
		endif
		curr = curr + 1;
		G{curr} = M;
	end
	
endfunction