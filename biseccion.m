function r = biseccion(a, b, fx, c, iu, x0)
  % Función que busca cero de una funcion con el punto medio con el metodo cerrado
  % parametros:
  % a = punto inicial a buscar
  % b = punto final a buscar
  % fx = funcion a buscar el cero
  % c = 0 para iteraciones, 1 para tolerancia
  % iu = numero de iteraciones o tolerancia en su caso
  % x0 = valor real para el calculo de error, si no se sabe poner 0
  %__________________________________________________
  % imprime i, a, m, b, fx(a), fx(m), err, err-rel

  linea(80)

  xn = [];
  err = 1;
  errrel = 1;
  
  if c == 0

    %hacer iteraciones
    for i = 1:iu
      m = (a+b)/2;
      if (x0 ~= 0)
        err = abs(x0 - m);
        errrel = err/x0;
      else
        if(i > 1)
          mant = xn(i-1, 3);
          err = abs(mant-m);
          errrel = err / mant;
        end
      end

      xn = [xn; [i a m b fx(a) fx(m) err errrel]];
 
      if(fx(a)*fx(m)<0)
        b = m;
      else
        a=m;
      end
    end
  
  elseif c == 1
    %hacer while
    i = 1 
    while abs(err) > iu
      m = (a+b)/2;
      if (x0 ~= 0)
        err = abs(x0 - m);
        errrel = err/x0;
      else
        if(i > 1)
          mant = xn(i-1, 3);
          err = abs(mant-m);
          errrel = err / mant;
        end
      end
      xn = [xn; [i a m b fx(a) fx(m) err err/x0]];
      
      if(fx(a)*fx(m)<0)
        b = m;
      else
        a=m;
      end
      i++;
    end
  else
      fprintf("Error en el parametro c, debe ser 0 para iteraciones o 1 para error absoluto")
  end

  r = xn;
end
