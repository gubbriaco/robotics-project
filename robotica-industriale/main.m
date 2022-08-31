clear; close all; clc;

%% CONFIGURAZIONE PUMA560 secondo la convenzione di Denavit-Hartenberg

% definisco le distanze tra il sistema di riferimento Oi-esimo ed il
% sistema di riferimento Oi-esimo'
link1=0; link2=0.9; link3=0.9;
global links
links = [link1 link2 link3];

% definisco gli angoli intorno all'asse xi-esimo tra l'asse zi-esimo
% valutato positivo in senso anti-orario
alpha1=pi/2; alpha2=0; alpha3=0;
alphas = [alpha1 alpha2 alpha3];

% definisco le coordinate su zi-esimo-1 del sistema di riferimento
% Oi-esimo'
d1=0; d2=0; d3=0;
ds = [d1 d2 d3];

% definisco gli angoli intorno all'asse zi-esimo-1 tra l'asse xi-esimo-1 e
% l'asse xiesimo valutato positivo in senso anti-orario
theta1=0; theta2=0; theta3=0;
thetas = [theta1 theta2 theta3];

% definisco la matrice di roto-traslazione che lega i sistemi di
% riferimento (0) e (b)
R0b = [1 0 0 0.5 ; 0 1 0 0.5 ; 0 0 1 1 ; 0 0 0 1];


%% CREAZIONE ROBOT
% creo la configurazione del robot in questione tramite il costruttore
% della classe PUMA560Configuration che riceve i parametri utili alla sua
% configurazione
global puma560
import puma560.PUMA560Configuration;
puma560 = PUMA560Configuration(links, alphas, ds, thetas, R0b);

% definisco ,tramite il Robotic Toolbox, gli oggetti 'Link', cioe' quelli
% che rappresenteranno i singoli corpi rigidi (bracci) che compongono il
% robot in questione passando come parametri le properties (variabili di 
% istanza) inizialzzate precedentemente tramite il costruttore
puma560.LINK1 = Link( [puma560.theta1, puma560.d1, puma560.link1, ...
              puma560.alpha1, PUMA560Configuration.revolute], 'standard' );
puma560.LINK2 = Link( [puma560.theta2, puma560.d2, puma560.link2, ...
              puma560.alpha2, PUMA560Configuration.revolute], 'standard' );
puma560.LINK3 = Link( [puma560.theta3, puma560.d3, puma560.link3, ...
              puma560.alpha3, PUMA560Configuration.revolute], 'standard' );

% salvo i link appena definiti in un array
LINKS = [puma560.LINK1 puma560.LINK2 puma560.LINK3];

% costruisco il robot con lausilio la classe concreta SerialLink che mi 
% permette di rappresentare il robot, avente collegamenti rigidi, tramite
% il collegamento seriale
global robot
robot = SerialLink(LINKS, 'name', 'PUMA 560');
         
%% PUNTI
global P1 P2 P3
P1=[0.8 0.8 0.5]'; P2=[1.2 0.8 0.5]'; P3=[1.0 1.2 0.5]';
POINTS = [P1 P2 P3];


%% CINEMATICA
import cinematica.cinematica_exec;
[Qp1, Qp2, Qp3, T01, T12, T23] = cinematica_exec();


%% LAMBDA E SIGMA
global sigma_step sigma lambda lambdad
import polynomial.lambda_sigma_poly_exec;
sigma_step=0.05;
[sigma, lambda, lambdad] = lambda_sigma_poly_exec(sigma_step);


%% TEMPO
import time.time_exec;
total_time = 40;
global t12 t23 t31
[T1, T2, T3, T4, t12, t23, t31] = time_exec(total_time);

offset = 10;


%% TRIANGOLO
import triangle.triangle_exec;
[PP_segment, PP_segment_derived, QQ_segment, QQ_segment_derived] ...
                            = triangle_exec(T1, T2, T3, T4, Qp1, Qp2, Qp3);
                        
x=PP_segment(:,1); y=PP_segment(:,2); z=PP_segment(:,3);
P1P2_segment = [x y z];
x=PP_segment(:,4); y=PP_segment(:,5); z=PP_segment(:,6);
P2P3_segment = [x y z];
x=PP_segment(:,7); y=PP_segment(:,8); z=PP_segment(:,9);
P3P1_segment = [x y z];

x=PP_segment_derived(:,1); y=PP_segment_derived(:,2); z=PP_segment_derived(:,3);
P1P2_segment_derived = [x y z];
x=PP_segment_derived(:,4); y=PP_segment_derived(:,5); z=PP_segment_derived(:,6);
P2P3_segment_derived = [x y z];
x=PP_segment_derived(:,7); y=PP_segment_derived(:,8); z=PP_segment_derived(:,9);
P3P1_segment_derived = [x y z];

