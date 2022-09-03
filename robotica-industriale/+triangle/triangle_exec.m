function triangle_exec(T)

    global P1 P2 P3

    T1 = T(1);
    T2 = T(2);
    T3 = T(3);
    T4 = T(4);

    global Qp
    Qp1 = Qp(:,1);
    Qp2 = Qp(:,2);
    Qp3 = Qp(:,3);


    import path.Path;
    global P1P2_segment P2P3_segment P3P1_segment
    global P1P2_derived_segment P2P3_derived_segment P3P1_derived_segment
    global Q1Q2_segment Q2Q3_segment Q3Q1_segment
    global Q1Q2_derived_segment Q2Q3_derived_segment Q3Q1_derived_segment

    %% P1->P2 segment
    [P1P2_segment, P1P2_derived_segment, Q1Q2_segment, Q1Q2_derived_segment]...
                                    = Path.segment(T1,T2, P1, P2, Qp1, Qp2);
    %% P2->P3 segment
    [P2P3_segment, P2P3_derived_segment, Q2Q3_segment, Q2Q3_derived_segment]...
                                    = Path.segment(T2,T3, P2, P3, Qp2, Qp3);
    %% P3->P1 segment
    [P3P1_segment, P3P1_derived_segment, Q3Q1_segment, Q3Q1_derived_segment]...
                                    = Path.segment(T3,T4, P3, P1, Qp3, Qp1);

    grid on; xlabel('X'); ylabel('Y'); zlabel('Z');


    
end