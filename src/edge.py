import logging
import logging.config

import matplotlib as matplotlib


class Edge:
    """
    Class of graph Edge
    contains all edge's data and functions
    """

    def __init__(self, name=None, n_start=None, n_finish=None, tvp=0, flow=0):
        self.n_finish = n_finish
        self.n_start = n_start
        self.tvp = tvp
        self.flow = flow

        if not name and n_start and n_finish:
            self.name = n_start.name + '-' + n_finish.name

        self.logger = logging.getLogger(__name__)
        self.logger.info(f'Create Edge "{self.name}" object')

    def __str__(self):
        self.logger.info(f'Print Edge "{self.name}" object')
        return self.name

    def show_edge(self, ax):
        self.logger.info(f'Show Edge "{self.name}" object')
        ax.arrow(self.n_start.x,
                 self.n_start.y,
                 self.n_finish.x - self.n_start.x,
                 self.n_finish.y - self.n_start.y,
                 linewidth=1,
                 head_length=0, head_width=0, color='r', linestyle='-')
        print(ax)
