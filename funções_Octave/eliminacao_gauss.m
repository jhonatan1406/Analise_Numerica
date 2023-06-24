##ultilizar a eliminação de gaus quando A=b
## A é uma matriz , B é o vetor independente
## Função ultilizada para detrminar a matriz dos coeficentes escalonada
## entrada:
## A- Matriz dos coenficiente
## B- Vetor dos termons indepedentes
## n - ordem do sistema
## Saida:
## A- Matrzi dos coeficnetes escalonada
## B - Vetor de termos independe ajustados
## @seelso ( substituicoes_sucessivas)
## @end detypefn

function [A,b] = eliminacao_gauss (A, b, n)
  for j = 1 :n
    for i= j+1 : n
      m(i,j) = A(i,j)/A(j,j);
      for k=1:n
        A(i,k)=-m(i,j)*A(j,k) + A(i,k);
      endfor
      b(i)= -m(i,j)*b(j) + b(i);
    endfor
  endfor
## lembra de fazer resolver a matriz traingular superior por
##x=substituicoes_retroativas(A,b_aj,n)
x=substituicoes_retroativas(A,b,n)
endfunction
