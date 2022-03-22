import logging
import logging.config
import matplotlib


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

    def print_node(self,
                   ax: matplotlib.axes,
                   show_caption=True) -> int:
        # //TODO: Add docstring for print_node
        ax.scatter(self.x, self.y, s=4, color='r')
        if show_caption:
            ax.text(self.x + 4, self.y + 4, self.name, size=12)
        # if OK - return 0
        return 0
