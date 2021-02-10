function output = my_edge(input,method,scale,sigma)
switch method
    case 1
        output = Robert(input,scale,sigma);
    case 2
        output = Prewitt(input,scale,sigma);
    case 3
        output = Sobel(input,scale,sigma);
    case 4
        output = Marr(input,scale,sigma);
    case 5
        output = Canny(input,scale,sigma);
end
end