
figure;
for n_type = 1:length(noise_types)
    subplot(3, 1, n_type);
    plot(noise_levels, psnr_median(n_type, :), '-o', 'LineWidth', 1.5, 'DisplayName', 'Medianowy (wbudowany)');
    hold on;
    plot(noise_levels, psnr_gaussian(n_type, :), '-s', 'LineWidth', 1.5, 'DisplayName', 'Gaussowski (wbudowany)');
    plot(noise_levels, psnr_dncnn(n_type, :), '-x', 'LineWidth', 1.5, 'DisplayName', 'DnCNN');
    plot(noise_levels, psnr_manual_median(n_type, :), '-d', 'LineWidth', 1.5, 'DisplayName', 'Medianowy (ręczny)');
    plot(noise_levels, psnr_manual_gaussian(n_type, :), '-*', 'LineWidth', 1.5, 'DisplayName', 'Gaussowski (ręczny)');
    hold off;

    xlabel('Odchylenie standardowe szumu (\sigma)');
    ylabel('PSNR [dB]');
    title(['Porównanie PSNR dla szumu: ', noise_types{n_type}]);
    legend('Location', 'northeast');
    grid on;
end

figure;
for n_type = 1:length(noise_types)
    subplot(3, 1, n_type);
    plot(noise_levels, ssim_median(n_type, :), '-o', 'LineWidth', 1.5, 'DisplayName', 'Medianowy (wbudowany)');
    hold on;
    plot(noise_levels, ssim_gaussian(n_type, :), '-s', 'LineWidth', 1.5, 'DisplayName', 'Gaussowski (wbudowany)');
    plot(noise_levels, ssim_dncnn(n_type, :), '-x', 'LineWidth', 1.5, 'DisplayName', 'DnCNN');
    plot(noise_levels, ssim_manual_median(n_type, :), '-d', 'LineWidth', 1.5, 'DisplayName', 'Medianowy (ręczny)');
    plot(noise_levels, ssim_manual_gaussian(n_type, :), '-*', 'LineWidth', 1.5, 'DisplayName', 'Gaussowski (ręczny)');
    hold off;

    xlabel('Odchylenie standardowe szumu (\sigma)');
    ylabel('SSIM');
    title(['Porównanie SSIM dla szumu: ', noise_types{n_type}]);
    legend('Location', 'northeast');
    grid on;
end

figure;
for n_type = 1:length(noise_types)
    subplot(3, 1, n_type);
    plot(noise_levels, time_median(n_type, :), '-o', 'LineWidth', 1.5, 'DisplayName', 'Medianowy (wbudowany)');
    hold on;
    plot(noise_levels, time_gaussian(n_type, :), '-s', 'LineWidth', 1.5, 'DisplayName', 'Gaussowski (wbudowany)');
    plot(noise_levels, time_dncnn(n_type, :), '-x', 'LineWidth', 1.5, 'DisplayName', 'DnCNN');
    plot(noise_levels, time_manual_median(n_type, :), '-d', 'LineWidth', 1.5, 'DisplayName', 'Medianowy (ręczny)');
    plot(noise_levels, time_manual_gaussian(n_type, :), '-*', 'LineWidth', 1.5, 'DisplayName', 'Gaussowski (ręczny)');
    hold off;

    xlabel('Odchylenie standardowe szumu (\sigma)');
    ylabel('Czas obliczeń [s]');
    title(['Porównanie czasu obliczeń dla szumu: ', noise_types{n_type}]);
    legend('Location', 'northwest');
    grid on;
end

