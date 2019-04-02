i=imread('NFI-00101001.jpg');
[rows, columns, numberOfColorBands] = size(i);
rgbImage = cat(3, i, i, i);
[rows, columns, numberOfColorBands] = size(rgbImage)
rgbImage=rgb2gray(rgbImage);
imshow(rgbImage)