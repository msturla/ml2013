% trains two computers
function [retW1, retW2] = train_comp(W1, W2, eta, tries)
    retW1 = W1;
    retW2 = W2;
    for i = 1:tries,
        [retW1, retW2] = comp_game(retW1, retW2, eta);
    end
end