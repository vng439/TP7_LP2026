## Ejercicio 6 - valorAbsoluto
```haskell
valorAbsoluto :: Float -> Float
valorAbsoluto x
| x < 0     = -x
| otherwise = x
```
La función recibe un número de tipo Float y devuelve su valor absoluto. Para resolverlo se utilizan guardas, evaluando si el número es menor que cero. Si es negativo, se devuelve su opuesto; en caso contrario, se devuelve el mismo valor.

Se eligió utilizar guardas porque permiten expresar claramente los dos posibles casos del problema: números negativos y números no negativos. No fue necesario utilizar recursión ya que la solución requiere únicamente una comparación.

### Conceptos utilizados:

**Función pura:**
La función siempre devuelve el mismo resultado para una misma entrada y no produce efectos secundarios. Por ejemplo, si se invoca valorAbsoluto (-5), siempre devolverá 5, independientemente del contexto en que se ejecute.

**Guardas (Guards):**
Se utilizan para expresar condiciones de forma clara y legible. En este ejercicio permiten distinguir entre el caso en que el número es negativo y el caso en que es cero o positivo.

**Comparación de valores:**
La expresión x < 0 realiza una comparación entre el valor recibido y cero para determinar qué resultado debe devolver la función.

**Tipado estático:**
La firma Float -> Float indica que la función recibe un valor de tipo Float y devuelve otro valor del mismo tipo. Haskell verifica estos tipos durante la compilación, ayudando a prevenir errores antes de ejecutar el programa.


## Ejercicio 7 – signo
```haskell
signo :: Float -> Int
signo x
    | x < 0 = -1
    | x == 0 = 0
    | otherwise = 1
```
La función recibe un número real (`Float`) y devuelve un valor entero (`Int`) que indica su signo. Devuelve `-1` si el número es negativo, `0` si es igual a cero y `1` si es positivo.

La solución utiliza guardas para evaluar las distintas posibilidades establecidas en la consigna. Primero verifica si el número es menor que cero, luego si es igual a cero y, en caso contrario, devuelve `1`, indicando que el número es positivo.

### Conceptos utilizados

**Función pura:**
La función siempre produce el mismo resultado para una misma entrada y no genera efectos secundarios. Por ejemplo, `signo (-3)` siempre devolverá `-1`.

**Guardas (Guards):**
Permiten expresar de forma clara los distintos casos posibles del problema. En este ejercicio se utilizan para diferenciar números negativos, cero y números positivos.

**Comparación de valores:**
Se utilizan los operadores relacionales `<` y `==` para determinar la relación del número recibido con el valor cero y decidir qué resultado devolver.

**Tipado estático:**
La firma `Float -> Int` indica que la función recibe un número real y devuelve un número entero. Haskell verifica estos tipos durante la compilación.

**Funciones condicionales:**
La lógica de la función depende de condiciones que determinan cuál de los tres resultados posibles debe retornarse, cumpliendo exactamente con la definición matemática de la función signo.

## Ejercicio 8 – maximo
```haskell
maximo :: Int -> Int -> Int
maximo x y =
    if x > y
       then x
       else y
```
La función recibe dos números enteros y devuelve el mayor de ellos. Su objetivo es determinar cuál de los dos valores representa el máximo.

La solución utiliza una expresión condicional `if-then-else` para comparar ambos números. Si el primer número es mayor que el segundo, devuelve el primero; de lo contrario, devuelve el segundo. De esta manera siempre se obtiene el valor máximo entre los dos parámetros recibidos.

### Conceptos utilizados

**Función pura:**
La función siempre devuelve el mismo resultado para los mismos valores de entrada y no produce efectos secundarios. Por ejemplo, `maximo 8 3` siempre devolverá `8`.

**Expresiones condicionales (if-then-else):**
Permiten tomar decisiones dentro de la función. En este caso se utilizan para elegir cuál de los dos números debe ser devuelto como resultado.

**Comparación de valores:**
Se utiliza el operador relacional `>` para determinar cuál de los dos números es mayor.

