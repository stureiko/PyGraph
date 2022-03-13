import logging
import sys


class Edge:
    """
    Class of graph Edge
    contains all edge's data and functions
    """

    def __init__(self, name=None, n_start=None, n_finish=None):
        self.n_finish = n_finish
        self.n_start = n_start

        if not name and n_start and n_finish:
            self.name = n_start.name + '-' + n_finish.name

        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)
        handler = logging.StreamHandler(stream=sys.stdout)
        handler.setFormatter(logging.Formatter(fmt='[%(asctime)s %(name)s: %(levelname)s] %(message)s'))
        self.logger.addHandler(handler)
        self.logger.info('Create Edge object')

    def __str__(self):
        self.logger.info(f'Print Edge: {self.name} object')
        return self.name
