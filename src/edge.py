import logging
import logging.config
import matplotlib


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

    def print_edge(self,
                   ax: matplotlib.axes,
                   show_caption=False,
                   show_arrow=False) -> int:
        if show_arrow:
            a_length = 2
            a_width = 2
        else:
            a_length = 0
            a_width = 0

        ax.arrow(self.n_start.x,
                 self.n_start.y,
                 self.n_finish.x - self.n_start.x,
                 self.n_finish.y - self.n_start.y,
                 linewidth=1,
                 head_length=a_length, head_width=a_width, color='k', linestyle='-')

        if show_caption:
            ax.text((self.n_finish.x - self.n_start.x)/2,
                    (self.n_finish.y - self.n_start.y)/2,
                    self.name, size=12)
        # if OK - return 0
        return 0
