Functors

Definição: são funções que fazem com que as funções de um certo tipo sejam aplicáveis a um tipo paramétrico(tipo de polimorfismo) contendo esse tipo e é definido por:

class Functor f where  
    fmap :: (a -> b) -> f a -> f b  
fmap é uma função de primeira ordem e (a -> b) representa a função de transformação que será aplicada à cada elemento de f a. O resultado final será um novo Functor, representado por f b.
A primeira linha deste código indica que será possível executar a função fmap em qualquer tipo que seja uma instância de Functor.


Exemplos:

Podemos fazer um fmap em uma lista, executando uma função de transformação para cada elemento. Como resultado temos uma lista de mesmo tamanho, mas podendo conter elementos de algum outro tipo ou do mesmo tipo mas com outros valores, ou até mesmo uma lista igual à inicial.
Como toda função de primeira ordem, a função que passamos como argumento para o fmap pode ser nomeada (que tenha sido declarada anteriormente) ou uma expressão lambda (também conhecida como função anônima).


Fmap com função lambda:
Se quisermos somar 1 à todos os elementos de uma lista de números, podemos escrever o seguinte código em Haskell:
fmap (\n -> n + 1) [1, 2, 3, 4] 
Para definir uma expressão lambda nesta linguagem, utilizamos o caractere \ (que lembra um pouco o letra lambda do alfabeto grego: λ).
No trecho (\n -> n + 1) estamos definindo uma expressão lambda com um parâmetro numérico n, que irá retornar n + 1. Esta função será executada para cada elemento da lista e uma nova lista será criada ao final dessas execuções.
Desta forma o resultado deste fmap será:
[2, 3, 4, 5]



Voltando para a definição, neste exemplo:
    • f é um Functor do tipo Lista, que em Haskell é representando pelo símbolo [ ]. 
    • a neste caso é um Num, representando o tipo dos elementos contidos na lista de entrada. 
    • b também é um Num, representando o tipo dos elementos da lista que será retornada. 
    • (a -> b) é uma função de transformação, que irá receber um elemento do tipo a e retornar um elemento do tipo b. Neste caso, irá receber um número a e retornar um outro número b. 
Em Haskell Num é uma Type class que representa os tipos numéricos.
Neste exemplo, a e b são da mesma classe, mas poderíamos ter como resultado uma lista com elementos de outra classe.


Alterando o tipo da variáveis da lista:
Se quiséssemos por exemplo transformar uma lista de números em uma lista de strings (que no Haskell é representado por um array de char), poderíamos escrever o seguinte código:
fmap (\n -> show n) [10, 11, 12, 13] 

Onde show é uma função capaz de transformar um número em um array de caracteres. 
Em nosso código acima, fmap irá primeiro executar a função show passando o primeiro elemento da lista como argumento, que irá retornar o valor "1".

Em seguida percorrerá os demais elementos da lista e, um por um, irá executar a função show, passando um elemento da lista por vez. Conforme esta operação é realizada, o resultado de cada executação é armazenado em uma nova lista.
Após percorrer por todos os elementos e terminar de criar a lista com o resultado de todas as operações, fmap irá retornar uma nova lista contendo:
["10", "11", "12", "13"]

Dizemos que fmap é uma função de tansformação. Mas, embora seja possível mudar o tipo dos elementos contidos dentro do Functor (neste caso, a Lista), através do fmap não é possível mudar o tipo do Functor e nem seu tamanho. Ou seja, dada uma lista com 4 elementos, o fmap sempre retornará uma lista contendo 4 elementos.
Voltando mais uma vez para definição:
class Functor f where  
    fmap :: (a -> b) -> f a -> f b  
Note que a entrada é f a e a saída é f b. Ou seja, o tipo do Functor, representado pela letra f

Utilizado fmap com uma função nomeada:

Podemos utilizar uma função já existente e passa-lá com argumento para o fmap.
No exemplo abaixo definimos uma função chamada soma1 e em seguida a passamos como argumento para o fmap:
soma1 n = n + 1

fmap soma1 [1, 2, 3, 4] 
E o resultado será igual ao obtido quando utilizamos uma expressão lambda:
[2, 3, 4, 5]

Este mecanismo é útil em 2 situações:
    • Quando a função é muito complexa, para facilitar o entendimento do código ou; 
    • Quando queremos re-aproveitar uma função pré-existente. 


Fonte: https://dev.to/marciofrayze/functors-58le, https://haskell.pesquisa.ufabc.edu.br/haskell/09.functors/