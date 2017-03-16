function [ output_args ] = group( parts, pts )
% __author__ = Yepoch
% __version__ = 1.1.0
% __lastUpdate__ = 2017.3.14
% __AP__ = 

    function [ output_args ] = worker( pts, part )
        output_args = part;
        counter = max(acreage);
        cursor = partsNum;
        for partC = 1:1:partsNum
            x1 = part{partC}.domain(1, 1);
            x2 = part{partC}.domain(2, 1);
            y1 = part{partC}.domain(1, 2);
            y2 = part{partC}.domain(2, 2);
            if pts(2)<=x2 && pts(2)>=x1 && pts(1)<=y2 && pts(1)>=y1
                if acreage(partC) <= counter
                    counter = acreage(partC);
                    cursor = partC;
                end
            end
        end
        output_args{cursor}.pts = [output_args{cursor}.pts; pts];
        output_args{cursor}.ptsNum = output_args{cursor}.ptsNum+1;
    end

    [ptsNum, ~] = size(pts);
    partsNum = length(parts);
    acreage = zeros(1, partsNum);
    for pc = 1:1:partsNum
        height = parts{pc}.domain(2, 1)-parts{pc}.domain(1, 1);
        weight = parts{pc}.domain(2, 2)-parts{pc}.domain(1, 2);
        acreage(pc) = height*weight;
    end
    bottle = parts;
    for ptsC = 1:1:ptsNum
        bottle = worker(pts(ptsC, :), bottle);
    end
    output_args = bottle;

end

