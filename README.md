## 🎯 Como Usar

### Iniciar o Backend

```bash
cd backend
npm start
```

O backend estará disponível em: `http://localhost:3001`

Para desenvolvimento com hot-reload:
```bash
npm run dev
```

### Iniciar o Frontend

Em outro terminal:

```bash
cd frontend
npm run dev
```

O frontend estará disponível em: `http://localhost:3003`

### Acessar a Aplicação

1. Abra o navegador em `http://localhost:3003`
2. Selecione o tipo de validação (Pagamento ou Recebimento)
3. Configure os filtros desejados (ano, data inicial, data final)
4. Clique em "Validar"
5. Analise os resultados no dashboard e na tabela de divergências
6. Clique em uma divergência para ver os detalhes completos

## 🔍 Endpoints da API

### GET /health
Verifica o status do servidor

**Resposta:**
```json
{
  "status": "OK",
  "timestamp": "2025-01-06T10:00:00.000Z",
  "uptime": 123.45
}
```

### GET /api/validation/test-connections
Testa as conexões com os bancos de dados

**Resposta:**
```json
{
  "success": true,
  "connections": {
    "locavia": true,
    "sankhya": true,
    "errors": {}
  }
}
```

### POST /api/validation/pagamento
Valida multas de pagamento

**Request Body:**
```json
{
  "year": 2025,
  "startDate": "2025-01-01",
  "endDate": "2025-12-31"
}
```

**Resposta:**
```json
{
  "success": true,
  "data": {
    "summary": {
      "total": 100,
      "matched": 85,
      "divergent": 10,
      "notFoundInSankhya": 5,
      "matchPercentage": "85.00"
    },
    "divergences": [...]
  }
}
```

### POST /api/validation/recebimento
Valida multas de recebimento (mesma estrutura do endpoint de pagamento)

## 🎨 Interface

### Características Visuais

- **Design Sóbrio e Profissional**: Cores neutras com destaques em azul
- **Responsivo**: Funciona em desktop, tablet e mobile
- **Cards Informativos**: Estatísticas claras e objetivas
- **Tabela Paginada**: Visualização organizada de divergências
- **Modal de Detalhes**: Informações completas de cada divergência
- **Badges de Status**: Identificação visual rápida do tipo de divergência

### Cores

- **Primária**: #2c3e50 (Azul escuro)
- **Secundária**: #34495e (Cinza azulado)
- **Sucesso**: #27ae60 (Verde)
- **Alerta**: #f39c12 (Laranja)
- **Erro**: #e74c3c (Vermelho)
- **Destaque**: #3498db (Azul)

## 📊 Lógica de Comparação

### Campos Comparados

#### Multas de Pagamento
- **Número AIT** → NUMNOTA
- **CNPJCPF_1** → AD_IDEXTERNO
- **Data** → DTNEG
- **ValorCobradoMulta** → VLRTOT

#### Multas de Recebimento
- **Número AIT** → NUMNOTA
- **CNPJCPF** → AD_IDEXTERNO
- **Data** → DTNEG
- **Valor** → VLRTOT

### Tolerâncias

- **Valores**: Diferença máxima de R$ 0,01 (tolerância de 1 centavo)
- **Datas**: Devem ser exatamente iguais (sem tolerância)

### Tipos de Divergência

1. **NOT_FOUND_IN_SANKHYA**: Registro existe no Locavia mas não foi encontrado no Sankhya
2. **DIVERGENT**: Registro encontrado em ambos, mas com diferenças nos valores ou datas

## 🛠️ Tecnologias Utilizadas

### Backend
- express: ^4.18.2
- cors: ^2.8.5
- dotenv: ^16.3.1
- mysql2: ^3.6.5
- tedious: ^16.6.1
- date-fns: ^3.0.6

### Frontend
- react: ^18.2.0
- react-dom: ^18.2.0
- axios: ^1.6.2
- date-fns: ^3.0.6
- vite: ^5.0.8

## 📝 Scripts Disponíveis

### Backend
- `npm start`: Inicia o servidor em modo produção
- `npm run dev`: Inicia o servidor em modo desenvolvimento com nodemon

### Frontend
- `npm run dev`: Inicia o servidor de desenvolvimento
- `npm run build`: Cria build de produção
- `npm run preview`: Visualiza o build de produção

## 🔒 Segurança

- As credenciais estão armazenadas em variáveis de ambiente
- Arquivo `.env.example` disponível para referência
- `.gitignore` configurado para não versionar dados sensíveis
- Timeout de 60 segundos nas requisições para evitar travamentos

## 🐛 Troubleshooting

### Erro de conexão com o banco de dados

1. Verifique se as credenciais no `.env` estão corretas
2. Teste a conexão usando o endpoint `/api/validation/test-connections`
3. Verifique se os servidores de banco de dados estão acessíveis

### Frontend não conecta com o Backend

1. Verifique se o backend está rodando na porta 3001
2. Verifique o proxy no `vite.config.js`
3. Limpe o cache do navegador

### Erro ao instalar dependências

```bash
# Limpar cache do npm
npm cache clean --force

# Remover node_modules e reinstalar
rm -rf node_modules
npm install
```

## 📄 Licença

Este é um projeto interno da empresa.

## 👥 Suporte

Para dúvidas ou problemas, entre em contato com a equipe de TI.
