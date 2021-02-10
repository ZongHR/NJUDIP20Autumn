function output = my_edgelinking(input, row, col)
pos = [row,col];
%边缘每个点至多经过两次
img = 2 * input;
%对邻域的标号，顺时针遍历
% [ 2 ][ 3 ][ 4 ]
% [ 1 ][ X ][ 5 ]
% [ 8 ][ 7 ][ 6 ]
neighborhood = [ 0 -1; -1 -1; -1 0; -1 1; 0 1; 1 1; 1 0; 1 -1 ];
exitdir = [ 7 7 1 1 3 3 5 5 ];
%找到出发点，设置初次进入方向
for i=1:8
    tmp = pos + neighborhood(i,:);
    if img(tmp(1),tmp(2))
        initpos = tmp;
        initdir = exitdir(i);
        output = initpos;
        break;
    end  
end
tmpdir = initdir;
%开始遍历追踪边缘
%第二次同方向回到出发点 或 邻域内无可经过边缘点 时终止
flag = true;
while flag
    flag = false;
    for i=1:8
        dir = mod(tmpdir+i-1,8);
        if dir == 0
            dir = 8;
        end
        %当前遍历到的点
        pos = tmp + neighborhood(dir);
        if img(pos(1),pos(2))>0
            %找到边缘点,可经过次数减一
            img(pos(1),pos(2))=img(pos(1),pos(2))-1;
            tmp = pos;
            %确定进入方向
            tmpdir = exitdir(dir);
            output = [output;tmp];
            flag = true;
            if all(tmp==initpos)&&(tmpdir==initdir)
                %同方向进入出发点，结束
                flag = false;
            end
            break;
        end
    end
end

end