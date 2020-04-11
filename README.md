# Viagens
App de viagens

Aplicativo que simula um site de venda de pacotes de viagens que seja visualmente coerente entre diversos aparelhos Apple.

1- Tela principal com uma tabela com células modificadas, com 3 label's e uma Imagem. Tudo foi feito via AutoLayout nessa tela.

2 - Há uma tela de pacotes trabalhando com CollectionView, que organiza todos os elementos, e uma TabBar, para navegar entre uma tela e outra.
-> Dentro da tela de pacotes há uma searchBar habilitada que permite a pesquisa de qualquer um dos elementros presentes na Collection.

3- Há uma tela de detalhes, ela é apresentada na seleção de qualquer elemento da Collection.
-> Dentro da tela há elementos empilhados via StackView, horizontal e vertical.
-> Teclado modificado para cada tipo de entrada.
-> Tudo está dentro de um ScrollView, que tem seu tamanho aumentado quando o teclado é ativado. O aumento é exatamente igual a propriedade de altura do teclado.

4- Há uma tela de confirmação do pacote selecionado que é disparada após a finalização da tela 3 e é possível retornar a tela de busca de pacotes.
