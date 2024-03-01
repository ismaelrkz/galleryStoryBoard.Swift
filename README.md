# Gallery StoryBoard 

## Sobre o projeto 
O objetivo do projeto é criar um aplicativo iOS interativo e intuitivo usando da linguagem Swift que oferecesse funcionalidades de autenticação, registro, criação de galerias personalizadas e adição de conteúdo visual. A aplicação visa proporcionar ao usuário uma experiência amigável e agradável permitindo a organização de imagens em galerias e associando citações a cada imagem.

No geral, o desenvolvimento da aplicação ajudou-me a adquirir habilidades práticas, combinando conceitos de interface de usuário, navegação, manipulação de imagens e integração de dados para criar uma aplicação coesa e funcional. Este projeto não apenas solidificou conceitos fundamentais, mas também proporcionou uma oportunidade valiosa para aplicar esses conhecimentos em um contexto prático.

## Layout
<p float="left">
  <img src="Simulator Screenshot - iPhone 15 Pro - 2024-03-01 at 08.52.44.png" width="200" />
  <img src="Simulator Screenshot - iPhone 15 Pro - 2024-03-01 at 08.52.54.png" width="200" />
  <img src="Simulator Screenshot - iPhone 15 Pro - 2024-03-01 at 08.53.30.png" width="200" />
  <img src="Simulator Screenshot - iPhone 15 Pro - 2024-03-01 at 08.57.09.png" width="200" />
<p float="left">


## Tecnologias utilizadas

- Swift
- UIKit
- Storyboard

## Estrutura do projeto

### **ViewController**:

1. **Responsabilidade:**
    - Interface de login e registro.
2. **Lógica e Métodos Principais:**
    - **`tappedLoginButton`**: Valida os campos de login e, se aprovado, transita para a **`TabBarViewController`** usando **`navigationController`**.
    - **`tappedCreateAccountButton`**: Navega para a tela de registro (**`RegisterViewController`**) usando **`navigationController`**.
    - **`validateTextFieldLogin`**: Verifica a validade dos campos de texto para ativar/desativar o botão de login.
    - Uso da **`navigationController`** para navegação entre telas.

### **RegisterViewController**:

1. **Responsabilidade:**
    - Gerencia o processo de registro.
2. **Lógica e Métodos Principais:**
    - **`tappedCreateAccountButton`**: Inicia o processo de registro, validando campos e, se aprovado, transita para a **`TabBarViewController`** usando **`navigationController`**.
    - **`validateTextFieldCreateAccount`**: Valida campos e verifica a correspondência das senhas.
    - Uso da **`navigationController`** para navegação entre telas.

### **AlertController**:

1. **Responsabilidade:**
    - Gerencia a exibição de alertas na interface do usuário.
2. **Lógica e Métodos Principais:**
    - **`alertInformation`**: Exibe um alerta informativo com título e mensagem.
    - **`alertConfirmation`**: Exibe um alerta de confirmação com opções "Yes" e "No".
    - **`chooseImage`**: Exibe um alerta de escolha para a fonte da imagem (câmera, biblioteca ou cancelar).
    - Uso do **`UIViewController`** para apresentar os alertas.

### **TabBarViewController**:

1. **Responsabilidade:**
    - Gerencia a interface de abas.
2. **Lógica e Métodos Principais:**
    - **`settingsUITabBar`**: Configura a aparência da barra de abas.
    - Conecta abas às visualizações correspondentes: **`CollectionView`** e **`TableView`**.
    - Uso do **`UITabBarController`** para a navegação entre as visualizações.

### **CustomCollectionViewCell**:

1. **Responsabilidade:**
    - Representa uma célula personalizada para a **`CollectionView`**.
2. **Lógica e Métodos Principais:**
    - **`settingsUICell`**: Configura a aparência visual da célula.
    - **`setupCell`**: Preenche a célula com dados do modelo **`imageForCell`**.

### **CollectionViewController**:

1. **Responsabilidade:**
    - Gerencia a exibição de uma coleção de imagens.
2. **Lógica e Métodos Principais:**
    - **`tappedAddImageButton`**: Permite a escolha de imagens da câmera ou biblioteca para adicionar à coleção usando **`UIImagePickerController`**.
    - **`validateTextFieldCreateAccount`**: Valida campos e verifica a correspondência das senhas.
    - Implementação dos protocolos **`UICollectionViewDelegate`** e **`UICollectionViewDataSource`**.
    - Uso da classe **`AlertController`** para escolha de imagens.

### **imageForCell** e **dataForCell**:

1. **Responsabilidade:**
    - Modelos de dados para representar imagens e dados associados.

### **CustomTableViewCell**:

1. **Responsabilidade:**
    - Representa uma célula personalizada para a **`TableView`**.
2. **Lógica e Métodos Principais:**
    - **`settingsUICell`**: Configura a aparência visual da célula.
    - **`setupCell`**: Preenche a célula com dados dos modelos **`dataForCell`**.

### **TableViewController**:

1. **Responsabilidade:**
    - Gerencia a exibição de uma tabela de citações e imagens associadas.
2. **Lógica e Métodos Principais:**
    - **`tappedAddImageButton`**: Permite a escolha de imagens da câmera ou biblioteca para adicionar à tabela usando **`UIImagePickerController`**.
    - **`tappedExitButton`**: Exibe um alerta de confirmação antes de fazer logout.
    - Implementação dos protocolos **`UITableViewDelegate`** e **`UITableViewDataSource`**.
    - Implementação do protocolo **`UITextFieldDelegate`** para configuração da aparência do campo de texto.
    - Uso da classe **`AlertController`** para escolha de imagens e exibição de alertas.

## Autor

Ismael Reckziegel

https://www.linkedin.com/in/ismaelrkz/
