# Machine Translation: English to French Model Deployment

This challenge involves deploying our English-to-French translation model using two different methods: **Flask with Docker** and **Gradio**. Below are step-by-step instructions for each approach.

---

## 🚀 Flask & Docker Deployment

### 1️⃣ Clone the Repository
```bash
git clone (https://github.com/RamezCh/flask_machine_translation_eng_fr.git)
cd flask_machine_translation_eng_fr
```

### 2️⃣ Build and Run the Docker Container
```bash
docker build -t translation-app .
docker run -p 5000:5000 translation-app
```

### 3️⃣ Test with Postman

Once the container is running, send a POST request to test the translation:

#### Using Postman:
- **URL:** `http://localhost:5000`
- **Method:** `POST`
- **Headers:** `Content-Type: application/json`
- **Body (JSON):**
  ```json
  {
    "text": "She is driving a truck."
  }
  ```
- **Response:**
  ```json
  {
    "translated_text": "Elle conduit un camion."
  }
  ```

### 4️⃣ Using Flask

Go to http://127.0.0.1:5000/

Type what you want to translate

Hit Translate

You now have your French translation!

---

## 🌐 Gradio Deployment

### 🔗 Access the Gradio Notebook
[Click here to open the Google Colab notebook](https://colab.research.google.com/drive/1u6lNay9D6_VhPVjsJD0mdqEzPvuyo-00?usp=sharing)

### 📌 Why Use Gradio?
- No need for **Flask** or **Docker**
- Provides an **interactive UI** for testing translations
- Generates a **public link** for easy sharing
