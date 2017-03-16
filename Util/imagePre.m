function [ output_args ] = imagePre( input_args )
% __author__ = Yepoch
% __version__ = 0.3.1
% __lastUpdate__ = 2016.8.24
% __AP__ = none

    input_args = double(input_args);
    min_num = min(min(input_args));
    input_args = input_args - min_num;
    max_num = max(max(input_args));
    ractor_num = 255/max_num;
    if ractor_num == 0
        ractor_num = 1;
    end
    output_args = round(input_args*ractor_num);
    
end

