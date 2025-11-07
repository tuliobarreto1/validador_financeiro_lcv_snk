# ⚡ Início Rápido - 3 Passos

## Para usuários de Windows

### Opção 1: Duplo clique no arquivo

1. Dê **duplo clique** no arquivo `iniciar.bat`
2. Aguarde as janelas abrirem
3. Acesse: **http://localhost:3003**

### Opção 2: Linha de comando

```bash
# Abrir terminal na pasta do projeto
iniciar.bat
```

---

## Para usuários de Linux/Mac

### Primeiro acesso (dar permissão)

```bash
chmod +x iniciar.sh
chmod +x parar.sh
```

### Iniciar a aplicação

```bash
./iniciar.sh
```

### Parar a aplicação

```bash
./parar.sh
```

---

## 📋 Checklist Primeira Execução

- [ ] Node.js instalado (versão 16+)
- [ ] Abrir terminal na pasta do projeto
- [ ] Executar script de inicialização
- [ ] Aguardar as mensagens de sucesso
- [ ] Abrir navegador em http://localhost:3003

---

## 🎯 Primeira Validação

1. Selecione: **Multas de Pagamento**
2. Mantenha o ano atual
3. Clique em: **🔍 Validar**
4. Aguarde 10-30 segundos
5. Veja os resultados!

---

## ❓ Problemas?

### Backend não inicia
```bash
cd backend
npm install
npm start
```

### Frontend não inicia
```bash
cd frontend
npm install
npm run dev
```

### Porta já em uso
- Feche outros programas usando as portas 3003 ou 3001
- Ou edite as configurações nos arquivos:
  - Backend: `backend/.env` (mude PORT)
  - Frontend: `frontend/vite.config.js` (mude port)

---

## 📚 Quer saber mais?

- **Instalação detalhada:** `INSTALACAO.md`
- **Como usar:** `COMO_USAR.md`
- **Documentação completa:** `README.md`
- **Estrutura do projeto:** `ESTRUTURA_PROJETO.txt`

---

## 🚀 URLs Úteis

- **Aplicação:** http://localhost:3003
- **Backend:** http://localhost:3001
- **Verificar saúde do backend:** http://localhost:3001/health
- **Testar conexões:** http://localhost:3001/api/validation/test-connections

---

✅ **É isso! Simples assim!**
