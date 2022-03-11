class Node:
    """
    Class of graph node
    contain all node's data and functions
    """
    def __init__(self, name='none'):
        self.name = name

    def __str__(self):
        return self.name
