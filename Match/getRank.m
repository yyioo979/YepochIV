function [ output_args ] = getRank( mated, rankNum )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.14
% __AP__ = 

    num = length(mated);
    correctNum = 0;
    for nc = 1:1:num
        bottle = mated{nc}.mated(1:1:rankNum);
        if ismember(mated{nc}.mark, bottle)
            correctNum = correctNum+1;
        end
    end
    if correctNum > 100
        correctNum = 100;
    end
    output_args = correctNum;

end

