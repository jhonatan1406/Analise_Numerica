%OBJETIVO: Resolver o sistema triangular inferior Ly = Pb...
...Matriz L obtida de decomposi��o LU com pivota��o parcial;
%ENTRADA: Ordem, Matriz Triangular Inferior Unit�ria, ...
...Vetor Independente, Posi��o dos piv�s;
%SA�DA: Solu��o do sistema triangular inferior.


function [y]=Substituicoes_Sucessivas_Pivotal(n,L,b,Pivot)

k=Pivot(1);
y(1)=b(k);

for i=2:n
    soma=0;

    for j=1:i-1
        soma=soma+L(i,j)*y(j);
    end

    k=Pivot(i);
    y(i)=b(k)-soma;

end
end
