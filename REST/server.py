from flask import Flask, request
from celery.states import FAILURE, SUCCESS
import subprocess
import sys
import tasks


app = Flask(__name__)
results = []


@app.route('/benchop/status', methods=['GET'])
def benchop_status():
    global results
    if len(results) == 0:
        return "You need to run Benchop first, call benchop/run_all.\n"

    # check for any fails
    for result in results:
        if result.state == FAILURE:
            results = []
            return "A task failed to complete, rerun benchop.\n"

    # check for pending status
    for result in results:
        if result.state != SUCCESS:
            return "Benchop is still running.\n"

    # success
    result = ""
    try:
        for r in results:
            result += r.get()
            print("got result for {}".format(r))
    except Exception as e:
        return "Exception [{}]\n".format(e)
    
    return result


@app.route('/benchop/run_all', methods=['GET'])
def benchop_run_all():
    global results
    if len(results) > 0:
        return "Benchop is already running\n"
    
    try:
        for command in tasks.problems_commands:
            if command != "all":
                print("queing task {}".format(command))
                results.append(tasks.problem.delay(command))

        print("queued up tasks, waiting for result")

    except Exception as e:
        result = "Problem [{}]\n".format(e)

    return "Benchop is running, call benchop/status for results.\n"


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
