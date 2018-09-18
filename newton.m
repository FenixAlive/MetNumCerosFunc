function s = newton(x0, fx, f2x, c, iu, sol)
  % funcion que busca el cero de una funcion con el metodo de newton abierto
  %___________________________________
  % x0 = punto donde inicia a buscar
  % fx = funcion en formato @(x)(fx)
  % f2x = derivada de funcion en formato @(x)(f'x)
  % c = 0 iteraciones, 1 tolerancia
  % iu = valor de iteraciones o tolerancia
  % sol = solucion real
  %____________________________________
  % tabla:
  %_______________________________________
  % i  xn  fx(x0)  f'x(x0)  err  err-rel
  %_______________________________________
  
  format long;
  linea(139)
  fprintf("\n\tPrograma que calcula el cero de una función con el metodo abierto de Newton-Raphson\n")

  %variables para iteraciones
  xn = [];
  temp = [];
  err = 1;
  errrel = 1;

  linea(139); 
  fprintf("\n\t i \t Xn \t\t     f(Xn) \t\t   f\'(Xn) \t     err-abs \t\t     err-rel")
  linea(139); 
  
  if c == 0
    %hacer iteraciones
    for i = 1:iu
      x0 = x0 - fx(x0)/f2x(x0);
      if (sol ~= 0)
        err = abs(sol - x0);
        errrel = err/sol;
      else
        if(i > 1)
          mant = xn(i-1, 2);
          err = abs(mant-x0);
          errrel = err/mant;
        end
      end
      temp = [i x0 fx(x0) f2x(x0) err err/x0];
      xn = [xn; temp];
    end

  elseif c == 1
    err = 1 + iu;
    errtemp = 0;
    i = 1;
    
    while abs(err) > iu
      errtemp = err;
      x0 = x0 - fx(x0)/f2x(x0);
      if (sol ~= 0)
        err = abs(sol - x0);
        errrel = err/sol;
      else
        if(i > 1)
          mant = xn(i-1, 2)
          err = abs(mant-x0);
          errrel = err/mant;
        end
      end
      temp = [i x0 fx(x0) f2x(x0) err err/x0];
      xn = [xn; temp];
      i++;
    end
  else
    fprintf("Error en la variable c, 0 para iteraciones, 1 para error")
  end
  s = xn;
  xn
  fprintf("\n");
  linea(139); 
  fprintf("\n");
end
