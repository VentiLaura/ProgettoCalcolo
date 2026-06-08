% =========================================================================
% METODO DEL PUNTO FISSO CON GRAFICO A RAGNATELA (COBWEB PLOT)
% =========================================================================
clear; clc; close all;
format long; % Imposta la visualizzazione interna di MATLAB ad alta precisione

% 1. DEFINIZIONE DELLA FUNZIONE g(x) (Corretto l'operatore di divisione vettoriale)
g = @(x) sqrt((2 - log(x+2)) ./ x);

% 2. PARAMETRI DI INPUT (Modificato x0 per evitare i numeri complessi della radice)
x0 = 1;           % Punto iniziale positivo e sicuro
tol = 1e-12;      % Tolleranza ad alta precisione
max_iter = 150;    % Numero massimo di iterazioni per il grafico

% 3. ALLOCAZIONE VETTORI PER MEMORIZZARE I PASSI
X = zeros(1, max_iter);
X(1) = x0;
iter = 0;
errore = Inf;

% =========================================================================
% 4. LOOP ITERATIVO (Calcolo numerico con controllo di divergenza)
% =========================================================================
diverge = false; 

while (errore > tol) && (iter < max_iter-1)
    iter = iter + 1;
    prossimo_x = g(X(iter));
    
    % CONTROLLO DI SICUREZZA 1: Se il valore è Inf, NaN o complesso
    if isnan(prossimo_x) || isinf(prossimo_x) || ~isreal(prossimo_x) || abs(prossimo_x) > 1e10
        diverge = true;
        break; 
    end
    
    X(iter+1) = prossimo_x;
    
    % CONTROLLO DI SICUREZZA 2: Controllo esplosione errore
    nuovo_errore = abs(X(iter+1) - X(iter));
    if iter > 1 && nuovo_errore > errore * 10 
        diverge = true;
        errore = nuovo_errore;
        break;
    end
    
    errore = nuovo_errore;
end

% Tagliamo i vettori alle iterazioni effettivamente calcolate
X = X(1:iter+1);

% Stampa dei risultati nella Command Window (Mostra 12 cifre decimali)
fprintf('---------------------------------------------------\n');
if diverge
    warning('ATTENZIONE: Il metodo sta DIVERGENDO o ha calcolato valori non ammissibili!');
    fprintf('Il calcolo è stato arrestato alla iterazione %d.\n', iter);
elseif iter >= max_iter-1 && errore > tol
    warning('Il metodo non è giunto a convergenza nel numero massimo di iterazioni consentite.');
    fprintf('Ultimo valore calcolato: %1.12f (Errore rimasto: %1.2e)\n', X(end), errore);
else
    fprintf('Il metodo è CONVERGSO con successo!\n');
    fprintf('Punto fisso trovato: %1.12f in %d iterazioni.\n', X(end), iter);
end
fprintf('---------------------------------------------------\n');

% =========================================================================
% 5. PARTE GRAFICA (Semplificata in sicurezza poiché X contiene solo valori positivi)
% =========================================================================
if ~diverge
    figure('Name', 'Analisi di Convergenza - Punto Fisso', 'NumberTitle', 'off');
    hold on; grid on;

    % Definiamo un intervallo degli assi pulito intorno ai punti calcolati
    % Poiché x0 > 0, min(X) rimarrà saldamente sopra lo zero, evitando i C.E. pericolosi
    xmin = max(min(X) - 0.2, 0.01); 
    xmax = max(X) + 0.2;
    x_plot = linspace(xmin, xmax, 500);

    % Disegno la bisettrice y = x (in rosso tratteggiato)
    plot(x_plot, x_plot, 'r--', 'LineWidth', 1.5, 'DisplayName', 'y = x');

    % Disegno la curva y = g(x) (in blu)
    plot(x_plot, g(x_plot), 'b-', 'LineWidth', 2, 'DisplayName', 'y = g(x)');

    % Disegno l'andamento iterativo (La Ragnatela)
    for k = 1:iter
        % Segmento verticale: da (x_k, x_k) a (x_k, x_k+1) cioè su y=g(x)
        % Aggiunto 'HandleVisibility', 'off' per non intasare la legenda
        if k == 1
            plot([X(k), X(k)], [0, X(k+1)], 'g-', 'LineWidth', 1.5, 'HandleVisibility', 'off'); 
        else
            plot([X(k), X(k)], [X(k), X(k+1)], 'g-', 'LineWidth', 1.5, 'HandleVisibility', 'off');
        end
        pause(0.1); % Ridotto leggermente il tempo per non annoiarsi se le iterazioni sono tante!
        
        % Segmento orizzontale: da (x_k, x_k+1) a (x_k+1, x_k+1) cioè sulla bisettrice
        plot([X(k), X(k+1)], [X(k+1), X(k+1)], 'g-', 'LineWidth', 1.5, 'HandleVisibility', 'off');
        pause(0.1);
    end

    % Evidenzio i punti di scatto con dei pallini neri
    plot(X(1:end-1), X(2:end), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 4);

    % Evidenzio il punto fisso finale con una stella magica
    plot(X(end), X(end), 'mp', 'MarkerFaceColor', 'm', 'MarkerSize', 12, 'DisplayName', 'Punto Fisso (\alpha)');

    % Abbellimenti del grafico
    xlabel('x_k');
    ylabel('y');
    title('Visualizzazione della Convergenza (Grafico a Ragnatela)');
    legend('Location', 'best');
    axis square;
    hold off;
end