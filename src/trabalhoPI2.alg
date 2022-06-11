algoritmo "AlgoritmoPI II"
tipo
   usuario = registro
      nome : caractere
      senha : caractere
   fimregistro

var
   opcao : inteiro
   vetUsuarios : vetor[0..2] de usuario
   vetChat : vetor[0..2] de caractere
   nomeUsuario, confUsuario : caractere
   senha, confsenha : caractere
   i, j : inteiro
   login : inteiro
   user, pass, msg : caractere


procedimento p_cadastro(pr_nome : caractere; pr_senha : caractere)
var
inicio
   limpatela
   vetUsuarios.nome[i] <- pr_nome
   vetUsuarios.senha[i] <- pr_senha
   i <- i + 1
   escreval("Cadastro criado com sucesso!!")
fimprocedimento


procedimento p_login(p_nome : caractere; p_senha : caractere)
var
   ind : inteiro
inicio
   para ind <- 0 ate 2 passo 1 faca
      se (vetUsuarios.nome[ind] = p_nome) e (vetUsuarios.senha[ind] = p_senha) entao
         limpatela
         escreval("Login realizado com sucesso!!")
         escreval("Bem Vindo(a) ", p_nome, "!!")
         login <- 1
         user <- "1"
         pass <- "1"
      fimse
   fimpara
   se login = 0 entao
      limpatela
      escreval("Usuario nao encontrado")
      p_nome <- ""
      p_senha <- ""
      user <- ""
      pass <- ""
   fimse
fimprocedimento


procedimento p_chat(pr_msg: caractere)
var
   ind : inteiro
inicio
   limpatela
   se (user = "1") entao
      para ind <- 0 ate 2 passo 1 faca
         se vetChat[i] = "+" entao
            j <- i
         senao
            escreval(vetChat[i])
         fimse
      fimpara
      vetChat[j] <- user + " " + pr_msg
      limpatela
      escreval("Mensagem enviada com sucesso")
   senao
      escreval("Voce precisa logar para usar o chat!!")
   fimse
fimprocedimento


procedimento p_logout
var
inicio
   limpatela
   se (user = "1") entao
      user <- ""
      pass <- ""
      escreval("Logout realizado com sucesso!!")
      escreval("Até logo!!")
   senao
      escreval("Voce nao esta logado...")
   fimse
fimprocedimento


funcao f_usuarioIncorreta(pr_usuarioIncorreta : caractere) : logico
var
   achou : logico
   ind : inteiro
inicio
   achou <- falso
   para ind <- 0 ate 2 passo 1 faca
      se (vetUsuarios.nome[ind] = pr_usuarioIncorreta) entao
         achou <- verdadeiro
         interrompa
      fimse
   fimpara
   se (vetUsuarios.nome[ind] <> pr_usuarioIncorreta) entao
      escreval("===========================")
      escreval("Usuario Incorreto!!")
      escreval("===========================")
   fimse
   retorne achou
fimfuncao


funcao f_senhaIncorreta(pr_senhaIncorreta : caractere) : logico
var
   achou : logico
   ind : inteiro
inicio
   achou <- falso
   para ind <- 0 ate 2 passo 1 faca
      se (vetUsuarios.senha[ind] = pr_senhaIncorreta) entao
         achou <- verdadeiro
         interrompa
      fimse
   fimpara
   se (vetUsuarios.senha[ind] <> pr_senhaIncorreta) entao
      escreval("===========================")
      escreval("Senha Incorreta!!")
      escreval("===========================")
   fimse
   retorne achou
fimfuncao

inicio
   enquanto (opcao <> 9) faca
      escreval("===========================")
      escreval("Escolha uma opcao")
      escreval("1- Cadastro")
      escreval("2- Login")
      escreval("3- Chat")
      escreval("4- Logout")
      escreval("9- Sair")
      escreval("===========================")
      leia(opcao)
      escolha(opcao)
      caso 1
         escreval("Informe um usuario")
         leia(nomeUsuario)
         escreval("Escolha uma senha")
         leia(senha)
         p_cadastro(nomeUsuario, senha)
      caso 2
         repita
            escreval("Insira seu usuario")
            leia(confUsuario)
         ate (f_usuarioIncorreta(confUsuario) = verdadeiro)
         repita
            escreval("Insira sua senha")
            leia(confsenha)
         ate (f_senhaIncorreta(confsenha) = verdadeiro)
         p_login(confUsuario, confsenha)
      caso 3
         escreval("Mensagem:")
         leia(msg)
         p_chat(msg)
      caso 4
         p_logout
      caso 9
         escreval("Finalizado com sucesso!!")
      fimescolha
   fimenquanto
Fimalgoritmo