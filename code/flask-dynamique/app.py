from flask import Flask, render_template

app = Flask(__name__)

# Données simulées (par exemple, une base de données d'articles)
articles = {
    1: {'titre': 'Article 1', 'contenu': 'Contenu du premier article.'},
    2: {'titre': 'Article 2', 'contenu': 'Contenu du deuxième article.'},
    3: {'titre': 'Article 3', 'contenu': 'Contenu du troisième article.'}
}

@app.route('/')
def index():
    return render_template('index.html', articles=articles)

@app.route('/article/<int:id>')
def afficher_article(id):
    article = articles.get(id)
    if article:
        return render_template('article.html', article=article)
    else:
        return f"Aucun article trouvé avec l'id {id}", 404

if __name__ == '__main__':
    app.run(debug=True)