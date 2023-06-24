%OBJETIVO: Resolver o sistema Ax=b pelo m�todo iterativo de Jacobi;
%ENTRADA: n(ordem), A(matriz), b(vetor independente), Toler, IterMax;
%SA�DA: x(vetor solu��o), Iter(n�mero de intera��es), CondErro.

function [x,Iter,CondErro]=Jacobi(n,A,b,Toller,IterMax)

for i=1:n
    r=1/A(i,i);

    for j=1:n
        if i~=j
            A(i,j)=A(i,j)*r;
        end
    end

    b(i)=b(i)*r;
    x(i)=b(i);
end

Iter=0;

while 1
    Iter=Iter+1;

    for i=1:n
        soma=0;

        for j=1:n
            if i~=j
                soma=soma+A(i,j)*x(j);
            end
        end

        v(i)=b(i)-soma;
    end

    NormaNum=0;
    NormaDen=0;

    for i=1:n
        t=abs(v(i)-x(i));

        if t>NormaNum
            NormaNum=t;
        end

        if abs(v(i))>NormaDen
            NormaDen=abs(v(i));
        end

        x(i)=v(i);
    end

    NormaRel=NormaNum/NormaDen;

    if NormaRel<=Toller || Iter>=IterMax
        break
    end
end

if NormaRel<=Toller
    CondErro=0;
else
    CondErro=1;
end

end
