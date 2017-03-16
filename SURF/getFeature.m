function [ output_args ] = getFeature( input_args, points )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.13
% __AP__ = 'extend'

    function [ output_args ] = worker( input_args, x, y, scales )
        output_args = zeros(1, 256);
        for xc = x-scales:1:x+scales-2
            for yc = y-scales:1:y+scales-2
                feaCounter = input_args(xc, yc)+1;
                output_args(1, feaCounter) = output_args(1, feaCounter)+1;
            end
        end
    end

    [row, ~] = size(points);
    output_args = cell(1, row);
    scales = 15;
    bottle = extend(input_args, scales);
    for rc = 1:1:row
        x = scales+points(rc, 2);
        y = scales+points(rc, 1);
        output_args{1, rc} = worker(bottle, x, y, scales);
    end

end

