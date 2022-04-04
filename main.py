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
    n1 = Node(name='Node_1')
    n2 = Node(name='Node_2')
    g.add_node(n1)
    g.add_node(n2)
    e = Edge(n_start=n1, n_finish=n2)
    g.add_edge_edge(e)

    for n in g.get_nodes():
        print(n)
