%info on houses
house_tot = 47000;
house_per_km = 8000; %km-2
house_revenue_month = 150;
house_consumption_year = 5.4*10^10;

%info on nuclear plant
hours = 8000;
power = 1400*10^6;
energy_year = power*(hours*60^2);

%area
cost_per_km2 = 21*10^6; %renovate every 20 yrs

overall_profit = 1; i = 1;
radius_covered = 0; %km
x = []; y = [];
max = [0, 0];

while overall_profit >= 0

    area_covered = pi.*(radius_covered).^2; %km2
    
    house_num = radius_covered*house_per_km;
    energy_needed = house_num*house_consumption_year;
    
    
    tot_revenue = house_num*house_revenue_month*12*20; %20 yr
    tot_cost = cost_per_km2*area_covered;
    
    overall_profit = tot_revenue-tot_cost;
    remaining_energy = energy_year-energy_needed;

    x(i) = house_num;
    y(i) = overall_profit;
    if overall_profit > max(2)
        max(1) = house_num;
        max(2) = overall_profit;
    end

    radius_covered = radius_covered+0.01; %km
    i = i+1;
end 

plot(x, y, "b-", LineWidth= 2)
hold on
plot(max(1), max(2), "ro")
xlabel("Houses heated")
ylabel("Profit in Pounds")
hold off