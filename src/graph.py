import logging
import sys
from logging import StreamHandler, Formatter
from src.node import Node
from src.edge import Edge


class SingletonMeta(type):
    """
    Мета класс, скрывающий конструктор
    """

    _instances = {}

    def __call__(cls, *args, **kwargs):
        """
        Данная реализация не учитывает возможное изменение передаваемых
        аргументов в `__init__`.
        """
        if cls not in cls._instances:
            instance = super().__call__(*args, **kwargs)
            cls._instances[cls] = instance
        return cls._instances[cls]


class Graph(metaclass=SingletonMeta):

    def __init__(self):
        self._nodes = set()
        self._edges = set()
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)
        handler = StreamHandler(stream=sys.stdout)
        handler.setFormatter(Formatter(fmt='[%(asctime)s %(name)s: %(levelname)s] %(message)s'))
        self.logger.addHandler(handler)
        self.logger.info('Create Graph object')

    def get_nodes(self):
        self.logger.info('Return Graph nodes')
        return self._nodes

    def add_node(self, n: Node) -> set:
        """
        Adding node to Graph node's list
        :param n: node
        :return: list of nodes with added node
        """
        self.logger.info(f'Add node "{n.name}" to Graph')
        self._nodes.add(n)
        self.logger.info(f'Node "{n.name}" added to Graph')
        return self._nodes

    def get_edges(self):
        self.logger.info('Return Graph edges')
        return self._edges

    def add_edge_nodes(self, n_start: Node, n_finish: Node) -> set:
        """
        Create new edge based on nodes [n_start, n_finish] and add this edge in Graph
        :param n_start:
        :param n_finish:
        :return: list of edges
        """
        e = Edge(n_start=n_start, n_finish=n_finish, name=n_start.name + '-' + n_finish.name)
        self.logger.info(f'Add edge "{e.name}" to Graph')
        self._edges.add(e)
        self.logger.info(f'Edge "{e.name}" added to Graph')
        return self._edges

    def add_edge_edge(self, e: Edge) -> set:
        """
        Add new edge in Graph
        :param e: Edge
        :return: list of edges
        """
        self.logger.info(f'Add edge "{e.name}" to Graph')
        self._edges.add(e)
        self.logger.info(f'Edge "{e.name}" added to Graph')
        return self._edges
