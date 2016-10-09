function aArray = roundWithFixedSum(origArray,nDecimals,sumFix)
% 1 - rounding
aArray=round(origArray,nDecimals);

% 2 - put residual in the first eligible array element
residual=sum(aArray)-sumFix;
if residual > 0
    i=1;
    while residual>0
        aArray(i)=max(0,aArray(i)-residual);
        residual=sum(aArray)-sumFix;
        i=i+1;
    end
elseif residual <0
    i=1;
    while residual<0        
        aArray(i)=min(sumFix,aArray(i)-residual);
        residual=sum(aArray)-sumFix;
        i=i+1;
    end
end

aArray=round(aArray,nDecimals);

end