**Tipado estático:**
La firma `Int -> Int -> Int` indica que la función recibe dos números enteros y devuelve un número entero. Haskell verifica que los tipos utilizados sean correctos durante la compilación.

**Currificación:**
La función recibe sus parámetros de forma separada (`Int -> Int -> Int`) en lugar de recibir una tupla. Esto es una característica propia de Haskell, donde las funciones son currificadas por defecto.


## Ejercicio 9 – max3

```haskell
maximo :: Int -> Int -> Int
maximo x y =
if x > y
    then x
    else y

max3 :: Int -> Int -> Int -> Int

max3 a b c = maximo (maximo a b) c

```

La función recibe tres números enteros y devuelve el mayor de ellos. Para resolver el problema reutiliza la función `maximo`, definida previamente para comparar dos valores.

Primero se compara el primer número con el segundo mediante `maximo a b`, obteniendo el mayor de ambos. Luego, ese resultado se compara con el tercer número mediante una nueva llamada a `maximo`. El resultado final corresponde al mayor de los tres valores recibidos.

Por ejemplo: haskell `max3 4 8 6`

1. `maximo 4 8` devuelve `8`.
2. `maximo 8 6` devuelve `8`.
3. Resultado final: `8`.

### Conceptos utilizados

**Función pura:**
La función siempre devuelve el mismo resultado para los mismos parámetros de entrada y no produce efectos secundarios. Por ejemplo, `max3 4 8 6` siempre devolverá `8`.

**Reutilización de funciones:**
En lugar de volver a implementar la lógica de comparación, la función aprovecha la definición de `maximo`. Esto reduce la repetición de código y facilita el mantenimiento del programa.

**Composición de funciones:**
La solución combina dos llamadas a `maximo`, utilizando el resultado de la primera como argumento de la segunda para construir una solución más compleja a partir de una más simple.

**Comparación de valores:**
Aunque la comparación se realiza dentro de `maximo`, el objetivo sigue siendo determinar cuál de los números es el mayor.

**Tipado estático:**
La firma `Int -> Int -> Int -> Int` indica que la función recibe tres números enteros y devuelve un entero. Haskell verifica estos tipos durante la compilación.

**Currificación:**
La función recibe los parámetros de forma separada, característica propia de Haskell y de las funciones currificadas.


## Ejercicio 10 – max4 (Forma 1)

```haskell
maximo :: Int -> Int -> Int
maximo x y =
    if x > y
       then x
       else y

max4 :: Int -> Int -> Int -> Int -> Int
max4 a b c d = maximo (maximo a b) (maximo c d)
```


La función recibe cuatro números enteros y devuelve el mayor de ellos. Para resolver el problema reutiliza la función `maximo`, encargada de comparar dos valores.

La solución divide el problema en dos comparaciones independientes. Primero obtiene el máximo entre `a` y `b`, y luego el máximo entre `c` y `d`. Finalmente, compara ambos resultados para obtener el mayor de los cuatro números.

Por ejemplo: `max4 5 8 3 10`

1. `maximo 5 8` devuelve `8`.
2. `maximo 3 10` devuelve `10`.
3. `maximo 8 10` devuelve `10`.
4. Resultado final: `10`.

### Conceptos utilizados

**Función pura:**
La función siempre devuelve el mismo resultado para los mismos datos de entrada y no produce efectos secundarios.

**Reutilización de funciones:**
La solución aprovecha la función `maximo` para evitar repetir la lógica de comparación.

**Descomposición del problema:**
El cálculo se divide en comparaciones más pequeñas y fáciles de resolver, obteniendo primero máximos parciales y luego el máximo definitivo.

**Composición de funciones:**
El resultado de una llamada a `maximo` se utiliza como argumento de otra llamada, construyendo la solución de manera gradual.

**Tipado estático:**
La firma `Int -> Int -> Int -> Int -> Int` indica que la función recibe cuatro enteros y devuelve un entero.

