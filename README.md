Este é um Repositório dedicado para a disciplina de Laboratório de Arquitetura de Sistemas Digitais, onde volta-se atenção para o projeto final da disciplina. 
Nesse caso foi escolhido adicionar suporte às seguintes novas instruções ao processador de ciclo único: JAL, JR, ANDI, ORI e SRL. Todas as alterações foram feitas a partir
do processador resultante da sprint 8.

A primeira a ser adicionada foi a instrução JAL, que deve salvar em ra o valor de PC+4 e saltar para o label, fazendo PC + Imm,
para isso foi necessário adicionar a extensão de imediato do tipo J, nesse caso o MUX de seleção do imediato ja possuía
um espaço disponível. Também acrescenta-se a possibilidade do MuxResSrc selecionar PC+4 , para isso foi preciso aumentar o tamanho desse MUX, pois ele tinha dois espaços preenchidos.
Adiante, foi adicionado o sinal de Jump na unidade de controle e consequentemende modificada a lógica de cálculo do PCSrc, que representa a ação de salto,
agora realizando uma OR com o sinal de Jump após a AND de Branch e zero.

Para as instruções ORI e ANDI, apenas adiciona-se seus sinais de na unidade de controle, não há necessidade de alteração de hardware. E para a instrução SRL, além de
seus sinais de controle, também é necessário possibilitar a ULA de realizar essa operação, em nosso processador a ULA ainda possuía espaço disponível. Essas instruções
tem caminhos comumente conhecidos, seja de realizar uma operação entre registrador e imediato, como na ORI e ANDI ou entre registradores na instrução SRL.

Por fim, acrescenta-se a instrução JALR, que em condições especificas (jalr zero, ra, 0) é a instrução JR, ela faz PC = ra (registrador x1 em nossa arquitetura).
Para sua adição cria-se um novo sinal de controle "Jr", esse sinal é ativado quando
a instrução é lida, tal sinal é usado como seleção em um novo mux, que escolhe entre rd1SrcA e PC, a saída desse mux é levada ao cálculo de ImmPC, que agora pode realizar
a soma de PC + Imm, ou  rd1SrcA + Imm, é importante mencionar que essa instrução é do tipo I o qual ja possuímos possibilidade de extensão.
Assim, quando a instrução Jr for lida ela ira salvar em PC o valor de ra + zero. A partir de agora, podemos utilizar códigos de funções em nosso processador, 
saltando e retornando para diferentes endereços.

