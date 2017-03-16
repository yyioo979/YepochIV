function [ output_args ] = stratify( modeName, input_args, level )
% __author__ = Yepoch
% __version__ = 1.0.2
% __lastUpdate__ = 2017.2.12
% __AP__ = 'grads'

    function [ output_args ] = worker( input_args )
        [row, cloumn] = size(input_args);
        standard = 2.1*mean(mean(input_args));
        output_args = zeros(row, cloumn);
        for rc = 1:1:row
            for cc = 1:1:cloumn
                if rc<6 || cc<6 || rc>(row-6) || cc>(cloumn-6)
                    output_args(rc, cc) = 0;
                else
                    if input_args(rc, cc) > standard
                        output_args(rc, cc) = 1;
                    else
                        output_args(rc, cc) = 0;
                    end
                end
            end
        end
    end

    switch modeName
        case 'quee'
            output_args = cell(1, level);
            counter = 1;
            for nc = level:-1:1
                G = fspecial('gaussian', [nc, nc], 2);
                seniFin = imfilter(input_args, G, 'same');
                output_args{1, counter} = worker(grads(seniFin));
                counter = counter+1;
            end
        case 'single'
            G = fspecial('gaussian', [level, level], 2);
            seniFin = imfilter(input_args, G, 'same');
            output_args = worker(grads(seniFin));
        otherwise
            error('No such mode');
    end
end