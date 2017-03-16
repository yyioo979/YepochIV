num = length(data);
I1 = data{1};
skPts = getPoints(I1.sketch);
skFeature = getFeature(I1.skMblbp, skPts);
sk.pts = skPts;
sk.fea = skFeature;
clo = length(skFeature);
matched = cell(1, num);
ph.pts = skPts;
for nc = 1:1:num
    ph.fea = getFeature(data{nc}.phMblbp, skPts);
    matched{1, nc} = getMatch(sk, ph);
    matched{1, nc}.mark = data{nc}.mark;
end
