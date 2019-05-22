function [wave] = generate_single_wave(freq, time_seq)
    wave = sin(2*pi*freq*time_seq);
end
