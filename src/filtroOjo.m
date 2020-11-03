pkg load image;
LK= 0.4;

mascara=ones(3);
mascara=mascara*-1;
mascara(2,2)=10;

%im1=imread('../img/face/07O.bmp'); %Imagen centrada del ojo izquierdo 91x91
imO= imread('../img/face/07.jpeg'); %Imagen original
im1 = imcrop(imO, [90,98,90,90]);
%im2 = imcrop(imO, [90,98,90,90]); %Imagen recortada 91x91
im2 = imread('91x91ojoscent.BMP');
%imshow(ojos);
imshow(im1);
imwrite(im1, "91x91.bmp");

%Dominio de Fourier
H_Filtro = fft2(im1); %M�scara o filtro
O_Filtro = fft2(im2); %Imagen entrante

%figure, imshow(im1);
%figure, imshow(imO);
%figure, imshow(im2);
%figure,imshow(H_Filtro);
%figure, imshow(O_Filtro);


H_Filtro = kLaw_SpaceV(LK,im1);
O_Filtro=kLaw_SpaceV(LK,im2);

resp=O_Filtro.*(conj(H_Filtro)./(abs(H_Filtro)));
cor1=real(ifftshift(ifft2(resp)));
figure, mesh(cor1);
%maximo1=max(cor1(:));
%[yy1,xx1]=find(maximo1==cor1);

%cor12=imfilter(cor1,mascara);
%maximo2=max(cor12(:));
%[yy2,xx2]=find(maximo2==cor12);

%figure, imshow(im2);


