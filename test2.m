a=VideoReader('cars.mp4');
for img = 1:100;
    filename=strcat('frame',num2str(img),'.jpg');
    b=read(a,img);
    imwrite(b,filename);
end 