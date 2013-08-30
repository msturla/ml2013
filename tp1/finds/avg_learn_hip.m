function [ as, at ] = avg_learn_hip( tries, T, arch )
%learns a hipothesis T with the architecture
%learns it a total of tries times
% returns as (average positive examples) and at (average total examples)
as = 0;
at = 0;
for k = 1:tries,
    [ds, dt] = learn_hip(T, arch);
    as = as + ds;
    at = at + dt;
end
as = as / tries;
at = at / tries;
end

