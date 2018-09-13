function r = eje4(a, b, fx, c, iu, x0)
  % Función que busca cero de una funcion con el punto medio con el metodo cerrado
  % parametros:
  % a = punto inicial a buscar
  % b = punto final a buscar
  % fx = funcion a buscar el cero
  % c = 0 para iteraciones, 1 para error
  % iu = numero de iteraciones o error absoluto en su caso
  % x0 = valor real para el calculo de error
  % imprime a, m, b, fx(a), fx(m), err, err-rel

  format long;
  xn = [];
  
  if c == 0

    %hacer iteraciones
    for i = 1:iu
      m = (a+b)/2;
      err = abs(x0 - m);
      xn = [xn; [a m b fx(a) fx(m) err err/x0]];
 
      if(fx(a)*fx(m)<0)
        b = m;
      else
        a=m;
      end
    end
  
  elseif c == 1
    %hacer while
    err = 1+iu;
    
    while iu < err
      m = (a+b)/2;
      err = abs(x0 - m);
      xn = [xn; [a m b fx(a) fx(m) err err/x0]];
 
      if(fx(a)*fx(m)<0)
        b = m;
      else
        a=m;
      end
    else
      fprintf("Error en el parametro c, debe ser 0 para iteraciones o 1 para error absoluto")
    end
  end

  r = xn;
end
