function [ as, at ] = avg_learn_hip( tries, T, arch )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
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

