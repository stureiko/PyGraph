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
    # _nodes = []
    # _edges = []

    def __init__(self):
        self._nodes = set()
        self._edges = set()

    def get_nodes(self):
        return self._nodes

    def add_node(self, n: Node) -> set:
        """
        Adding node to Graph node's list
        :param n: node
        :return: list of nodes with added node
        """
        self._nodes.add(n)
        return self._nodes

    def get_edges(self):
        return self._edges

    def add_edge_nodes(self, n_start: Node, n_finish: Node) -> set:
        """
        Create new edge based on nodes [n_start, n_finish] and add this edge in Graph
        :param n_start:
        :param n_finish:
        :return: list of edges
        """
        self._edges.add(Edge(n_start=n_start, n_finish=n_finish))
        return self._edges

    def add_edge_edge(self, e: Edge) -> set:
        """
        Add new edge in Graph
        :param e: Edge
        :return: list of edges
        """
        self._edges.add(e)
        return self._edges
