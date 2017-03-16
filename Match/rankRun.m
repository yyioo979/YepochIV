% __author__ = Yepoch
% __lastUpdate__ = 2017.2.14

num = length(data);
rankNum = 10;
mated = cell(1, num);
for nc = 1:1:num
    nc
    iStone = data{nc};
    skPts = getPoints(iStone.sketch);
%     seg = segmentation(iStone.sketch);
    [~, seg] = intercept(3, 3, iStone.sketch);
%     seg = allotRatio(seg, mould);
    skFeature = getFeature(iStone.skMblbp, skPts);
    sk.pts = skPts;
    sk.fea = skFeature;
    ph.pts = skPts;
    matched = cell(1, num);
    for ic = 1:1:num
        iCursor = data{ic};
        ph.fea = getFeature(iCursor.phMblbp, skPts);
        matched{1, ic} = getMatch(sk, ph);
        matched{1, ic}.mark = data{ic}.mark;
        party = group(seg.part, matched{1, ic}.matchedPts);
        matched{1, ic}.ratio = getRatio(party);
%         matched{1, ic}.ratio = matched{1, ic}.matchedNum;
    end
    mated{1, nc}.mark = iStone.mark;
    mated{1, nc}.mated = getMate(matched, rankNum);
end

correctNum = zeros(1, rankNum);
for rc = 1:1:rankNum
    correctNum(1, rc) = getRank(mated, rc);
end
