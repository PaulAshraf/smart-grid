sets
t timeslots /1*24/
s scenarios /1*3/
w prosumers /1*3/
c controllable_appliances /hvac,wm,dw/
f phases /beginning,ongoing,finishing/
;

alias(w,ww)

$onecho > results.txt
par=charging_effecinecy_ess rng=ESS!C5:E8 ignoreRows=6:7 cDim=1
par=charging_effecinecy_ev rng=EV!C5:E9 ignoreRows=6:8 cDim=1
par=discharging_effecinecy_ess rng=ESS!C5:E8 ignoreRows=6:7 cDim=1
par=discharging_effecinecy_ev rng=EV!C5:E9 ignoreRows=6:8 cDim=1
par=inflexible rng=InfLoadT!B3:E27 cDim=1 rDim=1
par=number_operated rng=ContLoad!B11:E14 cDim=1 rDim=1
par=power_consumption_appliance rng=contLoad!B24:K28 cDim=2 rDim=1
par=power_produced_pv rng=PV!B2:E26 cDim=1 rDim=1
par=charging_rate_ess rng=ESS!C5:E7 ignoreRows=6 cDim=1
par=charging_rate_ev rng=EV!C5:E8 ignoreRows=6:7 cDim=1
par=discharging_rate_ess rng=ESS!C5:E7 ignoreRows=6 cDim=1
par=discharging_rate_ev rng=EV!C5:E8 ignoreRows=6:7 cDim=1
par=soc_ini_ess rng=ESS!C5:E11 ignoreRows=6:10 cDim=1
par=soc_max_ess rng=ESS!C5:E15 ignoreRows=6:14 cDim=1
par=soc_min_ess rng=ESS!C5:E13 ignoreRows=6:12 cDim=1
par=soc_max_ev rng=EV!C5:E12 ignoreRows=6:11 cDim=1
par=soc_ini_ev rng=EV!C5:E14 ignoreRows=6:13 cDim=1
par=soc_min_ev rng=EV!C5:E17 ignoreRows=6:16 cDim=1
par=arrival rng=EV!C5:E18 ignoreRows=6:17 cDim=1
par=departure rng=EV!C5:E15 ignoreRows=6:14 cDim=1
par=duration_appliance rng=contLoad!B17:K21 cDim=2 rDim=1
par=buy_price rng=Real_Time_Price!B4:C27 rDim=1
par=sell_price rng=Selling_Price!B3:C26 rDim=1
par=temp_outside rng=ContLoadHVAC!B32:E56 cDim=1 rDim=1
par=temp_max rng=ContLoadHVAC!C28:E29 cDim=1
par=temp_min rng=ContLoadHVAC!C28:E30 ignoreRows=29 cDim=1
par=resistance rng=ContLoadHVAC!G29:H31 rDim=1
par=capacity rng=ContLoadHVAC!G34:H36 rDim=1
par=cop rng=ContLoadHVAC!G39:H41 rDim=1
par=temp rng=ContLoadHVAC!J28:M52 rDim=1 cDim=1
par=power_appliance rng=Appliances!B4:AC30 rDim=1 cDim=3
par=power_produced_wind rng=Wind!B2:E26 cDim=1 rDim=1
par=line_limits rng=Grid!A2:D5 cDim=1 rDim=1
par=line_limits rng=Grid!A8:D11 cDim=1 rDim=1
$offecho

*$CALL GDXXRW input.xlsx o=in.gdx @results.txt

Parameters
charging_effecinecy_ess(w)         charging efficiency of the ESS of prosumer w
charging_effecinecy_ev(w)          charging efficiency of the EV of prosumer w
discharging_effecinecy_ess(w)      discharging efficiency of the ESS of prosumer w
discharging_effecinecy_ev(w)       discharging efficiency of the EV of prosumer w
inflexible(t,w)                    inflexible load of household h in period t
number_operated(w,c)               number of times the controllable appliance c of prosumer w must be operated during the optimization horizon
power_consumption_appliance(f,c,w) power consumed by controllable appliance c of prosumer w while in phase f .
power_produced_pv(t,w)             available power of the PV system of household w in period t
power_produced_ev(t,w)             available power of the wind turbines system of household w in period t
power_produced_wind(t,w)             available power of the wind turbines system of household w in period t
charging_rate_ess(w)               charging rate of the ESS of prosumer w
charging_rate_ev(w)                charging rate of the EV of prosumer w
discharging_rate_ess(w)            discharging rate of the ESS of prosumer w
discharging_rate_ev(w)             discharging rate of the EV of prosumer w
soc_ini_ess(w)                     initial SOE of the ESS of prosumer w
soc_max_ess(w)                     maximum SOE of the ESS of prosumer w
soc_min_ess(w)                     minimum SOE of the ESS of prosumer w
soc_ini_ev(w)                      initial SOE of the EV of prosumer w
soc_max_ev(w)                      maximum SOE of the EV of prosumer w
soc_min_ev(w)                      minimum SOE of the EV of prosumer w
arrival(w)                         arrival period of the EV of prosumer w
departure(w)                       departure period of the EV of prosumer w
duration_appliance(f,c,w)          duration of phase f of controllable appliance c of prosumer w [number of T-hour periods]
buy_price(t)                       "price at which energy is bought "
sell_price(t)                      "price at which energy is sold "
temp_outside(t,w)                  outside tempreture of w during period t
temp_max(w)                        maximum prefereed tempreture for w
temp_min(w)                        minmum prefereed tempreture for w
resistance(w)                      resistance of the air of w
capacity(w)                        thermal capacity of the air of w
cop(w)                             coofeciant of perfromance for w
power_appliance(t,s,w,c)           power consumed by controllable appliance c of prosumer w while in period t in scenario s
line_limits(w,ww)                  the limit of the transfer between prosumer w and ww
line_loses(w,ww)                  the loses of the transfer between prosumer w and ww
;

