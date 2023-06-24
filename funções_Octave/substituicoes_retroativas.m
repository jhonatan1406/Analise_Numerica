%Substitui��es retroativas
%Objetivo: Resolver sistema triangular superior Ux = d
%
%Entrada: n, U, d
%n = Ordem
%U = Matriz triangular superior
%d = vetor independente
%
%Sa�da: solucao x


function x = substituicoes_retroativas (U, d,n)

  ##if nargin <  3 % Verifica se o número de argumentos de entrada é menor que 1
  ##n = size(L, 2);  % Define 'n' como o número de colunas de L
  ##endif

  x(n) = d(n)/U(n, n);

   for i = (n-1) : -1 : 1
     Soma = 0;

     for j = (i+1) : n
       Soma = Soma + U(i, j) * x(j);
     endfor

     x(i) = (d(i) - Soma) / U(i, i);

   endfor

endfunction
