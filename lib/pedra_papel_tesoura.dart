//importar o pacote para entrada e saída de dados
import "dart:io";
//importar o pacote de valorea aleatórios
import "dart:math";
//definir um enum com as opções de jogo (pedra, papel, tesoura, sair) - o enum fica fora da função
enum OPCOES {pedra, papel, tesoura, sair}

void exibir(String texto){
  print(texto);
}

int pegarOpcaoUsuario(){ //uma função que pega o que o usuário digitou (e utiliza o operador "!" para dizer que não é necessário fazer a verificação do null)
  return int.parse(stdin.readLineSync()!);
}

int pegarRodadas(){
  return int.parse(stdin.readLineSync()!);
}

bool opcaoValida(int opcao){ //validação do que o usuário digitou
  return opcao >=1 && opcao <4;
}

bool rodadaValida(int rodada) {
  return rodada >=1 && rodada <=5;
}

OPCOES mapearOpcao( int opcao) {
  return OPCOES.values[ opcao - 1 ];
}

String verificaResultado(OPCOES opUsuario, OPCOES opComputador){
  if(opUsuario == opComputador) return "empate";
  if(opUsuario == OPCOES.pedra){
    return opComputador == OPCOES.papel? "o computador venceu." : "você venceu.";
  } else if(opUsuario == OPCOES.papel){
    // return opComputador == OPCOES.pedra? "você venceu." : "o computador venceu.";
    // tammbém temos a opção de fazer com o switch expressional: 
    return switch(opComputador){
      OPCOES.tesoura => "o computador venceu.",
      _ => "você venceu."
    };
  }
  else{
    if(opComputador == OPCOES.pedra){
      return "o computador venceu.";
    }
    else{
      return "você venceu.";
    }

  }

}

void jogo() {
int opUsuario;
int rodadas = pegarRodadas();
do{
  while()
    do{
      var menu = "1 - pedra \n2 - papel \n3 - tesoura \n4 - sair";
      exibir(menu);

      opUsuario = pegarOpcaoUsuario();

    }while(!opcaoValida(opUsuario));

    if(opUsuario == 4) {
      exibir("até logo");
    }
    else{
      var opComputador = Random().nextInt(3) + 1; //aqui, apesar de já termos declarado a variável, o compilador nao sabe o valor que dará (porque é random), entao nao dá para ser constante
      OPCOES opcaoUsuario = mapearOpcao(opUsuario);
      final opcaoComputador = mapearOpcao(opComputador);

      exibir('JOGADOR(${opcaoUsuario.name }) vs (${opcaoComputador.name})COMPUTADOR');
      final resultado = verificaResultado(opcaoUsuario, opcaoComputador);
      exibir(resultado);

    }

}
while(rodadaValida(rodadas));

} //essa função está sendo executada lá na função principal (main), que está na pasta bin