$gdxIn in.gdx
$load charging_effecinecy_ess
$load charging_effecinecy_ev
$load discharging_effecinecy_ess
$load discharging_effecinecy_ev
$load inflexible
$load number_operated
$load power_consumption_appliance
$load power_produced_pv
$load power_produced_wind
$load charging_rate_ess
$load charging_rate_ev discharging_rate_ess
$load discharging_rate_ev
$load soc_ini_ess
$load soc_max_ess
$load soc_min_ess
$load soc_ini_ev
$load soc_max_ev
$load soc_min_ev
$load arrival
$load departure
$load duration_appliance
$load buy_price
$load sell_price
$load temp_outside
$load temp_max
$load temp_min
$load resistance
$load capacity
$load cop
$load power_appliance
$load line_limits
$load line_loses


scalar time_interval /1/ ;
scalar N /3/ ;


positive variables
power_sold_pv(w,t)          portion of the PV discharging power of prosumer w injected to PCC in period t
power_used_pv(w,t)          portion of the PV power of prosumer w used to satisfy self-consumption in period t
power_sold_wind(w,t)          portion of the PV discharging power of prosumer w injected to PCC in period t
power_used_wind(w,t)          portion of the PV power of prosumer w used to satisfy self-consumption in period t
power_total_input(w,t)      total power procured by prosumer w in period t
power_total_output(w,t)     total power injected to grid prosumer w in period t
power_charge_ess(w,t)       charging power of ESS of prosumer w in period t
power_discharge_ess(w,t)    discharging power of ESS of prosumer w in period t
power_used_ess(w,t)         portion of the ESS discharging power of prosumer w used to satisfy self-consumption in period t
power_sold_ess(w,t)         portion of the ESS discharging power of prosumer w injected to PCC in period t
soc_ess(w,t)                SOC of ESS of prosumer w in period t
power_charge_ev(w,t)        charging power of EV of prosumer w in period t
power_discharge_ev(w,t)     charging power of EV of prosumer w in period t
power_used_ev(w,t)          portion of the EV discharging power of prosumer w used to satisfy self-consumption in period t
power_sold_ev(w,t)          portion of the EV discharging power of prosumer w injected to PCC in period t
soc_ev(w,t)                 SOC of EV of prosumer w in period t
power_used_appliance(w,t,c) power consumed by controllable appliance c of prosumer w while in period t
power_grid_input(w,t)             power bought from the grid if everything is insuffecient
power_grid_output(w,t)            power sold to the grid if there is no need for it
power_exchange(w,ww,t)      power exchanged from prosumer ww to prosumer w at time t
;


Binary Variables
x2(w,t)          "binary variable. 1 if the power flows from grid to prosumers/if EV is charging (w = {1, 2, 3}) for prosumer w in period t; else 0."
x3(w,t)          "binary variable. 1 if the power flows from grid to prosumers/ if ESS is charging (w = {1, 2, 3}) for prosumer w in period t; else 0."
v(s)             "binary variables. 1 if the scenario is the optimal scenario to operate; else 0"
;

variable cost total cost for the procumer;

