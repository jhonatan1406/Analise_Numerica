%Solu��o pelo m�todo iterativo de Jacobi: Ax = b

%Entrada:
% n = ordem
% A = matriz dos coeficientes
% b = vetor dos termos independentes
% Toler = toler�ncia
% IterMax = n�mero m�ximo de itera��es

%Sa�da:
% x = vetor solu��o
% Iter = n�mero de itera��es
% Info = informa��o sobre converg�ncia
% Info = 0 -> Convergiu
% Info = 1 -> n�o convergiu

function [x, Iter, Info] = solucao_jacobi (n, A, b, Toler, IterMax)

  for i=1 : n
    x(i) = b(i)/A(i, i);
  endfor

  Iter = 0;

  while 0~=1

    Iter = Iter + 1;

    for i=1 : n

      Soma = 0;

      for j=1 : n

        if i~=j
          Soma = Soma + A(i, j)*x(j);
        endif

      endfor

      v(i) = (b(i) - Soma)/A(i, i);

    endfor

    NormaNum = 0;
    NormaDen = 0;

    for i=1 : n

      t = abs(v(i)-x(i));

      if t>NormaNum
        NormaNum = t;
      endif

      if abs(v(i))>NormaDen
        NormaDen = abs(v(i));
      endif

      x(i) = v(i);

    endfor

    NormaRel = NormaNum/NormaDen;
    disp('Itera��es: '); disp(Iter);
    %disp('Solu��o: '); disp(x);
    %disp('NormaRel: '); disp(NormaRel);

    if NormaRel <= Toler || Iter >= IterMax
      break;
    endif

  endwhile

  if NormaRel <= Toler
    Info = 0;
  else
    Info = 1;
  endif

  %disp('Solu��o: '); disp(x);

endfunction


















































