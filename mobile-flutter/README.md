
## Como rodar o seu projeto
```
Desenvolvimento online:

# flutter run --dart-define=endpoint=http://docker_domain:333

# flutter build apk  --dart-define=endpoint=http://docker_domain:333

Mock para desenvolvimento offline (limitado):

# flutter run --dart-define=offline=true

# flutter build apk --profile --dart-define=offline=true

```

## Bugs conhecidos
- Caso limpe o storage com app aberto
- UI e mensagens de erros
- falta de testes
- digitgra comentario vazio

## Como você planejou abordar este projeto? Que tecnologis foram utilizadas?

- Flutter version
  - 2.2.1

- Clean Architecture
 - Baseada no curso de arquitetura limpa do manguinho

- Recursos
- - Tipografia e cores organizada ( Style guide )
- - Internacionalizaçãp (pt-BR e en-US)
- - Offline

- Gerencia de estado
  - Provider para singletons
  - Mobx para reatividade


- Cache para Offline
  - Hive

- Package de Testes de unidade
  - Mockito

- Testes escritos
  - Usercases
  - Presenters
  - Adapters
  - Models
  - Factories

- Github Actions
  - [thanks @aagarwal1012](https://gist.github.com/aagarwal1012/eb2551683d81cf47d60868ab607520b1)


## Você acha algum dos requisitos ou features difícil em algum aspecto? Por quê?
- Falta de um mockup para seguir.

## Se você tivesse mais tempo para fazer o projeto o que faria de diferente?
- Escreveria mais testes
- Melhoraria navegação de rotas
- Melhorara o offline
- Faria um mockup


## Github Actions
- [thanks @aagarwal1012](https://gist.github.com/aagarwal1012/eb2551683d81cf47d60868ab607520b1)
-

