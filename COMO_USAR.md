# 📖 Como Usar o Validador Financeiro

## Guia Completo de Utilização

### 🎯 Objetivo da Ferramenta

O Validador Financeiro LCV-SNK compara automaticamente os dados de multas entre dois sistemas diferentes (Locavia e Sankhya), identificando:
- ✅ Registros que estão corretos em ambos os sistemas
- ⚠️ Registros com divergências de valores ou datas
- ❌ Registros que existem no Locavia mas não no Sankhya

---

## 🚀 Iniciando a Aplicação

### 1. Abrir dois terminais

**Terminal 1 - Backend:**
```bash
cd backend
npm start
```
Aguarde a mensagem: `🚀 Servidor rodando na porta 3001`

**Terminal 2 - Frontend:**
```bash
cd frontend
npm run dev
```
Aguarde a mensagem: `➜ Local: http://localhost:3003/`

### 2. Acessar a aplicação

Abra seu navegador e acesse: **http://localhost:3003**

---

## 🎨 Interface da Aplicação

### Tela Inicial

Ao abrir a aplicação, você verá:

1. **Cabeçalho (Header)**
   - Título: "Validador Financeiro LCV-SNK"
   - Subtítulo: "Comparação entre sistemas Locavia e Sankhya"

2. **Painel de Filtros (Card Branco)**
   - Tipo de Validação: Dropdown com 2 opções
   - Ano: Dropdown com últimos 5 anos
   - Data Inicial: Campo de data
   - Data Final: Campo de data
   - Botões: "🔍 Validar" e "🔄 Limpar Filtros"

3. **Mensagem de Boas-Vindas**
   - Ícone: 📊
   - Texto explicativo

---

## 📝 Passo a Passo para Validar

### Passo 1: Escolher o Tipo de Validação

Clique no dropdown "Tipo de Validação" e selecione:

**Opção 1: Multas de Pagamento**
- Compara multas que a empresa **pagou**
- Campos comparados:
  - Número AIT (apenas números)
  - CPF/CNPJ do fornecedor
  - Data do pagamento
  - Valor cobrado da multa

**Opção 2: Multas de Recebimento**
- Compara multas que a empresa **recebeu**
- Campos comparados:
  - Número AIT (apenas números)
  - CPF/CNPJ do cliente
  - Data do recebimento
  - Valor da multa com descontos

### Passo 2: Selecionar o Ano

Clique no dropdown "Ano" e selecione o ano desejado.
- Por padrão, vem selecionado o ano atual
- Disponíveis os últimos 5 anos

### Passo 3: Definir Período (Opcional)

Se quiser filtrar por um período específico:

1. Clique no campo "Data Inicial"
2. Selecione a data de início
3. Clique no campo "Data Final"
4. Selecione a data de término

**Dica:** Deixe em branco para validar o ano inteiro.

### Passo 4: Executar a Validação

Clique no botão **"🔍 Validar"**

O botão mudará para "⏳ Validando..." e ficará desabilitado.

⏱️ **Tempo estimado:** 10 a 30 segundos (dependendo da quantidade de dados)

---

## 📊 Entendendo os Resultados

### Dashboard de Estatísticas

Após a validação, você verá 4 cards coloridos:

**Card 1: Total de Registros** (Azul)
- Quantidade total de registros analisados no Locavia

**Card 2: Registros Conformes** (Verde)
- Registros que estão **idênticos** nos dois sistemas
- Mostra a porcentagem de conformidade
- Exemplo: "85.5% de conformidade"

**Card 3: Registros Divergentes** (Laranja)
- Registros encontrados em ambos, mas com **diferenças**
- Pode ser diferença de valor ou data

**Card 4: Não Encontrados** (Vermelho)
- Registros que existem no Locavia mas **não existem** no Sankhya

---

### Tabela de Divergências

Logo abaixo do dashboard, você verá uma tabela com todas as divergências encontradas.

**Colunas da Tabela:**

1. **Tipo**
   - Badge vermelho: "Não Encontrado" (não existe no Sankhya)
   - Badge laranja: "Divergente" (valores diferentes)

2. **Código Multa**
   - Código interno do Locavia

3. **Número AIT**
   - Número da autuação (apenas dígitos)

4. **CPF/CNPJ**
   - Documento da pessoa/empresa

5. **Data Locavia**
   - Data registrada no sistema Locavia

6. **Data Sankhya**
   - Data registrada no sistema Sankhya
   - Mostra "-" se não encontrado

7. **Valor Locavia**
   - Valor em Reais (R$) do Locavia

8. **Valor Sankhya**
   - Valor em Reais (R$) do Sankhya
   - Mostra "-" se não encontrado

9. **Status**
   - Lista os campos que estão divergentes
   - Exemplo: "Data, Valor"

**Paginação:**
- A tabela mostra 20 registros por vez
- Use os botões "← Anterior" e "Próxima →" para navegar

---

## 🔍 Ver Detalhes de uma Divergência

### Como Abrir o Modal de Detalhes

1. Clique em **qualquer linha** da tabela de divergências
2. Um modal (janela sobreposta) será aberto

### O que você verá no Modal

