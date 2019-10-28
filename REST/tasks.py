from celery import Celery
import subprocess


app = Celery('tasks', backend='rpc://', broker='amqp://localhost')
#problems_commands = ["all", "1a", "1aII", "1b", "1bII", "1c", "1cII"]
#problems_filenames = ["Global.m", "problem1a.m", "problem1aII.m", "problem1b.m", "problem1bII.m", "problem1c.m", "problem1cII.m"]

problems_commands = ["all", "1a", "1b", "1bII", "1c"]
problems_filenames = ["Global.m", "problem1a.m", "problem1b.m", "problem1bII.m", "problem1c.m"]

def list_problems():
    result = ""
    for command in problems_commands:
        result += command + '\n'
    return result


@app.task
def problem(command):
    cmd = "octave"
    workdir = "../BENCHOP"
    for i in range(0, len(problems_commands)):
        if problems_commands[i] == command:
            args = problems_filenames[i]
            result = subprocess.run([cmd, args], stdout=subprocess.PIPE, cwd=workdir)
            return result.stdout.decode()

    return "Command {} not found, available commands are:\n{}".format(problem, list_problems)
