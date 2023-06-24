function [L, U, b_ajustado] = LU(A, b, n)
    % Verifica se A é uma matriz quadrada
    [m, ~] = size(A);
    if m ~= n
        error('A matriz A deve ser quadrada.');
    end

    % Verifica se o tamanho de b é consistente
    if numel(b) ~= n
        error('O vetor b deve ter o mesmo número de linhas que a matriz A.');
    end

    % Inicializa L como matriz identidade e U como uma cópia de A
    L = eye(n);
    U = A;

    % Decomposição LU
    for k = 1:n-1
        if U(k, k) == 0
            error('A matriz A não pode ter elementos diagonais nulos durante a decomposição LU.');
        end

        for i = k+1:n
            L(i, k) = U(i, k) / U(k, k);
            U(i, :) = U(i, :) - L(i, k) * U(k, :);
        end
    end

    % Ajuste do vetor b
    b_ajustado = L \ b;

    % Retorna L, U e o vetor b ajustado
end

% Lembra de fazer as substituições para solucionar a decoposição LU
%y = substituicoes_sucessivas(L,b,n)
%x= substituicoes_retroativas (U,y,n)
