# -*- coding: utf-8 -*-
"""
Created on Tue Jun  9 13:55:37 2020

@author: Test

"""
import numpy as np

def roundPartial (value, resolution):
    return round (value / resolution) * resolution


for i in np.nditer(w_col_1csv, op_flags = ['readwrite']):
    i[...] = roundPartial (i[...], 0.0625);