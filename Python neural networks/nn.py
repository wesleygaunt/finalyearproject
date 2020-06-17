# Imports
import numpy as np 
import pickle
import pandas as pd
import matplotlib.pyplot as plt
import csv


c = 0.3;
a = 1;
hidden_layer_nodes = 4;

#iris = pd.read_csv('iris.csv')
#iris.loc[iris['species']=='virginica','species']=0
#iris.loc[iris['species']=='versicolor','species']=1
#iris.loc[iris['species']=='setosa','species'] = 2
#iris = iris[iris['species']!=2] #remove one species
##create i/o columns
#X_iris = iris[['petal_length', 'petal_width']].values
#Y_iris = iris[['species']].values
#Y_iris = (2*Y_iris.astype('float')) - 1   #change from 0,1 to -1,+1  
##operations on y
#Y_iris_modified = np.zeros([100,2])
#Y_iris_modified[:,0] = Y_iris[:,0]
#Y_iris_modified[:,1] = -Y_iris[:,0]     #make the output 2 dimensional
##operations on x
#X_iris_modified = X_iris.copy();
#X_iris_mean = np.mean(X_iris,0);    #compute the mean along both axes
#X_iris_modified[:,0] = X_iris_modified[:,0] - X_iris_mean[0]
#X_iris_modified[:,1] = X_iris_modified[:,1] - X_iris_mean[1]
#X_iris_modified[:,0] = X_iris_modified[:,0]/np.max(X_iris_modified[:,0])
#X_iris_modified[:,1] = X_iris_modified[:,1]/np.max(X_iris_modified[:,1])
#plt.figure(1)
#plt.scatter(X_iris_modified[:, 0], X_iris_modified[:, 1], c=Y_iris[:,0], s=40, cmap=plt.cm.Spectral);


# Each row is a training example, each column is a feature  [X1, X2, X3]
X_dataset_1=np.array(([-0.4,-0.4],[0,0.8],[0.2,0.4],[-0.6,-0.2]), dtype=float)
#=np.array(([1,0],[0,1],[0,1],[1,0]), dtype=float)
y_dataset_1=np.array(([1,-1],[-1,1],[-1,1],[1,-1]), dtype=float)
X = X_dataset_1;
y = y_dataset_1;

#X = X_iris_modified;
#y = Y_iris_modified;

X = pd.read_csv('X_clusters.csv').values;
y = pd.read_csv('Y_clusters.csv').values;



#with open('y_actual_dataset_1.csv', mode='w',newline='') as file:
#    writer = csv.writer(file)
#    writer.writerows(y)
#
#plt.figure(2)
#plt.scatter(X[:, 0], X[:, 1], c=y[:,0], s=40, cmap=plt.cm.Spectral);


# Define useful functions    

# Activation function
#def sigmoid(t):
#    return a*np.tanh(c*t)
#
## Derivative of sigmoid
#def sigmoid_derivative(p):
#    return a*c*(1 - ((p*p)/(a*a)))

## Activation function
def sigmoid(t):
    return 1/(1+np.exp(-t*c))

# Derivative of sigmoid
def sigmoid_derivative(p):
    return c*p * (1 - p)

# Class definition
class NeuralNetwork:
    def __init__(self, x,y):
        self.input = x
        self.weights1 = (np.random.rand(self.input.shape[1],hidden_layer_nodes) - 0.5)*2 # considering we have 2 nodes in the hidden layer, this will produce uniform in -1..+1 range.
        self.weights2 = (np.random.rand(hidden_layer_nodes,3) - 0.5) * 2
        self.y = y
        self.output = np. zeros(y.shape)
        
    def feedforward(self):
        self.layer1 = sigmoid(np.dot(self.input, self.weights1))
        self.layer2 = sigmoid(np.dot(self.layer1, self.weights2))
        return self.layer2
        
    def backprop(self):
        d_weights2 = np.dot(self.layer1.T, 2*(self.y -self.output)*sigmoid_derivative(self.output))
        d_weights1 = np.dot(self.input.T, np.dot(2*(self.y -self.output)*sigmoid_derivative(self.output), self.weights2.T)*sigmoid_derivative(self.layer1))
    
        self.weights1 += d_weights1
        self.weights2 += d_weights2

    def train(self, X, y):
        self.output = self.feedforward()
        self.backprop()
        

NN = NeuralNetwork(X,y)
for i in range(1000000): # trains the NN 1,000 times
    if i % 100000 == 0: 
        print ("for iteration # " + str(i) + "\n")
        print ("Input : \n" + str(X))
        print ("Actual Output: \n" + str(y))
        print ("Predicted Output: \n" + str(NN.feedforward()))
        loss = (np.mean(np.square(y - NN.feedforward())))
        print ("Loss: \n" + str(loss)) # mean sum squared loss
        print ("\n")
        NN.train(X, y)
        #if loss <0.001:
         #   break
                
        
  
print("i = " + str(i))
print ("Loss: \n" + str(loss)) # mean sum squared loss
print(NN.weights1);
print(NN.weights2);

weights1 = NN.weights1;
weights2 = NN.weights2;

#with open('train_dataset_1.pickle', 'wb') as f:
#   pickle.dump([X, weights1, weights2], f)
