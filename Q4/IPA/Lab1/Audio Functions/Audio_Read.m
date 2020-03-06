function [x,Fs]=Audio_Read(FileName)

    [y,Fs] = audioread(FileName); % Read a stereo wav file
    x=(y(:,1)+y(:,2))/2; % Add left/right channels to get a mono sound
    
    x=x./(max(abs(x)));
    
    Interval = round(length(x)/2):round(length(x)/2)+10000; % Define a temporal interval
    figure(1); plot(Interval,x(Interval)); axis tight; % Plot the signal in the interval

    sound(x,Fs); % Listen to audio
