% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 717.319341097953611 ; 770.167505036039188 ];

%-- Principal point:
cc = [ 377.310379031897469 ; 532.187481045736490 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.142927393986095 ; -0.417499906828329 ; -0.000436066551384 ; 0.000512324882285 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 8.323896527510621 ; 8.833171335368034 ];

%-- Principal point uncertainty:
cc_error = [ 4.140177840116989 ; 5.228053251465731 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.023800034718645 ; 0.096256700334776 ; 0.002653686758598 ; 0.002337272013601 ; 0.000000000000000 ];

%-- Image size:
nx = 768;
ny = 1024;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 17;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.198848e+00 ; 2.210452e+00 ; -3.199645e-02 ];
Tc_1  = [ -3.507684e+02 ; -5.287563e+02 ; 1.153561e+03 ];
omc_error_1 = [ 5.318703e-03 ; 6.306346e-03 ; 1.295055e-02 ];
Tc_error_1  = [ 6.888834e+00 ; 7.927701e+00 ; 1.376902e+01 ];

%-- Image #2:
omc_2 = [ 1.984570e+00 ; 2.121376e+00 ; -4.112569e-01 ];
Tc_2  = [ -2.967145e+02 ; -5.748266e+02 ; 1.297443e+03 ];
omc_error_2 = [ 4.580439e-03 ; 6.440682e-03 ; 1.065359e-02 ];
Tc_error_2  = [ 7.701267e+00 ; 8.846819e+00 ; 1.423901e+01 ];

%-- Image #3:
omc_3 = [ 1.968600e+00 ; 2.090693e+00 ; 2.196570e-01 ];
Tc_3  = [ -1.243935e+02 ; -4.467867e+02 ; 1.229519e+03 ];
omc_error_3 = [ 6.348420e-03 ; 5.305299e-03 ; 1.094585e-02 ];
Tc_error_3  = [ 7.248861e+00 ; 8.322950e+00 ; 1.461409e+01 ];

%-- Image #4:
omc_4 = [ NaN ; NaN ; NaN ];
Tc_4  = [ NaN ; NaN ; NaN ];
omc_error_4 = [ NaN ; NaN ; NaN ];
Tc_error_4  = [ NaN ; NaN ; NaN ];

%-- Image #5:
omc_5 = [ NaN ; NaN ; NaN ];
Tc_5  = [ NaN ; NaN ; NaN ];
omc_error_5 = [ NaN ; NaN ; NaN ];
Tc_error_5  = [ NaN ; NaN ; NaN ];

%-- Image #6:
omc_6 = [ NaN ; NaN ; NaN ];
Tc_6  = [ NaN ; NaN ; NaN ];
omc_error_6 = [ NaN ; NaN ; NaN ];
Tc_error_6  = [ NaN ; NaN ; NaN ];

%-- Image #7:
omc_7 = [ NaN ; NaN ; NaN ];
Tc_7  = [ NaN ; NaN ; NaN ];
omc_error_7 = [ NaN ; NaN ; NaN ];
Tc_error_7  = [ NaN ; NaN ; NaN ];

%-- Image #8:
omc_8 = [ 2.087167e+00 ; 2.117633e+00 ; -4.444882e-01 ];
Tc_8  = [ -2.936293e+02 ; -2.838175e+02 ; 1.498050e+03 ];
omc_error_8 = [ 5.770230e-03 ; 6.380415e-03 ; 1.274981e-02 ];
Tc_error_8  = [ 8.530852e+00 ; 1.018304e+01 ; 1.617901e+01 ];

%-- Image #9:
omc_9 = [ -2.063677e+00 ; -2.172573e+00 ; 2.998057e-02 ];
Tc_9  = [ -3.559119e+02 ; -3.623512e+02 ; 1.325751e+03 ];
omc_error_9 = [ 6.313973e-03 ; 6.163720e-03 ; 1.266320e-02 ];
Tc_error_9  = [ 7.673818e+00 ; 9.103752e+00 ; 1.554589e+01 ];

%-- Image #10:
omc_10 = [ NaN ; NaN ; NaN ];
Tc_10  = [ NaN ; NaN ; NaN ];
omc_error_10 = [ NaN ; NaN ; NaN ];
Tc_error_10  = [ NaN ; NaN ; NaN ];

%-- Image #11:
omc_11 = [ -1.758113e+00 ; -2.079716e+00 ; 3.666271e-01 ];
Tc_11  = [ -2.748170e+02 ; -4.406453e+02 ; 1.339520e+03 ];
omc_error_11 = [ 5.571310e-03 ; 5.002477e-03 ; 9.910986e-03 ];
Tc_error_11  = [ 7.731440e+00 ; 9.079915e+00 ; 1.476114e+01 ];

%-- Image #12:
omc_12 = [ NaN ; NaN ; NaN ];
Tc_12  = [ NaN ; NaN ; NaN ];
omc_error_12 = [ NaN ; NaN ; NaN ];
Tc_error_12  = [ NaN ; NaN ; NaN ];

%-- Image #13:
omc_13 = [ 1.967455e+00 ; 2.004543e+00 ; -8.242060e-02 ];
Tc_13  = [ -2.843184e+02 ; -5.014382e+02 ; 1.339113e+03 ];
omc_error_13 = [ 5.620515e-03 ; 5.699200e-03 ; 1.043155e-02 ];
Tc_error_13  = [ 7.867092e+00 ; 9.051373e+00 ; 1.526192e+01 ];

%-- Image #14:
omc_14 = [ 2.211817e+00 ; 2.034359e+00 ; 2.481164e-01 ];
Tc_14  = [ -3.157026e+02 ; -3.685264e+02 ; 1.229432e+03 ];
omc_error_14 = [ 6.640219e-03 ; 5.470375e-03 ; 1.235979e-02 ];
Tc_error_14  = [ 7.319500e+00 ; 8.491894e+00 ; 1.459212e+01 ];

%-- Image #15:
omc_15 = [ 2.005432e+00 ; 2.035615e+00 ; 2.047555e-01 ];
Tc_15  = [ -2.978280e+02 ; -4.369655e+02 ; 1.156609e+03 ];
omc_error_15 = [ 5.900294e-03 ; 5.275579e-03 ; 1.050341e-02 ];
Tc_error_15  = [ 6.888710e+00 ; 7.936612e+00 ; 1.370727e+01 ];

%-- Image #16:
omc_16 = [ NaN ; NaN ; NaN ];
Tc_16  = [ NaN ; NaN ; NaN ];
omc_error_16 = [ NaN ; NaN ; NaN ];
Tc_error_16  = [ NaN ; NaN ; NaN ];

%-- Image #17:
omc_17 = [ -1.843516e+00 ; -2.231918e+00 ; -2.818770e-02 ];
Tc_17  = [ -2.763677e+02 ; -4.914788e+02 ; 1.179223e+03 ];
omc_error_17 = [ 5.587208e-03 ; 5.820380e-03 ; 1.110876e-02 ];
Tc_error_17  = [ 6.939207e+00 ; 8.160161e+00 ; 1.386459e+01 ];

