## Ejercicio 3.a – long

### Consigna

Definir la función `long`, que devuelve la cantidad de elementos que contiene una lista.

### Código

```haskell
long :: [a] -> Int
long [] = 0
long (_:xs) = 1 + long xs
```

La función `long` recibe una lista de cualquier tipo de elementos y devuelve la cantidad total de elementos que contiene. Para ello recorre la lista de forma recursiva, contando un elemento en cada llamada hasta llegar al final.

### Cómo lo resuelve

Uiliza **Pattern Matching** para distinguir dos casos:

* Si la lista está vacía (`[]`), significa que no quedan elementos por contar, por lo que devuelve `0`.
* Si la lista tiene al menos un elemento (`_:xs`), suma `1` al resultado de calcular la longitud del resto de la lista (`xs`).

En cada llamada recursiva la lista se hace más pequeña, eliminando su primer elemento, hasta alcanzar el caso base.

Por ejemplo:

```haskell
long [4,8,2]
→ 1 + long [8,2]
→ 1 + (1 + long [2])
→ 1 + (1 + (1 + long []))
→ 1 + (1 + (1 + 0))
→ 3
```

### Conceptos utilizados

**Recursión explícita:**
La función se llama a sí misma para calcular la longitud del resto de la lista hasta llegar al caso base.

**Caso base:**
Cuando la lista está vacía (`[]`), la función devuelve `0`, indicando que no quedan elementos por contar.

**Listas genéricas (Polimorfismo):**
La firma `[a] -> Int` indica que la función puede trabajar con listas de cualquier tipo de dato. El tipo `a` representa un tipo genérico.

**Tipado estático:**
La firma de la función indica que recibe una lista de cualquier tipo y devuelve un número entero. Haskell verifica estos tipos durante la compilación.

### Tipo de ejercicio

Recursión explícita sobre listas.


# Ejercicio 3.c – member

## Código

```haskell
member :: Int -> [Int] -> Bool
member _ [] = False
member n (x:xs)
    | n == x    = True
    | otherwise = member n xs
```

La función recibe un número entero y una lista de enteros, y determina si el número pertenece o no a la lista. Devuelve `True` si encuentra el elemento y `False` en caso contrario. La función utiliza **Pattern Matching** para distinguir dos casos. Si la lista está vacía (`[]`), significa que el elemento no fue encontrado y devuelve `False`. Si la lista contiene elementos (`x:xs`), compara el primer elemento con el valor buscado. Si ambos son iguales, devuelve `True`; de lo contrario, continúa la búsqueda de forma recursiva sobre el resto de la lista hasta encontrar el elemento o llegar al final.

## Conceptos utilizados

**Función pura:**  
La función siempre devuelve el mismo resultado para una misma entrada y no produce efectos secundarios.

**Pattern Matching sobre listas:**  
Permite distinguir entre una lista vacía (`[]`) y una lista con elementos (`x:xs`), facilitando el tratamiento de cada caso.

**Recursión explícita:**  
La función se llama a sí misma recorriendo la lista elemento por elemento hasta encontrar el valor buscado o alcanzar el caso base.

**Caso base:**  
Cuando la lista está vacía, la búsqueda finaliza y la función devuelve `False`.

**Guardas (Guards):**  
Se utilizan para comprobar si el elemento actual de la lista coincide con el valor buscado.

**Comparación de valores:**  
Se emplea el operador `==` para verificar si el elemento actual es igual al valor que se desea encontrar.

**Tipado estático:**  
La firma `Int -> [Int] -> Bool` indica que la función recibe un entero y una lista de enteros, y devuelve un valor booleano.

## Tipo de ejercicio

Recursión explícita sobre listas.


# Ejercicio 3.g – rev

## Código

```haskell
append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys

rev :: [a] -> [a]
rev [] = []
rev (x:xs) = append (rev xs) [x]
```

La función `rev` recibe una lista de cualquier tipo de elementos y devuelve una nueva lista con los elementos en orden inverso. Para ello utiliza la función `append`, que concatena dos listas. La función utiliza **Pattern Matching** para distinguir dos casos. Si la lista está vacía (`[]`), devuelve una lista vacía. Si la lista contiene elementos (`x:xs`), primero invierte recursivamente el resto de la lista (`xs`) y luego agrega el primer elemento (`x`) al final utilizando la función `append`. De esta forma, cada elemento va cambiando su posición hasta obtener la lista invertida.

## Conceptos utilizados

**Función pura:**  
La función siempre devuelve la misma lista invertida para una misma lista de entrada y no produce efectos secundarios.

