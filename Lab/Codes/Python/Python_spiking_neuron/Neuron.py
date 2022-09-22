import numpy as np
import matplotlib.pyplot as plt

class Neuron():
    def __init__(self):#intialise neuron variables
        self.C=0.281 #capacitance
        self.gL=0.030 #leak conductance
        self.vR=-60.6 #membrane potential
        self.vT=-50.4 #spike threshold

    def create_injection_current(self): #current injectipoon function
        max_current=1
        self.currentInj=np.append(np.zeros(10),np.arange(0,max_current,0.01))
        self.T=len(self.currentInj)

    def leaky_integrate_and_fire(self): #leaky-integrate-and-fire function
        self.timeseries = np.linspace(0,self.T-1,self.T)
        self.V=np.ones(self.T)*self.vR
        ii=0
        while ii<self.T-2:
            dV=(-self.gL*(self.V[ii]-self.vR)+self.currentInj[ii])/self.C
            self.V[ii+1]=self.V[ii]+dV
            if self.V[ii+1]>self.vT:
                self.V[ii+1]=20
                self.V[ii+2]=self.vR
                ii+=1
            ii+=1

    def plot_neuron(self): #plot neuron's membrane potential and current injection over time
        fig=plt.figure()
        fig.set_figwidth(10)
        fig.set_figheight(8)
        ax=fig.add_subplot(211)
        ax.plot(self.timeseries,self.currentInj,color='gold')
        ax.set_title('Current Injection',style='italic')
        ax.set_ylabel('Current (nA)', style='italic')

        ax2=fig.add_subplot(212)
        ax2.plot(self.timeseries,self.V,color='black')
        ax2.set_title('Integrate and Fire Membrane Potiental Response', style='italic')
        ax2.set_xlabel('Time (ms)',style='italic')        
        ax2.set_ylabel('Voltage (mV)', style='italic')
        plt.tight_layout()
        plt.rcParams.update({'font.size': 20})
        plt.show()
