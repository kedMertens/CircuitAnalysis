function [I, U, phi, G] = NA(E, J, R, An)

E = sparse(E);
J = sparse(J);
R = sparse(R);

%     g  = sparse(1)./R;
%     g_d = diag(g);
%     
%     G = An*g_d*An'; % Matrix of coefficients
%     E = E + R.*Is; % Transfrom current sourse in parralel branch to emf sourse in serial
%     J = -sum((E.*g)'.*An,2); % Right part of the system
%     phi = G\J;   % Potentials from 1st to  n-1 nodes
%     
%     U = An'*phi; % Potendials without taking sources into account
%     U = (U + E); % Potendials with taking sources into account
%     I = U.*g;    % Currents
    
    g  = sparse(1)./R;
    g_d = diag(g);
    
    G = An*g_d*An'; % Matrix of coefficients
    J = An*(J - E.*g);  % Right part of the system (Currents)
    phi = G\J;   % Potentials from 1st to  n-1 nodes
    
    U = (phi'*An)'; % Branch voltage drop

    I = (U + E).*g;    % Currents
    
    phi = full(phi);
    I = full(I);
    U = full(U);
    
end