x=QQ_segment(:,1); y=QQ_segment(:,2); z=QQ_segment(:,3);
Q1Q2_segment = [x y z];
x=QQ_segment(:,4); y=QQ_segment(:,5); z=QQ_segment(:,6);
Q2Q3_segment = [x y z];
x=QQ_segment(:,7); y=QQ_segment(:,8); z=QQ_segment(:,9);
Q3Q1_segment = [x y z];

x=QQ_segment_derived(:,1); y=QQ_segment_derived(:,2); z=QQ_segment_derived(:,3);
Q1Q2_segment_derived = [x y z];
x=QQ_segment_derived(:,1); y=QQ_segment_derived(:,2); z=QQ_segment_derived(:,3);
Q2Q3_segment_derived = [x y z];
x=QQ_segment_derived(:,1); y=QQ_segment_derived(:,2); z=QQ_segment_derived(:,3);
Q3Q1_segment_derived = [x y z];

%% ERRORE triangolo
import error.Error;
Error.triangle(P1P2_segment, Q1Q2_segment, P2P3_segment, Q2Q3_segment, ...
                                               P3P1_segment, Q3Q1_segment);

%% PLOT PERCORSO TRIANGOLO
import plot.Plot;
Plot.triangle(P1P2_segment, P2P3_segment, P3P1_segment);

Plot.variabili_di_giunto_triangolo(Q1Q2_segment, Q2Q3_segment, Q3Q1_segment);
Plot.variabili_di_giunto_derivata_triangolo(Q1Q2_segment_derived, ...
                               Q2Q3_segment_derived, Q3Q1_segment_derived);
Plot.velocita_copertura_triangolo(P1P2_segment_derived, ...
                                P2P3_segment_derived, P3P1_segment_derived);


%% CIRCONFERENZA
global radius_circumference center_circumference
%centro circonferenza
center_circumference = [1 ; 0.95 ; 0.5];
%raggio circonferenza
radius_circumference = 0.25;
import circumference.circumference_exec;
[PP_arch, PP_arch_derived, QQ_arch, QQ_arch_derived] = circumference_exec();

x=PP_arch(:,1); y=PP_arch(:,2); z=PP_arch(:,3);
P1P2_arch = [x y z];
x=PP_arch(:,4); y=PP_arch(:,5); z=PP_arch(:,6);
P2P3_arch = [x y z];
x=PP_arch(:,7); y=PP_arch(:,8); z=PP_arch(:,9);
P3P1_arch = [x y z];

x=PP_arch_derived(:,1); y=PP_arch_derived(:,2); z=PP_arch_derived(:,3);
P1P2_arch_derived = [x y z];
x=PP_arch_derived(:,4); y=PP_arch_derived(:,5); z=PP_arch_derived(:,6);
P2P3_arch_derived = [x y z];
x=PP_arch_derived(:,7); y=PP_arch_derived(:,8); z=PP_arch_derived(:,9);
P3P1_arch_derived = [x y z];

x=QQ_arch(:,1); y=QQ_arch(:,2); z=QQ_arch(:,3);
Q1Q2_arch = [x y z];
x=QQ_arch(:,4); y=QQ_arch(:,5); z=QQ_arch(:,6);
Q2Q3_arch = [x y z];
x=QQ_arch(:,7); y=QQ_arch(:,8); z=QQ_arch(:,9);
Q3Q1_arch = [x y z];

x=QQ_arch_derived(:,1); y=QQ_arch_derived(:,2); z=QQ_arch_derived(:,3);
Q1Q2_arch_derived = [x y z];
x=QQ_arch_derived(:,4); y=QQ_arch_derived(:,5); z=QQ_arch_derived(:,6);
Q2Q3_arch_derived = [x y z];
x=QQ_arch_derived(:,7); y=QQ_arch_derived(:,8); z=QQ_arch_derived(:,9);
Q3Q1_arch_derived = [x y z];


%% ERRORE circonferenza
import error.Error;
Error.circumference(P1P2_arch, Q1Q2_arch, P2P3_arch, Q2Q3_arch, P3P1_arch, Q3Q1_arch);

%% PLOT PERCORSO CIRCONFERENZA
import plot.Plot;
Plot.circumference(P1P2_arch, P2P3_arch, P3P1_arch);

Plot.variabili_di_giunto_circonferenza(Q1Q2_arch, Q2Q3_arch, Q3Q1_arch);
Plot.variabili_di_giunto_derivata_circonferenza(Q1Q2_arch_derived, Q2Q3_arch_derived, Q3Q1_arch_derived);
Plot.velocita_copertura_circonferenza(P1P2_arch_derived, P2P3_arch_derived, P3P1_arch_derived);


%% PLOT CON TEMPO
import plot.Plot;
Plot.triangle40sec(Q1Q2_segment, P1P2_segment, Q2Q3_segment, P2P3_segment, Q3Q1_segment, P3P1_segment);
Plot.circumference40sec(Q1Q2_arch, P1P2_arch, Q2Q3_arch, P2P3_arch, Q3Q1_arch, P3P1_arch);


