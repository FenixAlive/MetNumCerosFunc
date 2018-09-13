function s = reglaFalsa(x0, x1, fx, c, iu, sol)
  % funcion de la regla falsa de secante para sacar el cero de una funcion con el metodo cerrado
  % x0 = inicio de busqueda
  % x1 = fin de busqueda
  % fx = funcion tipo @(x)(fx)
  % c = 0 para iteraciones, 1 para error
  % iu = numero de iteraciones o error
  % sol = solucion real
  
  linea(80);
  fprintf("\n Programa que busca el cero de una funcion con el metodo cerrado de regla falsa de secante\n")
  linea(80);

  format long;

  xn = [];
  
  if c == 0

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
  
  elseif c == 1
    
    err = 1 + iu;

    while err > iu
      m = x0 - (fx(x0)*(x1-x0))/(fx(x1)-fx(x0));
      err = abs(sol - m)
      xn = [xn; [x0 m x1 fx(x0) fx(m) err err/x0]];
      
      % regla falsa
      if(fx(x0)*fx(m)<0)
        x1 = m;
      else
        x0 = m;
      end
    end
  else
    fprintf("\n el valor de c solo puede ser 0 o 1");
  end
  s = xn;
end
