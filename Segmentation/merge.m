function [ output_args ] = merge( input_args )
% __author__ = Yepoch
% __version__ = 1.1.0
% __lastUpdate__ = 2017.2.15
% __AP__ = 'amplitude'

    function [ output_args ] = whetherBreak( box1, box2 )
        bottle1 = [box1(1, 1), box1(1, 2), box1(2, 1), box1(2, 2)];
        bottle2 = [box2(1, 1), box2(1, 2), box2(2, 1), box2(2, 2)];
        bias = amplitude('orign', bottle1, bottle2);
        if bias < 100
            output_args = true;
        else
            output_args = false;
        end
    end

    num = length(input_args);
    cursor = input_args{1, 1};
    output_args = cursor;
    partNum = length(cursor);
    ratio = ones(1, partNum);
    for partC = 1:1:partNum
        stone = cursor{1, partC};
        for nc = 2:1:num
            sNum = length(input_args{nc});
            for sc = 1:1:sNum
                if whetherBreak(stone.domain, input_args{nc}{sc}.domain)
                    ratio(partC) = ratio(partC)+1;
                    break;
                end
            end
        end
        output_args{partC}.ratio = ratio(1, partC);
    end

end

