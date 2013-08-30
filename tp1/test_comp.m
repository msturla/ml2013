% tests against a computer playing opponent
function [w, d] = test_comp(W1, W2, tries)
    w = 0;
    d = 0;
    for i = 1:tries,
        [W1, W2, res] = comp_game(W1, W2, 0);
        if (res == 1)
            w = w + 1;
        end
        if (res == 0)
            d = d + 1;
        end
    end
    w = w / tries;
    d = d / tries;
end