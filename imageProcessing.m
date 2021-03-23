function [K] = imageProcessing()
  
  pkg load image
        I=imread('I.jpg');
        I=mat2gray(I); 
        J = imresize(I,[20 20]);
        K = reshape(J,1,[]);
        K = 0.75 - K;
  
endfunction