**Pattern Matching sobre listas:**  
Permite distinguir entre una lista vacía (`[]`) y una lista con elementos (`x:xs`), facilitando el tratamiento de cada caso.

**Recursión explícita:**  
La función se llama a sí misma sobre el resto de la lista hasta alcanzar el caso base.

**Caso base:**  
Cuando la lista está vacía, la función devuelve una lista vacía, finalizando la recursión.

**Polimorfismo:**  
La firma `[a] -> [a]` indica que la función puede trabajar con listas de cualquier tipo de dato.

**Reutilización de funciones:**  
La solución aprovecha la función `append` para agregar el elemento actual al final de la lista ya invertida, evitando reimplementar la lógica de concatenación.

**Tipado estático:**  
Las firmas de tipo indican que `append` y `rev` trabajan con listas genéricas, manteniendo el mismo tipo de elementos durante toda la operación.

## Tipo de ejercicio

Recursión explícita sobre listas.

# Ejercicio 5 – capicua

## Código

```haskell
append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys

rev :: [a] -> [a]
rev [] = []
rev (x:xs) = append (rev xs) [x]

capicua :: Eq a => [a] -> Bool
capicua xs = xs == rev xs
```

La función `capicua` determina si una lista es capicúa, es decir, si se lee de la misma forma de izquierda a derecha que de derecha a izquierda. Devuelve `True` si la lista cumple esta condición y `False` en caso contrario. La solución reutiliza la función `rev`, que invierte el orden de los elementos de una lista. Luego compara la lista original con su versión invertida mediante el operador de igualdad (`==`). Si ambas listas son iguales, significa que la lista es capicúa; de lo contrario, no lo es.

## Conceptos utilizados

**Función pura:**  
La función siempre devuelve el mismo resultado para una misma lista de entrada y no produce efectos secundarios.

**Composición de funciones:**  
La solución reutiliza la función `rev` para invertir la lista y luego compara el resultado con la lista original, evitando duplicar lógica.

**Comparación de valores:**  
Se utiliza el operador `==` para verificar si la lista original y la lista invertida contienen los mismos elementos en el mismo orden.

**Polimorfismo:**  
La firma `Eq a => [a] -> Bool` indica que la función puede trabajar con listas de cualquier tipo, siempre que sus elementos puedan compararse por igualdad.

**Restricción de tipos (Eq):**  
La clase de tipos `Eq` garantiza que los elementos de la lista implementan el operador `==`, requisito necesario para poder comparar ambas listas.

**Tipado estático:**  
La firma de tipo especifica que la función recibe una lista genérica y devuelve un valor booleano, verificando los tipos durante la compilación.

## Tipo de ejercicio

Composición y reutilización de funciones sobre listas.

# Definición de Tipos - Ejercicio 5

## Código

```haskell
f (x,y,z) = ((x,y),z)
```

## Tipo

```haskell
f :: (a, b, c) -> ((a, b), c)
```

La función recibe una tupla de tres elementos y devuelve una nueva tupla donde los dos primeros elementos quedan agrupados en una subtupla, mientras que el tercer elemento permanece separado.

## Cómo se determina el tipo

La entrada es una tupla formada por tres elementos, cuyos tipos pueden ser distintos, representados por `a`, `b` y `c`.

El resultado es una nueva estructura compuesta por una tupla que contiene los dos primeros elementos `(a, b)` y el tercer elemento `c`.

Como la función únicamente reorganiza la estructura de la tupla y no realiza operaciones sobre sus elementos, no es necesario imponer restricciones sobre los tipos.

## Conceptos utilizados

**Polimorfismo:**  
La función puede trabajar con cualquier tipo de datos, ya que no realiza operaciones específicas sobre ellos.

**Tuplas:**  
Tanto el parámetro como el resultado son tuplas. La función modifica únicamente la organización de sus componentes.

**Tipado estático:**  
Haskell infiere el tipo más general de la función durante la compilación.

## Tipo de ejercicio

Inferencia de tipos.

# Definición de Tipos - Ejercicio 7

## Código

```haskell
f (x,y,z) = if x then y else z
```

## Tipo

```haskell
f :: (Bool, a, a) -> a
```

La función recibe una tupla compuesta por un valor booleano y dos valores del mismo tipo. Si el primer elemento de la tupla es `True`, devuelve el segundo elemento; en caso contrario, devuelve el tercero.

## Cómo se determina el tipo

El primer elemento de la tupla (`x`) se utiliza como condición de la expresión `if`, por lo que necesariamente debe ser de tipo `Bool`.

