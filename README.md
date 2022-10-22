# Comandos GIT
## Comandos Gerais:
- Iniciar o projeto:
```git init```

- Criar recurso:
```git checkout -b name_branch```

- Setar a Brach Padrao para Developer no Site;

- Antes de começar a trabalhar:
    - Puxar todas as alterações na branch se houver:
    ```git pull```

## Comandos para os módulos:
- Primeiro deve-se adicionar as informações(diretórios e arquivos):
```git add . ```

- Segundo deve-se realizar o commit com a mensagem:
```git commit -m 'message' ```

- Terceiro deve-se enviar para a branch remote:
    - No primeiro commit deve-se informar o repositório remoto e a branch:
    ```git push -u origin master```

    - Nos demais commits basta informar o comando:
    ```git push```

- Finalizar recurso 
```git checkout branch```

## Comandos para Merge
- Após o checkout vá para a branch developer:
    - Faça o merge entre branch:
    ```git merge branch```

    - Vá ao site para aceitar as pulls;

