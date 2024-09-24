#!/usr/bin/python3
# Printing hello world in flask

from flask import Flask, url_for, render_template
from markupsafe import escape

app = Flask(__name__)

@app.route("/")
def index():
    return "<centre>Welcome to my Home page</centre>"

@app.route("/<string:name>")
def hola(name):
    a = 'Can you detect me?'
    return f"<b>Hello World of Flask!</b> {escape(name)}"

@app.route('/<int:age>')
def age(age):
    return f"<m> Hey, You are {age} years old!</m>"

# url_for('static', filename='static.css')

@app.route('/login')
def login():
    return render_template('user_page.html')
