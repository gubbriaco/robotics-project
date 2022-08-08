clc; clear; close all;
import path_planning.discrete_potential_fields.map_creation;
import path_planning.discrete_potential_fields.rectangle_insertion;
import path_planning.discrete_potential_fields.distances;
import path_planning.discrete_potential_fields.search_path;

height_environment = 125;
width_environment = 275;

start = [2 123];
goal = [273 2];

delta=1;

environment = map_creation(width_environment,height_environment, delta);

%ostacoli: vertici senza ingrossamento
% OBSTACLE NR.1
x_obstacle=5; y_obstacle=15; w_obstacle=20; h_obstacle=50; curvature=0.2;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.2
x_obstacle=45; y_obstacle=110; w_obstacle=55; h_obstacle=15; curvature=0.7;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.3
x_obstacle=65; y_obstacle=60; w_obstacle=10; h_obstacle=25; curvature=0.9;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.4
x_obstacle=110; y_obstacle=45; w_obstacle=60; h_obstacle=35; curvature=0.3;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.5
x_obstacle=120; y_obstacle=85; w_obstacle=20; h_obstacle=20; curvature=0.1;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.6
x_obstacle=230; y_obstacle=60; w_obstacle=44; h_obstacle=40; curvature=0.5;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);

%mappa dei potenziali
discrete_potential_map = distances(goal(1),goal(2), environment);

%percorso minimo
[cell_path, path_map] = search_path(start(1),start(2), discrete_potential_map);