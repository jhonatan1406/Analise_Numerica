%OBJETIVO: Fazer a decomposi��o LU de uma matriz A;
%ENTRADA: Ordem, Matriz a ser decomposta;
%SA�DA: A, Determinante, Pivot.


function [A,Det,Pivot]=Decomposicao_LU(n,A)

for i=1:n
    Pivot(i)=i;
end

Det=1;

for j=1:n-1
    p=j;
    Amax=(abs(A(j,j)));

    for k=j+1:n
        if(abs(A(k,j))>Amax)
            Amax=abs(A(k,j));
            p=k;
        end
    end

    if(p~=j)
        for k=1:n
            t=A(j,k);
            A(j,k)=A(p,k);
            A(p,k)=t;
        end
        m=Pivot(j);
        Pivot(j)=Pivot(p);
        Pivot(p)=m;
        Det=-Det;
    end

    Det=Det*A(j,j);

    if(abs(A(j,j))~=0)
        r=1/A(j,j);
        for i=j+1:n
            Mult=A(i,j)*r;
            A(i,j)=Mult;
            for k=j+1:n
                A(i,k)=A(i,k)-Mult*A(j,k);
            end
        end
    end

end
Det=Det*A(n,n);
end
