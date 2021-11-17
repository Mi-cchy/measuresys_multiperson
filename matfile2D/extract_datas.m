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