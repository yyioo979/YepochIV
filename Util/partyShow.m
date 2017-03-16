function [ output_args ] = partyShow( input_args )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.3.14
% __AP__ = 'imagePre', 'signShow'

    num = length(input_args);
    cloNum = 5;
    rowNum = ceil(num/cloNum);
    figure;
    for nc = 1:1:num
        subplot(rowNum, cloNum, nc);
        signShow(imagePre(input_args{nc}.territory), input_args{nc}.pts);
    end
    output_args = true;

end