**Currificación:**
Los parámetros se reciben de forma separada, siguiendo el modelo de funciones currificadas propio de Haskell.


## Ejercicio 10 – max4 (Forma 2)

```haskell
maximo :: Int -> Int -> Int
maximo x y =
    if x > y
       then x
       else y

max4b :: Int -> Int -> Int -> Int -> Int
max4b a b c d = maximo a (maximo b (maximo c d))
```

La función recibe cuatro números enteros y devuelve el mayor de ellos. Al igual que la primera solución, utiliza la función `maximo`, pero organiza las comparaciones de manera diferente.

La evaluación comienza comparando los dos últimos números. El resultado se compara con el tercer número, luego con el segundo y finalmente con el primero. De esta manera se va propagando el valor máximo hacia el exterior de la expresión hasta obtener el resultado final.

Por ejemplo: `max4b 5 8 3 10`


1. `maximo 3 10` devuelve `10`.
2. `maximo 8 10` devuelve `10`.
3. `maximo 5 10` devuelve `10`.
4. Resultado final: `10`.

### Conceptos utilizados

**Función pura:**
La función siempre produce el mismo resultado para los mismos parámetros de entrada y no genera efectos secundarios.

**Reutilización de funciones:**
Se utiliza nuevamente la función `maximo` para resolver un problema más complejo sin duplicar código.

**Composición de funciones:**
Las llamadas a `maximo` se encuentran anidadas, utilizando el resultado de una comparación como entrada de la siguiente.

**Evaluación de expresiones:**
La solución demuestra cómo una expresión puede construirse a partir de varias aplicaciones sucesivas de una misma función.

**Tipado estático:**
La firma `Int -> Int -> Int -> Int -> Int` establece que la función recibe cuatro enteros y devuelve un entero.

**Currificación:**
La función recibe sus argumentos de manera separada, siguiendo el modelo funcional de Haskell.

### Conclusión

Ambas tienen la misma funcionalidad y complejidad. La primera resulta más visual porque divide los cuatro números en dos pares y luego compara los resultados, mientras que la segunda utiliza comparaciones anidadas de forma secuencial. La elección depende principalmente de la legibilidad que se busque en el código.


## Ejercicio 12 – ordenar3

```haskell
ordenar3 :: Int -> Int -> Int -> (Int, Int, Int)
ordenar3 a b c
a <= b && b <= c = (a,b,c)
a <= c && c <= b = (a,c,b)
b <= a && a <= c = (b,a,c)
b <= c && c <= a = (b,c,a)
c <= a && a <= b = (c,a,b)
otherwise = (c,b,a)
```

La función recibe tres números enteros y devuelve una tupla con esos mismos valores ordenados de menor a mayor.

La solución utiliza guardas para evaluar todas las posibles posiciones relativas entre los tres números. Cada condición representa una forma distinta en que pueden estar ordenados los valores de entrada. Cuando una condición se cumple, la función devuelve una tupla con los números acomodados en orden ascendente.

Por ejemplo: ordenar3 8 3 5

La condición: `b <= c && c <= a` es verdadera, ya que: `3 <= 5 && 5 <= 8`

Por lo tanto, la función devuelve: `(3,5,8)`

### Conceptos utilizados

**Función pura:**
La función siempre devuelve la misma tupla para los mismos valores de entrada y no produce efectos secundarios.

**Guardas (Guards):**
Permiten expresar de manera clara cada uno de los posibles casos de ordenamiento. Cada guarda representa una disposición distinta de los tres números.

**Comparación de valores:**
Se utilizan los operadores `<=` para determinar la relación de orden entre los números y decidir cómo deben ubicarse en la tupla resultado.

**Operadores lógicos:**
El operador `&&` permite combinar varias condiciones que deben cumplirse simultáneamente para identificar correctamente cada caso.

**Tipado estático:**
La firma `(Int -> Int -> Int -> (Int, Int, Int))` indica que la función recibe tres números enteros y devuelve una tupla compuesta por tres enteros.

