function [ output_args ] = signShow( background, pts )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.12
% __AP__ = 

    imshow(uint8(background));
    [row, ~] = size(pts);
    hold on;
    for rc = 1:1:row
        plot(round(pts(rc, 1)), round(pts(rc, 2)), '*');
    end
    output_args = true;

end

