function W  = plot_test_and_train(eta, dtrain, testnum, thresh)
    W = zeros(1,7);
    trains(1) = 0;
    results(1) = test_random(W, testnum);
    done = 0;
    i = 1;
    while(~done),
        W = train_random(W, eta, dtrain);
        trains(i+1) = i * dtrain;
        results(i+1) = test_random(W, testnum);
        if (results(i+1) > thresh)
            done = true;
        end
        i = i + 1;
    end
    plot(trains, results);
end