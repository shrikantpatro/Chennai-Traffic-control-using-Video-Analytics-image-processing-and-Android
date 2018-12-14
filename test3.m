%codes
clc;
close all;
clear all;
%image acquisition
f1=imread('4.jpeg');
f=imresize(f1,[800 NaN]); % image loading unit
figure (1)
imshow(f)
g=rgb2gray(f);
g=medfilt2(g,[5 5]);

%figure (2)
%imshow (g)
% morphological image processing 
conc=strel('disk',5);
gi=imdilate(g,conc);
conc1=strel('disk',5);
ge=imerode(gi,conc1); % morphological image processing
gdiff=imsubtract(gi,ge);
gdiff1=mat2gray(gdiff);
%figure (4)
%imshow (gdiff1)
gdiff2=conv2(gdiff1,[1 1;1 1]);
%figure  (5)
%imshow (gdiff2)
gdiff3=imadjust(gdiff2,[0.4 0.9],[0 1],1);
%figure (6)
%imshow (gdiff3)
B=logical(gdiff3);
[a1 b1]=size(B);
%figure(7)
%imshow(B)
er=imerode(B,strel('line',60,8));
%figure(8)
%imshow(er)
out1=imsubtract(B,er);
F=imfill(out1,'holes'); %filling the object
H=bwmorph(F,'thin',0.5);
H=imerode(H,strel('line',8,55));
%figure(9)
%imshow(H)
%Normalization% & Object Recognition 
I=bwareaopen(H,floor((a1/18)*(b1/18)));
I(1:floor(.9*a1),1:2)=1;
I(a1:-1:(a1-20),b1:1:(b1-2))=1;
%figure(10)
%imshow(I)
%Cars detection in image
k=figure (11);
%I2 = imcrop(I,[297 302 100 80]);
imshowpair (f,I);
F = getframe(k);
[X, Map] = frame2im(F);
figure(12)
%imshow(X)
crp=imcrop(X,[578 37 219 521]);


A=crp;
[ro,co,k]=size(A);
x=(ro*co);
x1=x*0.8;
disp(x);
disp(x1);

%new=[]
pink_count=0;
%new1=[];
green_count=0;
%I=imread('board.tif');
%[m n k]=size(I);



for r=1:ro
    for c = 1:co
        pixel=A(r,c);
        if pixel==255
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
imshow(crp);
impixelinfo();
b2="Vehicle:-";
disp(b2);
disp(pink_count);
b3="Non vehicle part:-";
disp(b3);
disp(green_count);
disp(b1);
per = 0;
per =(pink_count/x)*100;
disp(per) 


%{

%Create bounding box on detected cars
Iprops=regionprops(I,'BoundingBox','Image');
hold on
text(8,785,strcat('\color{green}Cars Detected:',num2str(length(Iprops))))
hold on
for n=2:size(Iprops,1)
rectangle('Position',Iprops(n).BoundingBox,'EdgeColor','g','LineWidth',2);
end
hold off


i=X;
%j2=imresize(i,0.5,'bicubic');
j2=i;

%Step 2 of algo to Zoom image
%c=zoomver(j2);
c=j2;
subplot(1,2,1);
imshow(j2),title('original');
subplot(1,2,2);
imshow(c),title('Zoomed image');
%To display pixel info
imtool(c)
c1=c;
%Now extract the required area
I2 = imcrop(c1,[297 302 100 80]);
imshow(I2);
%To capture pixel intensity of complete image 
I3=capture_intensity(I2);
imshow(I3)
I4=seg_black_white(I3);
fprintf(I4);
%}




