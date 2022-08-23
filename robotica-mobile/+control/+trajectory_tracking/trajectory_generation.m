function [samples, xstar, ystar, xdstar, ydstar, xddstar, yddstar, thetastar, thetadstar]...
    = trajectory_generation(P, Ts)


    Px = P(:,1)';
    Py = P(:,2)';
    wpts = [Px ; Py];
    samples = length(P)/Ts;
    
    [q, qd, qdd, tvec, pp] = trapveltraj(wpts, samples);

    xstar = q(1,:);
    ystar = q(2,:);

    xdstar = qd(1,:);
    ydstar = qd(2,:);

    xddstar = qdd(1,:);
    yddstar = qdd(2,:);

    thetastar = atan2(ydstar, xdstar);
    

    figure();
    global start goal
    hold on; plot(start(1),start(2), "*", "Color","b");
    hold on; plot(goal(1),goal(2), "*", "Color","g");
    hold on; plot(xstar, ystar);
    legend({"start", "goal", "trajectory generated"}, "Location","northwest");
    title("APPROXIMATED TRAJECTORY");
    

    figure();
    hold on; plot(start(1),start(2), "*", "Color","b");
    hold on; plot(goal(1),goal(2), "*", "Color","g");
    hold on; plot(Px, Py);
    hold on; plot(xstar, ystar);
    legend({"start", "goal", "original trajectory", "trajectory generated", "original trajectory"},...
           "Location","northwest");
    title("APPROXIMATED TRAJECTORY AND ORIGINAL TRAJECTORY");                                                 
      
%     % Considero le due colonne della traiettoria P essendo rispettivamente
%     % le x e le y della traiettoria ottima ottenuta dal path planning. Per
%     % ottenere un'approssimazione di tale percorso devo ottenere, quindi,
%     % un'approssimazione di ogni colonna, cioe' sia delle x che delle y.
%     % Pertanto, calcolo prima l'approssimazione delle x e poi quella delle
%     % y. Ogni approssimazione viene calcolata per interpolazione
%     % utilizzando le funzioni native 'polyfit' e 'polyval' di MATLAB. La 
%     % prima permette di ottenere un fitting del polinomio corrispondete ai 
%     % valori passati in input, cioe' i valori presenti nella colonna 
%     % considerata (prima citata). Per la precisione vengono passati tre 
%     % input alla funzione 'polyfit': il primo rappresenta le 'ascisse' (che
%     % in entrambi i casi e' stato ottenuto per discretizzazione tramite la 
%     % funzione nativa linspace di MATLAB considerando come range di valori
%     % quello ottenuto considerando i valori della colonna in questione), il
%     % secondo rappresenta le 'ordinate', quindi i valori che dovrebbero
%     % essere rappresentati solitamente in un 'grafico 2D' (che in questo 
%     % caso corrispondono ai valori delle due colonne considerate), il terzo
%     % valore, infine, rappresenta il grado di interpolazione scelto per il
%     % polinomio. La funzione 'polyfit' restituisce in output tre valori:
%     % il primo e' un array che rappresenta i coefficienti del polinomio in
%     % questione ottenuto, il secondo rappresenta il valore medio (@see mean
%     % ), il terzo rappresenta la deviazione standard (@see std). Pertanto,
%     % costruisco la funzione a partire dai risultati ottenuti tramite la
%     % funzione 'polyval'  rispetto al tempo 't' passando come valori i
%     % coefficienti, le ascisse considerate, il valore medio e la deviazione
%     % standard ottenuti. Infine, la derivata di tale funzione puo' essere
%     % calcolata tramite la funzione nativa 'diff' di MATLAB.
% 
%     
%     %     S e' la stima dell'errore
%     %     mu:
%     %     mu(1) = mean e' la media 
%     %     mu(2) = std e' la deviazione standard
% 
% 
%     syms xstar(t) xdotstar(t) ystar(t) ydotstar(t) thetastar(t) thetadotstar(t) ...
%          xdotdotstar(t) ydotdotstar(t) vstar(t) omegastar(t);
%     import control.poly.poly;
%     
%     X = P(:,1);
%     yX = X;
%     size_yX = size(yX);
%     xX = linspace(0, size_yX(1)-1, size_yX(1));
%     [Xcoff, SX, muX] = polyfit(xX, yX, grade);
%     xstar(t) = poly(Xcoff, grade);
%     pX = polyval(Xcoff, xX, SX, muX);
%     xdotstar(t) = diff(xstar);
%     xdotdotstar(t) = diff(xdotstar(t));
%     
%     Y = P(:,2);
%     yY = Y;
%     size_yY = size(yY);
%     xY = linspace(0, size_yY(1)-1, size_yY(1));
%     [Ycoff, SY, muY] = polyfit(xY, yY, grade);
%     ystar(t) = poly(Ycoff, grade);
%     pY = polyval(Ycoff, xY, SY, muY);
%     ydotstar(t) = diff(ystar);
%     ydotdotstar(t) = diff(ydotstar(t));
%     
%     thetastar(t) = atan2(ydotstar(t), xdotstar(t));
%     thetadotstar(t) = diff(thetastar(t));
%     
%     vstar(t) = sqrt((xdotstar(t))^2 + (ydotstar(t))^2);
%     omegastar(t) = (ydotdotstar(t)*xdotstar(t) - xdotdotstar(t)*ydotstar(t))...
%                         /((xdotstar(t)^2) + (ydotstar(t)^2));
%     
%     global start goal
%     figure();
%     hold on; plot(start(1),start(2), "*", "Color","b");
%     hold on; plot(goal(1),goal(2), "*", "Color","g");
%     hold on; plot(pX, pY); 
%     hold on; plot(X, Y);
%     legend({"start", "goal", "trajectory generated", "original trajectory"},...
%            "Location","northwest");
%     title("APPROXIMATED TRAJECTORY");

    
end