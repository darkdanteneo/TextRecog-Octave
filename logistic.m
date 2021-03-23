input_layer_size = 400;
num_labels = 10;


load('data.mat');
m = size(X,1);

rand_data = randperm(m);
sel = X(rand_data(1:100), :);

image(sel);


lambda = 0.1;

[all_theta] = oneVsAll(X, y, num_labels, lambda);

pause;


pred = predictOneVsAll(all_theta, X);

fprintf('accuracy: %d\n', mean(double(pred == y))  * 100);

rp = randperm(m);

for i = 1:m
  image(X(rp(i), :));
  
  pred = predictOneVsAll(all_theta, X(rp(i), :));
  printf('Prediction: %d \n' , mod(pred,10));
  
  s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
    
endfor
