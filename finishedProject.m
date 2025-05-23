%% Project 1: The monkey pressing the button
% By Nathan Pike and Max Mitchell
load fullData.mat
load MyProjectVariables1.mat

R = fullData(:,1); %% The values of column 1, Red 
G = 225-R; %% Values of column 1 subtracted from 225, Green
SC= 100*(R-G)./(R+G); %% Signed Coherence Equation, creates a 11032x1 matrix of signed coherence values 
min= min(100*(R-G)./(R+G)) %= -90.2222, Minimum SC value
max= max(100*(R-G)./(R+G)) %= 90.2222, Maximum SC value

%% for loop to find the mean, median, SEM, and percentage of red in terms of the signed coherence
uniqueSC= unique(SC); % Lists all unique values of SC
for n=1:length(uniqueSC) 
    idx=find(SC==uniqueSC(n)); % Finds each unique value of SC
    pRed(n)= sum(fullData(idx,2) ==2)./length(idx); % The second column of fullData equal to 2 (red) divided by the number of inputs to find the percentage of times red was pressed
    RTmean(n)= mean(fullData(idx,3)); % The mean reaciton times found from 3rd column of fullData for each unique value of SC
    RTse(n)= std(fullData(idx,3))./sqrt(length(idx)); % Finds the standard error from the standard deviation of each reaction time for their unqiue SC value, divided by the square root of the number of inputs of idx
    RTmedian(n)= median(fullData(idx,3)); % The median of the reaction times for each unique value of SC
end


%% Psychometric Curve

figure(1);

plot(uniqueSC, pRed, 'ro-', 'markersize', 12)
xlabel('Signed Coherence (%)')
ylabel('Percent Frequency of Red')
title('Percentage the Monkey Pressed Red as a Function of Signed Coherence')
legend('Percent Chance Monkey Chooses Red per Each Signed Coherence Value')

%%

%%
% 

%% Mean Reaction Time
figure(2);
plot(uniqueSC, RTmean, 'b-'); % plot of the Mean Reaction times as a function of the signed coherence
xlabel('Signed Coherence')
ylabel('Mean Reaction Time(ms)')
title('Mean Reaction Time for Signed Coherence')
legend('Reaction Times for Corresponding Signed Coherence Value')

%%

%% Error Bar
figure(3);
plot(uniqueSC ,RTmean,'-o') 
errorbar(uniqueSC, RTmean, RTse,'Color', 'r') %% Creates an errorbar that is the size of SEM for each data point graphed
xlabel('Signed Coherence')
ylabel('Reaction Time(ms)')
title('Mean Reaction Time for Signed Coherence with Error Bars')
legend('reaction times by signed coherence with standard error')

%%

%% Histogram 
figure(4);
column3 = fullData(:,3);
hist(column3);  %% Histogram of the 3rd column reaction time values 
xlim([0,3000]); %% Sets a limit to the size of the hist
xlabel('Reaction time values');
ylabel('frequency');
legend('frequency of reaction times');
% Not a Gaussian distribution 

%%

%% Mean and Median
figure(5);
plot(uniqueSC, RTmean) % plots the mean as a function of SC
hold on % holds so that a second line can be plotted
plot(uniqueSC, RTmedian) %plots the median as a function of SC
legend('Line representing the mean reaction time', 'Line representing the median reaction time')
xlabel('Signed Coherence')
ylabel ('Reaction Time (ms)')
title('Mean and Median Reaction Times as a Function of Signed Coherence')
%The mean is larger as it is more affected by outliers than the median, and
%there are larger outliers as can be seen by the histogram not being gaussian 