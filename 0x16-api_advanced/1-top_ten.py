#!/usr/bin/python3
""" Script to send a request to a Reddit API """

import requests


def top_ten(subreddit):
    """ Function to print a titles of the top 10 hot posts. """

    url = f'https://www.reddit.com/r/{subreddit}/hot.json'
    header = {'User-Agent': 'Custom User Agent'}

    try:
        req = requests.get(url, headers=header)
        req.raise_for_status()

        data = req.json()
        # top_ten = []

        for post in data['data']['children'][:10]:
            print(post['data']['title'])

    except Exception:
        print('None')
