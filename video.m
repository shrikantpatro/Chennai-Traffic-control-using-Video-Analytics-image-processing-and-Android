
% obj=VideoReader('test2.avi');
 %a=read(obj);
 %frames=get(obj,'NumberOfFrames')
 %for k=1:frames-1;
  %   I(k).cdata=a(:,:,:,k);
   %  I(k).colormap=[];
 %end
 %implay(I);
 a=VideoReader('video.mp4');
for img = 1:a.NumberOfFrames;
    filename=strcat('frame',num2str(img),'.jpg');
    b = read(a, img);
    imshow(b);
    imwrite(b,filename);
end
movie(img)
 
 
 %vidpath=uigetdir();