% __author__ = Yepoch
% __lastUpdate__ = 2017.2.16

trainNum = 30;
trainSet = data(1:1:trainNum);
% trainSeg = cell(1, trainNum);
% for trainC = 1:1:trainNum
%     trainSeg{1, trainC} = segmentation(trainSet{1, trainC}.sketch);
%     trainSeg{1, trainC}.mark = trainC;
%     trainSeg{1, trainC}.total = length(trainSeg{1, trainC}.part);
% end
% 
% mould = [];
% for trainC = 1:1:trainNum-1
%     if isempty(trainSeg{1, trainC}.part)
%         continue;
%     else
%         inNum = length(trainSeg{1, trainC}.part);
%         for inC = 1:1:inNum
%             [trainC, inC]
%             numCounter = 0;
%             markQuee = [];
%             inCursor = trainSeg{1, trainC}.part{1, inC};
%             for intC = trainC+1:1:trainNum
%                 if isempty(trainSeg{1, intC}.part)
%                     continue;
%                 else
%                     inNum1 = length(trainSeg{1, intC}.part);
%                     for inpartC = 1:1:inNum1
%                         inCounter = trainSeg{1, intC}.part{1, inpartC};
%                         box1(1, 1:2) = inCursor.domain(1, :);
%                         box1(1, 3:4) = inCursor.domain(2, :);
%                         box2(1, 1:2) = inCounter.domain(1, :);
%                         box2(1, 3:4) = inCounter.domain(2, :);
%                         if amplitude('orign', box1, box2) < 400
%                             numCounter = numCounter+1;
%                             delMark = [intC; inpartC];
%                             markQuee= [markQuee, delMark];
%                             break;
%                         end
%                     end
%                 end
%             end
%             if numCounter > 18
%                 num1 = length(markQuee(1, :));
%                 temp1 = zeros(2, 2);
%                 for num1C = 1:1:num1
%                     temp1 = temp1+trainSeg{markQuee(1, num1C)}.part{markQuee(2, num1C)}.domain;
%                 end
%                 mouldTemple.domain = temp1/num1;
%                 mouldTemple.ratio = numCounter;
%                 mould = [mould, mouldTemple];
%             end
%             if numCounter ~= 0
%                 num1 = length(markQuee(1, :));
%                 for num1C = 1:1:num1
%                     trainSeg{markQuee(1, num1C)}.part(markQuee(2, num1C)) = [];
%                 end
%             end
%         end
%     end
% end

mould(1).domain = [55, 40; 215, 160];
mould(2).domain = [105, 55; 135, 95];
mould(3).domain = [140, 80; 165, 120];
mould(4).domain = [170, 75; 190, 125];
mould(5).domain = [100, 110; 135, 145];

mould = trainRatio( mould, trainSet );