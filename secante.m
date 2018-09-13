function s = biseccion(x0, x1, fx, c, iu, sol)
  %
  %  Funcion que calcula el cero de una funcion mediante el metodo de biseccion
  %  las variables a pasar en orden son las siguientes:
  %  x0 = valor inicial
  %  x1 = valor inicial
  %  fx = funcion a evauluar ej. fx = @(x)(x^2)
  %  c  = 0 con iteraciones, 1 con calculo de error
  %  iu = numero de iteraciones o error segun sea el caso
  %  sol = solucion
  %  tabla = x0 x1 m fx(x0) fx(m) err err-rel 
  format long;

  linea(80)
  fprintf("\n Programa que calcula el cero de una función con el metodo cerrado de Bisección\n")
  linea(80); 
  fprintf("\n");

  %variables para iteraciones
  xn = [];
  temp = [];

  %hacer iteraciones
  if c == 0
    for i = 1:iu
      m = x0 - (fx(x0)*(x1-x0))/(fx(x1)-fx(x0));
      err = abs(sol - m);
      temp = [x0 x1 m fx(x0) fx(m) err err/x0];
      xn = [xn; temp];
      % biseccion
      x0 = x1;
      x1 = m;
    end
  elseif c==1
    err = 1+iu;
    
    while err > iu
      m = x0 - (fx(x0)*(x1-x0))/(fx(x1)-fx(x0));
      err = abs(sol - m)
      temp = [x0 x1 m fx(x0) fx(m) err err/x0];
      xn = [xn; temp];
      % biseccion
      x0 = x1;
      x1 = m;
    end
  else
    fprintf("\n\tEl parametro c fue introducido con error, vuelva a intentarlo\n");
  end
  linea(80); 
  fprintf("\n\t x0 \t x1 \t m \t fx(x0) \t fx(m) \t err \t err-rel \n")
  linea(80); 
  fprintf("\n");
  s = xn;
endfunction

