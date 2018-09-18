function s = reglaFalsa(x0, x1, fx, c, iu, sol)
  % ______________________________________________________
  % funcion de la regla falsa de secante para sacar el cero de una funcion con el metodo cerrado
  % x0 = inicio de busqueda
  % x1 = fin de busqueda
  % fx = funcion tipo @(x)(fx)
  % c = 0 para iteraciones, 1 para tolerancia
  % iu = numero de iteraciones o tolerancia
  % sol = solucion real
  %__________________________________________________
  % tabla:
  %__________________________________________________
  % i  x0  m  x1  fx(x0)  fx(m)  err  err-rel  

  
  linea(80);
  fprintf("\n Programa que busca el cero de una funcion con el metodo cerrado de regla falsa de secante\n")
  linea(80);

  format long;

  xn = [];
  err = 1
  errrel = 1
  
  if c == 0

    %hacer iteraciones
    for i = 1:iu
      m = x0 - (fx(x0)*(x1-x0))/(fx(x1)-fx(x0));
      if (sol ~= 0)
        err = abs(x0 - m)
        errrel = err / sol;
      else
        if(i > 1)
          mant = xn(i-1, 3)
          err = abs(mant - m)
          errrel = err / mant;
        end
      end
      
      xn = [xn; [i x0 m x1 fx(x0) fx(m) err err/x0]];
      
      % regla falsa
      if(fx(x0)*fx(m)<0)
        x1 = m;
      else
        x0 = m;
      end
    end
  
  elseif c == 1
    
    err = 1 + iu;
    errtemp = 0;
    i = 1
    while abs(err) > iu
      errtemp = err;
      m = x0 - (fx(x0)*(x1-x0))/(fx(x1)-fx(x0));
      if (sol ~= 0)
        err = abs(x0 - m)
        errrel = err / sol;
      else
        if(i > 1)
          mant = xn(i-1, 3)
          err = abs(mant - m)
          errrel = err / mant;
        end
      end
      xn = [xn; [i x0 m x1 fx(x0) fx(m) err err/x0]];      
      % regla falsa
      if(fx(x0)*fx(m)<0)
        x1 = m;
      else
        x0 = m;
      end
      i++;
    end
  else
    fprintf("\n el valor de c solo puede ser 0 o 1");
  end
  linea(80)
  fprintf("\n\t i \t x0 \t m \t x1 \t fx(x0) \t fx(m) \t err \t err-rel")
  linea(80)

  s = xn;
end
