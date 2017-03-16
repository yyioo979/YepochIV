function [ output_args ] = feaShow( input_args, background )
% __author__ = Yepoch
% __version__ = 1.0.0
% __AP__ = none
   
    num = length(input_args);
    imshow(uint8(imagePre(background)));
    for n = 1:1:num
        hold on;
        x = input_args{n}.domain(1, 1);
        y = input_args{n}.domain(1, 2);
        width = input_args{n}.domain(2, 1) - x;
        heigh = input_args{n}.domain(2, 2) - y;
        rect = [y, x, heigh, width]; 
        rectangle('position', rect, 'edgecolor', 'r');
    end
    output_args = true;
    
end

