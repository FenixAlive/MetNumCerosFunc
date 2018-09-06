% format long;

% sol = .7146210577792838;
 sol =sqrt(2);

%funcion linea
function linea(n)
fprintf("\n ");
for i = 1:n
  fprintf("_");
end
fprintf("\n");
endfunction

% pedir datos
linea(139)
fprintf("\n\tPrograma que calcula el cero de una función con el metodo abierto de Newton-Raphson\n")
x0 = input("\n\tCuanto vale x0: ");
iu = input("\n\tCuantas iteraciones: ");


% hacer funcion
% fx = @(x)(x^2-2*cos(x)+1);
% f2x = @(x)(2*x+2*sin(x));

 fx = @(x)(x^2-2);
 f2x = @(x)(2*x);

%variables para iteraciones
xn = [];
temp = [];

linea(139); 
fprintf("\n\t\t Xn \t\t     f(Xn) \t\t   f\'(Xn) \t     err-abs \t\t     err-rel")
linea(139); 

%hacer iteraciones
for i = 1:iu
  x0 = x0 - fx(x0)/f2x(x0);
  err = abs(sol - x0);
  temp = [x0 fx(x0) f2x(x0) err err/x0];
  xn = [xn; temp];
  if fx(x0) < 0 && f2x(x0) < 0
    fprintf("\n   %d | %.20f |%.15f |%.15f | %.20f | %.30f ", i, temp(1), temp(2), temp(3), temp(4), temp(5))
  elseif fx(x0) < 0 
    fprintf("\n   %d | %.20f |%.15f | %.15f | %.20f | %.30f ", i, temp(1), temp(2), temp(3), temp(4), temp(5))
  elseif fx(x0) < 0
    fprintf("\n   %d | %.20f | %.15f |%.15f | %.20f | %.30f ", i, temp(1), temp(2), temp(3), temp(4), temp(5))
  else
    fprintf("\n   %d | %.20f | %.15f | %.15f | %.20f | %.30f ", i, temp(1), temp(2), temp(3), temp(4), temp(5))
  end
end

fprintf("\n");
linea(139); 
fprintf("\n");
