function b = test_hip( V, T )
% Tests if the example V fits the hipotehsis T. returns true if the
% example is positive, false otherwise.
[~, k] = size(V);
b = 1;
for i = 1:k,
    if (T(i) ~= 0 && (T(i) ~= V(i)))
        b = 0;
        break;
    end
end
end

