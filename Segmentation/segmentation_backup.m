function [ output_args ] = segmentation( input_args )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.10
% __AP__ = 'immerge',

    loop = length(input_args);
    feagure = cell(1, loop);
    feagure{1} = immerge(input_args{1});
    cursor = feagure{1};
    for lc = 2:1:loop
        feagure{lc} = immerge(input_args{lc});
        counter = feagure{lc};
%         cursor = merge(counter, cursor);
    end
    output_args.feagure = feagure;
    
end

