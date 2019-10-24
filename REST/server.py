from flask import Flask, jsonify, request
import subprocess
import sys
import tasks


app = Flask(__name__)


@app.route('/benchop/table', methods=['GET'])
def benchop_table():
    result = tasks.table.delay().get(timeout=30)
    return result


@app.route('/benchop/ls', methods=['GET'])
def benchop_ls():
    args = ""
    try:
        args = request.args.get("args")
        if args == None:
            args = "-lah"
    except:
        args = "-lah"
        
    result = tasks.test.delay(args).get(timeout=30)
    return result


if __name__ == '__main__':
    app.run(host='0.0.0.0',port=4567,debug=True, use_reloader=False)
