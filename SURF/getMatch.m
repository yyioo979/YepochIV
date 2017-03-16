function [ output_args ] = getMatch( input1, input2 )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.13
% __AP__ = 'amplitude'
    
    num = length(input1.fea);
    bias = zeros(1, num);
    biasStone = 15000;
    matchedNum = 1;
    matchedPts = zeros(num, 2);
    for nc = 1:1:num
        bias(1, nc) = amplitude('orign', input1.fea{nc}, input2.fea{nc});
        if bias(1, nc) < biasStone
            matchedPts(matchedNum, :) = input1.pts(nc, :);
            matchedNum = matchedNum+1;
        end
    end
    output_args.bias = bias;
    matchedPts(matchedNum:1:end, :) = [];
    output_args.matchedPts = matchedPts;
    output_args.matchedNum = matchedNum-1;

end

