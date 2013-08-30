function plot_test_and_train_comp(eta, times, dtrain, testnum)
    W1 = zeros(1,7);
    W2 = zeros(1,7);
    trains(1) = 0;
    [results(1), draws(1)] = test_comp(W1, W2, testnum);
    for i = 1:times,
        [W1, W2] = train_comp(W1, W2, eta, dtrain);
        trains(i+1) = i * dtrain;
        [results(i+1), draws(i+1)] = test_comp(W1, W2, testnum);
    end
    plot(trains, results, trains, draws);
        
end