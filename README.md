# 🗣️ English to French Machine Translation App

This project is a simple **Flask-based web application** that translates text from **English to French** using a pre-trained machine translation model.

---

## 🚀 Features
- Translate sentences from **English → French**
- Simple, responsive HTML interface
- Powered by a pre-trained machine learning model
- Ready for deployment on **Render**, **Heroku**, or locally via **Docker**

---

## 🛠️ Setup Instructions

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/flask_machine_translation_eng_fr.git
cd flask_machine_translation_eng_fr

2️⃣ Create a Virtual Environment & Install Dependencies

python -m venv venv
source venv/bin/activate   # On macOS/Linux
venv\Scripts\activate      # On Windows

pip install -r requirements.txt

3️⃣ Run Locally
python app.py
Open your browser and go to http://127.0.0.1:5000/

🐳 Run with Docker
Build the Image

docker build -t eng-fr-translator .


Run the Container
docker run -p 5000:5000 eng-fr-translator

📌 How to Use

Open the app in your browser.
Enter your English sentence into the input field.
Click Translate.
The translated French text will appear below.


⚠️ Known Issues / Limitations

Model may produce less accurate results for long or complex sentences.
Internet connection may be required for loading large pre-trained models.
UI is minimal — can be improved for better user experience.

📸 Preview
<img width="1906" height="906" alt="image" src="https://github.com/user-attachments/assets/5de2e14f-fead-42c9-a37f-a58e585d5605" />

