#!/usr/bin/python3
"""
Python script to print TODO info of id given as an argument
using REST API
"""

import csv
import requests
from sys import argv


def get_info(emp_id):
    """
    Function to Retrieves and displays the TODO list
    progress of a given employee using a REST API.
    """

    url = f'https://jsonplaceholder.typicode.com/todos?userId={emp_id}'
    url1 = f'https://jsonplaceholder.typicode.com/users/{emp_id}'

    emp = requests.get(url1)
    uname = emp.json()['username'] if emp.status_code == 200 else _

    resp = requests.get(url)
    if resp.status_code == 200:
        todos = resp.json()
        # completed = sum(todo['completed'] for todo in todos)
        # print(f'Employee {name} is done with tasks({completed}/{total}):

        data = []
        for todo in todos:
            data.append([
                f'"{str(emp_id)}"', f'"{str(uname)}"',
                f'"{str(todo["completed"])}"',
                f'"{str(todo["title"])}"'
            ])

        filename = f'{emp_id}.csv'
        with open(filename, 'w', newline='') as f:
            writer = csv.writer(f)
            writer.writerows(data)
    else:
        print("API error occourd!")


if __name__ == '__main__':
    get_info(argv[1])
