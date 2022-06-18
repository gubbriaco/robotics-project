classdef Percorso

    methods(Static)
    
        function [PP, QQ, QQd] = Triangolo(links, lambda, lambda_d,T1,T2, P1, P2, Q1, Q2)
            N = length(lambda);
            for i=1:N
                % percorso lineare
                P = P1+lambda(i)*(P2-P1);

                Q = Q1+lambda(i)*(Q2-Q1);

                %definisco le variabili che mi serviranno per i grafici
                %corrispondono alle variazioni delle var. dei giunti e dei punti
                %raggiunti
                QQ(i,:) = Q;
                PP(i,:) = P;
                
                
                % calcolare J(Q)
                J = Jacobiano(links,[Q1 Q2]);

                % risolvere il sistema di eq. lineari J(Q)*Qd=Pd
                Pd = (P2-P1)*lambda_d(i) / (T2-T1);
                Qd = inv(J) * Pd;
                QQd(i,:) = Qd;

                %la nuova postura sara' quella trovata da Q con fminsearch
                Q0=Q;
            end
        end

        
        function [PP, QQ, Q0] = Circonferenza(lambda, centro, raggio, P1P2)
            N = length(lambda);
            for i=1:N
                
                angoloAlCentro =  2*asin( P1P2(i,:)/(2*raggio) );
                
                arco = angoloAlCentro*raggio;

                P(i,:) = arco;
                Q(i,:) = angoloAlCentro;
                
                %definisco le variabili che mi serviranno per i grafici
                %corrispondono alle variazioni delle var. dei giunti e dei punti
                %raggiunti
                QQ(i,:) = Q(i,:);
                PP(i,:) = P(i,:);

                Q0 = Q;
            end
        end
    
    end

end