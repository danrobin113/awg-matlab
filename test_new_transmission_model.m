clear; clc

model = awg.AWG(...
    'Ni', 1, ...
    'No', 4, ...
    'lambda_c', 1.55, ...
    'm', 106,   ...
    'N', 20,    ...
    'wi', 1.5,  ...
    'wo', 1.5,  ...
    'g',   .4,  ...
    'w',  1.5,  ...
    'd',  1.4-.4, ...
    'do', 3,...
    'R', 55.87, ...
    'core', 3.5,...
    'clad', 3.16,...
    'subs', 3.17,...
    'L0',319.1...
);

r = awg.spectrum2(model, 1.55, 0.02, 'Points', 100);

plot(r.wavelength,10*log10(r.transmission),'LineWidth',2)

disp(awg.analyse(r))