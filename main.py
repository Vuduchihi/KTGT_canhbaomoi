import sys
import requests #gửi request http tới telegram app
from datetime import datetime
import pytz #mui giờ

IST = pytz.timezone('Asia/Saigon')
raw_TS = datetime.now(IST)
curr_date = raw_TS.strftime("%d-%m-%Y")
curr_time = raw_TS.strftime("%H:%M:%S")

telegram_auth_token = "5476041182:AAG3E8Hf3SJsjJN8_wxLGH8XFQc7ASJ0Ids"
telegram_group_id = "vuduc_noti"

msg = f" Message received on {curr_date} at {curr_time}"

def send_msg_on_telegram(message):
    telegram_api_url = f"https://api.telegram.org/bot{telegram_auth_token}/sendMessage?chat_id=@{telegram_group_id}&text={message}"
    tel_resp = requests.get(telegram_api_url)

    if tel_resp.status_code == 200:
        print("INFO: Notification has been sent on Telegram")
    else:
        print("ERROR: Could not send Message")

content = sys.argv[1] # đầu vào sẽ là nội dung của folder results

msg = f"{msg}\nNoidung:{content}"

send_msg_on_telegram(msg)

