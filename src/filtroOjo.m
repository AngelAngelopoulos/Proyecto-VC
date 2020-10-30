pkg load image;
LK= 0.4;

mascara=ones(3);
mascara=mascara*-1;
mascara(2,2)=10;

im1=imread('../img/face/07O.bmp'); %Imagen centrada del ojo izquierdo 91x91
imO= imread('../img/face/07.bmp'); %Imagen original
im2 = imcrop(imO, [90,98,90,90]); %Imagen recortada 91x91

%Dominio de Fourier
#H_Filtro = fft2(im1); %Máscara o filtro
#O_Filtro = fft2(im2); %Imagen entrante

H_Filtro = kLaw_SpaceV(LK,im1);
O_Filtro=kLaw_SpaceV(LK,im2);

resp=O_Filtro.*(conj(H_Filtro)./(abs(H_Filtro)));
cor1=real(ifftshift(ifft2(resp)));
figure, mesh(cor1);
maximo1=max(cor1(:));
[yy1,xx1]=find(maximo1==cor1);

cor12=imfilter(cor1,mascara);
maximo2=max(cor12(:));
[yy2,xx2]=find(maximo2==cor12);

figure, imshow(im2);


