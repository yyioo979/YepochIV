function [ output_args ] = amplitude( outmode, input1, input2 )
% __author__ = Yepoch
% __version__ = 0.3.2
% __lastUpdate__ = 2016.11.24
%  __AP__ = none

    paraNum = numel(input1);
    output_args = 0;
    for amc = 1:1:paraNum
        output_args = output_args + (input1(amc)-input2(amc))^2;
    end
    switch outmode
        case 'orign'
        case 'sqrt'
            output_args = sqrt(output_args);
        otherwise
            output_args = [sqrt(output_args), output_args];
    end
end

