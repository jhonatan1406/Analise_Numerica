##Solu��o de Sistema LU
##resolve depocoposicao LU com pivotacao

function x = Solucao_sistema_LUPT (A, b)

  m = size(A, 1);
  n = size(A, 2);
  [A, Pivot, PdU, Info] = decomp_LU_pivot_parcial(m, n, A);
  U = triu(A);
  L = eye(size(A)) + tril(A, -1);
  p = eye(size(A));
  p = p(Pivot, :);
  b = p*b;
  y = substituicoes_sucessivas( L, b,n);
  x = substituicoes_retroativas( U, y,n);

endfunction
