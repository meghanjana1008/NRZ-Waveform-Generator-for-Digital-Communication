clc;
clear;

% Parameters
n = 4;                 % Number of flip-flops
len = 15;              % Sequence length (2^n - 1)
register = [1 0 0 0];  % Initial seed (non-zero)
pn_sequence = zeros(1, len);

% Feedback taps (positions to XOR): Q4 and Q1 => index 1 and 4
tap1 = 1;
tap2 = 4;

% LFSR loop
for i = 1:len
    pn_sequence(i) = register(end); % Output = last flip-flop (Q4)
    
    % XOR feedback
    feedback = xor(register(tap1), register(tap2));
    
    % Shift register
    register = [feedback register(1:end-1)];
end

% Display sequence
disp('PN Sequence:');
disp(pn_sequence);

% Plot NRZ waveform
figure;
stairs(pn_sequence, 'LineWidth', 2);
ylim([-0.5 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('NRZ waveform of PN sequence');
grid on;