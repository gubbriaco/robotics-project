function T03 = cinematica_diretta(links, Q)

    l2 = links(2); 
    l3 = links(3);
    
    Q1 = Q(1); 
    Q2 = Q(2); 
    Q3 = Q(3);
    
    
    c1 = cos(Q1);
    c2 = cos(Q2);
    c23 = cos( Q2+Q3 );
    s1 = sin(Q1);
    s2 = sin(Q2);
    s23 = sin( Q2+Q3 );
    
    T03 = [
            [c1*c23 -c1*s23 s1 c1*(l2*c2+l3*c23)]
            [s1*c23 -s1*s23 -c1 s1*(l2*c2+l3*c23)]
            [s23 c23 0 l2*s2+l3*s23]
            [0 0 0 1]
          ];
    
end