%% ????
classdef kon < matlab.apps.AppBase
 
    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                matlab.ui.Figure
        RezultatEditField       matlab.ui.control.NumericEditField
        RezultatEditFieldLabel  matlab.ui.control.Label
        KonvertiratiButton      matlab.ui.control.Button
        IznosEditField          matlab.ui.control.NumericEditField
        IznosEditFieldLabel     matlab.ui.control.Label
        UDropDown               matlab.ui.control.DropDown
        UDropDownLabel          matlab.ui.control.Label
        IzDropDown              matlab.ui.control.DropDown
        IzDropDownLabel         matlab.ui.control.Label
        KonverterValutaLabel    matlab.ui.control.Label
    end
 
   
    properties (Access = private)
      ExchangeRates = [
        "EUR" "USD" 1.496464;
        "EUR" "GBP" 0.8679;
        "AUD" "USD" 0.7456;
        "CAD" "USD" 0.7744;
        "JPY" "USD" 0.0094;
        "CHF" "USD" 1.1025;
        "TRY" "USD" 0.1323;
        "GBP" "USD" 1.7264;
    ];
       
    end
   
    methods (Access = private)
       
       
    % Method to find exchange rate
    function rate = findExchangeRate(app, fromCurrency, toCurrency)
        % Search for exchange rate in ExchangeRates property
        idx = find(strcmp(app.ExchangeRates(:,1), fromCurrency) & strcmp(app.ExchangeRates(:,2), toCurrency));
        if ~isnan(idx)
            rate = app.ExchangeRates{idx, 3};
        else
            rate = 0; % Return NaN if exchange rate is not found
        end
    end
    end
   
 
    % Callbacks that handle component events
    methods (Access = private)
 
        % Button pushed function: KonvertiratiButton
        function KonvertiratiButtonPushed(app, event)
            fromCurrency = app.IzDropDown.Value;
            toCurrency = app.UDropDown.Value;
            amount = app.IznosEditField.Value;
           
            % Find conversion rate
            rate = app.findExchangeRate(fromCurrency, toCurrency);
           
            if ~isnan(rate)
                 c * rate;
                app.RezultatEditField.Value = convertedAmount;
            else
                app.RezultatEditField.Value = 0;
 
            end
        end
    end
 
    % Component initialization
    methods (Access = private)
 
        % Create UIFigure and components
        function createComponents(app)
 
            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
             app.UIFigure.Positi 100 640 480];
            app.UIFigure.Name = 'MATLAB App';
 
            % Create KonverterValutaLabel
             app.K
             app.KonverterValutaLabel.Positi 395 94 22];
            app.KonverterValutaLabel.Text = 'Konverter Valuta';
 
            % Create IzDropDownLabel
            app.IzDropDownLabel = uilabel(app.UIFigure);
             app.IzDropDownLabel.Horiz
             app.IzDropDownLabel.Positi 338 25 22];
            app.IzDropDownLabel.Text = 'Iz';
 
            % Create IzDropDown
            app.IzDropDown = uidropdown(app.UIFigure);
            app.IzDropDown.Items = {'EUR', 'AUD', 'CAD', 'HRK', 'JPY', 'CHF', 'TRY', 'GBP', 'USD'};
             app.IzDropDown.Positi 338 100 22];
            app.IzDropDown.Value = 'EUR';
 
            % Create UDropDownLabel
            app.UDropDownLabel = uilabel(app.UIFigure);
             app.UDropDownLabel.Horiz
             app.UDropDownLabel.Positi 291 25 22];
            app.UDropDownLabel.Text = 'U';
 
            % Create UDropDown
            app.UDropDown = uidropdown(app.UIFigure);
            app.UDropDown.Items = {'EUR', 'AUD', 'CAD', 'HRK', 'JPY', 'CHF', 'TRY', 'GBP', 'USD'};
             app.UDropDown.Positi 291 100 22];
            app.UDropDown.Value = 'EUR';
 
            % Create IznosEditFieldLabel
            app.IznosEditFieldLabel = uilabel(app.UIFigure);
             app.IznosEditFieldLabel.Horiz
             app.IznosEditFieldLabel.Positi 243 34 22];
            app.IznosEditFieldLabel.Text = 'Iznos';
 
            % Create IznosEditField
            app.IznosEditField = uieditfield(app.UIFigure, 'numeric');
             app.IznosEditField.Positi 243 100 22];
 
            % Create KonvertiratiButton
             app.K 'push');
             app.KonvertiratiButton.Butt @KonvertiratiButtonPushed, true);
             app.KonvertiratiButton.Positi 193 100 23];
            app.KonvertiratiButton.Text = 'Konvertirati';
 
            % Create RezultatEditFieldLabel
            app.RezultatEditFieldLabel = uilabel(app.UIFigure);
             app.RezultatEditFieldLabel.Horiz
             app.RezultatEditFieldLabel.Positi 149 49 22];
            app.RezultatEditFieldLabel.Text = 'Rezultat';
 
            % Create RezultatEditField
            app.RezultatEditField = uieditfield(app.UIFigure, 'numeric');
             app.RezultatEditField.Positi 149 100 22];
 
            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end
 
    % App creation and deletion
    methods (Access = public)
 
        % Construct app
        function app = kon
 
            % Create UIFigure and components
            createComponents(app)
 
            % Register the app with App Designer
            registerApp(app, app.UIFigure)
 
            if nargout == 0
                clear app
            end
        end
 
        % Code that executes before app deletion
        function delete(app)
 
            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
