#! /usr/bin/env python3

import numpy as np

from PyQt4 import QtGui
from PyQt4 import QtCore
import QtMPL


class UI(QtGui.QMainWindow):

    def __init__(self):
        QtGui.QMainWindow.__init__(self)
        self.setWindowTitle("Some signals stuff")
        self.main_widget = QtGui.QWidget(self)
        top_layout = QtGui.QVBoxLayout(self.main_widget)

        self.mpl = QtMPL.QtMpl(self.main_widget)
        top_layout.addWidget(self.mpl)
        
        self.main_widget.setFocus()
        self.setCentralWidget(self.main_widget)

        return
