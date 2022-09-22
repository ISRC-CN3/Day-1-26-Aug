classdef neuron %2
    properties %97
        C = 0.281; %4
        gL = 0.030; %5
        vR = -60.6; %6
        vT = -50.4; %7
        currentInj; %99
        T; %99
        timeseries; %99
        V; %99
    end %97
    methods %97
        function self = neuron %98
            self; %98
        end %98
        function self = create_injection_current(self) %8
            max_current=1;
            self.currentInj = cat(2,zeros(1,10),[[1:max_current*100]./100]); %9
            self.T = length(self.currentInj); %10
        end %97
        function self = leaky_integrate_and_fire(self) %11
            self.timeseries = linspace(1,self.T, self.T); %12
            self.V = ones(1,self.T).*self.vR %13
            ii = 1; %14
            while ii < (max(self.T)-2) %15
                dV = (-self.gL.*(self.V(ii) - self.vR) + ...
                    self.currentInj(ii))./self.C; %16
                self.V(ii+1) = self.V(ii)+dV; %17
                if self.V(ii+1) >= self.vT %18
                    self.V(ii+1) = 20; %19
                    self.V(ii+2) = self.vR; %20
                    ii = ii + 1; %21
                end %18
                ii = ii + 1; %22
            end
        end
        function plot_neuron(self) %23
            figure %24
            ax = subplot(2,1,1) ;%25
            plot(self.timeseries,self.currentInj,'color','k') %26
            title('Current Injection','FontAngle','italic') %27
            ylabel('Current (nA)') %28
            ax2 = subplot(2,1,2) ;%29

            plot(self.timeseries,self.V,'color','k') %30
            title('Integrate and Fire Voltage Response', 'FontAngle','italic') %31
            xlabel('Time (ms)') %32
            ylabel('Voltage (mV') %33
            %shg %35
            print('-dpng','-r300','Integrate and Fire Voltage Response'); %36
        end
    end
end