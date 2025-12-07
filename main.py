from flask import Flask, render_template
import logging

app = Flask(__name__)

# configure logging
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s %(levelname)s %(name)s: %(message)s"
)
app.logger.setLevel(logging.INFO)


@app.route("/")
def index():
    app.logger.info("Index page accessed")
    return render_template("index.html")


if __name__ == "__main__":
    app.run(debug=True, port=80, host="0.0.0.0")
