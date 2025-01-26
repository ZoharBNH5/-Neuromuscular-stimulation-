%load the file for maayan menual 

filename = sprintf("maayan_menual.mat");
load(filename, "data");

reaction = data(:,1) ; %reaction vector 
stim = data(:,2) ; %simulation vector

%now working on the reaction time, wanted

% take all the index where the gradient is positive-strong to find the sharp
% increases in the plot 

all_rec_indexes = [] ;
str_inc = 0.4 ; 
for i = 1:length(reaction)-30 
     check = reaction(i+30) - reaction(i) ;
    if(check > str_inc) 
        all_rec_indexes(end+1) = i ; 
    end 
end 


% to take only the first index where the increse begin, i deleted all the
% rest values from the same increase. also i entered the first value
% manually 

rec_indexes_final = [] ;
rec_indexes_final(1) = 2008 ; 

for i = 1:length(all_rec_indexes)-1 
    check2 = all_rec_indexes(i+1) - all_rec_indexes(i) ; 
    if (check2 > 100) 
        rec_indexes_final(end+1) = all_rec_indexes(i+1) ; 
    end 
end 


%showing the places of the index compare to the original data 

figure;
plot(reaction, '-o'); % Plot the recation
hold on;
scatter(rec_indexes_final, reaction(rec_indexes_final), 'r', 'filled', 'DisplayName', 'Index Final');
legend show; 
xlabel('Index');
ylabel('reaction Value in volt');
title('Visualization of reaction Index Final on Original Plot wanted');



%now working on the stimuli times (still for maayan manual)

%define a theshold and take only the indexes that have value more then it 
threshold = 48 ; 
all_stim_times = [];

for i = 1:length(stim) 
    if (stim(i) > threshold) 
        all_stim_times(end+1) = i ;
    end 
end 

% take only the first element on the increase and define the first stimulation manually 
stim_indexes_final = [] ; 
stim_indexes_final(1) = 1775 ; 

for i = 1:length(all_stim_times)-1
    check3 = all_stim_times(i+1) - all_stim_times(i) ; 
    if (check3 > 50) 
        stim_indexes_final(end+1) = all_stim_times(i+1) ; 
    end 
end 

% delete the last one cause it was out of the trail 
stim_indexes_final(31) = [] ;  

% display the results 
figure;
plot(stim, '-o'); % Plot the stimulation
hold on;
scatter(stim_indexes_final, stim(stim_indexes_final), 'r', 'filled', 'DisplayName', 'Index Final');
legend show; 
xlabel('Index');
ylabel('reaction Value');
title('Visualization of stim Index Final on Original Plot un-wanted');


% now after i have the reaction indexes and the stimuli indexes i can calculate
% the time interval between them. 
% check the time interval between the stim and the reactions and convert
% from index to time

time_intervals = [] ; 
for i = 1:30 
    index_interval = rec_indexes_final(i) - stim_indexes_final(i) ; 
    time = index_interval / 2000 ; 
    time_intervals(end+1) = time ; 
end 
disp(time_intervals) 


% time interval number 28 is negative so i deleted it (cant be possibale
% that the person react before the stimuli has been given)
time_intervals(28) = [] ; 
disp(time_intervals) 

%taking the mean reaction time 
mean_interval_wanted = mean(time_intervals) ; 
std_interval_wanted = std(time_intervals) ; 
 



%load the file for maayan unwanted movements 
%
filename = sprintf("maayan_pulse_40v_20d.mat");
load(filename, "data");

reaction_1 = data(:,1) ; %reaction vector 
stim_1 = data(:,2) ; %simulation vector

%now working on the reaction times, unwanted 
% take all the index where the gradient is positive-strong to find the sharp
% increases in the plot 

all_rec_indexes_1 = [] ;
str_inc_1 = 0.01 ; 
for i = 1:length(reaction_1)-20 
     check_1 = reaction_1(i+20) - reaction_1(i) ;
    if(check_1 > str_inc_1) 
        all_rec_indexes_1(end+1) = i ; 
    end 
