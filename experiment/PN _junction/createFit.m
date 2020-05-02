function [fitresult, gof] = createFit(VF, IF)
%CREATEFIT(VF,IF)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : VF
%      Y Output: IF
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 02-Dec-2019 15:13:12 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData(VF,IF);

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [5.60374310334818e-06 39.4843339933895];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'IF vs. VF', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel VF
ylabel IF
grid on


