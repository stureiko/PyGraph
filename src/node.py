import logging
import logging.config


class Node:
    # //TODO: TVP-29: Create node_id as a key in dict (in Graph class) for quick access to definite node
    """
    Class of graph node
    contain all node's data and functions
    """

    def __init__(self, name='none', x=0, y=0):
        self.name = name
        self.x = x
        self.y = y
        self.logger = logging.getLogger(__name__)
        self.logger.info(f'Create Node: "{self.name}" object')

    def __str__(self):
        self.logger.info(f'Print Node: "{self.name}" object')
        return self.name

    def get_point(self) -> (float, float):
        return self.x, self.y
