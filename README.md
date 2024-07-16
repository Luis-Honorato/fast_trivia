# Fast Trivia

## Documentação 

### Introdução

App desenvolvido como apresentação de meus principais conhecimentos em Flutter!

### Como Usar

Após clonar o repositório localmente e abri-lo com sua IDE favorita, executar o seguinte commando no terminal:
```bash
flutter pub get
```
Este comando baixará todas as depêndencias externas utilizadas para o desenvolvimento do aplicativo, tais dependências serão citadas e explicadas posteriormente. 

Executar o comando no terminal:
```bash
dart run build_runner watch
```
Isso irá instalar os mocks nescessários para rodar os testes do projeto.

Caso apareça algum conflito como a imagem abaixo:
![image](https://github.com/Luis-Honorato/fast_trivia/assets/90717674/f9b2ac46-08b5-46e6-9f40-6796ebafcf71)

Pressione a tecla 1

Ao finalizar a atualização e download dos mocks, ainda selecionando o terminal pressione as teclas ```CTR + C``` para finalizar a execução do comando acima.

Foram feitos no total 12 testes para garantir a usabilidade e funcionamento do aplicativo, eles podem ser encontrados na pasta ```/testes``` e acompanham a arquitetura do projeto.
Para rodar todos os testes e verificar se o aplicativo encontra-se funcionando como o esperado rode o comando no terminal:
```bash
flutter test
```
Isso irá rodar todos os testes e entregar uma resposta visual se passaram ou quebraram.

### Escolha da arquitetura

Como arquitetura foi escolhida a Clean Architecture.

A Clean Architecture é um princípio de design que visa separar as responsabilidades e camadas de um aplicativo de maneira a promover a modularização, reutilização de código e facilidade de teste. Essa separação também permite melhor adaptabilidade a mudanças no futuro e reduz o risco de componentes fortemente acoplados.

#### Benefícios da Clean Architecture

1. Modularização e Separação de Camadas:
A Clean Architecture divide o aplicativo em camadas distintas, cada uma com uma responsabilidade específica. Essas camadas incluem a Camada de Presentation (Apresentação), a Camada de Domain (Domínio) e a Camada de Data (Dados). Essa separação promove a modularização do código, tornando mais fácil substituir ou modificar componentes individuais sem afetar outras partes do aplicativo. Essa modularização garante que os componentes da UI possam ser alterados sem modificar a lógica de negócios central, favorecendo a manutenção do código.

2. Testabilidade:
Uma das principais vantagens da Clean Architecture é seu impacto na testabilidade. A separação de responsabilidades possibilita testar cada camada de forma independente. A lógica de negócios pode ser testada sem a necessidade de componentes de interface do usuário ou dependências externas. Isso permite uma cobertura de teste abrangente, resultando em um aplicativo mais confiável.

3. Escalabilidade:
A Clean Architecture suporta a escalabilidade de aplicativos ao encapsular a funcionalidade em camadas distintas. À medida que o aplicativo cresce, novos recursos podem ser adicionados estendendo camadas existentes ou adicionando novas. Essa flexibilidade evita a introdução de código confuso e promove um código estruturado e organizado. 

5. Independência de Frameworks e Bibliotecas:
A Clean Architecture prioriza a independência da lógica de negócios central de frameworks e bibliotecas externas. Isso garante que a funcionalidade essencial do aplicativo não seja afetada por mudanças nas tendências tecnológicas ou atualizações no próprio Flutter.

### Bibliotecas e dependências utilizadas no aplicativo 

Algumas bibliotecas externas foram utilizadas para o desenvolvimento do projeto, foram elas:

1. **Gorouter**:
A biblioteca "go_router" foi escolhida para o gerenciamento eficiente de rotas dentro do aplicativo.

2. **Bloc**:
A biblioteca "bloc" é escolhida para o gerenciamento de estado do aplicativo. Ela adere ao padrão BLoC (Business Logic Component) e permite separar a lógica de negócios da interface do usuário. O uso do BLoC ajuda a manter o código organizado, facilita a testabilidade e permite uma melhor escalabilidade conforme o aplicativo cresce.

3. **Equatable**:
A biblioteca "equatable" é adotada para aprimorar a comparação de classes. Ela simplifica a implementação de métodos "equals" e "hashCode" para objetos, tornando mais fácil a comparação de instâncias de classes personalizadas. Isso contribui para a precisão e confiabilidade dos testes e operações de comparação no código.

4. **Dartz**:
A biblioteca "dartz" é incorporada para aproveitar o conceito de "either" (ou "ou") na manipulação de resultados e erros. Utilizei no tipo de retorno dos meus usecases para tornar o tratamento de erros mais expressivo e seguro.

5. **Mockito**:
A biblioteca "mockito" é utilizada para criar mocks das classes durante os testes. Isso possibilita testar componentes isoladamente, simular comportamentos específicos e garantir que as diferentes partes do aplicativo funcionem conforme o esperado, mesmo em um ambiente controlado.

6. **SharedPreferences**:
A biblioteca "shared_preferences" é empregada para salvar dados localmente. Ela fornece uma maneira fácil de armazenar informações localmente, utilizei ela como Banco de Dados Local.

### Considerações finais
Se tiver alguma consideração ou sugestão me chama no linkedin!
https://www.linkedin.com/in/luis-honorato/

Muito obrigado pela atenção. 

Abraços, Luis Honorato ❤️
