clc; clear; close all;
img=imread("toCircleCrop.jpg"); 
img2= zeros(512,512,3);
a1=256;
centralx= 256;
centraly=256;
for x1=1:512 
    for y1=1:512
        if y1~=256
        r2=sqrt((x1-centralx)*(x1-centralx) + (y1-centraly)*(y1-centraly));
        tetha= atand((-1*y1+centraly)/(x1-centraly));
        if x1<centralx
            tetha= tetha+180;
        end
            if r2>=a1
                dr=r2-a1;               
                x2= x1- round(dr*cosd(tetha)*.8);
                y2= y1+ round(dr*sind(tetha)*.8);
            else
                dr=r2;              
                x2= x1- round(dr*cosd(tetha)+ centralx-1);  
                y2= y1+ round(dr*sind(tetha)+centraly-1);  
            end
        end
         
        
        img2(y2, x2, :)=img(y1, x1, :);
    end
end
img2=uint8(img2);
imshow(img2);