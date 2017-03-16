function [ output_args ] = group_backup( parts, pts )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.14
% __AP__ =

    function [ output_args ] = worker( part, pts )
        [ptsNum, ~] = size(pts);
        territory = part.territory;
        ptsCounter = part.ptsNum;
        ptsIndex = zeros(1, ptsNum);
        partPts = zeros(ptsNum, 2);
        for ptsC = 1:1:ptsNum
            if territory(pts(ptsC, 2), pts(ptsC, 1)) == 1
                ptsCounter = ptsCounter+1;
                ptsIndex(ptsCounter) = ptsC;
                partPts(ptsCounter, :) = pts(ptsCounter, :);
            end
        end
        ptsIndex(ptsCounter+1:end) = [];
        partPts(ptsCounter+1:end, :) = [];
        output_args.ptsNum = ptsCounter;
        output_args.ptsIndex = ptsIndex;
        output_args.partPts = partPts;
    end

    partsNum = length(parts);
    output_args = parts;
    for partC = 1:1:partsNum
        bottle = worker(parts{partC}, pts); 
        pts(bottle.ptsIndex, :) = [];
        output_args{partC}.pts = bottle.partPts;
        output_args{partC}.ptsNum = bottle.ptsNum;
    end

end