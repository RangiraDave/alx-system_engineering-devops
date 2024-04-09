#!/usr/bin/python3
""" Script to create a recursive function calling get request to reddit API.
"""

import requests


def recurse(subreddit, hot_list=[], after=None):
    """
    Function to take care of the logic to:
    quiry the reddit API and returns list containing titles of all
    hot articles for a given subreddit.
    """

    url = f'https://www.reddit.com/r/{subreddit}/hot.json'
    header = {'User-Agent': 'Custom User Agent'}
    params = {'after': after} if after else {}

    try:
        req = requests.get(url, headers=header, params=params, allow_redirects=False)
        req.raise_for_status()

        data = req.json()

        if 'data' in data and 'children' in data['data']:
            posts = [p['data']['title'] for p in data['data']['children']]
            hot_list.extend(posts)

            if data['data']['after'] is not None:
                recurse(subreddit, hot_list, data['data']['after'])
    except requests.exceptions.HTTPError:
        return None

    return hot_list
