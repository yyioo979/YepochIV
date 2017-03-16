function [ output_args ] = multiShow( input_args, row, cloumn )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.10
% __AP__ = 'imagePre'

    num = length(input_args);
    for nc = 1:1:num
        temple = imagePre(input_args{nc});
        subplot(row, cloumn, nc);
        imshow(uint8(temple));
    end
    output_args = true;
end

