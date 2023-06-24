function [X]=Inversa(n,A)

for i=1:n
    I(i,i)=1;
end

[A,Det,Pivot]=Decomposicao_LU(A,n);

if (Det==0)
    disp('\nMatriz nao possui Inversa!\n');
    return;
end

X=zeros(n);

for i=1:n;
[y]=Substituicoes_Sucessivas_Pivotal(n,A,I(i,:),Pivot);
[X(:,i)]=Substituicoes_Retroativas(A,y,n);
end

end