Las expresiones `then y` y `else z` deben devolver el mismo tipo, ya que una expresión `if` siempre produce un único resultado. Por este motivo, `y` y `z` deben pertenecer al mismo tipo, representado por `a`.

Finalmente, la función devuelve el valor obtenido de la expresión `if`, por lo que el tipo de retorno también es `a`.

## Conceptos utilizados

**Polimorfismo:**  
La función puede trabajar con cualquier tipo de dato para `y` y `z`, siempre que ambos sean del mismo tipo.

**Expresión condicional (`if-then-else`):**  
La condición debe ser de tipo `Bool`, y ambas ramas (`then` y `else`) deben devolver un valor del mismo tipo.

**Tuplas:**  
La función recibe una tupla de tres elementos y utiliza cada uno con un propósito diferente: el primero como condición y los otros dos como posibles resultados.

**Tipado estático:**  
Haskell infiere que el primer elemento debe ser un `Bool` y que los otros dos deben compartir el mismo tipo para que la función sea válida.

## Tipo de ejercicio

Inferencia de tipos.

# Currificación - Ejercicio a)

## Consigna

Definir, siempre que sea posible, una versión currificada para la siguiente definición de tipo:

```haskell
f1 :: (Float, Char, String) -> String
```

## Versión currificada

```haskell
f1 :: Float -> Char -> String -> String
```

La función original recibe una única tupla compuesta por un `Float`, un `Char` y un `String`, y devuelve un `String`.

Al currificarla, la tupla se reemplaza por una secuencia de parámetros individuales. El resultado es una función que recibe un argumento por vez hasta completar todos los parámetros necesarios.

## Cómo se obtiene

El tipo original:

```haskell
(Float, Char, String) -> String
```

indica que la función recibe **un solo parámetro**, que es una tupla de tres elementos. Al currificarla, cada componente de la tupla pasa a convertirse en un parámetro independiente:

```haskell
Float -> Char -> String -> String
```

De esta forma, la función puede aplicarse parcialmente, una de las principales características de Haskell.

## Conceptos utilizados

**Currificación:**  
Consiste en transformar una función que recibe una tupla de argumentos en otra que recibe los argumentos de manera individual.

**Aplicación parcial:**  
Una función currificada puede recibir solo algunos de sus parámetros y devolver una nueva función esperando los restantes.

**Tipado estático:**  
Haskell verifica durante la compilación que cada argumento recibido corresponda con el tipo declarado.

## Tipo de ejercicio

Transformación de tipos mediante currificación.



# Alto Orden y Esquemas de Recursión - Ejercicio 1.a (genLista)

## Consigna

Definir la función `genLista`, que genera una lista de una cantidad dada de elementos, a partir de un elemento inicial y de una función de incremento entre los elementos de la lista. Dicha función de incremento, dado un elemento de la lista, devuelve el elemento siguiente.

## Código

```haskell
genLista :: Int -> a -> (a -> a) -> [a]
genLista 0 _ _ = []
genLista n x f = x : genLista (n - 1) (f x) f
```

La función `genLista` genera una lista de longitud determinada a partir de un valor inicial y de una función que indica cómo obtener el siguiente elemento. Esto permite construir listas de cualquier tipo, siempre que exista una función capaz de generar el siguiente valor. La función utiliza **Pattern Matching** para distinguir dos casos. Si la cantidad de elementos a generar es `0`, devuelve una lista vacía. En caso contrario, agrega el elemento actual al comienzo de la lista utilizando el operador `(:)` y realiza una llamada recursiva disminuyendo la cantidad de elementos restantes. Antes de la llamada recursiva, aplica la función recibida (`f`) al elemento actual para obtener el siguiente valor de la secuencia.

Por ejemplo:

```haskell
genLista 5 1 (+1)
```

genera la lista:

```haskell
[1,2,3,4,5]
```

## Conceptos utilizados

**Función pura:**  
La función siempre genera la misma lista para los mismos parámetros de entrada y no produce efectos secundarios.

**Función de orden superior:**  
Recibe como parámetro otra función (`a -> a`), la cual utiliza para calcular el siguiente elemento de la lista.

**Pattern Matching:**  
Permite distinguir el caso base (`0`) del caso recursivo.

**Recursión explícita:**  
La función se llama a sí misma disminuyendo la cantidad de elementos pendientes de generar.

**Caso base:**  
Cuando la cantidad de elementos es `0`, la función devuelve una lista vacía.

**Polimorfismo:**  
La firma `a` indica que la función puede generar listas de cualquier tipo de dato.

