function [ output_args ] = getRatio( input_args )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.15
% __AP__ = 

    num = length(input_args);
    output_args = 0;
    for nc = 1:1:num
        stone = input_args{nc};
        output_args = output_args+stone.ptsNum*stone.ratio;
    end

end