**Tuplas:**
El resultado se representa mediante una tupla de tres elementos, que permite devolver los números ordenados en una única estructura de datos.

**Resolución por casos:**
El problema se resuelve analizando todas las posibles relaciones de orden entre los elementos y seleccionando la salida adecuada para cada situación.


## Ejercicio 14 – Funciones booleanas (Not, And, Or y Xor)
```haskell
miNot :: Bool -> Bool
miNot True = False
miNot False = True

miAnd :: Bool -> Bool -> Bool
miAnd True True = True
miAnd _ _ = False

miOr :: Bool -> Bool -> Bool
miOr False False = False
miOr _ _ = True

miXor :: Bool -> Bool -> Bool
miXor True False = True
miXor False True = True
miXor _ _ = False


miAnd2 :: Bool -> Bool -> Bool
miAnd2 x y =
    if x == True && y == True
       then True
       else False
```

Se implementaron las funciones booleanas básicas `Not`, `And`, `Or` y `Xor` sin utilizar las versiones predefinidas de Haskell. Además, se realizó una comparación entre dos implementaciones de la función `And`: una utilizando *Pattern Matching* y otra utilizando una expresión condicional tradicional.

* `miNot` invierte el valor lógico recibido.
* `miAnd` devuelve `True` únicamente cuando ambos operandos son `True`.
* `miOr` devuelve `False` únicamente cuando ambos operandos son `False`.
* `miXor` devuelve `True` cuando los operandos son distintos entre sí.

Para comparar enfoques, se implementó también `miAnd2`, que utiliza una expresión `if-then-else` para evaluar la condición lógica.

### Conceptos utilizados

**Función pura:**
Todas las funciones reciben valores booleanos y devuelven un resultado sin modificar ningún estado externo. Para una misma entrada siempre producen la misma salida.

**Pattern Matching:**
Permite definir directamente el resultado para determinados valores de entrada. En este ejercicio se utiliza para describir las tablas de verdad de cada operación lógica de forma declarativa y sencilla.

**Expresiones condicionales (if-then-else):**
La función `miAnd2` utiliza una condición explícita para decidir qué valor devolver según los parámetros recibidos.

**Comparación de valores:**
En `miAnd2` se emplea el operador `==` para verificar si ambos parámetros son `True`.

**Tipado estático:**
Las firmas de tipo indican que las funciones trabajan exclusivamente con valores booleanos (`Bool`) y devuelven también resultados booleanos. Haskell verifica estos tipos durante la compilación.

**Operadores lógicos:**
La implementación tradicional de `miAnd2` utiliza el operador lógico `&&` para combinar dos condiciones booleanas.

### Comparación entre Pattern Matching e implementación tradicional

La función `miAnd` utiliza *Pattern Matching*, mientras que `miAnd2` utiliza una expresión `if-then-else`.
```haskell
miAnd True True = True
miAnd _ _ = False

miAnd2 x y =
    if x == True && y == True
       then True
       else False
```
El uso de *Pattern Matching* resulta más simple y legible, ya que permite describir directamente los casos posibles sin necesidad de escribir condiciones adicionales. Además, el código es más declarativo, ya que se especifica qué resultado corresponde a cada patrón de entrada.

Por otro lado, la versión tradicional puede resultar más familiar para quienes provienen de lenguajes imperativos, aunque suele requerir expresiones más extensas para resolver el mismo problema.

## Ejercicio 14 – Funciones booleanas (Not, And, Or y Xor)

```haskell
miNot :: Bool -> Bool
miNot True = False
miNot False = True

miAnd :: Bool -> Bool -> Bool
miAnd True True = True
miAnd _ _ = False

miOr :: Bool -> Bool -> Bool
miOr False False = False
miOr _ _ = True

miXor :: Bool -> Bool -> Bool
miXor True False = True
miXor False True = True
miXor _ _ = False


miAnd2 :: Bool -> Bool -> Bool
miAnd2 x y =
    if x == True && y == True
       then True
       else False
```

