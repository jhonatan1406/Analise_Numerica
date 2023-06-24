%OBJETIVO: Fazer a decomposi��o LDL^T de uma matriz A (sim�trica e definida positiva);
%ENTRADA: Ordem, Matriz a ser decomposta (Triangular Inferior);
%SA�DA: Matriz A(Triangular Inferior Unit�ria), Determinante.

function [A,det]=Decomposicao_LDLT(n,A)

det=1;

z=0;

for i=1:n
    for j=1:n
        if (A(i,j)~=A(j,i))
        z=1;
        if(z==1)
            fprintf('A matriz n�o � sim�trica!\n')
        end
        return
        end
    end
end

for j=1:n;
    soma=0;

    for k=1:j-1
        soma=soma+(A(j,k))^2*A(k,k);
    end

    A(j,j)=A(j,j)-soma;
    r=1/A(j,j);
    det=det*A(j,j);

    for i=j+1:n;
        soma=0;

        for k=1:j-1
        soma=soma+A(i,k)*A(k,k)*A(j,k);
        end

        A(i,j)=(A(i,j)-soma)*r;
    end

end

end
