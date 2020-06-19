function F = BoundaryEquations(x,epsilon,kg,hg,as,Density_bed,Flowin,Pt,R,RxnKinetic,Components,T,C_gas_In,C_gas_Out,BoundaryCond)

C_Cs_C2H6 = x(1);
C_Cs_C2H4 = x(2);
C_Cs_O2   = x(3);
C_Cs_CO2  = x(4);
C_Cs_CO   = x(5);
C_Cs_H2O  = x(6);
Cpf       = x(7);
Ts        = x(8);

% C_solid = x(1:6);
C_solid = C_gas_In;

if strcmp(BoundaryCond,'First')== 1
C_C_C2H6 = C_gas_In(1);
C_C_C2H4 = C_gas_In(2);
C_C_O2   = C_gas_In(3);
C_C_CO2  = C_gas_In(4);
C_C_CO   = C_gas_In(5);
C_C_H2O  = C_gas_In(6);

y_gas = C_gas_In/sum(C_gas_In);

E_Cs_C2H6 = (1-epsilon)*kg*as*(C_C_C2H6 - C_Cs_C2H6) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],1,'Mass'));   
E_Cs_C2H4 = (1-epsilon)*kg*as*(C_C_C2H4 - C_Cs_C2H4) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],2,'Mass'));
E_Cs_O2   = (1-epsilon)*kg*as*(C_C_O2 - C_Cs_O2) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],3,'Mass'));   
E_Cs_CO2  = (1-epsilon)*kg*as*(C_C_CO2 - C_Cs_CO2) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],4,'Mass'));
E_Cs_CO   = (1-epsilon)*kg*as*(C_C_CO - C_Cs_CO) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],5,'Mass'));   
E_Cs_H2O  = (1-epsilon)*kg*as*(C_C_H2O - C_Cs_H2O) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],6,'Mass'));
E_Cpf     = Cpf - (((Components(1).cp_R(1) + Components(1).cp_R(2)*T + Components(1).cp_R(3)*T^2 + Components(1).cp_R(4)*T^(-2))*R)*(y_gas(1)))*(1/Components(1).Mw) ...
                - (((Components(2).cp_R(1) + Components(2).cp_R(2)*T + Components(2).cp_R(3)*T^2 + Components(2).cp_R(4)*T^(-2))*R)*(y_gas(2)))*(1/Components(2).Mw)...
                - (((Components(3).cp_R(1) + Components(3).cp_R(2)*T + Components(3).cp_R(3)*T^2 + Components(3).cp_R(4)*T^(-2))*R)*(y_gas(3)))*(1/Components(3).Mw) ...
                - (((Components(4).cp_R(1) + Components(4).cp_R(2)*T + Components(4).cp_R(3)*T^2 + Components(4).cp_R(4)*T^(-2))*R)*(y_gas(4)))*(1/Components(4).Mw) ...
                - (((Components(5).cp_R(1) + Components(5).cp_R(2)*T + Components(5).cp_R(3)*T^2 + Components(5).cp_R(4)*T^(-2))*R)*(y_gas(5)))*(1/Components(5).Mw) ...
                - (((Components(6).cp_R(1) + Components(6).cp_R(2)*T + Components(6).cp_R(3)*T^2 + Components(6).cp_R(4)*T^(-2))*R)*(y_gas(6)))*(1/Components(6).Mw) ...
                - (((Components(7).cp_R(1) + Components(7).cp_R(2)*T + Components(7).cp_R(3)*T^2 + Components(7).cp_R(4)*T^(-2))*R)*(y_gas(7)))*(1/Components(7).Mw);
E_Ts      = (1-epsilon)*hg*as*(T - Ts) + Density_bed*ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],1,'Energy');
                    
elseif strcmp(BoundaryCond,'Last')== 1

C_solid = C_gas_Out;
    
C_C_C2H6 = C_gas_Out(1);
C_C_C2H4 = C_gas_Out(2);
C_C_O2   = C_gas_Out(3);
C_C_CO2  = C_gas_Out(4);
C_C_CO   = C_gas_Out(5);
C_C_H2O  = C_gas_Out(6);

y_gas = C_gas_Out/sum(C_gas_Out);

E_Cs_C2H6 = (1-epsilon)*kg*as*(C_C_C2H6 - C_Cs_C2H6) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],1,'Mass'));   
E_Cs_C2H4 = (1-epsilon)*kg*as*(C_C_C2H4 - C_Cs_C2H4) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],2,'Mass'));
E_Cs_O2   = (1-epsilon)*kg*as*(C_C_O2 - C_Cs_O2) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],3,'Mass'));   
E_Cs_CO2  = (1-epsilon)*kg*as*(C_C_CO2 - C_Cs_CO2) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],4,'Mass'));
E_Cs_CO   = (1-epsilon)*kg*as*(C_C_CO - C_Cs_CO) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],5,'Mass'));   
E_Cs_H2O  = (1-epsilon)*kg*as*(C_C_H2O - C_Cs_H2O) + Density_bed*(ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],6,'Mass'));
E_Cpf     = Cpf - (((Components(1).cp_R(1) + Components(1).cp_R(2)*T + Components(1).cp_R(3)*T^2 + Components(1).cp_R(4)*T^(-2))*R)*(y_gas(1)))*(1/Components(1).Mw) ...
                - (((Components(2).cp_R(1) + Components(2).cp_R(2)*T + Components(2).cp_R(3)*T^2 + Components(2).cp_R(4)*T^(-2))*R)*(y_gas(2)))*(1/Components(2).Mw) ...
                - (((Components(3).cp_R(1) + Components(3).cp_R(2)*T + Components(3).cp_R(3)*T^2 + Components(3).cp_R(4)*T^(-2))*R)*(y_gas(3)))*(1/Components(3).Mw) ...
                - (((Components(4).cp_R(1) + Components(4).cp_R(2)*T + Components(4).cp_R(3)*T^2 + Components(4).cp_R(4)*T^(-2))*R)*(y_gas(4)))*(1/Components(4).Mw) ...
                - (((Components(5).cp_R(1) + Components(5).cp_R(2)*T + Components(5).cp_R(3)*T^2 + Components(5).cp_R(4)*T^(-2))*R)*(y_gas(5)))*(1/Components(5).Mw) ...
                - (((Components(6).cp_R(1) + Components(6).cp_R(2)*T + Components(6).cp_R(3)*T^2 + Components(6).cp_R(4)*T^(-2))*R)*(y_gas(6)))*(1/Components(6).Mw) ...
                - (((Components(7).cp_R(1) + Components(7).cp_R(2)*T + Components(7).cp_R(3)*T^2 + Components(7).cp_R(4)*T^(-2))*R)*(y_gas(7)))*(1/Components(7).Mw);
E_Ts      = (1-epsilon)*hg*as*(T - Ts) + Density_bed*ODHReactions(C_solid,Ts,R,Pt,Flowin,RxnKinetic,[Components.deltaS0],[Components.deltaH0],1,'Energy');

end

F = [E_Cs_C2H6 E_Cs_C2H4 E_Cs_O2 E_Cs_CO2 E_Cs_CO E_Cs_H2O E_Cpf E_Ts];

end