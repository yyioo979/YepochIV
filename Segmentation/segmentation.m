function [ output_args ] = segmentation( input_args )
% __author__ = Yepoch
% __version__ = 1.2.0
% __lastUpdate__ = 2017.2.15
% __AP__ = 'stratify', 'immerge'

    bottle = stratify('single', input_args, 16);
    output_args.part = immerge(bottle);
    output_args.images = bottle;

end