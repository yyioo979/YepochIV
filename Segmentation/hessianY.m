function [ output_args ] = hessianY( input_args )
% __author__ = Yepoch
% __version__ = 1.0.0
% __lastUpdate__ = 2017.2.9
% __AP__ = 'extend'

    function [ output_args ] = maper(po, scales)
        xx = cell(1, 3);
        xx{1}.pos = [po(1)-scales+1, po(2)-1.5*scales+0.5;
                     po(1)-scales+1, po(2)-0.5*scales+0.5;
                     po(1)+scales-1, po(2)-1.5*scales+0.5;
                     po(1)+scales-1, po(2)-0.5*scales+0.5];
        xx{1}.par = 1;
        xx{2}.pos = [po(1)-scales+1, po(2)-0.5*scales+0.5;
                     po(1)-scales+1, po(2)+0.5*scales-0.5;
                     po(1)+scales-1, po(2)-0.5*scales+0.5;
                     po(1)+scales-1, po(2)+0.5*scales-0.5];
        xx{2}.par = -2;
        xx{3}.pos = [po(1)-scales+1, po(2)+0.5*scales-0.5;
                     po(1)-scales+1, po(2)+1.5*scales-0.5;
                     po(1)+scales-1, po(2)+0.5*scales-0.5;
                     po(1)+scales-1, po(2)+1.5*scales-0.5];
        xx{3}.par = 1;
        yy = cell(1, 3);
        yy{1}.pos = [po(1)-1.5*scales+0.5, po(2)-scales+1;
                     po(1)-1.5*scales+0.5, po(2)+scales-1;
                     po(1)-0.5*scales+0.5, po(2)-scales+1;
                     po(1)-0.5*scales+0.5, po(2)+scales-1];
        yy{1}.par = 1;
        yy{2}.pos = [po(1)-0.5*scales+0.5, po(2)-scales+1;
                     po(1)-0.5*scales+0.5, po(2)+scales-1;
                     po(1)+0.5*scales-0.5, po(2)-scales+1;
                     po(1)+0.5*scales-0.5, po(2)+scales-1];
        yy{2}.par = -2;
        yy{3}.pos = [po(1)+0.5*scales-0.5, po(2)-scales+1;
                     po(1)+0.5*scales-0.5, po(2)+scales-1;
                     po(1)+1.5*scales-0.5, po(2)-scales+1;
                     po(1)+1.5*scales-0.5, po(2)+scales-1];
        yy{3}.par = 1;
        xy = cell(1, 4);
        xy{1}.pos = [po(1)-scales, po(2)-scales;
                     po(1)-scales, po(2)-1;
                     po(1)-1, po(2)-scales;
                     po(1)-1, po(2)-1];
        xy{1}.par = 1;
        xy{2}.pos = [po(1)-scales, po(2)+1;
                     po(1)-scales, po(2)+scales;
                     po(1)-1, po(2)+1;
                     po(1)-1, po(2)+scales];
      	xy{2}.par = -1;
        xy{3}.pos = [po(1)+1, po(2)-scales;
                     po(1)+1, po(2)-1;
                     po(1)+scales, po(2)-scales;
                     po(1)+scales, po(2)-1];
      	xy{3}.par = -1;
        xy{4}.pos = [po(1)+1, po(2)+1;
                     po(1)+1, po(2)+scales;
                     po(1)+scales, po(2)+1;
                     po(1)+scales, po(2)+scales];
      	xy{4}.par = 1;
        output_args.xx = xx;
        output_args.yy = yy;
        output_args.xy = xy;
    end

    function [ output_args ] = worker( input_args, map )
        dxx = ant(input_args, map.xx);
        dyy = ant(input_args, map.yy);
        dxy = ant(input_args, map.xy);
        output_args = dxx*dyy-0.81*dxy*dxy;
    end

    function [ output_args ] = ant( input_args, map )
        num = length(map);
        output_args = 0;
        for nc = 1:1:num
            para1 = input_args(map{nc}.pos(1, 1), map{nc}.pos(1, 2));
            para2 = input_args(map{nc}.pos(2, 1), map{nc}.pos(2, 2));
            para3 = input_args(map{nc}.pos(3, 1), map{nc}.pos(3, 2));
            para4 = input_args(map{nc}.pos(4, 1), map{nc}.pos(4, 2));
            para = para1+para4-para2-para3;
            output_args = output_args+map{nc}.par*para;
        end
    end

    function [ output_args ] = manager( input_args, scales )
        [row, cloumn] = size(input_args);
        output_args = zeros(row, cloumn);
        expara = 1.5*scales-0.5;
        bottle = extend(input_args, expara);
        for rc = expara+1:1:expara+row
            for cc = expara+1:1:expara+cloumn
                position = maper([rc, cc], scales);
                output_args(rc-expara, cc-expara) = worker(bottle, position);
                [rc-expara, cc-expara]
            end
        end
    end

    output_args = manager(input_args, 3);
end