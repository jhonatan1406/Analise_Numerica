% solucao de cholesky
% faz a decomposicao e resolve a decoposicao


function [x]=Resolucao_Cholesky(L,b,n)

[LA,Det,CondErro]=Cholesky(L,n);

 if CondErro == 1
   display ("nao é possivel fazer pelo o metado de cholesky")

endif
L = tril (LA);
[y]=substituicoes_sucessivas(L,b,n);
[x]=substituicoes_retroativas(L',y,n);

endfunction
