% plays a tic-tac-toe game against a random selecting opponent
function [retW res] = random_game(W, eta)
	G = cell(1,10);
	curr = 1;
	G{1} = zeros(3,3);
    k = rand() < 0.1;
	while (~game_finished(G{curr}))
		if (mod(curr, 2) == 0)
			% random opponent
			M = random_move(G{curr}, 2);
        else
            if (eta == 0 || rand() < 0.3 || k)
			    M = choose_coord(G{curr}, W, 1);
            else
                M = random_move(G{curr}, 1);
            end
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
    if (eta ~= 0)
        score = get_score(G{curr}, retW, 1);
        retW = retW + get_dw(eta, points, score, get_char_vector(G{curr}, 1));
        i = 1;
        while (i + 1 <= curr)
           score = get_score(G{i}, retW, 1);
           next_score = get_score(G{i + 1}, retW, 1);
           V = get_char_vector(G{i}, 1);
           retW = retW + get_dw(eta, next_score, score, V);
           i = i + 2;
        end
    end
end























