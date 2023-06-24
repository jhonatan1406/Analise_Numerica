%OBJETIVO: Fazer a decomposi��o LL^T de uma matriz A sim�trica e definida positiva;
%ENTRADA: Ordem, Matriz a ser decomposta (Triangular Inferior);
%SA�DA: A, Determinante, CondErro.

function [A,Det,CondErro]=Cholesky(A,n)

CondErro=0;
Det=1;

for j=1:n;
    soma=0;

    for k=1:j-1
        soma=soma+A(j,k)^2;
    end
    t=A(j,j)-soma;

    if t>0
        A(j,j)=sqrt(t);
        r=1/A(j,j);
        Det=Det*t;
    else
        CondErro=1;
        fprintf('A matriz nao � definida positiva!\n');
        return
    end

    for i=j+1:n;
        soma=0;

        for k=1:j-1
        soma=soma+A(i,k)*A(j,k);
        end

        A(i,j)=(A(i,j)-soma)*r;
    end

end

end