Se implementaron las funciones booleanas básicas `Not`, `And`, `Or` y `Xor` sin utilizar las versiones predefinidas de Haskell. Además, se realizó una comparación entre dos implementaciones de la función `And`: una utilizando *Pattern Matching* y otra utilizando una expresión condicional tradicional.

Las funciones fueron implementadas utilizando *Pattern Matching*, definiendo explícitamente los casos posibles para cada operación lógica.

* `miNot` invierte el valor lógico recibido.
* `miAnd` devuelve `True` únicamente cuando ambos operandos son `True`.
* `miOr` devuelve `False` únicamente cuando ambos operandos son `False`.
* `miXor` devuelve `True` cuando los operandos son distintos entre sí.

Para comparar enfoques, se implementó también `miAnd2`, que utiliza una expresión `if-then-else` para evaluar la condición lógica.

### Conceptos utilizados

**Función pura:**
Todas las funciones reciben valores booleanos y devuelven un resultado sin modificar ningún estado externo. Para una misma entrada siempre producen la misma salida.

**Pattern Matching:**
Permite definir directamente el resultado para determinados valores de entrada. En este ejercicio se utiliza para describir las tablas de verdad de cada operación lógica de forma declarativa y sencilla.

**Expresiones condicionales (if-then-else):**
La función `miAnd2` utiliza una condición explícita para decidir qué valor devolver según los parámetros recibidos.

**Comparación de valores:**
En `miAnd2` se emplea el operador `==` para verificar si ambos parámetros son `True`.

**Tipado estático:**
Las firmas de tipo indican que las funciones trabajan exclusivamente con valores booleanos (`Bool`) y devuelven también resultados booleanos. Haskell verifica estos tipos durante la compilación.

**Operadores lógicos:**
La implementación tradicional de `miAnd2` utiliza el operador lógico `&&` para combinar dos condiciones booleanas.

### Comparación entre Pattern Matching e implementación tradicional

La función `miAnd` utiliza *Pattern Matching*, mientras que `miAnd2` utiliza una expresión `if-then-else`.

```haskell
miAnd True True = True
miAnd _ _ = False
```

```haskell
miAnd2 x y =
    if x == True && y == True
       then True
       else False
```

El uso de *Pattern Matching* resulta más simple y legible, ya que permite describir directamente los casos posibles sin necesidad de escribir condiciones adicionales. Además, el código es más declarativo, ya que se especifica qué resultado corresponde a cada patrón de entrada.

Por otro lado, la versión tradicional puede resultar más familiar para quienes provienen de lenguajes imperativos, aunque suele requerir expresiones más extensas para resolver el mismo problema.

### Conclusión
El Pattern Matching es una herramienta muy utilizada en programación funcional porque permite expresar los distintos casos de un problema de forma directa. En este ejercicio, las tablas de verdad pueden representarse casi literalmente mediante patrones, haciendo que el código sea más legible y declarativo que una solución basada en múltiples condiciones.

## Ejercicio 15 – par e impar

```haskell
par :: Int -> Bool
par 0 = True
par n = impar (n - 1)

impar :: Int -> Bool
impar 0 = False
impar n = par (n - 1)
```

Las funciones `par` e `impar` determinan si un número entero es par o impar. La solución utiliza recursión mutua, es decir, ambas funciones colaboran entre sí para resolver el problema.

La función `par` considera que el caso base es `0`, ya que cero es un número par. Si el número es distinto de cero, delega la evaluación en la función `impar` utilizando el valor anterior. De forma similar, la función `impar` considera que `0` no es impar y, para cualquier otro valor, delega la evaluación en `par`.

En cada llamada recursiva el número disminuye en una unidad hasta alcanzar el caso base.

Por ejemplo:

```haskell
par 4
→ impar 3
→ par 2
→ impar 1
→ par 0
→ True
```

### Conceptos utilizados

**Función pura:**
Las funciones siempre producen el mismo resultado para una misma entrada y no generan efectos secundarios.

