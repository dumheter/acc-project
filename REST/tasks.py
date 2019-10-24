import os
from celery import Celery
import subprocess


app = Celery('tasks', backend='rpc://', broker='amqp://localhost')


@app.task
def table():
    cmd = "octave"
    args = "Table.m"
    workdir = "../BENCHOP"
    result = subprocess.run([cmd, args], stdout=subprocess.PIPE, cwd=workdir)
    return result.stdout.decode()


@app.task
def test(args):
    cmd = "ls"
    workdir = "../BENCHOP"
    result = subprocess.run([cmd, args], stdout=subprocess.PIPE, cwd=workdir)
    return result.stdout.decode()
