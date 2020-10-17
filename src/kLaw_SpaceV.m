function [imOr]=kLaw_SpaceV(L_K,nombreI)
  
  YIni=fft2(double(nombreI));
  imOr=(abs(YIni).^L_K).*exp(j*angle(YIni));
endfunction
