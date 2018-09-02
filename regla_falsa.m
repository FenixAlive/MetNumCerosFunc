format long;
% pedir datos
x0 = input("\n\tCuanto vale x0: ");
x1 = input("\n\tCuanto vale x1: ");
iu = input("\n\tCuantas iteraciones: ");

% sol = .7146210577792838;
sol = sqrt(2);

% hacer funcion
% fx = @(x)(x^2-2*cos(x)+1);
fx = @(x)(x^2-2);
xn = [];
%hacer iteraciones
for i = 1:iu
  m = x0 - (fx(x0)*(x1-x0))/(fx(x1)-fx(x0));
  err = abs(sol - m);
  xn = [xn; [x0 m x1 fx(x0) fx(m) err err/x0]];
  % regla falsa
  if(fx(x0)*fx(m)<0)
    x1 = m;
  else
    x0 = m;
  end

end

xn
