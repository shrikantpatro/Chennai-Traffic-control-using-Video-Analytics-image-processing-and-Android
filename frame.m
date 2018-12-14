a=VideoReader('video.mp4');
for img = 1:a.NumberOfFrames;
    filename=strcat('frame',num2str(img),'.jpg');
    b=read(a,img);
    imwrite(filename);
end  