equations
*** objective function ***
objective_function
*** balance in each prosumer ***
balance(w,t)
*** power bought and sold ***
power1(w,t)
*** electric vehicles ***
ev1(w,t)
ev2(w,t)
ev3(w,t)
ev4(w,t)
ev5(w,t)
ev6_upper(w,t)
ev6_lower(w,t)
ev7(w,t)
ev8(w,t)
ev9(w,t)
*** energy storgae system ***
ess1(w,t)
ess2(w,t)
ess3(w,t)
ess4(w,t)
ess5(w,t)
ess6_upper(w,t)
ess6_lower(w,t)
ess7(w,t)
*** pv production ***
pv1(w,t)
pv2(w,t)
*** wind production ***
wind1(w,t)
wind2(w,t)
*** new appliances formulation ***
new_appliance_1(t,w,c)
new_appliance_2
*** grid ***
grid1(w,t)
grid2(w,ww,t)
grid3(ww,t)
*grid4(w,ww,t)
*grid5(w,ww,t)
;


*** objective function ***

* objective_function .. cost =e= sum((w,t),((buy_price(t)*power_total_input(w,t)*time_interval)-(sell_price(t)*power_total_output(w,t)*time_interval)));

objective_function .. cost =e= sum((w,t),((buy_price(t)*power_total_input(w,t)*time_interval)-(sell_price(t)*power_total_output(w,t)*time_interval)));


*** balance in each prosumer ***

balance(w,t) .. power_total_input(w,t) + power_used_pv(w,t) +  power_used_ess(w,t) + power_used_ev(w,t) + power_used_wind(w,t)  =e= inflexible(t,w) +  power_charge_ess(w,t) + power_charge_ev(w,t) + sum((c),power_used_appliance(w,t,c));

*** power bought and sold ***

power1(w,t) .. power_total_output(w,t) =e= power_sold_pv(w,t) + power_sold_ess(w,t) + power_sold_ev(w,t) + power_sold_wind(w,t);

*** electric vehicles ***

ev1(w,t) .. power_used_ev(w,t) + power_sold_ev(w,t) =e= discharging_effecinecy_ev(w) * power_discharge_ev(w,t);

ev2(w,t) .. power_charge_ev(w,t) =l= charging_rate_ev(w) * x2(w,t);

ev3(w,t) .. power_discharge_ev(w,t) =l= discharging_rate_ev(w) * (1 - x2(w,t));

ev4(w,t)$(ord(t)=arrival(w)) .. soc_ev(w,t) =e= soc_ini_ev(w);

**+ charging_effecinecy_ev(w) * power_charge_ev(w,t) * time_interval - power_discharge_ev(w,t) * time_interval * discharging_effecinecy_ev(w);

ev5(w,t)$(ord(t)>arrival(w) and ord(t)<=departure(w)) .. soc_ev(w,t) =e= soc_ev(w,t-1) + charging_effecinecy_ev(w) * power_charge_ev(w,t) - power_discharge_ev(w,t) * discharging_effecinecy_ev(w);

ev8(w,t)$(ord(t)<arrival(w) or ord(t)>departure(w)) .. power_charge_ev(w,t) =e= 0;

ev9(w,t)$(ord(t)<arrival(w) or ord(t)>departure(w)) .. power_discharge_ev(w,t) =e= 0;

ev6_upper(w,t)$(ord(t)>arrival(w) and ord(t)<departure(w)) .. soc_ev(w,t) =l= soc_max_ev(w);

ev6_lower(w,t)$(ord(t)>arrival(w) and ord(t)<departure(w)) .. soc_ev(w,t) =g= soc_min_ev(w);

ev7(w,t)$(ord(t)=departure(w)) .. soc_ev(w,t) =e= soc_max_ev(w);

*** energy storgae system ***

ess1(w,t) .. power_used_ess(w,t) + power_sold_ess(w,t) =e= discharging_effecinecy_ess(w) * power_discharge_ess(w,t);

ess2(w,t) .. power_charge_ess(w,t) =l= charging_rate_ess(w) * x3(w,t);

ess3(w,t) .. power_discharge_ess(w,t) =l= discharging_rate_ess(w) * (1 - x3(w,t));

ess4(w,t)$(ord(t)>1) .. soc_ess(w,t) =e= soc_ess(w,t-1) + charging_effecinecy_ess(w) * power_charge_ess(w,t) * time_interval - power_discharge_ess(w,t) * time_interval;

ess5(w,t)$(ord(t)=1) .. soc_ess(w,t) =e= soc_ini_ess(w);

ess6_upper(w,t) .. soc_ess(w,t) =l= soc_max_ess(w);

ess6_lower(w,t) .. soc_ess(w,t) =g= soc_min_ess(w);

ess7(w,t)$(ord(t)=24) .. soc_ess(w,t) =e= soc_ini_ess(w);

*** pv production ***

pv1(w,t)$(ord(w)=1 or ord(w)=3) .. power_used_pv(w,t) + power_sold_pv(w,t) =e= power_produced_pv(t,w) * 1;
pv2(w,t)$(ord(w)=2) .. power_used_pv(w,t) + power_sold_pv(w,t) =e= power_produced_pv(t,w) * 1;


