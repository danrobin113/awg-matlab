% Material model (Sellmeier) for: Si @ T[20K, 300K], lambda[1.1�m, 5.6�m]
% https://ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/20070021411.pdf
%
% INPUT:
%   x - wavelength
%   T - temperature
%
% OUTPUT:
%   n - index of refraction

function n = Si(x,T)

    if nargin < 2
        T = 295;    % default temperature model
    end
    
    if (x < 1.1) || (x > 5.6)
        warning('Extrapollating model equation for Si beyond range of 1.1�m - 5.6�m')
    end
    
    if (T < 20) || (T > 300)
        warning('Extrapollating model equation for Si beyond temperature range of 20K - 300K')
    end
    
    S1 = polyval([3.4469e-12 -5.823e-09 4.2169e-06 -0.00020802 10.491], T);
    S2 = polyval([-1.3509e-06 0.0010594 -0.27872 29.166 -1346.6], T);
    S3 = polyval([103.24 678.41 -76158 -1.7621e+06 4.4283e+07], T);
    x1 = polyval([2.3248e-14 -2.5105e-10 1.6713e-07 -1.1423e-05 0.29971], T);
    x2 = polyval([-1.1321e-06 0.001175 -0.35796 42.389 -3517.1], T);
    x3 = polyval([23.577 -39.37 -6907.4 -1.4498e+05 1.714e+06], T);
    
    n = sqrt(                           ...
        1                               ...
        + S1.*x.^2 ./ (x.^2 - x1.^2)    ...
        + S2.*x.^2 ./ (x.^2 - x2.^2)    ...
        + S3.*x.^2 ./ (x.^2 - x3.^2)    ...
	);
