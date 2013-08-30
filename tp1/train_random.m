% trains against a random playing opponent
function retW = train_random(W, eta, tries)
    retW = W;
    for i = 1:tries,
        retW = random_game(retW, eta);
    end
end