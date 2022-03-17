import logging
import logging.config


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
        self.logger.info(f'Create Edge "{self.name}" object')

    def __str__(self):
        self.logger.info(f'Print Edge "{self.name}" object')
        return self.name
