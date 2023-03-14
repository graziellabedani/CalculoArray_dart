import 'dart:ffi';
import 'dart:io';

void calculo_Media( notas_alunos, media_aprovacao, lista_media, nome_aluno, nome) {
  double media = 
         ((notas_alunos[0] +
          notas_alunos[1] +
          notas_alunos[2] +
          notas_alunos[3])) /4; // seleção e contagem das médias
  if (media >=  media_aprovacao) // lógica para a realização da comparação entre média do aluno e aprovação
  {
    lista_media.add("${media.toString()}. Parabéns, você foi aprovado."); // "se a nota inserida (média)>(media de aprovação) = APROVADO"
  } else {
    lista_media.add("${media.toString()}. Infelizmente seu rendimento não foi sufuciente, reprovado."); //"se a nota inserida (média)<(media de aprovação) = REPROVADO"
  }

  nome_aluno.add(nome); // seleção para a escolha do aluno na exibição da ficha
  print(notas_alunos);
  notas_alunos.removeRange(0, 4); // finalizando notas capitadas, para uma nova rolagem de notas
}

void main() {
  // Variáveis globais
  List nome_aluno = [];
  List notas_alunos = [];
  List lista_media = [];
  const media_aprovacao = 6.0;

  String? nome;
  double? avaliacao;
  double? media = 0.0;



 // ------------------------------------------------------------------
  for (int estudante = 1; estudante <= 10; estudante++) {
    // laço de repetição para inserção de nomes
    print("Informe o nome do $estudante° aluno:"); // comando para inserção dos nomes
    nome = stdin.readLineSync()!; // comando para inserção do nome;
    print(nome); // print do nome inserido

    for (int notas_estudante = 1; notas_estudante <= 4; notas_estudante++) {
      //laço de repetição para inserção das notas
      print("Informe sua $notas_estudante° nota do aluno $nome:"); // comando para inserção das notas
      avaliacao = double.parse(stdin.readLineSync()!); // transformando string em double no comando de inserção de notas
      notas_alunos.add(avaliacao); // adição das notas
    }

   calculo_Media(notas_alunos, media_aprovacao, lista_media, nome_aluno, nome); // função do calculo_media()
  }
 //---------------------------------------------------------------------


  String cont = "sim"; // Usuário decidindo continuar ou não na busca


 // --------------------------------------------------------------------
  while (cont == "sim") {
    print("Deseja acessar a média de qual aluno?");
    print(nome_aluno);

    String? nome_pesquisa = stdin.readLineSync()!; // busca a média já cadastrada

    List nome_e_media = [];
    for (var contagem_nome_e_media = 0;
        contagem_nome_e_media <= 9;
        contagem_nome_e_media++){ 
        nome_e_media.add("Nome do aluno: ${nome_aluno[contagem_nome_e_media]} , nota do aluno ${lista_media[contagem_nome_e_media]} ");

      if (nome_aluno[contagem_nome_e_media] == nome_pesquisa) {
        print(nome_e_media[contagem_nome_e_media]);
        break; // comando para quebrar o laço
      } else {
        print("");
      }
    }

    print(
        "Deseja continuar a verificação das médias? Se sim, digite 'sim'. Para finalizar, digite 'nao'");
    cont = stdin.readLineSync()!;
  }
  // -----------------------------------------------------------------------
}

// anotações:
// ! = O CAMPO NÃO PODE SER EM BRANCO
// while = Faz indepente
