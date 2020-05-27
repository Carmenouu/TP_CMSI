function flag = domdiag( A, strOpt )
    if nargin == 1
        strOpt = ''; 
    elseif nargin ~= 2
        error('domdiag: invalid input parameters');
    end

    [ m , n ] = size(A);
    if m ~= n
        error('domdiag: input matrix must have dimension rows==cols');
    end
    absDiag  = abs(diag(A));

    absElem = sum(abs(A), 2) - absDiag;
    flag = all(absElem <= absDiag);

    if strcmpi(strOpt, 'strict') && flag == true
        flag = any(absElem  < absDiag);
    end

end