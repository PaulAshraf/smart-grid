import xlrd
import xlwt

def printloop(appliance):      
    print(len(appliance))
    for i in range(len(appliance)):
        for j in range(len(appliance[i])):
            for k in range(len(appliance[i][j])):
                print(appliance[i][j][k], end=" ")
            print("")    
        print("")    

inputXl = xlrd.open_workbook('input.xlsx')
resultsXl = xlrd.open_workbook('caseThree.xlsx')

infloadXl = inputXl.sheet_by_name('InfLoadT')
infload = []
for i in range(3):
    arr = []
    for j in range(24):
        arr.append(infloadXl.cell(j+3,i+2).value)
    infload.append(arr)  


vXl = resultsXl.sheet_by_name('v')
if vXl.cell(1,0).value == 1:
    v = 0
    startAppliance = 2
    endAppliance = 10
elif vXl.cell(1,1).value == 1:
    v = 1
    startAppliance = 11
    endAppliance = 19
elif vXl.cell(1,2).value == 1:
    v = 2
    startAppliance = 20
    endAppliance = 28

appliance = [[[0] * 24 for _ in range(3)] for _ in range(3)]
applianceXl = inputXl.sheet_by_name('Appliances')
for i in range(startAppliance,endAppliance+1,1):
    prosumer = (i - startAppliance) // 3
    applianceType = i - startAppliance - prosumer * 3
    for j in range(24):   
        appliance[prosumer][applianceType][j] = applianceXl.cell(j+6,i).value   


chargeEvXl = resultsXl.sheet_by_name('power_charge_ev')
chargeEv = []
for i in range(3):
    arr = []
    for j in range(24):
        arr.append(chargeEvXl.cell(i+1,j+1).value)
    chargeEv.append(arr)  

chargeEssXl = resultsXl.sheet_by_name('power_charge_ess')
chargeEss = []
for i in range(3):
    arr = []
    for j in range(24):
        arr.append(chargeEssXl.cell(i+1,j+1).value)
    chargeEss.append(arr)   

totalNeg = [[None] * 24 for _ in range(3)]
for i in range(3):
    for j in range(24):
        totalNeg[i][j] = infload[i][j] + appliance[i][0][j] + appliance[i][1][j] + appliance[i][2][j] + chargeEv[i][j] + chargeEss[i][j] 

evXl = resultsXl.sheet_by_name('power_used_ev')
ev = []
for i in range(3):
    arr = []
    for j in range(24):
        arr.append(-1 * evXl.cell(i+1,j+1).value)
    ev.append(arr)          

essXl = resultsXl.sheet_by_name('power_used_ess')
ess = []
for i in range(3):
    arr = []
    for j in range(24):
        arr.append(-1 * essXl.cell(i+1,j+1).value)
    ess.append(arr)    

pvXl = resultsXl.sheet_by_name('power_used_pv')
pv = []
for i in range(3):
    arr = []
    for j in range(24):
        arr.append(-1 * pvXl.cell(i+1,j+1).value)
    pv.append(arr)    

windXl = resultsXl.sheet_by_name('power_used_wind')
wind = []
for i in range(3):
    arr = []
    for j in range(24):
        arr.append(-1 * windXl.cell(i+1,j+1).value)
    wind.append(arr)    

powerXl = resultsXl.sheet_by_name('power_total_input')
power = []
for i in range(3):
    arr = []
    for j in range(24):
        arr.append(-1 * powerXl.cell(i+1,j+1).value)
    power.append(arr)    

totalPos = [[None] * 24 for _ in range(3)]
for i in range(3):
    for j in range(24):
        totalPos[i][j] = ev[i][j] + ess[i][j] + pv[i][j] + wind[i][j] + power[i][j] 

total = [[None] * 24 for _ in range(3)]
for i in range(3):
    for j in range(24):
        total[i][j] = totalPos[i][j] + totalNeg[i][j]       

load = xlwt.Workbook(encoding="utf-8")
heading = ["Infelexible","WM","DW","HVAC","EV Charge","ESS Charge","Total Load","EV Input","ESS Input","PV Input","Wind Input","Grid Power","Total Input","Total"]

for i in range(3):
    sheet = load.add_sheet("Prosumer " + str(i+1))
    for j in range(len(heading)):
            sheet.write(1,j+1,heading[j])
    for j in range(24):
        sheet.write(j+2,0,j+1)
        sheet.write(j+2,1,infload[i][j])
        sheet.write(j+2,2,appliance[i][0][j])
        sheet.write(j+2,3,appliance[i][1][j])
        sheet.write(j+2,4,appliance[i][2][j])
        sheet.write(j+2,5,chargeEv[i][j])
        sheet.write(j+2,6,chargeEss[i][j])
        sheet.write(j+2,7,totalNeg[i][j])
        sheet.write(j+2,8,ev[i][j])
        sheet.write(j+2,9,ess[i][j])
        sheet.write(j+2,10,pv[i][j])
        sheet.write(j+2,11,wind[i][j])
        sheet.write(j+2,12,power[i][j])
        sheet.write(j+2,13,totalPos[i][j])
        sheet.write(j+2,14,total[i][j])

load.save("loadThree.xls")
print("Success!")









