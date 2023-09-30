clear all; clc; clear all; cla;
%% Variables modoficables
Numero_deDatos=50;
Neuronas=8;
a=.01;
b=.06;
Generaciones=10;
sep=.7;%Para ploteo
%%
hold on 
axis([-2,2,-2,2,-2,2]);
xlabel('x');
ylabel('y');
zlabel('z'); 
g1=[rand(1,Numero_deDatos)-sep; rand(1,Numero_deDatos)-sep; rand(1,Numero_deDatos)-sep];scatter3(g1(1,:),g1(2,:),g1(3,:),'.','MarkerFaceColor','r','MarkerEdgeColor','r');
g2=[rand(1,Numero_deDatos)-sep; rand(1,Numero_deDatos)-sep; rand(1,Numero_deDatos)+sep];scatter3(g2(1,:),g2(2,:),g2(3,:),'.','MarkerFaceColor','g','MarkerEdgeColor','g');
g3=[rand(1,Numero_deDatos)-sep; rand(1,Numero_deDatos)+sep; rand(1,Numero_deDatos)-sep];scatter3(g3(1,:),g3(2,:),g3(3,:),'.','MarkerFaceColor','b','MarkerEdgeColor','b');
g4=[rand(1,Numero_deDatos)-sep; rand(1,Numero_deDatos)+sep; rand(1,Numero_deDatos)+sep];scatter3(g4(1,:),g4(2,:),g4(3,:),'.','MarkerFaceColor','c','MarkerEdgeColor','c');
g5=[rand(1,Numero_deDatos)+sep; rand(1,Numero_deDatos)-sep; rand(1,Numero_deDatos)-sep];scatter3(g5(1,:),g5(2,:),g5(3,:),'.','MarkerFaceColor','m','MarkerEdgeColor','m');
g6=[rand(1,Numero_deDatos)+sep; rand(1,Numero_deDatos)-sep; rand(1,Numero_deDatos)+sep];scatter3(g6(1,:),g6(2,:),g6(3,:),'.','MarkerFaceColor','y','MarkerEdgeColor','y');
g7=[rand(1,Numero_deDatos)+sep; rand(1,Numero_deDatos)+sep; rand(1,Numero_deDatos)-sep];scatter3(g7(1,:),g7(2,:),g7(3,:),'.','MarkerFaceColor','k','MarkerEdgeColor','k');
g8=[rand(1,Numero_deDatos)+sep; rand(1,Numero_deDatos)+sep; rand(1,Numero_deDatos)+sep];scatter3(g8(1,:),g8(2,:),g8(3,:),'.','MarkerFaceColor','y','MarkerEdgeColor','c');
XX=[g1,g2,g3,g4,g5,g6,g7,g8];
X=mix(XX);
%Inteligneica Ideal para un problema 3D
inte(1)=mean(X(1,:));  %x
inte(2)=mean(X(2,:));  %y
inte(3)=mean(X(3,:));  %z
Inteligencia=mean(inte)%Unificacion

%% Datos Leatorios
T=[X];
%% Inicializar w
u=.8;
w1=[-.5+u;-.5+u;-.5+u];wd1=2;
w2=[-.5+u;-.5+u;1.5-u];wd2=3;
w3=[-.5+u;1.5-u;-.5+u];wd3=3.5;
w4=[-.5+u;1.5-u;1.5-u];wd4=4.5;
w5=[1.5-u;-.5+u;-.5+u];wd5=5.6;
w6=[1.5-u;-.5+u;1.5-u];wd6=7.8;
w7=[1.5-u;1.5-u;-.5+u];wd7=8;
w8=[1.5-u;1.5-u;1.5-u];wd8=9;
Neu=[w1 w2 w3 w4 w5 w6 w7 w8];
 NeuInicial=Neu;
for i=1:length(Neu) %Pintar neuronas en posicion incicial
    scatter3(Neu(1,i),Neu(2,i),Neu(3,i),'MarkerFaceColor','y','MarkerEdgeColor','k');
