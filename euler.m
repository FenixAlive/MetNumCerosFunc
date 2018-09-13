% format long;

 sol = .7146210577792838;
% sol =sqrt(2);

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
fprintf("\n\tPrograma que calcula el cero de una función con el metodo abierto de Euler\n")
x0 = input("\n\tCuanto vale x0: ");
iu = input("\n\tCuantas iteraciones: ");


% hacer funcion
% fx = @(x)(x^2-2*cos(x)+1);
% f1x = @(x)(2*x+2*sin(x));
% f2x = @(x)(2+2*cos(x));

% fx = @(x)(x^2-2);
% f1x = @(x)(2*x);
% f2x = @(x)(2);
 
fx = @(x)(x.^3-x+3);
f1x = @(x)(3*x.^2-1);
f2x = @(x)(6*x);

%variables para iteraciones
xn = [];
temp = [];
ux = @(x)(fx(x)/f1x(x));
tx = @(x)((fx(x)*f2x(x))/(f1x(x)*f1x(x)));

linea(139); 
fprintf("\n\t\t Xn \t\t     f(Xn) \t\t   f\'(Xn) \t     err-abs \t\t     err-rel")
linea(139); 

%hacer iteraciones
for i = 1:iu
  x0 = x0 - ((2*ux(x0))/(1+sqrt(1-2*tx(x0))));
  err = abs(sol - x0);
  temp = [x0 fx(x0) f1x(x0) err err/x0];
  xn = [xn; temp];
  fprintf("\n   %d | %.25f | %.15f | %.15f | %.20f | %.30f ", i, temp(1), temp(2), temp(3), temp(4), temp(5))
end

fprintf("\n");
linea(139); 
fprintf("\n");
xn