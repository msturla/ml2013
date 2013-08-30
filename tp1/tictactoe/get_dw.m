function dW = get_dw(eta, expected, observed, X)
   dW = ((eta * (expected - observed)) .* X)';
end