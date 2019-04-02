        
%fid=fopen('F:\OfflineSignature\data.txt');
%tline = fgetl(fid);
%while ischar(tline)
    
 %   s=strcat('Test/',tline);
  %  tline = fgetl(fid);
%end
%fclose(fid);
s='NFI-00203002.jpg';
        I=imread(s);
        wndSize=5;
        [m, n] = size(I);
         F = [];
         Tfeature = [];
        m1 = floor(m/8) * 8;
        n1 = floor(n/8) * 8;
%LBPfeatures = dense_vl_lbp( I,wndSize );

for i = 1 : floor(m/8) : m1
                for j = 1 : floor(n/8) : n1
                wndSize=5;
         %       LBPfeatures = dense_vl_lbp( J,wndSize );
                lbp_feature = extractLBPFeatures(I(i:floor(i+m/8-1), j:floor(j+n/8-1)));
          %     [hog1,visualization] = extractHOGFeatures(J,'CellSize',[2 2]);
               F = horzcat(F, lbp_feature);
              
            end
end
   %    F = horzcat(F, 1);
 if size(I, 3) == 3
            I = rgb2gray(I);
            J = im2single(I);
            %[FRAMES,DESCRS] = vl_dsift(J);
            
        end
        lbp_feature = extractLBPFeatures(I);
        %Tfeature = [Tfeature; lbp_feature];
        Tfeature=lbp_feature;
        load Test_data
        load FeatureT
        
        classifier = fitcecoc(feature1, data_label, ...
    'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationsIn', 'rows');
       % result = TestSVM(feature1,YTrain, F)
        
        
        [predictedLabels score] = predict(classifier, Tfeature, 'ObservationsIn', 'rows');
        predictedLabels
        score=abs(score);
        score=max(score);
%         if(score>0.09)
%            result=strcat(num2str(predictedLabels),'Match');
%            result
%         else
%             result='Not Match'
%         end
%         
        
        