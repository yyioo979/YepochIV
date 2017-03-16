% __author__ = Yepoch
% __lastUpdate__ = 2017.3.14

trainNum = 50;
trainSet = data(1:1:trainNum);

[mouldTemp, ~] = intercept(3, 3, data{1}.sketch);

loop = 1;
mouldNum = length(mouldTemp);
para = ones(1, mouldNum);
trainNum = length(trainSet);
dataPara = (1/trainNum)*ones(mouldNum, trainNum);
dataSum = zeros(1, mouldNum);
mated = cell(1, trainNum);
correctNum = zeros(1, mouldNum);
for lc = 1:1:loop
    for mc = 1:1:mouldNum
        for imc = 1:1:mouldNum
            if imc == mc
                mouldTemp(imc).ratio = para(mc);
            else
                mouldTemp(imc).ratio = 0;
            end
        end
        dataSum(mc) = sum(dataPara(mc, :));
        for tc = 1:1:trainNum
            [lc, mc, tc]
            iStone = trainSet{tc};
            skPts = getPoints(iStone.sketch);
            [~, seg] = intercept(3, 3, iStone.sketch);
            seg = allotRatio(seg, mouldTemp);
            skFeature = getFeature(iStone.skMblbp, skPts);
            sk.pts = skPts;
            sk.fea = skFeature;
            ph.pts = skPts;
            matched = cell(1, trainNum);
            for itc = 1:1:trainNum
                iCursor = trainSet{itc};
                ph.fea = getFeature(iCursor.phMblbp, skPts);
                matched{1, itc} = getMatch(sk, ph);
                matched{1, itc}.mark = trainSet{itc}.mark;
                party = group(seg.part, matched{1, itc}.matchedPts);
                matched{1, itc}.ratio = getRatio(party);
            end
            mated{1, tc}.mark = iStone.mark;
%           matched
            mated{1, tc}.mated = getMate(matched, 5);
        end
        para
        for rc = 1:1:trainNum
            if ismember(mated{rc}.mark, mated{rc}.mated)
                correctNum(mc) = correctNum(mc)+dataPara(mc, rc);
            end
        end
        correctNum
        ePara = (dataSum(mc)-correctNum(mc))/dataSum(mc);
        para(mc) = 0.5*log((1-ePara)/ePara);
        for rc = 1:1:trainNum
            if ismember(mated{rc}.mark, mated{rc}.mated)
                dataPara(mc, rc) = dataPara(mc, rc)*exp(-para(mc))/dataSum(mc);
            else
                dataPara(mc, rc) = dataPara(mc, rc)*exp(para(mc))/dataSum(mc);
            end
        end
    end
    if sum(correctNum) > 0.9*mouldNum*trainNum
        break;
    end
end
minPara = abs(min(para))+1;
for mc = 1:1:mouldNum
    mouldTemp(mc).ratio = round(10*(para(mc)+minPara));
end
mould = mouldTemp;