# 🔴 Problema de Acesso ao MySQL (Sankhya)

## ❌ Erro Atual
```
Error: connect ETIMEDOUT 34.206.174.119:3306
```

## 🔍 Diagnóstico

O servidor MySQL Sankhya **não está acessível** da sua máquina. O timeout indica que a conexão está sendo bloqueada por:

1. **Security Group da AWS** - O RDS não permite conexões do seu IP
2. **VPN** - Você precisa estar conectado na VPN corporativa
3. **Firewall** - Firewall local ou corporativo bloqueando a porta 3306
4. **IP Whitelist** - Seu IP não está na lista de IPs permitidos

---

## ✅ SQL Server Locavia - FUNCIONANDO!

O banco Locavia está **funcionando perfeitamente** e já conseguiu buscar **4.028 registros**.

---

## 🚀 SOLUÇÃO TEMPORÁRIA: Usar Apenas Locavia

Enquanto você resolve o acesso ao MySQL com o administrador, **você já pode usar a aplicação** apenas com dados do Locavia!

### Novas Rotas Disponíveis:

#### 1. Multas de Pagamento (Apenas Locavia)
```
POST /api/validation/pagamento-locavia
```

**Exemplo de requisição:**
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
      "total": 4028,
      "source": "Locavia"
    },
    "records": [
      { ... todos os registros ... }
    ]
  }
}
```

#### 2. Multas de Recebimento (Apenas Locavia)
```
POST /api/validation/recebimento-locavia
```

---

## 🔧 Como Resolver o Acesso ao MySQL

### Passo 1: Verificar VPN
**Você está conectado na VPN da empresa?**

Se o banco Sankhya está na AWS e é privado, você **precisa estar na VPN** para acessar.

### Passo 2: Testar Conectividade

Execute o teste de rede:
```bash
node test-network.js
```

Ou teste manualmente com telnet:
```bash
telnet prd-bd-mysql-sankhya-asalocadora.c9rkbcg3f2at.us-east-1.rds.amazonaws.com 3306
```

### Passo 3: Verificar com Administrador

Pergunte ao administrador de banco de dados ou DevOps:

1. **Meu IP precisa estar liberado no Security Group?**
   - IP atual: (descubra com `curl ifconfig.me`)
   - Peça para liberar no Security Group do RDS

2. **Preciso estar na VPN?**
   - Qual VPN devo usar?
   - Como conectar?

3. **Existem credenciais diferentes para acesso externo?**

4. **Há um bastion host ou jump server?**
   - Preciso tunelizar a conexão?

### Passo 4: Testar com Ferramentas

Tente conectar usando:

**MySQL Workbench:**
```
Host: prd-bd-mysql-sankhya-asalocadora.c9rkbcg3f2at.us-east-1.rds.amazonaws.com
Port: 3306
Username: tulio.barreto
Password: 2rhcrugz9t=4vx?#qx
Database: SANKHYA_PROD
```

**Linha de comando:**
```bash
mysql -h prd-bd-mysql-sankhya-asalocadora.c9rkbcg3f2at.us-east-1.rds.amazonaws.com -P 3306 -u tulio.barreto -p SANKHYA_PROD
```

Se conseguir conectar por essas ferramentas, o problema está na configuração do código (improvável).

Se **não** conseguir conectar, é problema de rede/firewall.

---

## 🔐 Security Group AWS - Exemplo

O administrador precisa adicionar uma regra parecida com:

```
Type: MySQL/Aurora
Protocol: TCP
Port: 3306
Source: SEU_IP/32  (ou a faixa da VPN)
```

---

## 📝 Informações Úteis para o Administrador

**RDS Endpoint:**
```
prd-bd-mysql-sankhya-asalocadora.c9rkbcg3f2at.us-east-1.rds.amazonaws.com
```

**Resolvido para IP:**
```
34.206.174.119
```

**Região AWS:**
```
us-east-1 (Norte da Virgínia)
```

**Porta:**
```
3306 (MySQL padrão)
```

**Erro:**
```
connect ETIMEDOUT
```
Significa: A conexão não foi aceita nem recusada, apenas não respondeu (timeout) = bloqueio de firewall/security group.

---

## ✅ Quando o MySQL Voltar a Funcionar

Assim que você conseguir acesso ao MySQL:

1. Reinicie o servidor: `npm run dev`
2. Use as rotas originais:
   - `POST /api/validation/pagamento` (com comparação)
   - `POST /api/validation/recebimento` (com comparação)
3. A aplicação vai comparar Locavia vs Sankhya automaticamente

---

## 🆘 Precisa de Ajuda?

Entre em contato com:
- **Equipe de DevOps/Infraestrutura** - Para liberar acesso
- **DBA do Sankhya** - Para verificar permissões
- **Equipe de Redes** - Para configurar VPN se necessário

---

## 📊 Status Atual

| Banco | Status | Mensagem |
|-------|--------|----------|
| **Locavia (SQL Server)** | ✅ **FUNCIONANDO** | 4.028 registros encontrados |
| **Sankhya (MySQL)** | ❌ **BLOQUEADO** | Timeout de conexão - problema de rede/firewall |

**Conclusão:** Você pode usar a aplicação com os dados do Locavia enquanto resolve o acesso ao MySQL!
