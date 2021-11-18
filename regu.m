function [alpha] = regu(dc)
pop = dc;
deci = pop(2)*4 +pop(3)*2 +pop(4)*1 ;
if pop(1)==0
alpha = deci/100;
end
if pop(1)==1
alpha = deci/10;
end
end

