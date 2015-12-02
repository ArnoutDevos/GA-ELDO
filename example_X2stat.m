clear all;
clf;

% Define the boundaries of the problem.
lb=[0 0 0 0 0 0];
ub=[1 1 1 1 1 1];
V=6;
M=2;
%lb=[-5 -5];
%ub=[5 5];
%V=2;
%M=1;
% Use the GA
n=15;
PopDivider=2;
QFactor =0.993;
gamma=0.38;
N = 30;
itstat = [];
for PopDivider=2:1:10
    PopDivider
    ittotaal = [];
    timetotal = [];
    for i = 1:n
        i
        tic
        [it, pop] = myGAstat(@(x) benchmark(3,x),V,M,lb,ub,N,PopDivider,QFactor,gamma);
        T=toc;
        ittotaal = [ittotaal it];
        timetotal = [timetotal T];
        pause(0.1) %allow for plot outside tic toc if necessary
        
    end
    
    itstat = [itstat; 1/PopDivider mean(ittotaal) std(ittotaal) mean(timetotal) std(timetotal)];
end
hold off
errorbar(itstat(:,1),itstat(:,2),itstat(:,3))
figure
errorbar(itstat(:,1),itstat(:,4),itstat(:,5))