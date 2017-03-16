function [ output_args ] = allotRatio( input, mould )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.16
% __AP__ = 'amplitude'

    inputNum = length(input.part);
    output_args = input;
    mouldNum = length(mould);
    group = 10000*ones(1, inputNum);
    index = zeros(1, inputNum);
    for ic = 1:1:inputNum
        cursor = input.part{ic}.domain;
        for mc = 1:1:mouldNum
            counter = mould(mc).domain;
            box1(1, 1:2) = cursor(1, :);
            box1(1, 3:4) = cursor(2, :);
            box2(1, 1:2) = counter(1, :);
            box2(1, 3:4) = counter(2, :);
            bias = amplitude('orign', box1, box2);
            if bias < 10000
                if bias < group(ic)
%                     [ic, mc, bias]
                    output_args.part{ic}.ratio = mould(mc).ratio;
                    group(ic) = bias;
                    index(ic) = 1;
                end
            else
                if index(ic) == 0
                    output_args.part{ic}.ratio = mould(end).ratio;
                end
            end
        end
    end

end

