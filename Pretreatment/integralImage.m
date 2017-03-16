function [ output_args ] = integralImage( input_args )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.9
% __AP__ = 

    function [ output_args ] = worker( input_args )
        [row, cloumn] = size(input_args);
        staff = zeros(1, cloumn);
        output_args = zeros(row, cloumn);
        for rc = 1:1:row
            staff(1) = input_args(rc, 1);
            for cc = 2:1:cloumn
                staff(cc) = input_args(rc, cc)+staff(cc-1);
            end
            if rc == 1
                output_args(rc, :) = staff;
            else
                output_args(rc, :) = output_args(rc-1, :)+staff;
            end
        end
    end

    output_args = worker(input_args);
end