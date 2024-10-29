from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/saluer', methods=['POST'])
def greet():
    prenom = request.form['prenom']
    return render_template('saluer.html', prenom=prenom)

if __name__ == '__main__':
    app.run(debug=True)