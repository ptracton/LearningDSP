

from PyQt4 import QtGui
import matplotlib
import matplotlib.dates as mdates
from matplotlib.backends.backend_qt4agg import FigureCanvasQTAgg


class QtMpl(FigureCanvasQTAgg):

    '''
    '''

    def __init__(self, parent):

        self.fig = matplotlib.figure.Figure()

        FigureCanvasQTAgg.__init__(self, self.fig)
        self.setParent(parent)
        self.axes = self.fig.add_subplot(111)
        self.axes.set_ylabel("Y-Axis")
        self.axes.set_xlabel("X-Axis")

        # we define the widget as expandable
        FigureCanvasQTAgg.setSizePolicy(self,
                                        QtGui.QSizePolicy.Expanding,
                                        QtGui.QSizePolicy.Expanding)
        # notify the system of updated policy
        FigureCanvasQTAgg.updateGeometry(self)
        return
