function [X,Y,   grid,obstacles] = obstacles_generator()

    % Genero una mappa di ostacoli che sistemo in una griglia binaria di occupazione
    % dello spazio. Di conseguenza per rappresentare gli ostacoli posso sfruttare una
    % meshgrid. 

    %% GRID ENVIRONMENT
    nr = 100; nc = 100;
    x_origin=1; y_origin=1;
    width=100; height=100;
    grid = zeros(nr, nc);
    width_points = linspace(x_origin-1, nr, width);
    height_points = linspace(y_origin-1, nc, height);
    [X,Y] = meshgrid(width_points, height_points);

    
    
    %% OBSTACLES
    nr_obstacles=0;
    
    %% WALLS
    width_wall = 1;
    height_wall = 1;
    
    % under wall
    x_origin_wall=1; y_origin_wall=1; length_wall=100;
    grid(1:2,1:100) = height_wall;
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,1) X(1,100) Y(1) Y(2)];
    
    % over wall
    grid(99:100,1:100) = height_wall; 
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,1) X(1,100) Y(99) Y(100)];
    
    % left wall
    grid(1:100,1:2) = height_wall; 
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,1) X(1,2) Y(1) Y(100)];
    
    % right wall
    grid(1:100,99:100) = height_wall; 
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,99) X(1,100) Y(1) Y(100)];

    
    %grid(y_under:y_over, x_under:x_over)
    height_obstacle = 1;
    
    % obstacle nr.1
    x_left=15; x_right=25; 
    y_under=10; y_over=20;
    grid(x_left:x_right,y_under:y_over) = height_obstacle;   
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    % obstacle nr.2
    x_left=40; x_right=45;
    y_under=15; y_over=70;
    grid(x_left:x_right,y_under:y_over) = height_obstacle;   
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    % obstacle nr.3
    x_left=15; x_right=35; 
    y_under=30; y_over=60;
    grid(x_left:x_right,y_under:y_over) = height_obstacle;
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    % obstacle nr.4
    x_left=60; x_right=90; 
    y_under=15; y_over=60;
    grid(x_left:x_right,15:60) = height_obstacle;      
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    % obstacle nr.5
    x_left=15; x_right=60;
    y_under=80; y_over=90;
    grid(x_left:x_right,y_under:y_over) = height_obstacle;   
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    % obstacle nr.6
    x_left=70; x_right=90;
    y_under=70; y_over=90;
    grid(x_left:x_right,y_under:y_over) = height_obstacle;
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    
    %% PLOT
    Z = 1.*grid;
    figure(); mesh(X,Y,Z); xlabel("X"); ylabel("Y"); zlabel("Z");
    axis("equal"), axis([0 100 0 100])
