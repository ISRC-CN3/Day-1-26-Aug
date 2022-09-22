classdef neuron 
    properties %initailise neuron variables
        C = 0.281; %capacitance
        gL = 0.030;%leak conductance
        vR = -60.6; %membrane potential
        vT = -50.4; %spike threshold
       %for Matlab all variable must be declared first
        currentInj; 
        T; 
        timeseries;
        V; 
    end 
    methods %declare neuron functions 
        function self = neuron 
            self; 
        end 
        function self = create_injection_current(self)%current injection function 
            max_current=1;
            self.currentInj = cat(2,zeros(1,10),[[1:max_current*100]./100]); 
            self.T = length(self.currentInj); 
        end 
        function self = leaky_integrate_and_fire(self)%leaky-integrate-and-fire function
            self.timeseries = linspace(1,self.T, self.T); 
            self.V = ones(1,self.T).*self.vR 
            ii = 1; 
            while ii < (max(self.T)-2) 
                dV = (-self.gL.*(self.V(ii) - self.vR) + ...
                    self.currentInj(ii))./self.C; 
                self.V(ii+1) = self.V(ii)+dV; 
                if self.V(ii+1) >= self.vT 
                    self.V(ii+1) = 20; 
                    self.V(ii+2) = self.vR; 
                    ii = ii + 1; 
                end 
                ii = ii + 1; 
            end
        end
        function plot_neuron(self) %plot neuron's membrane potential and current injection with time
            figure 
            ax = subplot(2,1,1) ;
            plot(self.timeseries,self.currentInj,'color','k') 
            title('Current Injection','FontAngle','italic') 
            ylabel('Current (nA)') 
            ax2 = subplot(2,1,2) ;
            plot(self.timeseries,self.V,'color','k') 
            title('Integrate and Fire Voltage Response', 'FontAngle','italic')
            xlabel('Time (ms)') 
            ylabel('Voltage (mV)') 
            shg 
            %print('-dpng','-r300','Integrate and Fire Voltage Response');
        end
    end
end
