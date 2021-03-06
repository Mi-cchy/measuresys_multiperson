% Auto-generated by cameraCalibrator app on 23-Sep-2021
%-------------------------------------------------------


% Define images to process
imageFileNames = {'C:\Users\mitsuhiro\Downloads\HEIC-Converter-20210923-134231\IMG_0019.JPG',...
    'C:\Users\mitsuhiro\Downloads\HEIC-Converter-20210923-134231\IMG_0020.JPG',...
    'C:\Users\mitsuhiro\Downloads\HEIC-Converter-20210923-134231\IMG_0021.JPG',...
    'C:\Users\mitsuhiro\Downloads\HEIC-Converter-20210923-134231\IMG_0023.JPG',...
    'C:\Users\mitsuhiro\Downloads\HEIC-Converter-20210923-134231\IMG_0024.JPG',...
    'C:\Users\mitsuhiro\Downloads\HEIC-Converter-20210923-134231\IMG_0027.JPG',...
    'C:\Users\mitsuhiro\Downloads\HEIC-Converter-20210923-134231\IMG_0028.JPG',...
    'C:\Users\mitsuhiro\Downloads\HEIC-Converter-20210923-134231\IMG_0030.JPG',...
    'C:\Users\mitsuhiro\Downloads\HEIC-Converter-20210923-134231\IMG_0031.JPG',...
    'C:\Users\mitsuhiro\Downloads\IMG_0033.JPG',...
    };
% Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames);
imageFileNames = imageFileNames(imagesUsed);

% Read the first image to obtain image size
originalImage = imread(imageFileNames{1});
[mrows, ncols, ~] = size(originalImage);

% Generate world coordinates of the corners of the squares
squareSize = 30;  % in units of 'millimeters'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the camera
[cameraParams, imagesUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'millimeters', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', [], ...
    'ImageSize', [mrows, ncols]);

% View reprojection errors
h1=figure; showReprojectionErrors(cameraParams);

% Visualize pattern locations
h2=figure; showExtrinsics(cameraParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, cameraParams);

% For example, you can use the calibration data to remove effects of lens distortion.
undistortedImage = undistortImage(originalImage, cameraParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('MeasuringPlanarObjectsExample')
% showdemo('StructureFromMotionExample')
