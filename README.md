## O que são Entidades?
As entidades reunem as Regras de Negócio Cruciais. Elas precisam ser mais puras possíveis. As entidades podem ser usadas por muitas aplicações da empresa, por exemplo, podemos usar uma mesma entidade no app e no backend. 
As entidades tem as regras mais gerais e de nível mais alto da aplicação. Nenhuma mudança deve interferir na entidade. 
Uma entidade pode validar e modelar um objeto. Na Entity estamos modelando algo do mundo real. 

## O que são Casos de Uso?
Os casos de uso contém as regras de negócio específicas da aplicação. Elas são a execução da regra de negócio. Mudanças nessa camada não podem afetar as entidades!

## O que é Repositório?
O Design Pattern Repository separa a lógica de acesso a dados da regra de negócio, introduzindo um componente no meio chamado repository. 
Basicamente são as camadas externas, como se fosse um Service. 
Repository: fornece dados em formato amigável ao domínio. 
Datasource: fornece dados de acordo com o formato específico da API. 

## O que é Aggregate?
Coleção de objetos relacionados que desejamos tratar como uma unidade. 
