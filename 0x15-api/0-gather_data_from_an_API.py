#!/usr/bin/python3
"""
Python script to print TODO info of id given as an argument
using REST API
"""

from sys import argv
import requests


def get_info(emp_id):
    """
    Function to Retrieves and displays the TODO list
    progress of a given employee using a REST API.
    """

    url = f'https://jsonplaceholder.typicode.com/todos?userId={emp_id}'
    url1 = f'https://jsonplaceholder.typicode.com/users/{emp_id}'

    emp = requests.get(url1)
    name = emp.json()['name'] if emp.status_code == 200 else _

    resp = requests.get(url)
    if resp.status_code == 200:
        todos = resp.json()
        completed = sum(todo['completed'] for todo in todos)
        total = len(todos)

        print(f'Employee {name} is done with tasks({completed}/{total}):')

        for todo in todos:
            if todo['completed']:
                print(f'\t{todo["title"]}')
    else:
        print("API error occourd!")


if __name__ == '__main__':
    get_info(argv[1])
