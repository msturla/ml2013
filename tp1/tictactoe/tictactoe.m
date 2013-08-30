% plays a tic-tac-toe game against a random selecting opponent
function retW = tictactoe(W, eta)
	G = cell(1,10);
	curr = 1;
	G{1} = zeros(3,3);
	while (~game_finished(G{curr}))
		if (mod(curr, 2) == 0)
			% random opponent
			M = random_move(G{curr}, 2);
		else
			M = choose_coord(G{curr}, W, 1);
        end
		curr = curr + 1;
		G{curr} = M;
    end
    res = get_game_result(G{curr});
    points = 0;
    if (res  == 1)
        points = 100;
    end
    if (res == 2)
        points = -100;
    end
    retW = W;
    score = get_score(G{curr}, retW, 1);
    retW = retW + get_dw(eta, points, score, get_char_vector(G{curr}, 1));
    i = 1;
    while (i + 2 <= curr)
       score = get_score(G{i}, retW, 1);
       next_score = get_score(G{i + 2}, retW, 1);
       V = get_char_vector(G{i}, 1);
       retW = retW + get_dw(eta, next_score, score, V);
       i = i + 2;
    end
end























