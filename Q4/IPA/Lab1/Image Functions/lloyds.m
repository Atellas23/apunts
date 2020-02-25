function [partition, codebook, distor, rel_distor] = lloyds(training_set, ini_codebook, tol, plot_flag);
%LLOYDS Optimizes scalar quantization partition and codebook.
%       [PARTITION, CODEBOOK] = LLOYDS(TRAINING_SET, INI_CODEBOOK) optimizes
%       the scalar quantization PARTITION and CODEBOOK based on the provided
%       training vector TRAINING_SET using Lloyd I algorithm. The data in the
%       variable TRANING_SET should be typical data for the message source
%       to be quantized. INI_CODEBOOK is the initial guess of the codebook
%       values. The optimized CODEBOOK has the same vector size as
%       INI_CODEBOOK. When INI_CODEBOOK is a scalar integer instead of vector,
%       it is the length of the desired CODEBOOK vector. PARTITION is a vector
%       with the vector length being the CODEBOOK vector length minus 1. The
%       optimization will be terminated if the relative distortion is less
%       than 10^(-7).
%
%       [PARTITION, CODEBOOK] = LLOYDS(TRAINING_SET, INI_CODEBOOK, TOL)
%       provides the tolerance in the optimization.
%
%       [PARTITION, CODEBOOK, DISTORTION] = LLOYDS(...) outputs the final
%       distortion value.
%
%       [PARTITION, CODEBOOK, DISTORTION, REL_DISTORTION] = LLOYDS(...)
%       outputs the relative distortion value in terminating the computation.
%
%       See also: QUANTIZ, DPCMOPT.

%       Wes Wang 10/10/94
%       Copyright (c) 1995-96 by The MathWorks, Inc.
%       $Revision: 1.1 $  $Date: 1996/04/01 18:01:22 $

% validation verification and format conversion.
if nargin < 2
    error('Not enough input variable for LLOYDS.');
end;

if length(training_set) < 1
    error('Training set for LLOYDS cannot be empty.');
elseif min(size(training_set)) > 1
    error('Training set must be a vector.');
elseif length(ini_codebook) < 1
    error('Initial codebook for LLOYDS cannot be empty.');
elseif length(ini_codebook) < 2
    % place the ini_codebook at the center
    ini_codebook = floor(ini_codebook);
    if ini_codebook < 1
        error('Invalid INI_CODEBOOK for LLOYDS.')
    end;
    min_training = min(training_set);
    max_training = max(training_set);
    int_training = (max_training - min_training)/ini_codebook;
    if int_training <= 0
        error('The input training set has only one value, it is not a valid training set.');
    end;
    codebook = [min_training+int_training/2 : int_training : max_training-int_training/2];
else
    min_training = min(training_set);
    max_training = max(training_set);
    codebook = sort(ini_codebook);
    ini_codebook = length(codebook);
end;

if nargin < 3
    tol = 0.0000001;
end;
if isempty(tol)
    tol = 0.0000001;
end;

% initial partition
partition = (codebook(2 : ini_codebook) + codebook(1 : ini_codebook-1)) / 2;

% distortion computation, initialization
[index, waste2, distor] = quantiz(training_set, partition, codebook);
last_distor = 0;

ter_cond2 = eps * max_training;
if distor > ter_cond2
    rel_distor = abs(distor - last_distor)/distor;
else
    rel_distor = distor;
end;

while (rel_distor > tol) & (rel_distor > ter_cond2)
    % using the centroid condition, find the optimal codebook.
    for i = 0 : ini_codebook-1
        waste1 = find(index == i);
        if ~isempty(waste1)
            codebook(i+1) = mean(training_set(waste1));
        else
            if i == 0
                codebook(1) = (partition(1) - min_training) / 2;
            elseif i == ini_codebook - 1
                codebook(i+1) = (max_training - partition(i+1)) / 2;
            else
                codebook(i+1) = (partition(i+1) - partition(i)) / 2;
            end
        end;
    end;

    % using the codebook as a fixed value, use the nearest neighbor condition
    % to form the nearest neightbor cell.
    partition = (codebook(2 : ini_codebook) + codebook(1 : ini_codebook-1)) / 2;
    
    % testing condition
    last_distor = distor;
    [index, waste2, distor] = quantiz(training_set, partition, codebook);
    if distor > ter_cond2
        rel_distor = abs(distor - last_distor)/distor;
    else
        rel_distor = distor;
    end;
end;

%if nargin > 3
    len = length(training_set)-1;
    waste1 = [zeros(1, ini_codebook); ones(1, ini_codebook)*len; zeros(1, ini_codebook)];
    waste1 = waste1(:);
    waste2 = waste1(1:3*ini_codebook-3);
    waste3 = [partition(:)'; partition(:)'; partition(:)'];
    waste4 = [codebook(:)'; codebook(:)';codebook(:)'];
    plot([0:len], training_set, waste1, waste4(:), waste2, waste3(:))
    axis([0, len, min_training, max_training])
    title('Optimized quantization code partition and codebook.')
    xlabel('Yellow: training_set; Maganta: codebook; Cyan: partition.');
%end;