*** wind production ***

wind1(w,t)$(ord(w)=1 or ord(w)=3) .. power_used_wind(w,t) + power_sold_wind(w,t) =e= power_produced_wind(t,w) * 1;
wind2(w,t)$(ord(w)=2) .. power_used_wind(w,t) + power_sold_wind(w,t) =e= power_produced_wind(t,w) * 1;


*** new appliances formulation ***

new_appliance_1(t,w,c) .. power_used_appliance(w,t,c) =e= sum((s),v(s)*power_appliance(t,s,w,c));

new_appliance_2 .. sum((s),v(s)) =e= 1;

*** grid ***

grid1(w,t) .. power_total_input(w,t) =e= sum((ww),power_exchange(w,ww,t) * line_loses(w,ww)) + power_grid_input(w,t);

grid2(w,ww,t) .. power_exchange(w,ww,t) =l= line_limits(w,ww);

grid3(ww,t) .. power_total_output(ww,t) =e= sum((w),power_exchange(w,ww,t) * line_loses(w,ww)) + power_grid_output(ww,t);

*grid4(w,ww,t)$(ord(w)=ord(ww)) .. power_exchange(w,ww,t) =e= 0;

*grid5(w,ww,t) .. power_exchange(w,ww,t) =e= -1 * power_exchange(ww,w,t);

model vpp /ALL/

*option minlp=SCIP;
option mip=CPLEX;
*option Limrow=500;

SOLVE vpp USING mip  MINIMIZING cost;

display cost.l;
display power_total_input.l;
display power_total_output.l;
display power_charge_ess.l;
display power_discharge_ess.l;
display power_used_ess.l;
display power_charge_ev.l;
display power_discharge_ev.l;
display power_used_ev.l;
display power_used_pv.l;
display power_sold_ess.l;
display power_sold_ev.l;
display power_sold_pv.l;
display soc_ess.l;
display soc_ev.l;
display power_used_appliance.l;
display power_exchange.l;
display power_grid_input.l;
display power_grid_output.l;
display power_used_wind.l;
display power_sold_wind.l;

display x2.l;
display x3.l;
display v.l;

display charging_effecinecy_ess;
display charging_effecinecy_ev;
display discharging_effecinecy_ess;
display discharging_effecinecy_ev;
display inflexible;
display number_operated;
display power_consumption_appliance;
display power_produced_pv;
display charging_rate_ess;
display charging_rate_ev;
display discharging_rate_ess;
display discharging_rate_ev;
display soc_ini_ess;
display soc_max_ess;
display soc_min_ess;
display soc_ini_ev;
display soc_max_ev;
display soc_min_ev;
display arrival;
display departure;
display duration_appliance;
display buy_price;
display sell_price;
display temp_outside;
display temp_max;
display temp_min;
display resistance;
display capacity;
display cop;
display power_appliance;
display line_limits;

execute_unload "results.gdx"
cost.l
power_total_input.l
power_total_output.l
power_charge_ess.l
power_discharge_ess.l
power_used_ess.l
power_charge_ev.l
power_discharge_ev.l
power_used_ev.l
power_used_pv.l
power_sold_ess.l
power_sold_ev.l
power_sold_pv.l
power_used_wind.l
power_sold_wind.l
soc_ess.l
soc_ev.l
power_used_appliance.l
power_exchange.l
power_grid_input.l
power_grid_output.l
x2.l
x3.l
v.l

execute 'gdxxrw.exe results.gdx squeeze=n var=cost.l rng=cost!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_total_input.l cDim=0 rDim=0 rng=power_total_input!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_total_output.l rng=power_total_output!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_charge_ess.l rng=power_charge_ess!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_discharge_ess.l rng=power_discharge_ess!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_used_ess.l rng=power_used_ess!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_used_ess.l rng=power_used_ess!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_used_ess.l rng=power_used_ess!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_used_ess.l rng=power_used_ess!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_charge_ev.l rng=power_charge_ev!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_discharge_ev.l rng=power_discharge_ev!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_used_ev.l rng=power_used_ev!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_used_pv.l rng=power_used_pv!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_sold_ess.l rng=power_sold_ess!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_sold_ev.l rng=power_sold_ev!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_sold_pv.l rng=power_sold_pv!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=soc_ess.l rng=soc_ess!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=soc_ev.l rng=soc_ev!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_used_appliance.l rng=power_used_appliance!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_exchange.l rng=power_exchange!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_grid_input.l rng=power_grid_input!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=power_grid_output.l rng=power_grid_output!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=x2.l rng=x2!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=x3.l rng=x3!'
* execute 'gdxxrw.exe results.gdx squeeze=n intAsText=n var=v.l rng=v!'

