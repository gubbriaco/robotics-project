clear; close all; clc;
import robot.Robot;
import environment.Environment;
import environment.Obstacle;


%% ROBOT
global radius_robot
radius_robot = 5;
robot = Robot(radius_robot);
% PLOT ROBOT
figure(); plot(robot);

%% ENVIRONMENT
global width height start goal
x_origin=0; y_origin=0;
width=275; height=125;
start = [x_origin+1 y_origin+1];
goal = [width-1 height-1];
environment = Environment(width, height);
% PLOT ENVIRONMENT
figure(); plot(environment, "ENVIRONMENT");

nr_obstacles=6;

% OBSTACLE NR.1
x_obstacle=20; y_obstacle=100; w_obstacle=20; h_obstacle=15; curvature=0.2;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(1) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle, "red");

% OBSTACLE NR.2
x_obstacle=45; y_obstacle=20; w_obstacle=55; h_obstacle=35; curvature=0.7;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(2) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle, "red");

% OBSTACLE NR.3
x_obstacle=65; y_obstacle=80; w_obstacle=40; h_obstacle=30; curvature=0.9;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(3) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle, "red");

% OBSTACLE NR.4
x_obstacle=120; y_obstacle=60; w_obstacle=30; h_obstacle=55; curvature=0.3;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(4) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle, "red");

% OBSTACLE NR.5
x_obstacle=170; y_obstacle=65; w_obstacle=50; h_obstacle=30; curvature=0.1;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(5) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle, "red");

% OBSTACLE NR.6
x_obstacle=180; y_obstacle=10; w_obstacle=70; h_obstacle=30; curvature=0.5;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(6) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle, "red");

%% OBSTACLES SHAPE
base_enlargement = radius_robot;
security_offset = eps;
enlargement = base_enlargement+security_offset;
path_planning.obstacles_shape.enlarge_obstacles
figure(); plot(environment, "ENVIRONMENT WITH ENLARGED OBSTACLES");
for i=1:length(obstacles)
    plot(enlarged_obstacles(i), "#808080")
    plot(obstacles(i), "red")
end

% figure();
% x=0; y=0;
% title("PROVA");
% rectangle('Position',[x y width height], "EdgeColor","black", "LineWidth",1);
% xlim_target = 300; ylim_target = 150;
% xlim([width-xlim_target xlim_target]); ylim([height-ylim_target ylim_target]);
% hold on; plot(start(1), start(2), "*", "LineWidth",4, "Color","#124ee6");
% hold on; plot(goal(1), goal(2), "*", "LineWidth", 4, "Color","#0eb04f");
% for i=1:height
%     for j=1:width
%         if isequal(environment.matrix(i,j), 999)
%             hold on; rectangle('Position',[i j 1 1], "Curvature",0, "FaceColor","black", "EdgeColor","black");
%         end
%     end
% end