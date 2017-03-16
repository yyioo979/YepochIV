function [ mould, seg ] = intercept( rowNum, cloNum, input )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.3.14

    function [ output_args ] = examine(input, maxSize, minSize)
        if input > maxSize
            output_args = maxSize;
        elseif input < minSize
            output_args = minSize;
        else
            output_args = input;
        end
    end

    [row, cloumn] = size(input);
    rowSize = round(row/rowNum);
    cloSize = round(cloumn/cloNum);
    counter = 0;
    seg.images = input;
    temp = cell(1, rowSize*cloSize+2);
    for rc = 1:1:rowNum
        for cc = 1:1:cloNum
            counter = counter+1;
            xTemp1 = (rc-1)*rowSize+1;
            yTemp1 = (cc-1)*cloSize+1;
            xTemp2 = rc*rowSize;
            yTemp2 = cc*cloSize;
            xTemp1 = examine(xTemp1, row, 1);
            yTemp1 = examine(yTemp1, cloumn, 1);
            xTemp2 = examine(xTemp2, row, 1);
            yTemp2 = examine(yTemp2, cloumn, 1);
            mould(counter).domain = [xTemp1, yTemp1; xTemp2, yTemp2];
            temp{counter}.territory = zeros(row, cloumn);
            temp{counter}.territory(xTemp1:xTemp2, yTemp1:yTemp2) = input(xTemp1:xTemp2, yTemp1:yTemp2);
            temp{counter}.domain = [xTemp1, yTemp1; xTemp2, yTemp2];
            temp{counter}.partMark = counter;
            temp{counter}.pts = [];
            temp{counter}.ptsNum = 0;
            temp{counter}.ratio = 1;
        end
    end
    temp{counter+1}.territory = zeros(row, cloumn);
    temp{counter+1}.domain = [1, 1; row, cloumn];
    temp{counter+1}.partMark = 0;
    temp{counter+1}.pts = [];
    temp{counter+1}.ptsNum = 0;
    temp{counter+1}.ratio = 1;
    temp(counter+2:1:end) = [];
    seg.part = temp;
    mould(counter+1).domain = [1, 1; row, cloumn];
    
end

