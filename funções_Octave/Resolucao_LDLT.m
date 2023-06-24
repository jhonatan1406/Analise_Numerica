function [x]=Resolucao_LDLT(n,A,b)

[A,det]=Decomposicao_LDLT(n,A);

for i=1:n

    for j=1:i
        L(i,j)=A(i,j);

    end

    D(i,i)=A(i,i);
    L(i,i)=1;
end

[y]=Substituicoes_Sucessivas(n,L,b);
[t]=Substituicoes_Sucessivas(n,D,y);
[x]=Substituicoes_Retroativas(n,L',t);

end
