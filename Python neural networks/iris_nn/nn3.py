# -*- coding: utf-8 -*-
"""
Created on Wed May 27 12:45:00 2020

@author: Test
"""
#https://towardsdatascience.com/writing-python-code-for-neural-network-from-scratch-259b98d6bb43
import numpy as np 
# Activation Functions

def tanh(x): 
   return np.tanh(x) 
def d_tanh(x): 
   return (1 - np.square(np.tanh(x)))
def sigmoid(x): 
   return 1/(1 + np.exp(-x)) 
def d_sigmoid(x): 
   return (1 - sigmoid(x)) * sigmoid(x) 
# Loss Functions 
def logloss(y, a): 
   return -(y*np.log(a) + (1-y)*np.log(1-a)) 
def d_logloss(y, a): 
   return (a - y)/(a*(1 - a)) 

m = 1

# The layer class
class Layer:    
    activationFns = { 
       'tanh': (tanh, d_tanh), 
       'sigmoid': (sigmoid, d_sigmoid) 
    }   
    learning_rate = 0.1 
    def __init__(self, inputs, neurons, activation): 
        self.W = np.random.randn(neurons, inputs) 
        self.b = np.zeros((neurons, 1)) 
        self.act, self.d_act=self.activationFns.get(activation)
    def feedforward(self, A1): 
        self.A1 = A1 
        self.Z = np.dot(self.W, self.A1) + self.b 
        self.A = self.act(self.Z) 
        return self.A
    def backprop(self, dA): 
        dZ = np.multiply(self.d_act(self.Z), dA) 
        dW = 1/dZ.shape[1] * np.dot(dZ, self.A1.T) 
        db = 1/dZ.shape[1] * np.sum(dZ, axis=1, keepdims=True)     
        dA1 = np.dot(self.W.T, dZ)          
        self.W = self.W - self.learning_rate * dW 
        self.b = self.b - self.learning_rate * db 
        return dA1
     
x = np.array([[0, 0, 1, 1], [0, 1, 0, 1]]) # dim x m
y = np.array([[0, 1, 1, 0]]) # 1 x m m = 4
epochs = 1500 
lyr = [Layer(2, 3, 'tanh'), Layer(3, 1, 'sigmoid')]
costs = [] 
# to plot graph  
for epoch in range(epochs):    
     # Feedforward    
     A = x    
     for layer in lyr:        
         A = layer.feedforward(A)     
     # Calulate cost to plot graph    
     cost = 1/m * np.sum(logloss(y, A))    
     costs.append(cost)      
     dA = d_logloss(y, A)    
     for layer in reversed(lyr):        
         dA = layer.backprop(dA)  # Making predictions
A = x
for layer in lyr:    
     A = layer.feedforward(A)
print(A)
    
