import os
from celery import Celery
import subprocess


app = Celery('tasks', backend='rpc://', broker='amqp://localhost')


@app.task
def test(args):
    counts = []
    cmd = "ls"
    workdir = "../BENCHOP"
    
    result = subprocess.check_output([cmd, args, workdir])

    return result.decode()
