% tests against a random playing opponent
function p = test_random(W, tries)
    j = 0;
    for i = 1:tries,
        [W, res] = random_game(W, 0);
        if (res == 1 || res == 0)
            j = j + 1;
        end
    end
    p = j / tries;
end