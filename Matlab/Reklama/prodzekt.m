%% pierwsze slajdy

clear; clf; close all; clc;
sciezka = 'C:\studeia\sem3\Matlab\Reklama\';
canvas1=imread("Wfiis.jpg");
[y, x] = size(canvas1);
x=x/3;
canvas2=imread("Budynek.jpg");
canvas2=imresize(canvas2, [y, x]);
canvas2=round(canvas2);
canvas1=round(canvas1);
imshow(canvas1);
pause(1);

for j=0.01:pi/200:pi/2.1 %kategorycznie za wolna pętla
    canvas3 = imresize(canvas2, [y, round(x*sin(j))]);
    [row3, col3, clrs] = size(canvas3);
    col3=floor(col3);
    canvas1(:,round(x/2)-round(col3/2):round(x/2)+fix(col3/2)-1,:) = canvas3(:,:,:);
    imshow(canvas1);
    axis off;
    axis image;
end
pause(1.0);
%% slajd 3

imy=73; imx=floor(x/2);
title("Dostępne kierunki")
canvas1=255*ones(y,x,3,"uint8");
imshow(canvas1);
FTG = imread("black_hole.jpg");
FTG = imresize(FTG, [y/2-imy ,imx]);
NMG = imread("Nanorurka.jpg");
NMG = imresize(NMG, [(y/2-imy), (imx-1)]);
FMG = imread("bigbrain.jpg");
FMG = imresize(FMG, [(y/2-imy), (imx-1)]);
ISG = imread("info.jpg");
ISG = imresize(ISG, [imy, imx]);
FT=imread("Fizyka Techniczna.jpg");
FT=imresize(FT, [imy, imx]);
IS=imread("IS.jpg");
IS=imresize(IS, [imy, imx]);
MN=imread("MikroNano.jpg");
MN=imresize(MN, [imy, imx-1]);
FM=imread("Fizyka Medyczna.jpg");
FM=imresize(FM, [imy, imx-1]);
[gifImage, cmap] = imread(strcat(sciezka,'ehwave.gif'), 'Frames', 'all');
[rows, columns, ncolor, numimage] = size(gifImage);
[FM2, cmap2] = imread(strcat(sciezka,'medykalna.gif'), 'Frames', 'all');
[rows2, columns2, ncolor2, numimage2] = size(FM2);
[MIKRO, cmap3] = imread(strcat(sciezka,'mikronano2.gif'), 'Frames', 'all');
[rows3, columns3, ncolor3, numimage3] = size(MIKRO);
[INFA, cmap4] = imread(strcat(sciezka,'infa2.gif'), 'Frames', 'all');
[rows4, columns4, ncolor4, numimage4] = size(INFA);
gora=4;
tmp=canvas1;
title("Dostępne kierunki");
for i=(y-imy):-3:1 % Pętla jest kategorycznie za wolna
    if(i<=y/2-imy)
    tmp(i:i+imy-1,1:imx,:) = FT(1:imy,1:imx,:);
    tmp(i:i+imy-1,imx+3:x,:) = MN(1:imy,1:imx-1,:);
    tmp(i+imy:y/2,:,:)=255*ones(floor(y/2-(i+imy-1)),x,3,"uint8");
    end
    if(i>=y/2)
        tmp(i:i+imy-1,1:imx-1,:) = FM(1:imy,1:imx-1,:);
        tmp(i:i+imy-1,imx+2:x,:) = IS(1:imy,1:imx,:);
        tmp(i+imy:y,:,:)=255*ones(y-(i+imy-1),x,3,"uint8");
    end
    if(i<=y/2 && i>=y/2-imy)
        tmp(i:y/2-1,1:imx,:) = FT(1:floor(y/2-i),1:imx,:);
        tmp(i:y/2-1,imx+3:x,:) = MN(1:floor(y/2-i),1:imx-1,:);    
    end
    axis image;
    imshow(tmp);
    hold on;
    line([1 x], [y/2 y/2], 'Color', 'k');
    line([fix(x/2), fix(x/2)], [1 y],'Color', 'k');
    pause(0.01);
