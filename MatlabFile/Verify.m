s='NFI-00202002.jpg';
test=imread(s);
if size(test, 3) ~= 3
            test = cat(3, test,test, test);
        end
test=imresize(test,[600 600]);
test=rgb2gray(test);
offsets = [0 1; -1 1;-1 0;-1 -1;2 2];

  glcm=graycomatrix(test, 'Offset', offsets, 'Symmetric', true);

stats=graycoprops(glcm);
data_glcm=struct2array(stats);
iglcm=1;
glcm_contrast={5};
glcm_correlation={5};
glcm_energy={5};
glcm_homogeneity={5};
    for x=1:5
      glcm_contrast{x}=data_glcm(iglcm);
      iglcm=iglcm+1;
    end
    for x=1:5
        glcm_correlation{x}=data_glcm(iglcm);
        iglcm=iglcm+1;
    end
    for x=1:5
        glcm_energy{x}=data_glcm(iglcm);
        iglcm=iglcm+1;
    end
    for x=1:5
        glcm_homogeneity{x}=data_glcm(iglcm);
        iglcm=iglcm+1;
    end
rata2=mean2(test);
std_deviation=std2(test);
glcm_entropy=entropy(test);
rata2_variance= mean2(var(double(test)));
glcm_kurtosis=kurtosis(double(test(:)));
glcm_skewness=skewness(double(test(:)));
buat_train=[glcm_contrast(1:5),glcm_correlation(1:5),glcm_energy(1:5),glcm_homogeneity(1:5),rata2,std_deviation,glcm_entropy,rata2_variance,glcm_kurtosis,glcm_skewness];

test_data=cell2mat(buat_train);
input_Feature=buat_train;
load Test_data
%result = multisvm(data_feat1,data_label,test_data)
classifier = fitcecoc(data_feat1, data_label, ...
    'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationsIn', 'rows');
       % result = TestSVM(feature1,YTrain, F)
        
        
        [predictedLabels score] = predict(classifier, test_data, 'ObservationsIn', 'rows');
        predictedLabels