**Pattern Matching:**
Se utiliza para definir los casos base (`par 0` e `impar 0`) de forma directa y legible.

**Recursión mutua (indirecta):**
La función `par` llama a `impar` y la función `impar` llama a `par`. Ninguna de las dos resuelve completamente el problema por sí sola.

**Caso base:**
El valor `0` permite finalizar la recursión y evita llamadas infinitas.

**Tipado estático:**
Las firmas indican que ambas funciones reciben un entero y devuelven un valor booleano (`Bool`).

### Tipo de ejercicio

Recursión mutua o indirecta.


## Ejercicio 16 – fibonacci

### Código

```haskell
fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)
```

### Descripción

La función calcula el término correspondiente de la sucesión de Fibonacci. Esta sucesión se caracteriza porque cada número se obtiene sumando los dos términos anteriores.

### Cómo lo resuelve

Se definen dos casos base:

```haskell
fibonacci 0 = 0
fibonacci 1 = 1
```

Para cualquier otro valor, la función calcula recursivamente los dos términos anteriores y suma sus resultados.

Por ejemplo:

```haskell
fibonacci 4
→ fibonacci 3 + fibonacci 2
→ (fibonacci 2 + fibonacci 1) + (fibonacci 1 + fibonacci 0)
→ (1 + 1) + (1 + 0)
→ 3
```

### Conceptos utilizados

**Función pura:**
La función siempre devuelve el mismo resultado para un mismo valor de entrada y no produce efectos secundarios.

**Pattern Matching:**
Se utiliza para definir los casos base de la sucesión (`0` y `1`).

**Recursión explícita:**
La función se llama a sí misma para calcular términos anteriores de la sucesión hasta alcanzar los casos base.

**Caso base:**
Los valores `0` y `1` permiten detener la recursión y construir el resto de los resultados.

**Tipado estático:**
La firma `Int -> Int` indica que la función recibe un entero y devuelve un entero.

### Tipo de ejercicio

Recursión explícita.

## Ejercicio 17 – factorial

### Código

```haskell
factorial :: Int -> Int
factorial n = factorialAux n 1

factorialAux :: Int -> Int -> Int
factorialAux 0 acc = acc
factorialAux n acc = factorialAux (n - 1) (n * acc)
```

### Descripción

La función calcula el factorial de un número entero positivo. El factorial de un número `n` se obtiene multiplicando todos los enteros positivos desde `1` hasta `n`.

### Cómo lo resuelve

La solución utiliza una función auxiliar llamada `factorialAux` que incorpora un parámetro acumulador (`acc`).

El acumulador almacena el resultado parcial de las multiplicaciones realizadas. En cada llamada recursiva el número disminuye en una unidad y el acumulador se actualiza multiplicándolo por el valor actual de `n`.

Cuando `n` llega a `0`, el acumulador contiene el resultado final y se devuelve como respuesta.

Por ejemplo:

```haskell
factorial 4
→ factorialAux 4 1
→ factorialAux 3 4
→ factorialAux 2 12
→ factorialAux 1 24
→ factorialAux 0 24
→ 24
```

### Conceptos utilizados

**Función pura:**
La función siempre devuelve el mismo resultado para una misma entrada y no genera efectos secundarios.

**Recursión explícita:**
La función auxiliar se llama a sí misma reduciendo progresivamente el problema hasta alcanzar el caso base.

**Recursión de cola:**
La llamada recursiva es la última operación que realiza la función. No quedan cálculos pendientes luego del retorno de la llamada.

**Acumulador:**
El parámetro `acc` almacena los resultados parciales de las multiplicaciones y permite implementar la recursión de cola.

**Caso base:**
Cuando `n` vale `0`, el acumulador contiene el factorial completo y se devuelve como resultado.

**Tipado estático:**
Las firmas de tipo indican claramente qué datos reciben y qué datos devuelven ambas funciones.

### Tipo de ejercicio

Recursión explícita con acumulador y recursión de cola.
