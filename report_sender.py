import os
import requests
import time
from datetime import datetime

# Webhook beállítások
WEBHOOK_URL = "https://discord.com/api/webhooks/1504925264348581918/SdwKnaamhRvWBbbTZ5Q9MwhUEYOyOo-JWc09sjkkVOCmv8Q_NmSSmG1awHDisisEXFXz"  # Cseréld ki a webhook URL-re

# Fájl elérési útja
file_name = "log.txt"
script_dir = os.path.dirname(os.path.abspath(__file__))
file_path = os.path.join(script_dir, file_name)

def send_log_to_webhook():
    """Elküldi a log.txt tartalmát a webhookra"""
    if not os.path.isfile(file_path):
        print(f"[{datetime.now()}] Hiba: A fájl nem található: {file_path}")
        return False
    
    try:
        # Fájl tartalmának olvasása
        with open(file_path, 'r', encoding='utf-8') as f:
            log_content = f.read()
        
        # Ha a fájl üres, ne küldjük el
        if not log_content.strip():
            print(f"[{datetime.now()}] Üres log fájl, nincs mit küldeni")
            return True
        
        # Webhook payload
        payload = {
            "content": f"**Log tartalom ({datetime.now()})**\n```\n{log_content[:1900]}\n```"
        }
        
        # Küldés a webhookra
        response = requests.post(WEBHOOK_URL, json=payload)
        
        if response.status_code == 204:
            print(f"[{datetime.now()}] Sikeresen elküldve a webhook!")
            return True
        else:
            print(f"[{datetime.now()}] Hiba a küldéskor: {response.status_code}")
            return False
            
    except Exception as e:
        print(f"[{datetime.now()}] Hiba: {str(e)}")
        return False

if __name__ == "__main__":
    send_log_to_webhook()
