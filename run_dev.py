import os
import subprocess
 
def run_dev():
    os.environ['FLASK_ENV'] = 'development'
subprocess.call(['python', 'app.py'])
 
if __name__ == "__main__":
    run_dev()