end 

% to take only the first index where the increse begin, i delete all the
% rest values from the same increase. also i entered the first value
% manually 

rec_indexes_final_1 = [] ;
rec_indexes_final_1(1) = 2129 ; 

for i = 1:length(all_rec_indexes_1)-1 
    check2_1 = all_rec_indexes_1(i+1) - all_rec_indexes_1(i) ; 
    if (check2_1 > 100) 
        rec_indexes_final_1(end+1) = all_rec_indexes_1(i+1) ; 
    end 
end 

%showing the places of the index compare to the original data 

figure;
plot(reaction_1, '-o'); % Plot the stimulation
hold on;
scatter(rec_indexes_final_1, reaction_1(rec_indexes_final_1), 'r', 'filled', 'DisplayName', 'Index Final');
legend show; 
xlabel('Index');
ylabel('reaction Value');
title('Visualization of rection Index Final on Original Plot un-wanted');


%now working on the stimuli times, unwanted   

%define a thershold and take only the indexes that have value more then it 
threshold_1= 49 ; 
all_stim_times_1 = [];

for i = 1:length(stim_1) 
    if (stim_1(i) > threshold_1) 
        all_stim_times_1(end+1) = i ;
    end 
end 

% take only the first element of the increase and define the first stimulation manually 
stim_indexes_final_1 = [] ; 
stim_indexes_final_1(1) = 2012 ; 

for i = 1:length(all_stim_times_1)-1
    check3_1 = all_stim_times_1(i+1) - all_stim_times_1(i) ; 
    if (check3_1 > 500) 
        stim_indexes_final_1(end+1) = all_stim_times_1(i+1) ; 
    end 
end 

% showing the places of the index compare to the original data 

figure;
plot(stim_1, '-o'); % Plot the stimulation
hold on;
scatter(stim_indexes_final_1, stim_1(stim_indexes_final_1), 'r', 'filled', 'DisplayName', 'Index Final');
legend show; 
xlabel('Index');
ylabel('reaction Value');
title('Visualization of stimulation Index Final on Original Plot un-wanted');



%now after i have the reaction times and the stimuli time i can calculate
%the time interval between them. 
% check the time interval between the stim and the reactions

time_intervals_1 = [] ; 
for i = 1:38 
    index_1 = rec_indexes_final_1(i) - stim_indexes_final_1(i) ; 
    time_1 = index_1 / 2000 ; 
    time_intervals_1(end+1) = time_1 ; 
end 

%taking the mean reaction time 
mean_interval_unwanted = mean(time_intervals_1) ; 
std_interval_unwanted = std(time_intervals_1) ; 


% plots the results on a bar graf 
means = [mean_interval_unwanted, mean_interval_wanted];
stds = [std_interval_unwanted, std_interval_wanted];
labels = {'Unwanted', 'Wanted'};

% create the bar graph
figure;
bar(means, 'FaceColor', 'flat');
hold on;

% add error bars
errorbar(1:length(means), means, stds, 'k', 'linestyle', 'none', 'LineWidth', 1);

for i = 1:length(means)
    if i == 1
        % Place the left label (Unwanted) on top of the bar
        text(i, means(i) + stds(i) + 0.01, sprintf('%.2f ± %.2f', means(i), stds(i)), ...
            'HorizontalAlignment', 'center', 'FontSize', 10);
    else
        % Place the right label (Wanted) slightly to the side
        text(i + 0.1, means(i) + stds(i) - 0.01, sprintf('%.2f ± %.2f', means(i), stds(i)), ...
            'HorizontalAlignment', 'left', 'FontSize', 10);
    end
end

% customize the plot
set(gca, 'xticklabel', labels);
ylabel('Mean time interval Value in sec');
title('Mean and Standard Deviation of time interval for maayan');


hold off;