from flask import Flask

app = Flask(__name__)

@app.route("/testdata")
def home():
    return "🚀 Python App Deployed Successfully!"
@app.route("/testdata/welcome")
def welcome():
    return "Welcome to the test data page1111111111111111111!"

@app.route("/testdata/status")
def status1():
    return "Status: All systems operational."


@app.route("/testdata/mission")
def some_den():
    return "Mission: Explore the unknown."


# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=8000)