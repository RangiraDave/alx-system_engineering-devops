#!/usr/bin/python3
"""
Python script to print TODO info of id given as an argument
using REST API and export data in JSON format.
"""

import json
import requests
import sys


def get_info(emp_id):
    """
    Retrieves and displays the TODO list progress of a given employee
    using a REST API and exports data in JSON format.
    """
    url = f'https://jsonplaceholder.typicode.com/todos?userId={emp_id}'
    url1 = f'https://jsonplaceholder.typicode.com/users/{emp_id}'

    emp = requests.get(url1)
    name = emp.json()['username'] if emp.status_code == 200 else None

    resp = requests.get(url)
    if resp.status_code == 200:
        todos = resp.json()
        completed_tasks = []

        for todo in todos:
            task_info = {
                    "task": todo["title"],
                    "completed": todo["completed"],
                    "username": name
            }
            completed_tasks.append(task_info)

        output_filename = f'{emp_id}.json'
        with open(output_filename, 'w') as outfile:
            json.dump({emp_id: completed_tasks}, outfile)

        print(f'Data exported successfully to {output_filename}')
    else:
        print("API error occurred!")


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python3 gather_data_from_an_API.py <employee_id>")
    else:
        get_info(sys.argv[1])
