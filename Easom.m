% % Easom function have several local minima the global minima is 
% % (x1,y1)=(pi,pi) and f(x1,y1)=-1 x,y=[-100 100]
% % y = -cos(x1)*cos(x2)*exp(-(x1-pi)^2-(x2-pi)^2);

function z=Easom(x)

    global NFE;
    if isempty(NFE)
        NFE=0;
    end
    
    NFE=NFE+1;
 signa=1;
 
     if ( x(8)==1 )
         signa = -1;
     end
 signb=1;
     if ( x(16)==1 )
         signb = -1;
     end
 x1=signa*(x(1)+2 * x(2)+4* x(3)+8* x(4)+16*x(5)+32*x(6)+64*x(7));
 x2=signb*(x(9)+2 * x(10)+4* x(11)+8* x(12)+16*x(13)+32*x(14)+64*x(15));
 
     z= -cos(x1)*cos(x2)*exp(-(x1-pi)^2-(x2-pi)^2);
   

end