# 1. Imagem Base
# Usando uma versão estável do Python com base Alpine para uma imagem menor.
FROM python:3.11-alpine

# 2. Diretório de Trabalho
# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# 3. Instalação de Dependências
# Copia o arquivo de dependências primeiro para aproveitar o cache do Docker.
COPY requirements.txt .
# Instala as dependências sem gerar cache para manter a imagem leve.
RUN pip install --no-cache-dir -r requirements.txt

# 4. Cópia do Código da Aplicação
# Copia o restante dos arquivos da aplicação para o diretório de trabalho.
COPY . .

# 5. Exposição da Porta
# Informa ao Docker que o contêiner escuta na porta 8000.
EXPOSE 8000

# 6. Comando de Execução
# Executa a aplicação com uvicorn.
# --host 0.0.0.0 torna a aplicação acessível de fora do contêiner.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
