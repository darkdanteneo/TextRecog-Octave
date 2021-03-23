pkg load communications

input_layer_size = 400;
num_labels = 10;


load('data.mat');
m = size(X,1);



rp = randperm(m);

for i = 1:m
  
  imshow((vec2mat(X(rp(i)),20))');
  pred = predictOneVsAll(all_theta, X(rp(i), :));
  printf('Prediction: %d \n' , mod(pred,10));
  
  s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
    if s == 'a'
       [K] = imageProcessing;
       imshow((vec2mat(K,20))');
       pred = predictOneVsAll(all_theta, K);
       printf('Prediction: %d \n' , mod(pred,10));
       input('Paused - press enter to continue','g');
    end
    
endfor
