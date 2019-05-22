clear;clc;close all

%% image processing
image_name = input('Input filename: ', 's');
src = imread(image_name);
src_bin = imrotate(double(rgb2gray(src))/255, -90);

%% music processing
minFreq = 300;
maxFreq = 3400;
fs = 8000;
one_key_time = 0.05;
t = 0:1/fs:one_key_time;
dFreq = (maxFreq-minFreq)/size(src_bin,2);

sound_seq = [];

for row = 1:size(src_bin,1)
    current_sound = zeros(1, size(t,2));
    for column = 1:size(src_bin,2)
        current_freq = minFreq + column*dFreq;
        current_sound = current_sound + src_bin(row, column) * generate_single_wave(current_freq, t);
    end
    sound_seq = [sound_seq, current_sound];
end
sound_seq = sound_seq/max(abs(sound_seq));
audiowrite('output.wav', sound_seq, 8192);