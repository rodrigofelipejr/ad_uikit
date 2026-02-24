# ad_uikit

Uma biblioteca abrangente de componentes de UI reutilizáveis e estilos para aplicativos Flutter. Este package foi desenvolvido para fornecer uma base sólida e consistente para a construção de interfaces modernas, seguindo padrões de design escaláveis.

## Funcionalidades

- **Design Modular**: Componentes organizados de forma atômica para máxima reutilização.
- **Sistema de Estilos**: Gerenciamento de estilos compartilhado e flexível que permite fácil personalização.
- **Suporte a Comportamentos (Behaviors)**: Componentes que reagem de forma consistente a diferentes estados (como `regular`, `loading`, `error`, `disabled`, etc.).
- **Tokens de Design**: Conjunto completo de tokens para cores, tamanhos, espaçamentos e tipografia (`ADColors`, `ADSizes`, `ADSpacing`, etc.).

## Começando

Para começar a usar o `ad_uikit`, adicione-o como uma dependência no seu arquivo `pubspec.yaml`. Se estiver usando como um package local:

```yaml
dependencies:
  ad_uikit:
    path: packages/ad_uikit
```

Em seguida, execute o comando para baixar as dependências:

```bash
flutter pub get
```

## Uso

Importe a biblioteca principal no seu código:

```dart
import 'package:ad_uikit/ad_uikit.dart';
```

### Exemplo: Utilizando o Shimmer

O `ad_uikit` oferece componentes prontos para uso, como o `ZShimmer`:

```dart
// Exemplo de um shimmer retangular padrão
ZShimmer.standard(
  size: Size(200, 20),
)
```

## Informações Adicionais

Este pacote é mantido internamente e está em constante evolução. Para novas funcionalidades ou correção de bugs, verifique a estrutura de `lib/` e siga os padrões de contribuição definidos para o projeto.
