clear;clc;
%Dir 
filePath = fullfile('D:\EECE5554\Lab5calibration\Cinder');
%Load undistorted images
buildingScene = imageDatastore(filePath);
%Display the images
montage(buildingScene.Files)

%Read the images from the image set and load into pics array
I = readimage(buildingScene,1);

%Initialize features for I(1)
grayImage = im2gray(I);
[y,x,m] = harris(grayImage, 2000, 'tile', [20 20], 'disp');
points = cornerPoints([x,y]);
[features, points] = extractFeatures(grayImage, points);

%Initialize all the transforms to the identity matrix
numImages = numel(buildingScene.Files);
tforms(numImages) = projective2d(eye(3));

%Initialize variable to hold image sizes
imageSize = zeros(numImages,2);

%Iterate over remaining image pairs
for n = 2:numImages

    %Store points and features for I(n-1)
    pointsPrevious = points;
    featuresPrevious = features;

    %Read I(n).
    I = readimage(buildingScene, n);
    
    %Convert image to grayscale.
    grayImage = im2gray(I); 

    %Save image size
    imageSize(n,:) = size(grayImage);

    %Detect and extract Harris features for I(n).
    [y,x,m] = harris(grayImage, 2000, 'tile', [20 20], 'disp');
    points = cornerPoints([x,y]);
    [features, points] = extractFeatures(grayImage, points);
  
    % Find correspondences between I(n) and I(n-1).
    indexPairs = matchFeatures(features, featuresPrevious, 'Unique', true);
    
    matchedPoints = points(indexPairs(:,1), :);
    matchedPointsPrev = pointsPrevious(indexPairs(:,2), :);        
    
    % Estimate the transformation between I(n) and I(n-1).
    tforms(n) = estimateGeometricTransform2D(matchedPoints, matchedPointsPrev,'projective', 'Confidence', 99.9, 'MaxNumTrials', 2000);  
    
    % Compute T(n) * T(n-1) * ... * T(1)
    tforms(n).T = tforms(n).T * tforms(n-1).T; 
end

%Compute the output limits for each transform.
for i = 1:numel(tforms)           
    [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(i,2)], [1 imageSize(i,1)]);    
end
%Next, compute the average X limits for each transforms and find the image that is in the center. 
%Only the X limits are used here because the scene is known to be horizontal. 
%If another set of images are used, both the X and Y limits may need to be used to find the center image.
avgXLim = mean(xlim, 2);
[~,idx] = sort(avgXLim);
centerIdx = floor((numel(tforms)+1)/2);
centerImageIdx = idx(centerIdx);
%Finally, apply the center image's inverse transform to all the others.
Tinv = invert(tforms(centerImageIdx));
for i = 1:numel(tforms)    
    tforms(i).T = tforms(i).T * Tinv.T;
end

%Initiliaze the panorama
for i = 1:numel(tforms)           
    [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(i,2)], [1 imageSize(i,1)]);
end

maxImageSize = max(imageSize);

% Find the minimum and maximum output limits. 
xMin = min([1; xlim(:)]);
xMax = max([maxImageSize(2); xlim(:)]);

yMin = min([1; ylim(:)]);
yMax = max([maxImageSize(1); ylim(:)]);

% Width and height of panorama.
width  = round(xMax - xMin);
height = round(yMax - yMin);

% Initialize the "empty" panorama.
panorama = zeros([height width 3], 'like', I);

blender = vision.AlphaBlender('Operation', 'Binary mask', ...
    'MaskSource', 'Input port');  

% Create a 2-D spatial reference object defining the size of the panorama.
xLimits = [xMin xMax];
yLimits = [yMin yMax];
panoramaView = imref2d([height width], xLimits, yLimits);

% Create the panorama.
for i = 1:numImages
    
    I = readimage(buildingScene, i);  
   
    % Transform I into the panorama.
    warpedImage = imwarp(I, tforms(i), 'OutputView', panoramaView);
                  
    % Generate a binary mask.    
    mask = imwarp(true(size(I,1),size(I,2)), tforms(i), 'OutputView', panoramaView);
    
    % Overlay the warpedImage onto the panorama.
    panorama = step(blender, panorama, warpedImage, mask);
end

figure
imshow(panorama)

