from src.node import Node


class Edge:
    """
    Class of graph Edge
    contain all edges's data and functions
    """

    def __init__(self, name='none', n_start=None, n_finish=None):
        self.n_finish = n_finish
        self.n_start = n_start
        self.name = name

    def __str__(self):
        return self.name
