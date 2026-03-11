clc; clear; close all;

image = im2double(imread('13.jpg'));
if size(image,3) == 3
    image = rgb2gray(image); 
end
figure; imshow(image); title('Oryginalny obraz');

% noise parameters
noise_levels = 0.01:0.02:0.4; 
num_levels = length(noise_levels);
noise_types = {'gaussian', 'salt & pepper', 'speckle'};

% setting matrixes to store results
psnr_median = zeros(length(noise_types), num_levels);
psnr_gaussian = zeros(length(noise_types), num_levels);
psnr_dncnn = zeros(length(noise_types), num_levels);
psnr_manual_median = zeros(length(noise_types), num_levels);
psnr_manual_gaussian = zeros(length(noise_types), num_levels);

ssim_median = zeros(length(noise_types), num_levels);
ssim_gaussian = zeros(length(noise_types), num_levels);
ssim_dncnn = zeros(length(noise_types), num_levels);
ssim_manual_median = zeros(length(noise_types), num_levels);
ssim_manual_gaussian = zeros(length(noise_types), num_levels);

time_median = zeros(length(noise_types), num_levels);
time_gaussian = zeros(length(noise_types), num_levels);
time_dncnn = zeros(length(noise_types), num_levels);
time_manual_median = zeros(length(noise_types), num_levels);
time_manual_gaussian = zeros(length(noise_types), num_levels);


net = denoisingNetwork('DnCNN'); 


for n_type = 1:length(noise_types)
    noise_type = noise_types{n_type};
    for i = 1:num_levels
        noise_std = noise_levels(i);
        
        
        if strcmp(noise_type, 'gaussian')
            noisy_image = imnoise(image, 'gaussian', 0, noise_std^2);
        elseif strcmp(noise_type, 'salt & pepper')
            noisy_image = imnoise(image, 'salt & pepper', noise_std);
        elseif strcmp(noise_type, 'speckle')
            noisy_image = image + sqrt(noise_std) * randn(size(image));
        end

        % Built-in median filter
        tic;
        denoised_median = medfilt2(noisy_image, [4, 4]);
        time_median(n_type, i) = toc;
        psnr_median(n_type, i) = psnr(denoised_median, image);
        ssim_median(n_type, i) = ssim(denoised_median, image);

        % Built-in Gaussian filter
        tic;
        h = fspecial('gaussian', [5, 5], 1);
        denoised_gaussian = imfilter(noisy_image, h, 'symmetric');
        time_gaussian(n_type, i) = toc;
        psnr_gaussian(n_type, i) = psnr(denoised_gaussian, image);
        ssim_gaussian(n_type, i) = ssim(denoised_gaussian, image);

        % DnCNN
        tic;
        denoised_dncnn = denoiseImage(noisy_image, net);
        time_dncnn(n_type, i) = toc;
        psnr_dncnn(n_type, i) = psnr(denoised_dncnn, image);
        ssim_dncnn(n_type, i) = ssim(denoised_dncnn, image);

        % mine median filter
        tic;
        denoised_manual_median = Median(noisy_image, 5);
        time_manual_median(n_type, i) = toc;
        psnr_manual_median(n_type, i) = psnr(denoised_manual_median, image);
        ssim_manual_median(n_type, i) = ssim(denoised_manual_median, image);

        % mine Gaussian filter
        tic;
        denoised_manual_gaussian = Gaussian(noisy_image, 5, 1); 
        time_manual_gaussian(n_type, i) = toc;
        psnr_manual_gaussian(n_type, i) = psnr(denoised_manual_gaussian, image);
        ssim_manual_gaussian(n_type, i) = ssim(denoised_manual_gaussian, image);
    end
end

draw_plots;
display_images;