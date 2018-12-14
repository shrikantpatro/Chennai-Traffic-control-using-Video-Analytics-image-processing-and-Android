function b1=rgbpink(z1)
z=z1;
[ro,co]=size(z);
x=(ro*co);
x1=x*(80/100);
fprintf(x);
fprintf(x1);

%new=[]
pink_count=1;
%new1=[];
green_count=1;
R = A(:,:,1); 
G = A(:,:,2); 
B = A(:,:,3);
for c = 1:ro
    for r = 1:co
        
        if R(c,r)==255 && B(c,r)==255
               pink_count=pink_count+1;
        else
             green_count=green_count+1;
        end
    end
end

if pink_count>=x1
    b1="Heavy Traffic";
elseif pink_count>green_count && pink_count<x1
    b1="Moderate Traffic";
else
    b1="Normal Traffic";
end
disp(pink_count);
disp('-----------------------------------------------')
disp(green_count);








