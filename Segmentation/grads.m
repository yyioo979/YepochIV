function [ output_args ] = grads( input_args )
% __author__ = Yepoch
% __version__ = 0.3.2
% __AP__ = none
    gx = [-1, 0, 1;
             -2, 0, 2;
             -1, 0, 1];
    gy = [ 1,  2,  1;
              0,  0,  0;
             -1, -2, -1];
    [row , cloumn] = size(input_args);
    output_args = zeros(row, cloumn);
    temple = [input_args(1, :); input_args; input_args(row, :)];
    temple = [temple(:, 1), temple, temple(:, cloumn)];
    for rc = 2:1:row+1
        for cc = 2:1:cloumn+1
            rx = gx(1, 1)*temple(rc-1, cc-1) + gx(1, 2)*temple(rc-1, cc) + gx(1, 3)*temple(rc-1, cc+1) ...
                + gx(2, 1)*temple(rc, cc-1) + gx(2, 2)*temple(rc, cc) + gx(2, 3)*temple(rc, cc+1) ...
                + gx(3, 1)*temple(rc+1, cc-1) + gx(3, 2)*temple(rc+1, cc) + gx(3, 3)*temple(rc+1, cc+1);
            ry = gy(1, 1)*temple(rc-1, cc-1) + gy(1, 2)*temple(rc-1, cc) + gy(1, 3)*temple(rc-1, cc+1) ...
                + gy(2, 1)*temple(rc, cc-1) + gy(2, 2)*temple(rc, cc) + gy(2, 3)*temple(rc, cc+1) ...
                + gy(3, 1)*temple(rc+1, cc-1) + gy(3, 2)*temple(rc+1, cc) + gy(3, 3)*temple(rc+1, cc+1);
            output_args(rc-1, cc-1) = sqrt(rx^2 + ry^2);
        end
    end
end

