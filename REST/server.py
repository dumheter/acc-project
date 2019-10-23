from flask import Flask, jsonify, request
import subprocess
import sys
import tasks
import json


app = Flask(__name__)


@app.route('/benchop/query', methods=['GET'])
def query_phrase():
    problems = ""
    try:
        problems = request.args.get("problems")
    except:
        problems = "1"
    problem_list = pronouns.split(",")

    # TODO
    #... = tasks.task1.delay(keywords).get(timeout=10)

    # TODO response
    #return ...


if __name__ == '__main__':
    app.run(host='0.0.0.0',port=1337,debug=True, use_reloader=False)
