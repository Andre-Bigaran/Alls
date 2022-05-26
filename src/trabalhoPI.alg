algoritmo "trabalhoPI"
var
nomeUsuario : vetor[1..100] de caracter
senha : vetor[1..100] de caracter
chat : vetor[1..100] de caracter
tempUser : caracter
tempSenha : caracter
msg : caracter
j : inteiro
i : inteiro
login : inteiro
opcao : caracter
currentUser : inteiro
inicio

i <- 1
currentUser <- 1
para i de 1 ate 100 faca
    chat[i] <- "+"
fimpara
i <- 1
enquanto opcao <> "parar" faca
    escreval("Escolha uma opcao entre:")
    escreval("logout, login, cadastro, chat e parar")
    leia(opcao)
    se opcao = "chat" entao
        limpatela
        se tempUser <> "" entao
            para i de 1 ate 100 faca
                se chat[i] = "+" entao
                    j <- i
                senao
                    escreval(chat[i])
                fimse
            fimpara
            escreva("Mensagem: ")
            leia(msg)
            chat[j] <- tempUser + " " + msg
            limpatela
        senao
            escreval("Voce precisa estar logado para usar o chat")
        fimse
        i <- 1
    fimse
    se opcao = "cadastro" entao
        limpatela
        escreval("Escolha um usuario")
        leia(nomeUsuario[currentUser])
        escreval("Escolha uma senha")
        leia(senha[currentUser])
        currentUser <- currentUser + 1
        limpatela
        escreval("Usuario criado com sucesso")
    fimse
    se opcao = "logout" entao
        limpatela
        se tempUser <> "" entao
            limpatela
            tempUser <- ""
            tempSenha <- ""
            escreval("Logout bem sucedido")
        senao
            escreval("Voce nao esta logado...")
        fimse
    fimse
    se opcao = "login" entao
        limpatela
        escreval("Insira seu usuario")
        leia(tempUser)
        escreval("Insira sua senha")
        leia(tempSenha)
        para i de 1 ate 100 faca
            se (nomeUsuario[i] = tempUser) e (senha[i] = tempSenha) entao
                limpatela
                escreval("Login bem sucedido")
                login <- 1
            fimse
        fimpara
        se login = 0 entao
            limpatela
            escreval("Usuario nao encontrado")
            tempUser <- ""
            tempSenha <- ""
        fimse
        login <- 0
   fimse
fimenquanto

limpatela
fimalgoritmo
