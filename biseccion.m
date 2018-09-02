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
fprintf("\n\tPrograma que calcula el cero de una función con el metodo cerrado de Bisección\n")
x0 = input("\n\tCuanto vale x0: ");
x1 = input("\n\tCuanto vale x1: ");
iu = input("\n\tCuantas iteraciones: ");


% hacer funcion
% fx = @(x)(x^2-2*cos(x)+1);
fx = @(x)(x^2-2);


%variables para iteraciones
xn = [];
temp = [];

linea(139); 
fprintf("\n\t     x0 \t\t x1 \t\t m \t\t    f(x0) \t\t f(m) \t\t err-abs \t\t err-rel")
linea(139); 

%hacer iteraciones
for i = 1:iu
  m = x0 - (fx(x0)*(x1-x0))/(fx(x1)-fx(x0));
  err = abs(sol - m);
  temp = [x0 x1 m fx(x0) fx(m) err err/x0];
  xn = [xn; temp];
  if fx(x0) < 0 && fx(m) < 0
    fprintf("\n | %.15f | %.15f | %.15f |%.15f |%.15f | %.15f | %.15f |", temp(1), temp(2), temp(3), temp(4), temp(5), temp(6), temp(7))
  elseif fx(x0) < 0 
    fprintf("\n | %.15f | %.15f | %.15f |%.15f | %.15f | %.15f | %.15f |", temp(1), temp(2), temp(3), temp(4), temp(5), temp(6), temp(7))
  elseif fx(m) < 0
    fprintf("\n | %.15f | %.15f | %.15f | %.15f |%.15f | %.15f | %.15f |", temp(1), temp(2), temp(3), temp(4), temp(5), temp(6), temp(7))
  else
    fprintf("\n | %.15f | %.15f | %.15f | %.15f | %.15f | %.15f | %.15f |", temp(1), temp(2), temp(3), temp(4), temp(5), temp(6), temp(7))
  end
  % biseccion
  x0 = x1;
  x1 = m;
end

fprintf("\n");
linea(139); 
fprintf("\n");
