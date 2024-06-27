#!/bin/sh
 
# Run the application in the background
if [ "$FLASK_ENV" = "development" ]; then
    flask run --host=0.0.0.0 --port=5000 &
else
    gunicorn --bind 0.0.0.0:5001 app:app &
fi
 
# Sleep for a specified time (e.g., 60 seconds)
sleep 60
 
# Stop the application
kill %1