end
for r=1:Generaciones
        for i=1:Numero_deDatos 
            v(:,1)=Neu(:,1)'*T(:,i)-(.5*Neu(:,1)'*Neu(:,1))+(sombrero(abs(wd1-wd1),a,b)+sombrero(abs(wd1-wd2),a,b)+sombrero(abs(wd1-wd3),a,b)+sombrero(abs(wd1-wd4),a,b)+sombrero(abs(wd1-wd5),a,b)+sombrero(abs(wd1-wd6),a,b)+sombrero(abs(wd1-wd7),a,b)+sombrero(abs(wd1-wd8),a,b));
            v(:,2)=Neu(:,2)'*T(:,i)-(.5*Neu(:,2)'*Neu(:,2))+(sombrero(abs(wd2-wd1),a,b)+sombrero(abs(wd2-wd2),a,b)+sombrero(abs(wd2-wd3),a,b)+sombrero(abs(wd2-wd4),a,b)+sombrero(abs(wd2-wd5),a,b)+sombrero(abs(wd2-wd6),a,b)+sombrero(abs(wd2-wd7),a,b)+sombrero(abs(wd2-wd8),a,b));
            v(:,3)=Neu(:,3)'*T(:,i)-(.5*Neu(:,3)'*Neu(:,3))+(sombrero(abs(wd3-wd1),a,b)+sombrero(abs(wd3-wd2),a,b)+sombrero(abs(wd3-wd3),a,b)+sombrero(abs(wd3-wd4),a,b)+sombrero(abs(wd3-wd5),a,b)+sombrero(abs(wd3-wd6),a,b)+sombrero(abs(wd3-wd7),a,b)+sombrero(abs(wd3-wd8),a,b));
            v(:,4)=Neu(:,4)'*T(:,i)-(.5*Neu(:,4)'*Neu(:,4))+(sombrero(abs(wd4-wd1),a,b)+sombrero(abs(wd4-wd2),a,b)+sombrero(abs(wd4-wd3),a,b)+sombrero(abs(wd4-wd4),a,b)+sombrero(abs(wd4-wd5),a,b)+sombrero(abs(wd4-wd6),a,b)+sombrero(abs(wd4-wd7),a,b)+sombrero(abs(wd4-wd8),a,b));
            v(:,5)=Neu(:,5)'*T(:,i)-(.5*Neu(:,5)'*Neu(:,5))+(sombrero(abs(wd5-wd1),a,b)+sombrero(abs(wd5-wd2),a,b)+sombrero(abs(wd5-wd3),a,b)+sombrero(abs(wd5-wd4),a,b)+sombrero(abs(wd5-wd5),a,b)+sombrero(abs(wd5-wd6),a,b)+sombrero(abs(wd5-wd7),a,b)+sombrero(abs(wd5-wd8),a,b));
            v(:,6)=Neu(:,6)'*T(:,i)-(.5*Neu(:,6)'*Neu(:,6))+(sombrero(abs(wd6-wd1),a,b)+sombrero(abs(wd6-wd2),a,b)+sombrero(abs(wd6-wd3),a,b)+sombrero(abs(wd6-wd4),a,b)+sombrero(abs(wd6-wd5),a,b)+sombrero(abs(wd6-wd6),a,b)+sombrero(abs(wd6-wd7),a,b)+sombrero(abs(wd6-wd8),a,b));
            v(:,7)=Neu(:,7)'*T(:,i)-(.5*Neu(:,7)'*Neu(:,7))+(sombrero(abs(wd7-wd1),a,b)+sombrero(abs(wd7-wd2),a,b)+sombrero(abs(wd7-wd3),a,b)+sombrero(abs(wd7-wd4),a,b)+sombrero(abs(wd7-wd5),a,b)+sombrero(abs(wd7-wd6),a,b)+sombrero(abs(wd7-wd7),a,b)+sombrero(abs(wd7-wd8),a,b));
            v(:,8)=Neu(:,8)'*T(:,i)-(.5*Neu(:,8)'*Neu(:,8))+(sombrero(abs(wd8-wd1),a,b)+sombrero(abs(wd8-wd2),a,b)+sombrero(abs(wd8-wd3),a,b)+sombrero(abs(wd8-wd4),a,b)+sombrero(abs(wd8-wd5),a,b)+sombrero(abs(wd8-wd6),a,b)+sombrero(abs(wd8-wd7),a,b)+sombrero(abs(wd8-wd8),a,b));
            [~,ind]=max(v);
            Neu(:,ind)=(Neu(:,ind)+(Inteligencia*(T(:,i)-Neu(:,ind))));
                    cla
                    scatter3(g1(1,:),g1(2,:),g1(3,:),'.','MarkerFaceColor','r','MarkerEdgeColor','r');
                    scatter3(g2(1,:),g2(2,:),g2(3,:),'.','MarkerFaceColor','g','MarkerEdgeColor','g');
                    scatter3(g3(1,:),g3(2,:),g3(3,:),'.','MarkerFaceColor','b','MarkerEdgeColor','b');
                    scatter3(g4(1,:),g4(2,:),g4(3,:),'.','MarkerFaceColor','c','MarkerEdgeColor','c');
                    scatter3(g5(1,:),g5(2,:),g5(3,:),'.','MarkerFaceColor','m','MarkerEdgeColor','m');
                    scatter3(g6(1,:),g6(2,:),g6(3,:),'.','MarkerFaceColor','y','MarkerEdgeColor','y');
                    scatter3(g7(1,:),g7(2,:),g7(3,:),'.','MarkerFaceColor','k','MarkerEdgeColor','k');
                    scatter3(g8(1,:),g8(2,:),g8(3,:),'.','MarkerFaceColor','y','MarkerEdgeColor','c');                                     
                    hold on 
                    for t=1:length(Neu)
                    scatter3(Neu(1,t),Neu(2,t),Neu(3,t),'MarkerFaceColor','k','MarkerEdgeColor','r');
                    scatter3(NeuInicial(1,t),NeuInicial(2,t),NeuInicial(3,t),'MarkerFaceColor','y','MarkerEdgeColor','k');
                    end
                    pause(.0001)
        end
end
for i=1:length(Neu) %Neuronas finales
    scatter3(Neu(1,i),Neu(2,i),Neu(3,i),'MarkerFaceColor','k','MarkerEdgeColor','r');
end

function [X] = mix(XX)
    indices = randperm(length(XX));
     X = zeros(3,length(XX));
    for indi = 1:length(XX)
        X(:,indi) = XX(:,indices(indi));
    end
end

function s = sombrero(v,a,b)
s=(b-a*v^2)*exp((-v^2));
end

