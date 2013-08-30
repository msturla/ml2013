% plays a tic-tac-toe between two machines
function [retW1, retW2, res] = comp_game(W1, W2, eta)
	G = cell(1,10);
	curr = 1;
	G{1} = zeros(3,3);
	while (~game_finished(G{curr}))
		if (mod(curr, 2) == 0)
			M = choose_coord(G{curr}, W2, 2);
		else
			M = choose_coord(G{curr}, W1, 1);
        end
		curr = curr + 1;
		G{curr} = M;
    end
    res = get_game_result(G{curr});
    pointsp1 = 0;
    pointsp2 = 0;
    if (res  == 1)
        pointsp1 = 100;
        pointsp2 = -100;
    end
    if (res == 2)
        pointsp1 = -100;
        pointsp2 = 100;
    end
    retW1 = W1;
    retW2 = W2;
    if (eta ~= 0)
        score = get_score(G{curr}, retW1, 1);
        retW1 = retW1 + get_dw(eta, pointsp1, score, get_char_vector(G{curr}, 1));
        score = get_score(G{curr}, retW2, 2);
        retW2 = retW2 + get_dw(eta, pointsp2, score, get_char_vector(G{curr}, 2));
        i = 1;
        while (i + 1 <= curr)
           score = get_score(G{i}, retW1, 1);
           next_score = get_score(G{i + 1}, retW1, 1);
           V = get_char_vector(G{i}, 1);
           retW1 = retW1 + get_dw(eta, next_score, score, V);
           i = i + 2;
        end
        i = 2;
        while (i + 1 <= curr)
           score = get_score(G{i}, retW2, 2);
           next_score = get_score(G{i + 1}, retW2, 2);
           V = get_char_vector(G{i}, 2);
           retW2 = retW2 + get_dw(eta, next_score, score, V);
           i = i + 2;
        end
    end
end