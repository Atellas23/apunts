function [indx, quant, distor] = quantiz(sig, partition, codebook)
%QUANTIZ Produces the quantization index and output value.
%       INDX = QUANTIZ(SIG, PARTITION) produces a quantization index IDEX of
%       the input signal SIG based on the decision points PARTITION. Each
%       element in INDX is one of the N integers in range [0 : N-1]. PARTITION
%       is a strict ascending ordered N-1 vector that specifies the
%       boundaries. Elements of INDX = 0, 1, 2, ..., N-1 represent SIG in the
%       range of (-Inf, PARTITION(1)], (PARTITION(1), PARTITION(2)],
%       (PARTITION(2), PARTITION(3)], ..., (PARTITION(N-1), Inf).
%
%       [INDX, QUANT] = QUANTIZ(SIG, PARTITION, CODEBOOK) produces the output
%       value of the quantizer in QUNAT. CODEBOOK is a length N vector that
%       contains the output set.
%
%       [INDX, QUANT, DISTOR] = QUANTIZ(SIG, PARTITION, CODEBOOK) outputs 
%       DISTOR, the estimated distortion value of the quantization.
%
%       There is no decode quantizer function in this toolbox. The decode
%       computation could be easily computed by
%       y = codebook(indx+1).
%
%       See also LLOYD, DPCMENCO, DPCMDECO.

%       Wes Wang 10/6/94, 10/11/95.
%       Copyright (c) 1995-96 by The MathWorks, Inc.
%       $Revision: 1.1 $  $Date: 1996/04/01 18:01:55 $

sig = sig(:);
[n_sig, m_sig] = size(sig);
if m_sig > 1
    error('Function QUANTIZ is designed for scalar quantization only.');
end

% compute indx
indx = zeros(n_sig, 1);
for i = 1 : length(partition)
    indx = indx + (sig > partition(i));
end;

if nargout < 2
    return
end;

% compute QUANT
if nargin < 3
    error('Not enough input parameter to compute QUNAT in QUANTIZ.');
end;
quant = codebook(indx+1);

if nargout > 2
    % compute distortion
    distor = 0;
    for i = 0 : length(codebook)-1
        distor = distor + sum((sig(find(indx==i)) - codebook(i+1)).^2);
    end;
    distor = distor / n_sig;
end
%--end of quantiz--
