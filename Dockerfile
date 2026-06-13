# MailPilot — Python / FastAPI
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# app.py 读取 $PORT 并监听 0.0.0.0（默认 5000）
ENV PORT=5000
EXPOSE 5000

CMD ["python", "app.py"]
