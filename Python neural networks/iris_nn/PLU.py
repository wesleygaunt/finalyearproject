# -*- coding: utf-8 -*-
"""
Created on Sun Feb  9 13:54:31 2020

@author: Test
"""
c=0.5
m1 = 0.75
m2 = 0.1
b = 0.5
import numpy as np 
import matplotlib.pyplot as plt

T=np.array([-3,-2,-1,0,1,2,3],dtype = float)
T = 0.5*T
def sigmoid(t): #now leaky ReLU
    #t is the input 
     #return t * (t > 0)
     #return (np.exp(t)-np.exp(-t))/(np.exp(t)+np.exp(-t))
     #return (m1*x + c)*(np.abs(x)<=b) + ((m2*(x-b))+((m1*b)+c))*(x>b) + ((m2*(x+b))-(m1*b)+c)*(x<-1*b)
    return 1/(1+np.exp(-t))

# Derivative of sigmoid
def sigmoid_derivative(p):  #takes output 
     #return 1. * (p > 0)
     #return (m1)*(y<=(m1*b)+c)*(y>=(-1*m1*b)+c) + (m2)*(y>((m1*b)+c)) + (m2)*(y<((-1*m1*b)+c))
    return p * (1 - p)
    
P = sigmoid(T)
dp = sigmoid_derivative(P)

plt.scatter(T, P)
plt.title("IRIS DATA | Blue - Versicolor, Red - Virginica ")
plt.xlabel('Petal Length')
plt.ylabel('Petal Width')
plt.show()