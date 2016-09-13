%Lecture 5 problem set
data = xlsread('lecture5.xlsx');
data
plot(data(1,:))
vector = mat2vec2(data);
gobbled_data = data_goblin(vector);
plot(gobbled_data);
gobbled_data=gobbled_data';
gobbled_data(:,1)
processed_data = pre_processor(gobbled_data);
plot(processed_data);
%%Preprocessing number 3
boolean = data == 139503
sum(boolean)
%we used 139503 based on the knowledge of the outlier value as shown in the
%third problem of data transformation. Based on summing the boolean, we
%know this value is in the second column, which is the second hour of the day.
data(:,2)
[M,I] = max(data(:,2))
%based on indexing the rows, the outlier is in the 306th row. This means
%that the day is November 2nd and the time is 2am for the outlier.

%%Data transformation number 2
hist(processed_data);
qqplot(processed_data);
qqplot(log(processed_data));
hist(log(processed_data));
%The log transformation only slightly improved the normal distribution of
%the data set.
%%Data transformation number 3
%To find std dev of outlier point, subset data from 7000-8000 and find the
%max of that number. then take the std dev of it.
subsetted_data = processed_data(7000:8000,:);
outlier = max(subsetted_data);
xbar = mean(processed_data,'omitnan');
sd = std(processed_data,'omitnan');
sdoutlier = (outlier-xbar)/sd
%%Data transformation number 4
%No, we shouldn't do an outlier test for the whole year because the data
%flucutates dramatically based on the month.
boolean2 = processed_data == 139503
find(boolean2)
%This shows that the outlier is the 7322nd number. Because it occred on
%November 2nd (as shown in the preprocessing problem) we must subset the
%other numbers from that month.
novem = processed_data(7321:7350,:)
xbar2 = mean(novem,'omitnan')
sd2 = std(novem,'omitnan')
sdoutliernovem = (outlier-xbar2)/sd2