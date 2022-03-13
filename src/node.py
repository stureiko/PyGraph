import logging
import sys


class Node:
    """
    Class of graph node
    contain all node's data and functions
    """
    def __init__(self, name='none'):
        self.name = name
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)
        handler = logging.StreamHandler(stream=sys.stdout)
        handler.setFormatter(logging.Formatter(fmt='[%(asctime)s %(name)s: %(levelname)s] %(message)s'))
        self.logger.addHandler(handler)
        self.logger.info(f'Create Node: "{self.name}" object')

    def __str__(self):
        self.logger.info(f'Print Node: "{self.name}" object')
        return self.name
