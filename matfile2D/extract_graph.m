

for i = 1:size(poses,2)
    try
        prob{i,1} = poses{1,i}(1,10,3); % RHip
        prob{i,2} = poses{1,i}(1,11,3); % RKnee
        prob{i,3} = poses{1,i}(1,12,3); % RAnkle
        prob{i,4} = poses{1,i}(1,13,3); % LHip
        prob{i,5} = poses{1,i}(1,14,3); % LKnee
        prob{i,6} = poses{1,i}(1,15,3); % LAnkle
        prob{i,7} = poses{1,i}(1, 9,3); % MidHip
    end
    
end

%% 書式
% GUIのフォント
set(0, 'defaultUicontrolFontName','Times New Roman' );%'MS UI Gothic'
% 軸のフォント
set(0, 'defaultAxesFontName','Times New Roman');
% タイトル、注釈などのフォント
set(0, 'defaultTextFontName','Times New Roman');
% % GUIのフォントサイズ
% set(0, 'defaultUicontrolFontSize', 9);
% % 軸のフォントサイズ
% set(0, 'defaultAxesFontSize', 9);%10
% % タイトル、注釈などのフォントサイズ
% set(0, 'defaultTextFontSize', 9);
% ラインの太さ
set(0, 'defaultlineLineWidth', 1);
% GUIのフォントサイズ
set(0, 'defaultUicontrolFontSize', 20);
% 軸のフォントサイズ
set(0, 'defaultAxesFontSize', 20);%10
% タイトル、注釈などのフォントサイズ
set(0, 'defaultTextFontSize', 20);

%% グラフ書く

f = figure(1);
set(gcf, 'Color', 'none')

    % 背景色
%     set(gcf, 'Color', 'none')
%     f.Position = [100 100 300 300]
%     M_ipad = [sheet{i,1}{:,7}, -(sheet{i,1}{:,10}-ipad_bias(2)), sheet{i,1}{:,9}-ipad_bias(1), sheet{i,1}{:,11}-ipad_bias(3)];

% prob_table = cell2table(prob)
% prob_table = fillmissing(prob_table, 'constant', 0);

emptyIndex = cellfun('isempty', prob);     % Find indices of empty cells
prob(emptyIndex) = {0};                    % Fill empty cells with 0
% mylogicalarray = logical(cell2mat(prob));  % Convert the cell array

t = 0:0.016666:(size(prob,1)-1)*0.016666;

plot(t,[prob{:,1}],t,[prob{:,2}],t,[prob{:,3}],t,[prob{:,4}],t,[prob{:,5}],t,[prob{:,6}],t,[prob{:,7}]);

%     h1 = xline(R_on, '-r', 'R-on');
%     h2 = xline(R_off, '--r', 'R-off');
%     h3 = xline(L_on, '-b', 'L-on');
%     h4 = xline(L_off, '--b', 'L-off');

%     xline(R_on, '-r', 'DisplayName', 'R-on')
%     xline(R_off, '--r', 'DisplayName', 'R-off')
%     xline(L_on, '-b', 'DisplayName', 'L-on')
%     xline(L_off, '--b', 'DisplayName', 'L-off')
xlabel('time [s]') 
ylabel('probability') 

lgd = legend("Rhip","Rknee","Rankle","Lhip","Lknee","Lankle","MidHip",'Location','southeast');
lgd.NumColumns = 2;
% 
% sheet_name = ["Rhip","Rknee","Rankle","Lhip","Lknee","Lankle"];
% 
saveas(gcf,"roujin1_front_openpose_prob",'svg')