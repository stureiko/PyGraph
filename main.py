from matplotlib import pyplot as plt

from src.graph import Graph
from src.node import Node
from src.edge import Edge
from src.log_setup import setupLogging
import logging
import os


if __name__ == '__main__':
    if not os.path.exists('logs/'):
        os.mkdir('logs')
    setupLogging()
    logger = logging.getLogger(__name__)
    logger.info('\n')
    logger.info('*' * 10)
    logger.info('Start new session')

    g = Graph()
    n1 = Node(name='Node_1', x=10, y=10)
    n2 = Node(name='Node_2', x=100, y=100)
    n3 = Node(name='Node_3', x=50, y=80)
    g.add_node(n1)
    g.add_node(n2)
    g.add_node(n3)
    e1 = Edge(n_start=n1, n_finish=n2)
    e2 = Edge(n_start=n1, n_finish=n3)
    g.add_edge_edge(e1)
    g.add_edge_edge(e2)

    for n in g.get_nodes():
        print(n)

    for e in g.get_edges():
        print(e)

    g.print_graph()