**Tipado estático:**  
La firma especifica que la función recibe un entero, un elemento de cualquier tipo y una función de transformación, devolviendo una lista del mismo tipo.

## Tipo de ejercicio

Función de orden superior con recursión explícita.

# Alto Orden y Esquemas de Recursión - Ejercicio 1.b (dh)

## Consigna

Usando `genLista`, definir la función `dh`, que dado un par de números (el primero menor que el segundo), devuelve una lista de números consecutivos desde el primero hasta el segundo.

## Código

```haskell
genLista :: Int -> a -> (a -> a) -> [a]
genLista 0 _ _ = []
genLista n x f = x : genLista (n - 1) (f x) f

dh :: Int -> Int -> [Int]
dh a b = genLista (b - a + 1) a (+1)
```

La función `dh` genera una lista de números consecutivos comprendidos entre dos valores enteros, incluyendo ambos extremos. Para ello reutiliza la función `genLista`, indicando cuántos elementos debe generar, cuál es el valor inicial y cómo obtener cada elemento siguiente. La cantidad de elementos que debe contener la lista se calcula mediante la expresión `b - a + 1`. El valor inicial corresponde al primer número (`a`) y la función de incremento utilizada es `(+1)`, que aumenta el valor en una unidad en cada paso.

De esta manera, `genLista` construye automáticamente la secuencia completa.

Por ejemplo:

```haskell
dh 3 7
```

genera la lista:

```haskell
[3,4,5,6,7]
```

## Conceptos utilizados

**Función pura:**  
La función siempre genera la misma lista para los mismos valores de entrada y no produce efectos secundarios.

**Reutilización de funciones:**  
La solución aprovecha la función `genLista`, evitando implementar nuevamente la lógica de generación de listas.

**Función de orden superior:**  
Aunque `dh` no recibe funciones como parámetros, utiliza una función de orden superior (`genLista`) pasándole la función `(+1)` como argumento.

**Aplicación parcial:**  
La expresión `(+1)` representa una función parcialmente aplicada que recibe un número y devuelve su sucesor.

**Tipado estático:**  
La firma `Int -> Int -> [Int]` indica que la función recibe dos enteros y devuelve una lista de enteros.

## Tipo de ejercicio

Reutilización de una función de orden superior.

# Alto Orden y Esquemas de Recursión - Ejercicio 2.a (mapo)

## Consigna

Definir la función `mapo`, una versión de `map` que toma una función de dos argumentos y una lista de pares de valores, y devuelve la lista de aplicaciones de la función a cada par.

## Código

```haskell
mapo :: (a -> b -> c) -> [(a, b)] -> [c]
mapo _ [] = []
mapo f ((x,y):xs) = f x y : mapo f xs
```

La función `mapo` recibe una función de dos argumentos y una lista de pares de valores. Aplica la función a cada par de la lista y devuelve una nueva lista con los resultados obtenidos. La función utiliza **Pattern Matching** para distinguir dos casos. Si la lista está vacía (`[]`), devuelve una lista vacía. Si la lista contiene al menos un par (`(x,y):xs`), aplica la función `f` a los elementos del primer par (`x` e `y`) y agrega el resultado al comienzo de la nueva lista mediante el operador `(:)`. Luego continúa recursivamente con el resto de la lista.

Por ejemplo:

```haskell
mapo (+) [(1,2), (3,4), (5,6)]
```

produce:

```haskell
[3,7,11]
```

## Conceptos utilizados

**Función pura:**  
La función siempre devuelve la misma lista de resultados para los mismos parámetros de entrada y no produce efectos secundarios.

**Función de orden superior:**  
Recibe otra función como parámetro (`f`) y la aplica sobre cada elemento de la lista.

**Pattern Matching:**  
Permite distinguir entre una lista vacía y una lista con elementos, además de descomponer cada elemento en un par `(x,y)`.

**Recursión explícita:**  
La función se llama a sí misma para procesar el resto de la lista hasta alcanzar el caso base.

**Caso base:**  
Cuando la lista está vacía, la función devuelve una lista vacía.

**Polimorfismo:**  
La firma utiliza tipos genéricos (`a`, `b` y `c`), permitiendo trabajar con distintos tipos de datos.

**Tipado estático:**  
La firma `(a -> b -> c) -> [(a, b)] -> [c]` especifica que la función recibe una función de dos argumentos y una lista de pares, devolviendo una lista con los resultados de aplicar dicha función.

## Tipo de ejercicio

Función de orden superior con recursión explícita sobre listas.