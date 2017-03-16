function [ output_args ] = extend( input_args, para)
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.9
% __AP__ = none

    [row, cloumn] = size(input_args);
    tb = zeros(para, cloumn+2*para);
    lr = zeros(row, para);
    output_args = [tb;lr, input_args, lr; tb];
end