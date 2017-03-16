function [ output_args ] = getPoints( input1 )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.12
% __AP__ = 'getFeature'

    points = detectSURFFeatures(uint8(input1));
    output_args = round(points.Location);

end

