function res = restriction(r)
    % 残差限制到更粗糙的网格上
    n = (size(r, 1) - 1) / 2;
    res = zeros(n+1, n+1);
    for i = 2:n
        for j = 2:n
            res(i, j) = (r(2*i-2, 2*j-2) + r(2*i-2, 2*j) + r(2*i, 2*j-2) + r(2*i, 2*j)) / 16 + ...
                (r(2*i-1, 2*j-2) + r(2*i-1, 2*j) + r(2*i-2, 2*j-1) + r(2*i, 2*j-1)) / 8 + ...
                r(2*i-1, 2*j-1) / 4;
        end
    end
end