%Verifica se a matriz pode ser resolvida por Cholesky

%Entradas: Matriz A

%Sa�das: 0 se a matriz atende �s condi��es
%        1 se a matriz n�o atende �s condi��es

function x = condicao_cholesky (A)

  m = size(A, 1);
  n = size(A, 2);

  %Se C1 > 0 ent�o a matriz n�o � sim�trica
  C1 = 0;

  %Se C2 > 0 ent�o a matriz n�o possui diagonal estritamente dominante
  C2 = 0;

  for i=1 : m

    for j=1 : n

      if A(i, j) ~= A(j, i)

        C1 = C1 + 1;

      endif

    endfor

  endfor

  aux = abs(A);
  aux = sum(aux, 2);
  aux = aux';

  for k=1 : m

    if A(k, k) < aux(k);

      C2 = C2 + 1;

    endif

  endfor

  if (C1==0)&&(C2 == 0)

    x = 0;

  else

    x = 1;

  endif

  %D�vida sobre a condi��o C2, ou seja, a parte do C2 foi ignorada no codigo

  %Como o teste C2 acima deu errado, vou tentar esse:
  %https://www.youtube.com/watch?v=v13mf6MAJrI&ab_channel=ThadeuPenna
  %3 min e 32 seg
  for i1=1 : m

    v(i1, 1) = 1;

  endfor

  C3 = v'*A*v;

  if (C1==0)&&(C3 > 0)

    x = 0;

  else

    x = 1;

  endif

endfunction




















