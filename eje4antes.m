format long;
% pedir datos
a = input("\n\tCuanto vale a: ");
b = input("\n\tCuanto vale b: ");
iu = input("\n\tCuantas iteraciones: ");

x0 = .7146210577792838;

% hacer funcion
fx = @(x)(x^2-2*cos(x)+1);
xn = [];
%hacer iteraciones
for i = 1:iu
  m = (a+b)/2;
  err = abs(x0 - m);
  xn = [xn; [a m b fx(a) fx(m) err err/x0]];
  if(fx(a)*fx(m)<0)
    b = m;
  else
    a=m;
  end

end

xn
