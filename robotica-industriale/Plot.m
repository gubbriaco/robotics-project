classdef Plot

    methods(Static)
        
        function Punti()
            global P1 P2 P3
            figure();
            plot3(P1(1), P1(2), P1(3), 'o', 'Color', 'red'); hold on;
            plot3(P2(1), P2(2), P2(3), 'o', 'Color', 'red'); hold on;
            plot3(P3(1), P3(2), P3(3), 'o', 'Color', 'red');
        end
        
        function VariabiliDiGiuntoTriangolo(Q1Q2segmento, Q2Q3segmento, Q3Q1segmento)
            global t12 t23 t31;
            figure();
            plot(t12, Q1Q2segmento(:,1),'Color', 'b'); hold on;plot(t12, Q1Q2segmento(:,2),'Color', 'r'); hold on;plot(t12, Q1Q2segmento(:,3),'Color', 'g'); hold on;
            plot(t23,  Q2Q3segmento(:,1),'Color', 'b'); hold on;plot(t23, Q2Q3segmento(:,2),'Color', 'r'); hold on;plot(t23, Q2Q3segmento(:,3),'Color', 'g'); hold on;
            plot(t31,  Q3Q1segmento(:,1),'Color', 'b'); hold on;plot(t31, Q3Q1segmento(:,2),'Color', 'r'); hold on;plot(t31, Q3Q1segmento(:,3),'Color', 'g'); hold on;
            plot(t12, Q1Q2segmento(:,1),'*','Color', 'b'); hold on;plot(t12, Q1Q2segmento(:,2),'*','Color', 'r'); hold on;plot(t12, Q1Q2segmento(:,3),'*','Color', 'g'); hold on;
            plot(t23,  Q2Q3segmento(:,1),'*','Color', 'b'); hold on;plot(t23, Q2Q3segmento(:,2),'*','Color', 'r'); hold on;plot(t23, Q2Q3segmento(:,3),'*','Color', 'g'); hold on;
            plot(t31,  Q3Q1segmento(:,1),'*','Color', 'b'); hold on;plot(t31, Q3Q1segmento(:,2),'*','Color', 'r'); hold on;plot(t31,  Q3Q1segmento(:,3),'*','Color', 'g'); hold on;
            title("VARIABILI DI GIUNTO percorso triangolo"); xlabel("\lambda"); ylabel("variabili di giunto"); legend('Q1Q2','Q2Q3','Q3Q1'); grid;
        end
        
        function VariabiliDiGiuntoDerivataTriangolo(Q1Q2segmentoDerivata, Q2Q3segmentoDerivata, Q3Q1segmentoDerivata)
            global t12 t23 t31;
            figure();
            plot(t12, Q1Q2segmentoDerivata(:,1),'Color', 'b'); hold on;plot(t12, Q1Q2segmentoDerivata(:,2),'Color', 'r'); hold on;plot(t12, Q1Q2segmentoDerivata(:,3),'Color', 'g'); hold on;
            plot(t23,  Q2Q3segmentoDerivata(:,1),'Color', 'b'); hold on;plot(t23, Q2Q3segmentoDerivata(:,2),'Color', 'r'); hold on;plot(t23, Q2Q3segmentoDerivata(:,3),'Color', 'g'); hold on;
            plot(t31,  Q3Q1segmentoDerivata(:,1),'Color', 'b'); hold on;plot(t31, Q3Q1segmentoDerivata(:,2),'Color', 'r'); hold on;plot(t31, Q3Q1segmentoDerivata(:,3),'Color', 'g'); hold on;
            plot(t12, Q1Q2segmentoDerivata(:,1),'*','Color', 'b'); hold on;plot(t12, Q1Q2segmentoDerivata(:,2),'*','Color', 'r'); hold on;plot(t12, Q1Q2segmentoDerivata(:,3),'*','Color', 'g'); hold on;
            plot(t23,  Q2Q3segmentoDerivata(:,1),'*','Color', 'b'); hold on;plot(t23, Q2Q3segmentoDerivata(:,2),'*','Color', 'r'); hold on;plot(t23, Q2Q3segmentoDerivata(:,3),'*','Color', 'g'); hold on;
            plot(t31,  Q3Q1segmentoDerivata(:,1),'*','Color', 'b'); hold on;plot(t31, Q3Q1segmentoDerivata(:,2),'*','Color', 'r'); hold on;plot(t31, Q3Q1segmentoDerivata(:,3),'*','Color', 'g'); hold on;
            title("VELOCITA' GIUNTI percorso triangolo"); xlabel("\lambda"); ylabel("velocita' variabili di giunto"); legend('Q1Q2d','Q2Q3d','Q3Q1d'); grid;
        end
        
        function VelocitaCoperturaTriangolo(P1P2segmentoDerivata, P2P3segmentoDerivata, P3P1segmentoDerivata)
            global t12 t23 t31;
            figure(); 
            plot(t12, P1P2segmentoDerivata(:,1),'Color', 'b'); hold on;plot(t12, P1P2segmentoDerivata(:,2),'Color', 'r'); hold on;plot(t12, P1P2segmentoDerivata(:,3),'Color', 'g'); hold on;
            plot(t23, P2P3segmentoDerivata(:,1),'Color', 'b'); hold on;plot(t23, P2P3segmentoDerivata(:,2),'Color', 'r'); hold on;plot(t23, P2P3segmentoDerivata(:,3),'Color', 'g'); hold on;
            plot(t31, P3P1segmentoDerivata(:,1),'Color', 'b'); hold on;plot(t31, P3P1segmentoDerivata(:,2),'Color', 'r'); hold on;plot(t31, P3P1segmentoDerivata(:,3),'Color', 'g'); hold on;
            plot(t12, P1P2segmentoDerivata(:,1),'*','Color', 'b'); hold on;plot(t12, P1P2segmentoDerivata(:,2),'*','Color', 'r'); hold on;plot(t12, P1P2segmentoDerivata(:,3),'*','Color', 'g'); hold on;
            plot(t23, P2P3segmentoDerivata(:,1),'*','Color', 'b'); hold on;plot(t23, P2P3segmentoDerivata(:,2),'*','Color', 'r'); hold on;plot(t23, P2P3segmentoDerivata(:,3),'*','Color', 'g'); hold on;
            plot(t31, P3P1segmentoDerivata(:,1),'*','Color', 'b'); hold on;plot(t31, P3P1segmentoDerivata(:,2),'*','Color', 'r'); hold on;plot(t31, P3P1segmentoDerivata(:,3),'*','Color', 'g'); hold on;
            title("VELOCITA' DI COPERTURA percorso triangolo"); xlabel("\lambda"); ylabel("velocita'"); legend('P1P2d','P2P3d','P3P1d'); grid;
        end
        
        
        
        function VariabiliDiGiuntoCirconferenza(Q1Q2arco, Q2Q3arco, Q3Q1arco)
            global t12 t23 t31;
            figure();
            plot(t12, Q1Q2arco(:,1),'Color', 'b'); hold on;plot(t12, Q1Q2arco(:,2),'Color', 'r'); hold on;plot(t12, Q1Q2arco(:,3),'Color', 'g'); hold on;
            plot(t23, Q2Q3arco(:,1),'Color', 'b'); hold on;plot(t23, Q2Q3arco(:,2),'Color', 'r'); hold on;plot(t23, Q2Q3arco(:,3),'Color', 'g'); hold on;
            plot(t31, Q3Q1arco(:,1),'Color', 'b'); hold on;plot(t31, Q3Q1arco(:,2),'Color', 'r'); hold on;plot(t31, Q3Q1arco(:,3),'Color', 'g'); hold on;
            plot(t12, Q1Q2arco(:,1),'*','Color', 'b'); hold on;plot(t12, Q1Q2arco(:,2),'*','Color', 'r'); hold on;plot(t12, Q1Q2arco(:,3),'*','Color', 'g'); hold on;
            plot(t23, Q2Q3arco(:,1),'*','Color', 'b'); hold on;plot(t23, Q2Q3arco(:,2),'*','Color', 'r'); hold on;plot(t23, Q2Q3arco(:,3),'*','Color', 'g'); hold on;
            plot(t31, Q3Q1arco(:,1),'*','Color', 'b'); hold on;plot(t31, Q3Q1arco(:,2),'*','Color', 'r'); hold on;plot(t31, Q3Q1arco(:,3),'*','Color', 'g'); hold on;
            title("VARIABILI DI GIUNTO percorso circonferenza"); xlabel("\lambda"); ylabel("variabili di giunto"); legend('Q1Q2','Q2Q3','Q3Q1'); grid;
        end
        
        function VariabiliDiGiuntoDerivataCirconferenza(Q1Q2arcoDerivata, Q2Q3arcoDerivata, Q3Q1arcoDerivata)
            global t12 t23 t31;
            figure();
            plot(t12, Q1Q2arcoDerivata(1,:),'Color', 'b'); hold on;plot(t12, Q1Q2arcoDerivata(2,:),'Color', 'r'); hold on;plot(t12, Q1Q2arcoDerivata(3,:),'Color', 'g'); hold on;
            plot(t23, Q2Q3arcoDerivata(1,:),'Color', 'b'); hold on;plot(t23, Q2Q3arcoDerivata(2,:),'Color', 'r'); hold on;plot(t23, Q2Q3arcoDerivata(3,:),'Color', 'g'); hold on;
            plot(t31, Q3Q1arcoDerivata(1,:),'Color', 'b'); hold on;plot(t31, Q3Q1arcoDerivata(2,:),'Color', 'r'); hold on;plot(t31, Q3Q1arcoDerivata(3,:),'Color', 'g'); hold on;
            plot(t12, Q1Q2arcoDerivata(1,:),'*','Color', 'b'); hold on;plot(t12, Q1Q2arcoDerivata(2,:),'*','Color', 'r'); hold on;plot(t12, Q1Q2arcoDerivata(3,:),'*','Color', 'g'); hold on;
            plot(t23, Q2Q3arcoDerivata(1,:),'*','Color', 'b'); hold on;plot(t23, Q2Q3arcoDerivata(2,:),'*','Color', 'r'); hold on;plot(t23, Q2Q3arcoDerivata(3,:),'*','Color', 'g'); hold on;
            plot(t31, Q3Q1arcoDerivata(1,:),'*','Color', 'b'); hold on;plot(t31, Q3Q1arcoDerivata(2,:),'*','Color', 'r'); hold on;plot(t31, Q3Q1arcoDerivata(3,:),'*','Color', 'g'); hold on;
            title("VELOCITA' GIUNTI percorso circonferenza"); xlabel("\lambda"); ylabel("velocita' variabili di giunto"); legend('Q1Q2d','Q2Q3d','Q3Q1d'); grid;
        end
        
        function VelocitaCoperturaCirconferenza(P1P2arcoDerivata, P2P3arcoDerivata, P3P1arcoDerivata)
            global t12 t23 t31;
            figure(); 
            plot(t12, P1P2arcoDerivata(1,:),'Color', 'b'); hold on;plot(t12, P1P2arcoDerivata(2,:),'Color', 'r'); hold on;plot(t12, P1P2arcoDerivata(3,:),'Color', 'g'); hold on;
            plot(t23, P2P3arcoDerivata(1,:),'Color', 'b'); hold on;plot(t23, P2P3arcoDerivata(2,:),'Color', 'r'); hold on;plot(t23, P2P3arcoDerivata(3,:),'Color', 'g'); hold on;
            plot(t31, P3P1arcoDerivata(1,:),'Color', 'b'); hold on;plot(t31, P3P1arcoDerivata(2,:),'Color', 'r'); hold on;plot(t31, P3P1arcoDerivata(3,:),'Color', 'g'); hold on;
            plot(t12, P1P2arcoDerivata(1,:),'*','Color', 'b'); hold on;plot(t12, P1P2arcoDerivata(2,:),'*','Color', 'r'); hold on;plot(t12, P1P2arcoDerivata(3,:),'*','Color', 'g'); hold on;
            plot(t23, P2P3arcoDerivata(1,:),'*','Color', 'b'); hold on;plot(t23, P2P3arcoDerivata(2,:),'*','Color', 'r'); hold on;plot(t23, P2P3arcoDerivata(3,:),'*','Color', 'g'); hold on;
            plot(t31, P3P1arcoDerivata(1,:),'*','Color', 'b'); hold on;plot(t31, P3P1arcoDerivata(2,:),'*','Color', 'r'); hold on;plot(t31, P3P1arcoDerivata(3,:),'*','Color', 'g'); hold on;
            title("VELOCITA' percorso circonferenza"); xlabel("\lambda"); ylabel("velocita'"); legend('P1P2d','P2P3d','P3P1d'); grid;
        end
        
        
        
        function Triangolo(P1P2segmento, P2P3segmento, P3P1segmento )
            figure();
            plot3(P1P2segmento(:,1),P1P2segmento(:,2),P1P2segmento(:,3),'*','Color','b'); hold on;
            plot3(P2P3segmento(:,1),P2P3segmento(:,2),P2P3segmento(:,3),'*','Color','r'); hold on;
            plot3(P3P1segmento(:,1),P3P1segmento(:,2),P3P1segmento(:,3),'*','Color','g'); hold on;
            plot3(P1P2segmento(:,1),P1P2segmento(:,2),P1P2segmento(:,3),'Color','b'); hold on;
            plot3(P2P3segmento(:,1),P2P3segmento(:,2),P2P3segmento(:,3),'Color','r'); hold on;
            plot3(P3P1segmento(:,1),P3P1segmento(:,2),P3P1segmento(:,3),'Color','g');
            title("TRIANGOLO"); legend('P1->P2','P2->P3','P3->P1');grid on;

        end
        
        function Circonferenza(P1P2arco, P2P3arco, P3P1arco)
            figure();
            plot3(P1P2arco(1,:),P1P2arco(2,:),P1P2arco(3,:),'*','Color','b'); hold on;
            plot3(P2P3arco(1,:),P2P3arco(2,:),P2P3arco(3,:),'*','Color','r'); hold on;
            plot3(P3P1arco(1,:),P3P1arco(2,:),P3P1arco(3,:),'*','Color','g'); hold on;
            plot3(P1P2arco(1,:),P1P2arco(2,:),P1P2arco(3,:),'Color','b'); hold on;
            plot3(P2P3arco(1,:),P2P3arco(2,:),P2P3arco(3,:),'Color','r'); hold on;
            plot3(P3P1arco(1,:),P3P1arco(2,:),P3P1arco(3,:),'Color','g');
            title("CIRCONFERENZA"); legend('P1->P2','P2->P3','P3->P1');grid on;
        end
    
        function Segmento(i, PP, QQ)
              global robot;
              plot3(PP(:,1), PP(:,2), PP(:,3), '>', 'Color', 'b'); hold on;
              robot.plot(QQ(i,:));
        end
       
        
        function Arco(i, PP, QQ)
            global robot;
            plot3(PP(1,:), PP(2,:), PP(3,:), '>', 'Color', 'b'); hold on;
            robot.plot(QQ(i,:));
        end

        
        function Triangolo40Secondi(Q1Q2segmento, P1P2segmento, Q2Q3segmento, P2P3segmento, Q3Q1segmento, P3P1segmento)
            global robot;
            figure();
            title('COPERTURA PERCORSO TRIANGOLO in circa 40sec');
            Q1Q2segmento = Q1Q2segmento';
            Qstart12SEGMENTO = Q1Q2segmento(:,1);
            Qend12SEGMENTO = Q1Q2segmento(:,length(Q1Q2segmento));
            [Q12SEGMENTO,Q12D,Q12DD] = jtraj(Qstart12SEGMENTO, Qend12SEGMENTO, 45);
            robot.plot(Q12SEGMENTO); hold on;
            plot3(P1P2segmento(:,1),P1P2segmento(:,2),P1P2segmento(:,3),'LineWidth',1); hold on;

            Q2Q3segmento = Q2Q3segmento';
            Qstart23SEGMENTO = Q2Q3segmento(:,1);
            Qend23SEGMENTO = Q2Q3segmento(:,length(Q2Q3segmento));
            [Q23SEGMENTO,Q23D,Q23DD] = jtraj(Qstart23SEGMENTO, Qend23SEGMENTO, 45);
            robot.plot(Q23SEGMENTO); hold on;
            plot3(P2P3segmento(:,1),P2P3segmento(:,2),P2P3segmento(:,3),'LineWidth',1); hold on;

            Q3Q1segmento = Q3Q1segmento';
            Qstart31SEGMENTO = Q3Q1segmento(:,1);
            Qend31SEGMENTO = Q3Q1segmento(:,length(Q3Q1segmento));
            [Q31SEGMENTO,Q31D,Q31DD] = jtraj(Qstart31SEGMENTO, Qend31SEGMENTO, 45);
            robot.plot(Q31SEGMENTO); hold on;
            plot3(P3P1segmento(:,1),P3P1segmento(:,2),P3P1segmento(:,3),'LineWidth',1); hold on;
        end
        
        function Circonferenza40Secondi(Q1Q2arco, P1P2arco, Q2Q3arco, P2P3arco, Q3Q1arco, P3P1arco)
            global robot;
            figure();
            title('COPERTURA PERCORSO CIRCONFERENZA in circa 40sec');
            Q1Q2arco = Q1Q2arco';
            Qstart12ARCO = Q1Q2arco(:,1);
            Qend12ARCO = Q1Q2arco(:,length(Q1Q2arco));
            [Q12ARCO,Q12D,Q12DD] = jtraj(Qstart12ARCO, Qend12ARCO, 45);
            robot.plot(Q12ARCO); hold on;
            plot3(P1P2arco(1,:),P1P2arco(2,:),P1P2arco(3,:),'LineWidth',1); hold on;

            Q2Q3arco = Q2Q3arco';
            Qstart23ARCO = Q2Q3arco(:,1);
            Qend23ARCO = Q2Q3arco(:,length(Q2Q3arco));
            [Q23ARCO,Q23D,Q23DD] = jtraj(Qstart23ARCO, Qend23ARCO, 45);
            robot.plot(Q23ARCO); hold on;
            plot3(P2P3arco(1,:),P2P3arco(2,:),P2P3arco(3,:),'LineWidth',1); hold on;

            Q3Q1arco = Q3Q1arco';
            Qstart31ARCO = Q3Q1arco(:,1);
            Qend31ARCO = Q3Q1arco(:,length(Q3Q1arco));
            [Q31ARCO,Q31D,Q31DD] = jtraj(Qstart31ARCO, Qend31ARCO, 45);
            robot.plot(Q31ARCO); hold on;
            plot3(P3P1arco(1,:),P3P1arco(2,:),P3P1arco(3,:),'LineWidth',1); hold on;
        end
    
    end

end