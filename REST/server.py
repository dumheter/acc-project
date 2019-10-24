from flask import Flask, request
import subprocess
import sys
import tasks


app = Flask(__name__)


@app.route('/benchop/run', methods=['GET'])
def benchop_run():
    problem = ""
    try:
        problem = request.args.get("problem")
        if problem == None:
            err_msg =  "No problem specified, specify a prolem by adding '?problem=...'.\n"
            err_msg += "Available commands are:\n"
            err_msg += tasks.list_problems()
            return err_msg
    except:
        return "Failed to process request. Did you forget to specify a problem via '?problem=...'.\n"

    print("problem: {}".format(problem))
    result = ""
    try:
        result = tasks.problem.delay(problem).get(timeout=60)
    except:
        result = "Problem {} took to long to run.\n".format(problem)
    return result


@app.route('/benchop/ls', methods=['GET'])
def benchop_ls():
    return "Available problems are:\n{}".format(tasks.list_problems())


if __name__ == '__main__':
    app.run(host='0.0.0.0',port=4567,debug=True, use_reloader=False)
