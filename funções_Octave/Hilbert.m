%OBJETIVO: Gerar uma matriz de Hilbert, sua inversa e as normas;
%ENTRADA: n(ordem);
%SA�DA: H(Hn), Hinv(Hn ^-1), NinfH(|Hn|inf), NinfHinv(|Hn ^-1|inf);

function [H,Hinv,NinfH,NinfHinv]=Hilbert(n)

for i=1:n
    H(i,i)=1/(2*i-1);

    for j=i+1:n
        H(i,j)=1/(i+j-1);
        H(j,i)=H(i,j);
    end
end

NinfH=0;

for j=1:n
    NinfH=NinfH+H(1,j);
end

Hinv(1,1)=n^2;
Prod1=1;
soma=Hinv(1,1);

for j=2:n
    Prod1=Prod1*(1-(n/(j-1))^2);
    Hinv(1,j)=n^2/j*Prod1;
    Hinv(j,1)=Hinv(1,j);
    soma=soma+abs(Hinv(1,j));
end

NinfHinv=soma;
Prod2=1;

for i=2:n;
    Prod1=1;
    Prod2=Prod2*(((n/(i-1))^2)-1);
    Hinv(i,i)=(n*Prod2)^2/(2*i-1);
    soma=Hinv(i,i);

    for j=i+1:n
        Prod1=Prod1*(1-(n/(j-1))^2);
        Hinv(i,j)=(n*Prod2)^2*Prod1/(i+j-1);
        Hinv(j,i)=Hinv(i,j);
        soma=soma+abs(Hinv(i,j));
    end

    for j=1:i-1;
        soma=soma+abs(Hinv(i,j));
    end

    if soma>NinfHinv
        NinfHinv=soma;
    end
end

end
