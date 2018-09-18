function s = secante(x0, x1, fx, c, iu, sol)
  %
  %  Funcion que calcula el cero de una funcion mediante el metodo de secante
  %  las variables a pasar en orden son las siguientes:
  %  x0 = valor inicial
  %  x1 = valor inicial
  %  fx = funcion a evauluar ej. fx = @(x)(x^2)
  %  c  = 0 con iteraciones, 1 con calculo de tolerancia
  %  iu = numero de iteraciones o tolerancia
  %  sol = solucion
  %____________________________________________
  %  tabla = i x0 x1 m fx(x0) fx(m) err err-rel 
  format long;

  linea(80)
  fprintf("\n Programa que calcula el cero de una función con el metodo cerrado de Secante\n")
  linea(80); 
  fprintf("\n");

  %variables para iteraciones
  xn = [];
  temp = [];
  err = 1;
  errrel = 1;

  %hacer iteraciones
  if c == 0
    for i = 1:iu
      m = x0 - (fx(x0)*(x1-x0))/(fx(x1)-fx(x0));
      if (sol ~= 0)
        err = abs(sol - m);
        errrel = err/sol;
      else
        if(i > 1)
          mant = xn(i-1, 3);
          err = abs(mant-m);
          errrel = err / mant;
        end
      end
      temp = [i x0 x1 m fx(x0) fx(m) err err/x0];
      xn = [xn; temp];
      % biseccion
      x0 = x1;
      x1 = m;
    end
  elseif c==1
    err = 1+iu;
    errtemp = 0;
    i = 1;
    while abs(err) > iu
      errtemp = err;
      m = x0 - (fx(x0)*(x1-x0))/(fx(x1)-fx(x0));
      if (sol ~= 0)
        err = abs(sol - m);
        errrel = err/sol;
      else
        if(i > 1)
          mant = xn(i-1, 3);
          err = abs(mant-m);
          errrel = err / mant;
        end
      end
      temp = [i x0 x1 m fx(x0) fx(m) err err/x0];
      xn = [xn; temp];
      % biseccion
      x0 = x1;
      x1 = m;
      i++;
    end
  else
    fprintf("\n\tEl parametro c fue introducido con error, vuelva a intentarlo\n");
  end
  linea(80); 
  fprintf("\n\t i \t x0 \t x1 \t m \t fx(x0) \t fx(m) \t err \t err-rel \n")
  linea(80); 
  fprintf("\n");
  s = xn;
endfunction


