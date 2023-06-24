%Objetivo: Resolver um sistema triangular inferior Lx = c pelas substitui��es sucessivas

%Entradas:
%n = Ordem da matriz
%L = Matriz triangular inferior
%c = vetor independente

%Sa�da = Solu��o do sistem

function [x] = substituicoes_sucessivas (L, c,n)
 ## if nargin <  3 % Verifica se o número de argumentos de entrada é menor que 1
 ##  n = size(L, 2);  % Define 'n' como o número de colunas de L
 ## end
  x(1) = c(1) / L(1, 1);

  for i = 2 : n

    Soma = 0;

    for j = 1 : (i-1)
      Soma = Soma + L(i, j) * x(j);
    endfor

    x(i) = (c(i) - Soma) / L(i, i);

  endfor

endfunction
