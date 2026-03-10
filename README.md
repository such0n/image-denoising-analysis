# Image Denoising & Noise Analysis Study 📉

A comprehensive MATLAB project focused on the mathematical analysis and practical restoration of degraded digital images. This study evaluates the effectiveness of various filtering techniques against three distinct noise models.

## 🎯 Project Objective
The goal was to simulate real-world image degradation and compare five different restoration methods, including:
* Standard linear and non-linear filters.
* Custom-coded manual implementations of core algorithms.
* Modern Deep Learning approaches (DnCNN).

---

## 🔬 Theoretical Background

### Noise Models
We implemented and analyzed three types of stochastic noise:
1.  **Gaussian Noise:** Modeled using normal distribution $\mu=0$ and variable variance $\sigma^2$.
2.  **Salt & Pepper Noise:** Impulse noise manifesting as pixels with extreme values ($0$ or $255$).
3.  **Speckle Noise:** Multiplicative noise often found in medical imaging or radar.

### Denoising Techniques
The project evaluates the following restoration strategies:
* **Median Filter:** Non-linear sorting-based filter (excellent for Salt & Pepper).
* **Gaussian Filter:** Linear low-pass filter using a convolution kernel $G(x, y)$.
* **DnCNN (Deep Convolutional Neural Network):** A 17-layer residual learning model for high-fidelity restoration.



---

## 📊 Quality Metrics
To objectively compare the results, two mathematical metrics were used:
* **PSNR (Peak Signal-to-Noise Ratio):** Measures the ratio between the maximum possible power of a signal and the power of corrupting noise.
* **SSIM (Structural Similarity Index):** A perception-based model that considers luminance, contrast, and structure.

---

## 🛠️ Implementation Details
The project is structured modularly:
* `main.m` – Core execution flow and parameter control.
* `Median.m` / `Gaussian.m` – **Manual implementations** (scratch-built convolution and sliding window algorithms).
* `wykresy.m` – Automated generation of performance charts.



## 📈 Key Findings
* **Median Filters** outperform all other methods specifically for impulse (Salt & Pepper) noise.
* **Gaussian Filters** effectively reduce Gaussian noise but tend to blur sharp edges.
* **DnCNN** proved to be the most universal solution, maintaining high SSIM across all noise types, albeit at a higher computational cost.
* **Built-in vs. Manual:** Built-in MATLAB functions are highly optimized for speed, whereas manual implementations allowed for a deep understanding of boundary handling (padding) and kernel operations.

---

## 🚀 How to use
1. Open MATLAB.
2. Run `main.m`.
3. The script will load the test image, apply noise, process it through the filter bank, and output a full comparative report with charts.

> **Note:** This project was developed as part of the "Computing Techniques" course at the AGH University of Krakow (WIET Faculty).
