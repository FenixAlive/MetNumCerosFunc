function s = newtonAbierto(x0, fx, f2x, c, iu, sol)
  % funcion que busca el cero de una funcion con el metodo de newton abierto
  % x0 = punto donde inicia a buscar
  % fx = funcion en formato @(x)(fx)
  % f2x = derivada de funcion en formato @(x)(f'x)
  % c = 0 iteraciones, 1 error
  % iu = valor de iteraciones o error
  % sol = solucion real
  
  format long;
  linea(139)
  fprintf("\n\tPrograma que calcula el cero de una función con el metodo abierto de Newton-Raphson\n")

  %variables para iteraciones
  xn = [];
  temp = [];

  linea(139); 
  fprintf("\n\t\t Xn \t\t     f(Xn) \t\t   f\'(Xn) \t     err-abs \t\t     err-rel")
  linea(139); 
  
  if c == 0
    %hacer iteraciones
    for i = 1:iu
      x0 = x0 - fx(x0)/f2x(x0);
      err = abs(sol - x0);
      temp = [x0 fx(x0) f2x(x0) err err/x0];
      xn = [xn; temp];
    end

  elseif c == 1
    err = 1 + iu;
    
    while err > iu
      x0 = x0 - fx(x0)/f2x(x0);
      err = abs(sol - x0)
      temp = [x0 fx(x0) f2x(x0) err err/x0];
      xn = [xn; temp];
    end
  else
    fprintf("Error en la variable c, 0 para iteraciones, 1 para error")
  end
  s = xn;
  fprintf("\n");
  linea(139); 
  fprintf("\n");
end

