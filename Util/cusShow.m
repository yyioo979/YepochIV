function [ output_args ] = cusShow( showName, varargin )
% __author__ = Yepoch
% __version__ = 0.3.2
% __lastUpdate__ = 2016.9.30
% __AP__ = 'multiShow', 'subShow'

    para = varargin;
    switch showName
        case 'multiShow'
            if nargin < 2
                error('Input parameter must more than 2');
            else
                figure;
                row = para{1};
                cloumn = para{2};
                output_args = multiShow(para{3}, row, cloumn);
            end
        case 'subShow'
            if nargin < 2
                error('Input parameter must more than 2');
            else
                figure;
                row = para{1};
                cloumn = para{2};
                output_args = subShow(para{3}, para{4}, row, cloumn);
            end
        case 'feaShow'
            if nargin < 2
                error('Input parameter must more than 2');
            else
                output_args = feaShow(para{1}, para{2});
            end
    end
end

