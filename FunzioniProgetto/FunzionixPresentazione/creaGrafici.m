function crea_grafici(res)
    % Decrescita del Residuo
    figure();
    semilogy(res, 'b.-');
    xlabel('Iterazione'); ylabel('Residuo'); grid on;
    title('Decrescita del Residuo');

    % Fattore di Conversione Reale
    if length(res) > 1
        C_reale = res(2:end) ./ res(1:end-1);
        figure();
        plot(C_reale, 'r.-');
        xlabel('Iterazione'); ylabel('Fattore C (res_{n}/res_{n-1})'); grid on;
        title('Verifica del Fattore di Conversione Reale');
    end
end