**Seção 1: Tipo de Divergência**
- Badge colorido indicando o tipo
- Descrição detalhada do problema

**Seção 2: Dados do Locavia**
- Código da Multa
- Número AIT
- CPF/CNPJ
- Data (em vermelho se divergente)
- Valor (em vermelho se divergente)

**Seção 3: Dados do Sankhya**
- Número da Nota
- ID Externo
- Data (em vermelho se divergente)
- Valor (em vermelho se divergente)
- **OU** mensagem de "não encontrado"

**Seção 4: Campos Divergentes** (se houver)
- Lista detalhada de cada campo divergente
- Comparação lado a lado: Locavia vs Sankhya
- Diferença em R$ (para valores divergentes)

### Fechar o Modal

Clique no botão **"Fechar"** ou clique fora do modal.

---

## 🔄 Executar Nova Validação

### Para validar outro período ou tipo:

1. Altere os filtros desejados
2. Clique em "🔍 Validar" novamente

### Para limpar todos os filtros:

Clique no botão **"🔄 Limpar Filtros"**
- Ano volta para o ano atual
- Datas inicial e final são limpas

---

## 💡 Dicas de Uso

### Melhor Forma de Identificar Problemas

1. **Primeiro:** Execute sem filtro de data para ver o panorama geral do ano
2. **Depois:** Se houver muitas divergências, filtre por mês
3. **Por fim:** Analise cada divergência individualmente

### Padrões Comuns de Divergências

**Divergência de Data:**
- Pode indicar diferença de fuso horário
- Ou lançamento em dias diferentes

**Divergência de Valor:**
- Verifique se há descontos aplicados
- Confira taxas administrativas
- Diferenças menores que R$ 0,01 são toleradas

**Não Encontrado:**
- Registro pode não ter sido integrado
- Pode ter sido integrado com chave diferente
- Verifique se o CPF/CNPJ está correto

---

## 📥 Exportar Resultados (Futuro)

**Nota:** Atualmente não há função de exportação, mas você pode:
- Fazer print screen das telas
- Copiar os dados manualmente
- Usar as ferramentas do desenvolvedor do navegador

---

## ⚠️ Mensagens de Erro

### Erro de Conexão

**Mensagem:** "Erro ao conectar com o servidor. Verifique se o backend está rodando."

**Solução:**
1. Verifique se o backend está executando na porta 3001
2. Verifique se o frontend está executando na porta 3003
3. Acesse http://localhost:3001/health para testar o backend
4. Reinicie os serviços se necessário

### Erro de Banco de Dados

**Mensagem:** "Erro ao buscar dados do Locavia" ou "Erro ao buscar dados do Sankhya"

**Solução:**
1. Verifique as credenciais no arquivo `.env`
2. Teste as conexões: http://localhost:3001/api/validation/test-connections
3. Verifique se os servidores de banco estão acessíveis

### Timeout

**Mensagem:** "Tempo de requisição esgotado"

**Solução:**
1. Tente com um período menor de datas
2. Verifique a conexão de rede
3. O timeout padrão é 60 segundos

---

## 🎯 Exemplo de Uso Completo

### Cenário: Validar multas de pagamento de janeiro de 2025

1. Acesse http://localhost:3003
2. Selecione "Multas de Pagamento"
3. Selecione "2025" no ano
4. Data Inicial: 01/01/2025
5. Data Final: 31/01/2025
6. Clique em "🔍 Validar"
7. Aguarde o processamento
8. Analise o dashboard:
   - Ex: 150 registros, 140 conformes, 8 divergentes, 2 não encontrados
9. Role a tela para ver a tabela de divergências
10. Clique em uma linha para ver detalhes
11. Analise cada divergência
12. Feche o modal
13. Repita para outras divergências

---

## 📞 Suporte

Se encontrar problemas ou tiver dúvidas:

1. Consulte o arquivo `README.md` para documentação técnica
2. Verifique o arquivo `INSTALACAO.md` para problemas de instalação
3. Entre em contato com a equipe de TI

---

## ✨ Recursos da Interface

### Design Responsivo
- Funciona em desktop, tablet e celular
- Layout se adapta automaticamente

### Cores e Badges
- **Verde:** Sucesso / Conforme
- **Laranja:** Atenção / Divergente
- **Vermelho:** Erro / Não Encontrado
- **Azul:** Informação / Destaque

### Interatividade
- Hover nos elementos mostra efeitos visuais
- Click nas linhas abre detalhes
- Loading spinner durante processamento
- Feedback visual em todas as ações

---

## 🎓 Glossário

**Multa de Pagamento:** Multas que a empresa pagou a terceiros (fornecedores)

**Multa de Recebimento:** Multas que a empresa recebeu de terceiros (clientes)

**Divergência:** Diferença entre os valores ou datas nos dois sistemas

**Conformidade:** Percentual de registros que estão idênticos nos dois sistemas

**Número AIT:** Número da autuação de infração de trânsito

**De-Para:** Mapeamento de campos entre os dois sistemas diferentes

**Locavia:** Sistema de origem dos dados

**Sankhya:** Sistema de destino/conferência dos dados

---

✅ **Pronto! Agora você está preparado para usar o Validador Financeiro LCV-SNK!**
