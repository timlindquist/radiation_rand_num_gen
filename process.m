function process(filename)

while(1)
    x=textread(filename,'%s ');
    d=hex2dec(x);
    %subplot(1,2,1);
    histogram(d,16); 
    title('Histogram');
    ylabel('Frequency');
    xlabel('Case');
    h=hist(d,16);
   % subplot(1,2,2);
   % boxplot(h);
    
    pause(.1);
end


