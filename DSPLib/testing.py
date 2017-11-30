#! /usr/bin/env python3


import sys
from PyQt4 import QtGui
import UI

import matplotlib
import numpy as np
import scipy as sp

if __name__ == "__main__":
    app = QtGui.QApplication(sys.argv)
    gui = UI.UI()
    gui.show()
    sys.exit(app.exec_())
