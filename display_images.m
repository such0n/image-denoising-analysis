
example_noise_idx = round(num_levels / 2); 
example_noise = noise_levels(example_noise_idx);

%gen szum
noisy_image_gaussian = imnoise(image, 'gaussian', 0, example_noise^2); % gaus
noisy_image_saltpepper = imnoise(image, 'salt & pepper', example_noise); % szum impulsowy
noisy_image_speckle = imnoise(image, 'speckle', example_noise); % szum speckle


denoised_manual_median_gaussian = Median(noisy_image_gaussian, 5); 
denoised_manual_gaussian_gaussian = Gaussian(noisy_image_gaussian, 5, 1); 
denoised_dncnn_gaussian = denoiseImage(noisy_image_gaussian, net); 

denoised_manual_median_saltpepper = Median(noisy_image_saltpepper, 5); 
denoised_manual_gaussian_saltpepper = Gaussian(noisy_image_saltpepper, 5, 1); 
denoised_dncnn_saltpepper = denoiseImage(noisy_image_saltpepper, net); 

denoised_manual_median_speckle = Median(noisy_image_speckle, 5); 
denoised_manual_gaussian_speckle = Gaussian(noisy_image_speckle, 5, 1); 
denoised_dncnn_speckle = denoiseImage(noisy_image_speckle, net);


figure;
subplot(1, 3, 1);
imshow(noisy_image_gaussian);
title(['(Gaussowski, \sigma = ' num2str(example_noise) ')']);

subplot(1, 3, 2);
imshow(noisy_image_saltpepper);
title(['(Impulsowy, \sigma = ' num2str(example_noise) ')']);

subplot(1, 3, 3);
imshow(noisy_image_speckle);
title(['(Speckle, \sigma = ' num2str(example_noise) ')']);

figure;
subplot(1, 4, 1);
imshow(denoised_manual_median_gaussian);
title('(Medianowy - Gauss)');

subplot(1, 4, 2);
imshow(denoised_manual_gaussian_gaussian);
title('(Gaussowski - Gauss)');

subplot(1, 4, 3);
imshow(denoised_dncnn_gaussian);
title('(DnCNN - Gauss)');

subplot(1, 4, 4);
imshow(noisy_image_gaussian);
title('Zaszumiony');



figure;
subplot(1, 4, 1);
imshow(denoised_manual_median_saltpepper);
title('(Medianowy - S and p)');

subplot(1, 4, 2);
imshow(denoised_manual_gaussian_saltpepper);
title('(Gaussowski - S and p)');

subplot(1, 4, 3);
imshow(denoised_dncnn_saltpepper);
title('(DnCNN - S and p)');

subplot(1, 4, 4);
imshow(noisy_image_saltpepper);
title('Zaszumiony');




figure;
subplot(1, 4, 1);
imshow(denoised_manual_median_speckle);
title('(Medianowy - Speckle)');

subplot(1, 4, 2);
imshow(denoised_manual_gaussian_speckle);
title('(Gaussowski - Speckle)');

subplot(1, 4, 3);
imshow(denoised_dncnn_speckle);
title('(DnCNN - Speckle)');

subplot(1, 4, 4);
imshow(noisy_image_speckle);
title('Zaszumiony');