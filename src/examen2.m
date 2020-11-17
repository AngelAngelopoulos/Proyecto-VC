% ÁREA DE CIENCIAS DE LA COMPUTACIÓN - FACULTAD DE INGENIERÍA - UASLP %
% VISIÓN COMPUTACIONAL - Segundo parcial %
% Horario 8:00 am - 9:00 am %
% Ximena Cervantes Díaz, 276978 %
% 13 de noviembre 2020 %
% Examen 2 %
pkg load video; %Paquete para manejar videos
pkg load image; %Paquete para manejar imagenes

infoVideo = aviinfo("video_Examen2.avi"); %Se leen los detalles e información del video

imF1 = imread("obj1.bmp"); %Imagen objeto 1
%Fotografama usado del video: 2484

imF2 = imread("obj2.bmp"); %Imagen objeto 2
%Fotografama usado del video: 570

HP1 = (fft2(imF1)); %Filtro a dominio de fourier
HP2 = (fft2(imF2)); %Filtro a dominio de fourier

mat1=zeros(4500,5);
mat2=zeros(4500,5);

nF=infoVideo.NumFrames;
SlitS=[];
mtr=zeros(nF/2,2);
iCont2=1;
incx=1;

%Inicio del ciclo para leer los fotogramas de 2 en 2 del video
for ival=1:2:7000
  
  imm=rgb2gray(aviread("video_Examen2.avi", ival)); %Imagen de tamaño 320x240
  imO=imcrop(imm,[1 1 239 239]); %imagen adquirida del video 
  
  P1 = (fft2(imO));
  cor1 = real(ifftshift(ifft2((P1.*conj(HP1)./abs(HP1)))));
  maximo = max(cor1(:));
  [yy,xx] = find(maximo == cor1);
  mat(incx, 1)=ival;
  mat(incx, 2)=xx;
  mat(incx,3)=yy;
  mat(incx,4)=maximo;
  incx=incx+1;
endfor

%Inicio del ciclo para leer los fotogramas de 2 en 2 del video
for ival=1:2:7190
  
  imm=rgb2gray(aviread("video_Examen2.avi", ival)); %Imagen de tamaño 320x240
  imO=imcrop(imm,[1 1 239 239]); %imagen adquirida del video 
  
  P2 = (fft2(imO));
  cor2 = real(ifftshift(ifft2((P2.*conj(HP2)./abs(HP2)))));
  maximo = max(cor2(:));
  [yy,xx] = find(maximo == cor2);
  mat2(incx, 1)=ival;
  mat2(incx, 2)=xx;
  mat2(incx,3)=yy;
  mat2(incx,4)=maximo;
  incx=incx+1;
endfor


plot(mat(:,4));
plot(mat2(:,4));
