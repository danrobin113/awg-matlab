classdef constants
    properties (Constant = true)
        mu0  = 0.4*pi;                          % H/�m
        eps0 = 8.854188*1e-6;                   % F/�m
        n0 = sqrt(0.4*pi/(8.854188*1e-6));      % Ohm
        c0 = 1/sqrt(0.4*pi*8.854188*1e-6);      % �m/s
    end
end