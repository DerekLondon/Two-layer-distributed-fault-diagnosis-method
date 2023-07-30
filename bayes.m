function [PSXTF,PSFXT] = bayes(XTS,Jth,ac)


%XTS测试样本的统计量，Jth统计量XTS的阈值，ac置信水平

%PSN正常情况的先验概率，PSF发生故障的先验概率
PSN=1-ac;
PSF=ac;

PSXTN=0;
PSXTF=0;



for i=1:size(XTS,2)
    PSXTN(i)=exp(-XTS(i)/Jth);
    PSXTF(i)=exp(-Jth/XTS(i));
end

PSXT=0;
for i=1:size(XTS,2)
    PSXT(i)=PSXTF(i)*PSF+PSXTN(i)*PSN;
end

%变量贡献指标
PSFXT=0;
for i=1:size(XTS,2)
    PSFXT(i)=PSXTF(i)*PSF/PSXT(i);
end
