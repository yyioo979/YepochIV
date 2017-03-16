function [ output_args ] = getMate( input, rankNum )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.13
% __AP__ = 

    num = length(input);
    bottle = zeros(num, 2);
    for nc = 1:1:num
        bottle(nc, 1) = input{nc}.ratio;
        bottle(nc, 2) = input{nc}.mark;
    end
    mateQuee = sortrows(bottle);
    output_args = mateQuee(end:-1:end-rankNum+1);

end

