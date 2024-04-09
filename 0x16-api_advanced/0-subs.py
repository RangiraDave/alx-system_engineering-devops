#!/usr/bin/python3
""" Function to return number of subscribers from the Reddit API. """

import requests


def number_of_subscribers(subreddit):
    """ The logic is handled here. """

    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    header = {'User-Agent': 'Custom User Agent'}

    try:
        req = requests.get(url, headers=header)
        req.raise_for_status()

        data = req.json()
        count = data['data']['subscribers']
    except Exception: # requests.HTTPError:
        count = 0

    return count
