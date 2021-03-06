% Plot contours of an ellipse with large eigenvalue disparity
% and the results of steepest descent

% Copyright 1999 by Todd K. Moon

v1 = [1;1];
v2 = [1; -1];
lambda1 = 100;
lambda2 = 5;
R = v1*v1'* lambda1 + v2*v2'*lambda2;
b = [200;200];
[Q,v] = eig(R);
Q1 = Q(:,1); q2 = Q(:,2);
xstar = R\b;
x1 = (-10+xstar(1):.1:10+xstar(1))';
x2 = (-10+xstar(2):.1:10+xstar(2))';
[X1,X2] = meshgrid(x1,x2);
Z = X1.^2 .* R(1,1) + X2.^2 .* R(2,2) + 2*X1.*X2.*R(1,2) - 2*b(1).*X1 - 2*b(2).*X2;
 
hold off
subplot(2,2,1)
contour(x1,x2,Z,50);
axis('equal');
axis('square');
hold on
axis([-10+xstar(1) 10+xstar(1) -10+xstar(2) 10+xstar(2)])
set(gca,'XTick',[-10+xstar(1) -5+xstar(1) 0+xstar(1) 5+xstar(1) 10+xstar(1)])
set(gca,'YTick',[-10+xstar(2) -5+xstar(2) 0+xstar(2) 5+xstar(2) 10+xstar(2)])

x = [1;-10];
y = x-xstar;
z = Q*y;
mu = .004;
%mu = .0051;
xn = zeros(2,1);
numiter = 20;
savez = zeros(2,numiter+1);
savez(:,1) = z;
for i = 1:numiter
%  grad = [2*x(1)*R(1,1) + 2*x(2)*R(1,2);
%         2*x(1)*R(1,2) + 2*x(2)*R(2,2)];
  grad = 2*R*x - 2*b;
  xn = x - mu*grad;
  plot([x(1) xn(1)],[x(2) xn(2)]);
  plot(x(1),x(2),'.','MarkerSize',10);
  x =xn;
  savez(:,i+1) = Q*(x-xstar);
end
xlabel('x_1')
ylabel('x_2')
print -dps ../pictures/steepest1a.ps
print -deps ../pictures/steepest1a.eps
input('press return')

clf 
hold off
subplot(2,2,1)
contour(x1,x2,Z,50);
axis('equal');
axis('square');
hold on
axis([-10+xstar(1) 10+xstar(1) -10+xstar(2) 10+xstar(2)])
set(gca,'XTick',[-10+xstar(1) -5+xstar(1) 0+xstar(1) 5+xstar(1) 10+xstar(1)])
set(gca,'YTick',[-10+xstar(2) -5+xstar(2) 0+xstar(2) 5+xstar(2) 10+xstar(2)])

x = [1;-10];
y = x-xstar;
z = Q*y;
%mu = .004;
mu = .0051;
xn = zeros(2,1);
numiter = 20;
savez = zeros(2,numiter+1);
savez(:,1) = z;
for i = 1:numiter
%  grad = [2*x(1)*R(1,1) + 2*x(2)*R(1,2);
%         2*x(1)*R(1,2) + 2*x(2)*R(2,2)];
  grad = 2*R*x - 2*b;
  xn = x - mu*grad;
  plot([x(1) xn(1)],[x(2) xn(2)]);
  plot(x(1),x(2),'.','MarkerSize',10);
  x =xn;
  savez(:,i+1) = Q*(x-xstar);
end
xlabel('x_1')
ylabel('x_2')
print -dps ../pictures/steepest1b.ps
print -deps ../pictures/steepest1b.eps

