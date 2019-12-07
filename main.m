clc;
clear;
close all;

imgDir  = dir(['*.jpg']);
for i=1:31
    Image=imread(imgDir(i).name);
    Image=rgb2gray(Image);

    
    
    image2   = rgb2gray(imread('image2.jpg'));
    %Image = rgb2gray(imread('image.jpg'));
    figure(1)
    subplot(221)
    imshow(Image);
    title('Image 1')
    subplot(222)
    imshow(image2);
    title('voiture 1');
    c = normxcorr2(image2,Image);
    subplot(223)
    mesh(c), shading flat
    title('NCC')
    colorbar;
    [ypeak, xpeak] = find(c==max(c(:)));
    yoffSet = ypeak-size(image2,1);
    xoffSet = xpeak-size(image2,2);
    subplot(224)
    imshow(Image);
    title('image suivi')
    imrect(gca, [xoffSet+1, yoffSet+1, size(image2,2), size(image2,1)]);
end