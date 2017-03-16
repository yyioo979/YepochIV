function [ output_args ] = immerge( input_args )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.14
% __AP__ = none

    function [ output_args ] = completion( input_args )
        it_num = 1;
        im_num = 1;
        it_mould = ones(3, 3);
        im_mould = [0, 1, 0; 1, 1, 1; 0, 1, 0];
        for itc = 1:1:it_num
            output_args = imdilate(input_args, it_mould);
        end
        for imc = 1:1:im_num
            output_args = imerode(output_args, im_mould);
        end
    end
    
    function [ output_args ] = engrave( input_args )
        [row, cloumn] = size(input_args);
        [stemple, snum] = bwlabel(input_args, 8);
        socialTemple = cell(1, snum);
        for sc = 1:1:snum
            socialTemple{1, sc}.territory = zeros(row, cloumn);
            socialTemple{1, sc}.domain = [row+1, cloumn+1; -1, -1];
            socialTemple{1, sc}.partMark = sc;
            socialTemple{1, sc}.pts = [];
            socialTemple{1, sc}.ptsNum = 0;
        end
        socialTemple{1, snum+1}.territory = zeros(row, cloumn);
        socialTemple{1, snum+1}.domain = [1, 1; row, cloumn];
        socialTemple{1, snum+1}.partMark = 0;
        socialTemple{1, snum+1}.pts = [];
        socialTemple{1, snum+1}.ptsNum = 0;
        for rc = 1:1:row
            for cc = 1:1:cloumn
                if stemple(rc, cc) == 0
                    socialTemple{1, snum+1}.territory(rc, cc) = 1;
                else
                    counter = stemple(rc, cc);
                    socialTemple{1, counter}.territory(rc, cc) = 1;
                    cursor = socialTemple{1, counter}.domain;
                    if rc < cursor(1, 1)
                        socialTemple{1, counter}.domain(1, 1) = rc;
                    end
                    if cc < cursor(1, 2)
                        socialTemple{1, counter}.domain(1, 2) = cc;
                    end
                    if rc > cursor(2, 1)
                        socialTemple{1, counter}.domain(2, 1) = rc;
                    end
                    if cc > cursor(2, 2)
                        socialTemple{1, counter}.domain(2, 2) = cc;
                    end
                end
            end
        end
        output_args = socialTemple;
    end

    seniFin = completion(input_args);
    output_args = engrave(seniFin);
end

