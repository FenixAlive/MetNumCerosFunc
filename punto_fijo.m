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
fprintf("\n\tPrograma que calcula el cero de una función con el metodo abierto de Punto Fijo\n")
x0 = input("\n\tCuanto vale x0: ");
iu = input("\n\tCuantas iteraciones: ");


% hacer funcion
 fx = @(x)(tan(x)-3*(x**3));
 

%variables para iteraciones
xn = [];
temp = [];

linea(139); 
fprintf("\n\t\t Xn \t\t     f(Xn) \t\t   f\'(Xn) \t     err-abs \t\t     err-rel")
linea(139); 

%hacer iteraciones
for i = 1:iu
  x0 = fx(x0);
  err = abs(sol - x0);
  temp = [x0 fx(x0) err err/x0];
  xn = [xn; temp];
  fprintf("\n   %d | %.25f | %.15f | %.20f | %.30f ", i, temp(1), temp(2), temp(3), temp(4));
end

fprintf("\n");
linea(139); 
fprintf("\n");