end
for i=pi/2:0.013:gora
    a=abs(fix(sin(2*i)*imx));
    b=abs(fix(sin(2*i)*(y/2-imy)));
    temp1 = imresize(FMG, [y/2-imy, a+1]);
    vector = imresize(FM2, [y-1-y/2-imy+1, round(x/2)-a]);
    move = mod(fix(i*35),numimage2-1)+1;%znacznie wolniej
    tmp(y/2+imy-1:y-1,a+1:round(x/2),:)=uint8(255*ind2rgb(vector(:,:,:,move),cmap2));
    tmp(y/2+imy:y-1,1:a+1,:)=temp1(1:y/2-imy,:,:);
    temp1 = imresize(FTG, [b+1, floor(x/2)]);
    tmp(imy:b+imy,1:floor(x/2),:)=temp1(:,:,:);
    vector = imresize(gifImage, [-(b+imy)+y/2+1,floor(x/2)]);
    move = mod(fix(i*80),numimage-1)+1;%optymalizacja
    tmp(b+imy-1:y/2,1:floor(x/2),:)=uint8(255*ind2rgb(vector(:,:,:,move),cmap)); 
    temp1 = imresize(NMG, [b+1, ceil(x/2)]);
    tmp(y/2-b:y/2,round(x/2):x,:)=temp1(:,:,:);
    vector = imresize(MIKRO, [y/2-b-imy+1, x-floor(x/2)]);
    move = mod(fix(i*16),numimage3-1)+1;%znaaacznie wolniej
    tmp(imy:y/2-b+1,round(x/2):x,:)=uint8(255*ind2rgb(vector(:,:,:,move),cmap3));
    temp1 = imresize(ISG, [y/2-imy, a+1]);
    vector = imresize(INFA, [y/2-imy, x-a-floor(x/2)]);
    move = mod(fix(i*43),numimage4-1)+1;%szybciej
    tmp(y/2+imy:y,floor(x/2):x-a-1,:)=uint8(255*ind2rgb(vector(:,:,:,move),cmap4));
    tmp(y/2+imy:y-1,x-a:x,:)=temp1(1:y/2-imy,:,:);
    imshow(tmp);
    hold;
    line([1 x], [y/2 y/2], 'Color', 'k');
    line([fix(x/2), fix(x/2)], [1 y],'Color', 'k');
    pause(0.0001)
end

%% slonce

clear; clf; close all; clc;

sciezka = 'C:\studeia\sem3\Matlab\Reklama\';

[sun, cmap5] = imread(strcat(sciezka,'\sun.gif'), 'Frames', 'all');
[rows5, columns5, ncolor5, numimage5] = size(sun);
figure();
haxes = gca;
for i=1:1:numimage5
    imshow(uint8(255*ind2rgb(sun(:,:,:,i), cmap5)), 'Parent', haxes);
    title(haxes, 'Dawna nazwa wydziału to instytut Techniki Jądrowej');
    pause(0.05);
end

%% co oferuje wfis

for i=1:0.1:100
    x=linspace(0,i);
    subplot(2,2,1);
    y1=x.^2;
    plot(y1,'b')
    xlim([0,i])
    ylim([0,max(y1)])
    title("Średni przyrost wiedzy")
    set(gca, 'xtick',[],'ytick',[])

    subplot(2,2,2);
    y2=1.1.^x;
    plot(y2,'r')
    xlim([0, i])
    ylim([0, max(y2)])
    title("Jakość życia")
    set(gca, 'xtick',[],'ytick',[])

    subplot(2,2,3);
    y3=abs((x-5).*(x-20).*(x-40).*(x-55).*(x-75).*(x-80).*(x-90).*(x-100));
    plot(y3,'g')
    xlim([0, i])
    ylim([0, max(y3)])
    title("Przeciętna ilość lenistwa")
    ylabel('Lenistwo [lokatory]');
    xlabel('Czas [dni]');
    set(gca, 'xtick',[], 'ytick', [])
    
    subplot(2,2,4);
    y4=x;
    plot(y4,'c')
    xlim([0, i])
    ylim([0, max(y4)])
    title("Prospekty na rynku pracy")
    set(gca, 'xtick',[], 'ytick', [])
end