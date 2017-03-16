function [ output_args ] = subShow( input_args, eng, row, cloumn )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.10
% __AP__ = 'imagePre'

    num = length(input_args);
    for nc = 1:1:num
       temple = imagePre(input_args{nc});
       subplot(row, cloumn, nc);
       imshow(uint8(temple));
       e_num = length(eng{nc});
       for ec = 1:1:e_num
           cursor = eng{nc}{1, ec}.domain;
           trans = [cursor(1, 2), cursor(1, 1), cursor(2, 2)-cursor(1, 2), cursor(2, 1)-cursor(1, 1)];
           hold on;
           rectangle('position', trans, 'edgecolor', 'r');
       end
    end
    output_args = true;

end

