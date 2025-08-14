from flask import Flask, request, jsonify, render_template
import numpy as np
import tensorflow as tf
from tensorflow.keras.preprocessing.sequence import pad_sequences
import re
import pickle
import os

# Define model path
MODEL_DIR = "model"

# Load trained model
model_path = os.path.join(MODEL_DIR, "my_model.keras")
model = tf.keras.models.load_model(model_path)

# Load tokenizers
with open(os.path.join(MODEL_DIR, "eng_tokenizer.pkl"), "rb") as f:
    eng_tokenizer = pickle.load(f)

with open(os.path.join(MODEL_DIR, "fr_tokenizer.pkl"), "rb") as f:
    fr_tokenizer = pickle.load(f)

max_eng_length = 15
max_fr_length = 21

def clean_text(text):
    text = text.lower()
    text = re.sub(r'[^a-z]', ' ', text)
    text = re.sub(r'\s+', ' ', text)
    text = text.strip()
    return text

# Translation function
def translate_sentence(input_sentence):
    input_sentence = clean_text(input_sentence)
    input_sequence = eng_tokenizer.texts_to_sequences([input_sentence])
    input_padded = pad_sequences(input_sequence, maxlen=max_eng_length, padding='post')
    target_seq = np.zeros((1, 1))
    target_seq[0, 0] = fr_tokenizer.word_index['start']
    decoded_sentence = ''
    for _ in range(max_fr_length - 1):
        output = model.predict([input_padded, target_seq], verbose=0)
        sampled_word_index = np.argmax(output[0, -1, :])
        sampled_word = fr_tokenizer.index_word.get(sampled_word_index, '')
        if sampled_word == 'end':
            break
        decoded_sentence += ' ' + sampled_word
        target_seq = np.append(target_seq, [[sampled_word_index]], axis=1)
    return decoded_sentence.strip()

# Flask App
app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route("/translate", methods=["POST"])
def translate():
    data = request.json
    input_text = data.get("text", "")
    if not input_text:
        return jsonify({"error": "No input text provided"}), 400
    translation = translate_sentence(input_text)
    return jsonify({"translation": translation})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)