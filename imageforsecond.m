function [img] = imageforsecond(loc,net)
a=zeros([224 224 1],'uint8');
%a= uint(a);

imgg=imresize(imread(loc),[224 224]);

rgbimgg = cat(3, imgg, imgg, imgg);

[pred,prob]= classify(net, rgbimgg);

%imgg=rgb2gray(imgg1);
imgg= imresize(imgg,[224 223]);

for i=1:223
a(:,i)=imgg(:,i);
end

probb=interp1([0 1],[0 255],prob);
probb=round(probb);

for k=1:7
    for j=1:32
        a((j+((k-1)*32)), 224)=probb(k);
    end
end

img=cat(3,a,a,a);


end
