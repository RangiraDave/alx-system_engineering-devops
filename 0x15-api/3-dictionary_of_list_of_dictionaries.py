#!/usr/bin/python3
"""
Python script to print TODO information in the REST API and export all data into JSON file.
"""

import json
import requests
import sys


def get_all_info_json():
    """
    Retrieves and displays the TODO list progress of a given employee
    using a REST API and exports data in JSON format.
    """
    # url = f'https://jsonplaceholder.typicode.com/todos?userId={emp_id}'
    url1 = f'https://jsonplaceholder.typicode.com/users'

    emp = requests.get(url1)
    # user = emp.json()

    if emp.status_code == 200:
        users = emp.json()
        all_tasks_info = {}

        for user in users:
            user_id = user['id']
            username = user['username']
            url_todos = f'https://jsonplaceholder.typicode.com/todos?userId={user_id}'
            todo_info = requests.get(url_todos)

            if todo_info.status_code == 200:
                todos = todo_info.json()
                tasks_info = []

                for todo in todos:
                    task_info = {
                            "username": user["username"],
                            "task": todo["title"],
                            "completed": todo["completed"]
                    }
                    tasks_info.append(task_info)

                all_tasks_info[user_id] = tasks_info

        output_filename = 'todo_all_employees.json'
        with open(output_filename, 'w') as outfile:
            json.dump(all_tasks_info, outfile)

        print(f'Data exported successfully to {output_filename}')
    else:
        print("API error occurred!")


if __name__ == '__main__':
    get_all_info_json()
