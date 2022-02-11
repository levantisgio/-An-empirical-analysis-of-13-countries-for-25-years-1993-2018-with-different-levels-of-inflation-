
*** PANEL DATA ANALYSIS ***

use "/Users/levantisgio/Desktop/solo.dta", clear

merge 1:1 Time TimeCode CountryName CountryCode using "/Users/levantisgio/Desktop/solo2.dta"
drop _merge
merge 1:1 Time TimeCode CountryName CountryCode using "/Users/levantisgio/Desktop/solo3.dta"
drop _merge
merge 1:1 Time TimeCode CountryName CountryCode using "/Users/levantisgio/Desktop/solo4.dta"
drop _merge
merge 1:1 Time TimeCode CountryName CountryCode using "/Users/levantisgio/Desktop/solo5.dta"
drop TimeCode CountryCode _merge

rename Time year
rename CountryName country
rename GDPgrowthannualNYGDPMK GDPgr
rename Grossfixedcapitalformation GFCF
rename Grossfixedcapitalformationa GFCFann
rename Centralgovernmentdebttotal debt
rename Foreigndirectinvestmentneti fdi
rename Generalgovernmentfinalconsump ggfce
rename LaborforcetotalSLTLFTOTL lf
rename Laborforceparticipationrate lf1564
rename MerchandisetradeofGDPTG trade
rename Populationages65andabove Pop65
rename PopulationgrowthannualSP Popgr
rename Ruralpopulationoftotalpop rural
rename InflationGDPdeflatorannual inflation
rename PM25airpollutionmeanannual pollution
rename TaxrevenueofGDPGCTAXT tax
rename Totalnaturalresourcesrents tnrr
rename Exportsofgoodsandservices Exports
rename Importsofgoodsandservices Imports
rename DepositinterestrateFRIN DIR
rename GrossdomesticsavingsofGDP Savings
rename RealinterestrateFRINRR RIR
rename FinalConsumptionofGDP FC

label variable GDPgr "GDP growth (annual %)"
label variable GFCF "Gross fixed capital formation (% of GDP)"
label variable GFCFann "Gross fixed capital formation (annual % growth)"
label variable debt "Central government debt, total (% of GDP)"
label variable fdi "Foreign direct investment, net inflows (% of GDP)"
label variable ggfce "General government final consumption expenditure (% of GDP) "
label variable lf "Labor force, total "
label variable lf1564 "Labor force participation rate, total (% of total population ages 15-64) "
label variable trade "Merchandise trade (% of GDP)"
label variable Pop65 "Population ages 65 and above (% of total population) "
label variable Popgr "Population growth (annual %) "
label variable rural "Rural population (% of total population) "
label variable inflation "Inflation, GDP deflator (annual %)"
label variable pollution "PM2.5 air pollution, mean annual exposure (micrograms per cubic meter)"
label variable tax "Tax revenue (% of GDP)"
label variable tnrr "Total natural resources rents (% of GDP)"
label variable Exports "Exports of goods and services (% of GDP)"
label variable Imports "Imports of goods and services (% of GDP)"
label variable Inflationconsumerpricesannu "Inflation, consumer prices (annual %) "
label variable DIR "Deposit interest rate (%) "
label variable Savings "Gross domestic savings (% of GDP)"
label variable RIR "Real interest rate (%)"

*** MANAGING DATA***

sort country year
encode country, gen( countryname_)
drop country
rename countryname_ country
order year country

xtset country year //SET THE DATA TO PANEL FORMAT 
sort country year
bysort country: gen gr_lf = [(lf-L.lf)/L.lf]*100

gen debt2 = debt^2
gen dTrade = Exports - Imports
label variable gr_lf "Growth of labor force"
label variable debt2 "debt squared"
label variable dTrade " exports-imports (%) "
order year country GDPgr GFCF debt gr_lf inflation tax ggfce pollution dTrade
gen id = _n
sort country year
by country: egen average_infl =mean(inflation)





                                        *** GRAPHICAL ANALYSIS ***   


           //  HISTOGRAMS  //
		   
histogram GDPgr, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) lpattern(blank) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor("0 0 0")) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(GDP Growth (%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of GDP growth (%)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))	   
histogram GDPgr, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) lpattern(blank) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor("0 0 0")) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(GDP Growth (%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of GDP growth (%)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram GDPgr, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) lpattern(blank) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor("0 0 0")) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(GDP Growth (%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of GDP growth (%)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))

histogram GFCF, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(GFCF (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of GFCF (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram GFCF, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(GFCF (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of GFCF (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram GFCF, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(GFCF (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of GFCF (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))

histogram debt, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Debt (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Debt (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram debt, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Debt (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Debt (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram debt, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Debt (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Debt (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))

histogram gr_lf, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Growth of labor force (%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Growth of Labor Force", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram gr_lf, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Growth of labor force (%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Growth of Labor Force", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram gr_lf, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Growth of labor force (%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Growth of Labor Force", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))

histogram inflation, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Inflation rate (%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Inflation (annual%)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram inflation, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Inflation rate (%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Inflation (annual%)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram inflation, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Inflation rate (%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Inflation (annual%)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))

histogram tax, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Tax Revenue (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Taxes (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram tax, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Tax Revenue (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Taxes (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram tax, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Tax Revenue (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Taxes (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))

histogram ggfce, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(GGFCE (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of GGFCE (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram ggfce, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(GGFCE (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of GGFCE (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram ggfce, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(GGFCE (% of GDP)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of GGFCE (% of GDP)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))

histogram pollution, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Pollution (micrograms per cubic meter)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Pollution (micrograms per cubic meter)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram pollution, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Pollution (micrograms per cubic meter)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Pollution (micrograms per cubic meter)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram pollution, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(Pollution (micrograms per cubic meter)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of Pollution (micrograms per cubic meter)", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))

histogram dTrade, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(dTrade (Export-Imports)(%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of dTrade", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram dTrade, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(dTrade (Export-Imports)(%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of dTrade", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram dTrade, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(dTrade (Export-Imports)(%)) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of dTrade", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))

		  
		  //  BOXPLOTS  //
		  
graph box GDPgr, box(1, fcolor("172 128 68") fintensity(inten100) lcolor(black)) medtype(cline) medline(lcolor(white) lpattern(dash_3dot)) cwhisker lines(lcolor("255 255 255") lpattern(longdash_dot_dot)) marker(1, mcolor("172 128 68") msize(medium) msymbol(circle_hollow)) ytitle(GDP Growth (annual %)) ytitle(, size(small) color("172 128 68")) ylabel(#4, labels labsize(small) labcolor("172 128 68") angle(horizontal) valuelabel ticks tlcolor("172 128 68") tposition(inside) grid glcolor("172 128 68") gmin gmax gextend) title("Boxplot of GDP Growth", size(large) color(white) margin(medium) box fcolor(black) lcolor(white)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))	  
graph box GFCF, box(1, fcolor("172 128 68") fintensity(inten100) lcolor(black)) medtype(cline) medline(lcolor(white) lpattern(dash_3dot)) cwhisker lines(lcolor("255 255 255") lpattern(longdash_dot_dot)) marker(1, mcolor("172 128 68") msize(medium) msymbol(circle_hollow)) ytitle(GFCF (% of GDP)) ytitle(, size(small) color("172 128 68")) ylabel(#4, labels labsize(small) labcolor("172 128 68") angle(horizontal) valuelabel ticks tlcolor("172 128 68") tposition(inside) grid glcolor("172 128 68") gmin gmax gextend) title("Boxplot of GFCF", size(large) color(white) margin(medium) box fcolor(black) lcolor(white)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
graph box debt, box(1, fcolor("172 128 68") fintensity(inten100) lcolor(black)) medtype(cline) medline(lcolor(white) lpattern(dash_3dot)) cwhisker lines(lcolor("255 255 255") lpattern(longdash_dot_dot)) marker(1, mcolor("172 128 68") msize(medium) msymbol(circle_hollow)) ytitle(Debt (% of GDP)) ytitle(, size(small) color("172 128 68")) ylabel(#4, labels labsize(small) labcolor("172 128 68") angle(horizontal) valuelabel ticks tlcolor("172 128 68") tposition(inside) grid glcolor("172 128 68") gmin gmax gextend) title("Boxplot of Debt", size(large) color(white) margin(medium) box fcolor(black) lcolor(white)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
graph box gr_lf, box(1, fcolor("172 128 68") fintensity(inten100) lcolor(black)) medtype(cline) medline(lcolor(white) lpattern(dash_3dot)) cwhisker lines(lcolor("255 255 255") lpattern(longdash_dot_dot)) marker(1, mcolor("172 128 68") msize(medium) msymbol(circle_hollow)) ytitle(Gr_labor (% annual)) ytitle(, size(small) color("172 128 68")) ylabel(#4, labels labsize(small) labcolor("172 128 68") angle(horizontal) valuelabel ticks tlcolor("172 128 68") tposition(inside) grid glcolor("172 128 68") gmin gmax gextend) title("Boxplot of Labor Growth ", size(large) color(white) margin(medium) box fcolor(black) lcolor(white)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
graph box dTrade, box(1, fcolor("172 128 68") fintensity(inten100) lcolor(black)) medtype(cline) medline(lcolor(white) lpattern(dash_3dot)) cwhisker lines(lcolor("255 255 255") lpattern(longdash_dot_dot)) marker(1, mcolor("172 128 68") msize(medium) msymbol(circle_hollow)) ytitle(dTrade (Exp.-Imp. % of GDP)) ytitle(, size(small) color("172 128 68")) ylabel(#4, labels labsize(small) labcolor("172 128 68") angle(horizontal) valuelabel ticks tlcolor("172 128 68") tposition(inside) grid glcolor("172 128 68") gmin gmax gextend) title("Boxplot of dTrade", size(large) color(white) margin(small) box fcolor(black) lcolor(white) bmargin(medium)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
graph box ggfce, box(1, fcolor("172 128 68") fintensity(inten100) lcolor(black)) medtype(cline) medline(lcolor(white) lpattern(dash_3dot)) cwhisker lines(lcolor("255 255 255") lpattern(longdash_dot_dot)) marker(1, mcolor("172 128 68") msize(medium) msymbol(circle_hollow)) ytitle(General Gov. Final Consumption Expend. (% of GDP)) ytitle(, size(small) color("172 128 68")) ylabel(#4, labels labsize(small) labcolor("172 128 68") angle(horizontal) valuelabel ticks tlcolor("172 128 68") tposition(inside) grid glcolor("172 128 68") gmin gmax gextend) title("Boxplot of GGFCE", size(large) color(white) margin(small) box fcolor(black) lcolor(white) bmargin(medium)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
graph box inflation, box(1, fcolor("172 128 68") fintensity(inten100) lcolor(black)) medtype(cline) medline(lcolor(white) lpattern(dash_3dot)) cwhisker lines(lcolor("255 255 255") lpattern(longdash_dot_dot)) marker(1, mcolor("172 128 68") msize(medium) msymbol(circle_hollow)) ytitle(Inflation (GDP deflator,annual%)) ytitle(, size(small) color("172 128 68")) ylabel(#4, labels labsize(small) labcolor("172 128 68") angle(horizontal) valuelabel ticks tlcolor("172 128 68") tposition(inside) grid glcolor("172 128 68") gmin gmax gextend) by(, title("Boxplot of Inflation", size(large) color(white) margin(small) box fcolor(black) lcolor(white) bmargin(medium))) by(, graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) by(country, total yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle ixtitle) subtitle(, size(small) color(white) box fcolor(black) lcolor(white)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
graph box pollution, box(1, fcolor("172 128 68") fintensity(inten100) lcolor(black)) medtype(cline) medline(lcolor(white) lpattern(dash_3dot)) cwhisker lines(lcolor("255 255 255") lpattern(longdash_dot_dot)) marker(1, mcolor("172 128 68") msize(medium) msymbol(circle_hollow)) ytitle(PM2.5 air pollution) ytitle(, size(small) color("172 128 68")) ylabel(#4, labels labsize(small) labcolor("172 128 68") angle(horizontal) valuelabel ticks tlcolor("172 128 68") tposition(inside) grid glcolor("172 128 68") gmin gmax gextend) title("Boxplot of Pollution", size(large) color(white) margin(small) box fcolor(black) lcolor(white) bmargin(medium)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
graph box tax, box(1, fcolor("172 128 68") fintensity(inten100) lcolor(black)) medtype(cline) medline(lcolor(white) lpattern(dash_3dot)) cwhisker lines(lcolor("255 255 255") lpattern(longdash_dot_dot)) marker(1, mcolor("172 128 68") msize(medium) msymbol(circle_hollow)) ytitle(Tax Revenue (% of GDP)) ytitle(, size(small) color("172 128 68")) ylabel(#4, labels labsize(small) labcolor("172 128 68") angle(horizontal) valuelabel ticks tlcolor("172 128 68") tposition(inside) grid glcolor("172 128 68") gmin gmax gextend) title("Boxplot of Taxes", size(large) color(white) margin(small) box fcolor(black) lcolor(white) bmargin(medium)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))    
		  
		  //  LINEGRAPHS  //

xtline GDPgr, recast(connected) mcolor(white) msize(tiny) msymbol(diamond) mlcolor(red) lcolor(white) lwidth(medium) lpattern(solid) ytitle(GDP Growth (% annual)) ytitle(, size(medium) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) ttitle(Year) ttitle(, size(medium) color("172 128 68")) tlabel(, labels labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) byopts(title("LineGraph of GDP Growth by Country", size(medium) color(white) box fcolor(black) lcolor(white) bmargin(small))) subtitle(, color("172 128 68") margin(small) box fcolor(white) lcolor(black)) byopts(graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) byopts(yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor(black) bmargin(small)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)))
xtline GFCF, recast(connected) mcolor(white) msize(tiny) msymbol(diamond) mlcolor(red) lcolor(white) lwidth(medium) lpattern(solid) ytitle(Gross Fixed Capital Formation (% of GDP)) ytitle(, size(medium) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) ttitle(Year) ttitle(, size(medium) color("172 128 68")) tlabel(, labels labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) byopts(title("LineGraph of GFCF by Country", size(medium) color(white) nobox)) subtitle(, color("172 128 68") margin(small) box fcolor(white) lcolor(black)) byopts(graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) byopts(yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor(black) bmargin(small)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)))
xtline debt, recast(connected) mcolor(white) msize(tiny) msymbol(diamond) mlcolor(red) lcolor(white) lwidth(medium) lpattern(solid) ytitle(Debt (% of GDP)) ytitle(, size(medium) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) ttitle(Year) ttitle(, size(medium) color("172 128 68")) tlabel(, labels labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) byopts(title("LineGraph of Debt by Country", size(medium) color(white) box fcolor(black) lcolor(white) bmargin(small))) subtitle(, color("172 128 68") margin(small) box fcolor(white) lcolor(black)) byopts(graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) byopts(yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor(black) bmargin(small)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)))
xtline gr_lf, recast(connected) mcolor(white) msize(tiny) msymbol(diamond) mlcolor(red) lcolor(white) lwidth(medium) lpattern(solid) ytitle(Labor Growth (% annual)) ytitle(, size(medium) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) ttitle(Year) ttitle(, size(medium) color("172 128 68")) tlabel(, labels labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) byopts(title("LineGraph of Labor Growth", size(medium) color(white) box fcolor(black) lcolor(white) bmargin(small))) subtitle(, color("172 128 68") margin(small) box fcolor(white) lcolor(black)) byopts(graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) byopts(yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor(black) bmargin(small)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)))
xtline inflation, recast(connected) mcolor(white) msize(tiny) msymbol(diamond) mlcolor(red) lcolor(white) lwidth(medium) lpattern(solid) ytitle(Inflation GDP denflator (%)) ytitle(, size(medium) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) ttitle(Year) ttitle(, size(medium) color("172 128 68")) tlabel(, labels labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) byopts(title("LineGraph of Inflation by Country", size(medium) color(white) box fcolor(black) lcolor(white) bmargin(small))) subtitle(, color("172 128 68") margin(small) box fcolor(white) lcolor(black)) byopts(graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) byopts(yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor(black) bmargin(small)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)))
xtline tax, recast(connected) mcolor(white) msize(tiny) msymbol(diamond) mlcolor(red) lcolor(white) lwidth(medium) lpattern(solid) ytitle(Tax Revenue (% of GDP)) ytitle(, size(medium) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) ttitle(Year) ttitle(, size(medium) color("172 128 68")) tlabel(, labels labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) byopts(title("LineGraph of Taxes by Country", size(medium) color(white) box fcolor(black) lcolor(white) bmargin(small))) subtitle(, color("172 128 68") margin(small) box fcolor(white) lcolor(black)) byopts(graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) byopts(yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor(black) bmargin(small)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)))
xtline ggfce, recast(connected) mcolor(white) msize(tiny) msymbol(diamond) mlcolor(red) lcolor(white) lwidth(medium) lpattern(solid) ytitle(General Gov Final Consumption Expend. (% of GDP)) ytitle(, size(medium) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) ttitle(Year) ttitle(, size(medium) color("172 128 68")) tlabel(, labels labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) byopts(title("LineGraph of GGFCE by Country", size(medium) color(white) nobox)) subtitle(, color("172 128 68") margin(small) box fcolor(white) lcolor(black)) byopts(graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) byopts(yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor(black) bmargin(small)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)))
xtline pollution, recast(connected) mcolor(white) msize(tiny) msymbol(diamond) mlcolor(red) lcolor(white) lwidth(medium) lpattern(solid) ytitle(Pollution. PM2.5 air pollution ( mean annual exposure. micrograms per cubic meter)) ytitle(, size(vsmall) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) ttitle(Year) ttitle(, size(medium) color("172 128 68")) tlabel(, labels labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) byopts(title("LineGraph of Pollution by Country", size(medium) color(white) box fcolor(black) lcolor(white) bmargin(small))) subtitle(, color("172 128 68") margin(small) box fcolor(white) lcolor(black)) byopts(graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) byopts(yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor(black) bmargin(small)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)))
xtline dTrade, recast(connected) mcolor(white) msize(tiny) msymbol(diamond) mlcolor(red) lcolor(white) lwidth(medium) lpattern(solid) ytitle(dTrade (Exp - Imp.) (% of GDP)) ytitle(, size(medium) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) ttitle(Year) ttitle(, size(medium) color("172 128 68")) tlabel(, labels labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) byopts(title("LineGraph of dTrade by Country", size(medium) color(white) box fcolor(black) lcolor(white) bmargin(small))) subtitle(, color("172 128 68") margin(small) box fcolor(white) lcolor(black)) byopts(graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) byopts(yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor(black) bmargin(small)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)))
		
		//  SCATTERPLOT MATRIX  //
		
graph matrix GDPgr  debt gr_lf GFCF inflation ggfce pollution dTrade tax, half diagonal(, color("172 128 68") fcolor(white) lcolor("172 128 68")) mcolor("172 128 68") msize(medsmall) msymbol(point) title("", size(medium) color(white) box fcolor(black) lcolor(white)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor("172 128 68")) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(white))

*** DESCRIPTIVE STATISTICS: ***

xtdescribe
xtsum GDPgr GFCF debt gr_lf inflation tax ggfce pollution dTrade

sum GDPgr,detail
sum GFCF,detail
sum debt,detail
sum gr_lf,detail
sum dTrade,detail
sum ggfce,detail
sum inflation,detail
sum pollution,detail
sum tax,detail



    *** REGRESSION ANALYSIS ***
	
* PREDICTION: 
	
reg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax
predict GDPgr_hat, xb
predict u_hat, res
sum u_hat, detail
pwcorr GDPgr GDPgr_hat, star(0.05) sig

*** (MIS)SPECIFICATION TEST(S)***

reg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax
estat ovtest

reg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax
estat imtest


   //GRAPHICAL
   
histogram u_hat, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(U_HAT) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of U_HAT", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram u_hat, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(U_HAT) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of U_HAT", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram u_hat, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(U_HAT) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) title("Histogram of U_HAT", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small)) legend(off) graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))
histogram u_hat, fcolor("173 139 67") lcolor(black) lwidth(vvvthin) normal normopts(lcolor(white) lpattern(vshortdash)) kdensity kdenopts(lcolor(white)) ytitle(Density) ytitle(, size(small) color("169 132 75")) yscale(lcolor(black)) ylabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) labgap(tiny) ticks tlcolor("173 139 67") tlength(vsmall) tposition(inside) grid glcolor(black)) ymtick(, labsize(medsmall) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") grid glcolor("173 139 67")) xtitle(U_HAT) xtitle(, size(small) color("173 139 67") margin(medium)) xlabel(, labels labsize(small) labcolor("173 139 67") angle(horizontal) ticks tlcolor("173 139 67") tposition(inside) grid glcolor("0 0 0")) by(, title("Histogram of U_HAT by Country", size(large) color(white) margin(medsmall) box fcolor(black) lcolor(white) bmargin(small))) by(, legend(off)) by(, graphregion(margin(zero) fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor("173 139 67") ifcolor(black) ilcolor("173 139 67"))) by(country, yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel iytitle ixtitle) subtitle(, color("173 139 67") orientation(horizontal)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor("173 139 67")) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor("173 139 67"))

xtline u_hat, recast(connected) mcolor(white) msize(tiny) msymbol(diamond) mlcolor(red) lcolor(white) lwidth(medium) lpattern(solid) ytitle(Residuals) ytitle(, size(medium) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) ttitle(Year) ttitle(, size(medium) color("172 128 68")) tlabel(, labels labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) byopts(title("LineGraph of U_HAT by Country", size(medium) color(white) box fcolor(black) lcolor(white) bmargin(small))) subtitle(, color("172 128 68") margin(small) box fcolor(white) lcolor(black)) byopts(graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) byopts(yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor(black) bmargin(small)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)))

graph matrix GDPgr  debt gr_lf GFCF inflation ggfce pollution dTrade tax u_hat, half diagonal(, color("172 128 68") fcolor(white) lcolor("172 128 68")) mcolor("172 128 68") msize(medsmall) msymbol(point) title("", size(medium) color(white) box fcolor(black) lcolor(white)) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor("172 128 68")) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(white))

qnorm u_hat, recast(connected) mcolor(white) msize(small) msymbol(circle_hollow) mlabel(country) mlabsize(tiny) mlabcolor("175 129 58") mlabposition(2) mlabangle(horizontal) lcolor("175 129 58") lwidth(medthin) rlopts(lcolor(red) lwidth(medthin)) ytitle(, size(small) color("175 129 58")) ylabel(, labels labsize(small) labcolor("175 129 58") angle(horizontal) ticks tlcolor("175 129 58") tlength(tiny) tlwidth(thin) grid glwidth(thin) glcolor("175 129 58") gmin gmax nogextend) xtitle(, size(small) color("175 129 58")) xlabel(, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") tlength(tiny) tlwidth(thin) grid glwidth(thin) glcolor("175 129 58") gmin gmax nogextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
pnorm u_hat, recast(connected) mcolor(white) msize(small) msymbol(circle_hollow) mlabel(country) mlabsize(tiny) mlabcolor("175 129 58") mlabposition(2) mlabangle(horizontal) lcolor("175 129 58") lwidth(medthin) rlopts(lcolor(red) lwidth(medthin)) ytitle(, size(small) color("175 129 58")) ylabel(, labels labsize(small) labcolor("175 129 58") angle(horizontal) ticks tlcolor("175 129 58") tlength(tiny) tlwidth(thin) grid glwidth(thin) glcolor("175 129 58") gmin gmax nogextend) xtitle(, size(small) color("175 129 58")) xlabel(, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") tlength(tiny) tlwidth(thin) grid glwidth(thin) glcolor("175 129 58") gmin gmax nogextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))

 //Test:
swilk u_hat  

 
	   
* TEST: HETEROSCEDASTICITY (Ετεροσκεδαστικότητα)
	   
reg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax
estat hettest


//Graphically:
		 
twoway (scatter GFCF u_hat, mcolor("175 129 58") msize(small) msymbol(circle)), ytitle(GGFCE) ytitle(, size(small) color("175 129 58")) yscale(noline) ylabel(#1, labels labsize(small) labcolor("175 129 58") angle(horizontal) noticks grid glcolor("175 129 58") gmin gmax nogextend) xtitle(Residuals) xtitle(, size(medsmall) color("175 129 58")) xlabel(minmax, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") grid glcolor("175 129 58") gmin gmax gextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
twoway (scatter debt u_hat, mcolor("175 129 58") msize(small) msymbol(circle)), ytitle(Debt) ytitle(, size(small) color("175 129 58")) yscale(noline) ylabel(#1, labels labsize(small) labcolor("175 129 58") angle(horizontal) noticks grid glcolor("175 129 58") gmin gmax nogextend) xtitle(Residuals) xtitle(, size(medsmall) color("175 129 58")) xlabel(minmax, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") grid glcolor("175 129 58") gmin gmax gextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
twoway (scatter gr_lf u_hat, mcolor("175 129 58") msize(small) msymbol(circle)), ytitle(Labor Growth(% annual)) ytitle(, size(small) color("175 129 58")) yscale(noline) ylabel(#1, labels labsize(small) labcolor("175 129 58") angle(horizontal) noticks grid glcolor("175 129 58") gmin gmax nogextend) xtitle(Residuals) xtitle(, size(medsmall) color("175 129 58")) xlabel(minmax, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") grid glcolor("175 129 58") gmin gmax gextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
twoway (scatter dTrade u_hat, mcolor("175 129 58") msize(small) msymbol(circle)), ytitle(dTrade(Exp. - Imp (%))) ytitle(, size(small) color("175 129 58")) yscale(noline) ylabel(#1, labels labsize(small) labcolor("175 129 58") angle(horizontal) noticks grid glcolor("175 129 58") gmin gmax nogextend) xtitle(Residuals) xtitle(, size(medsmall) color("175 129 58")) xlabel(minmax, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") grid glcolor("175 129 58") gmin gmax gextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
twoway (scatter ggfce u_hat, mcolor("175 129 58") msize(small) msymbol(circle)), ytitle(General Gov. Final Consumption expend.(% of GDP)) ytitle(, size(small) color("175 129 58")) yscale(noline) ylabel(#1, labels labsize(small) labcolor("175 129 58") angle(horizontal) noticks grid glcolor("175 129 58") gmin gmax nogextend) xtitle(Residuals) xtitle(, size(medsmall) color("175 129 58")) xlabel(minmax, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") grid glcolor("175 129 58") gmin gmax gextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
twoway (scatter pollution u_hat, mcolor("175 129 58") msize(small) msymbol(circle)), ytitle(PM2.5 air pollution. mean annual exposure %) ytitle(, size(small) color("175 129 58")) yscale(noline) ylabel(#1, labels labsize(small) labcolor("175 129 58") angle(horizontal) noticks grid glcolor("175 129 58") gmin gmax nogextend) xtitle(Residuals) xtitle(, size(medsmall) color("175 129 58")) xlabel(minmax, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") grid glcolor("175 129 58") gmin gmax gextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
twoway (scatter tax u_hat, mcolor("175 129 58") msize(small) msymbol(circle)), ytitle(Tax Revenue (% of GDP)) ytitle(, size(small) color("175 129 58")) yscale(noline) ylabel(#1, labels labsize(small) labcolor("175 129 58") angle(horizontal) noticks grid glcolor("175 129 58") gmin gmax nogextend) xtitle(Residuals) xtitle(, size(medsmall) color("175 129 58")) xlabel(minmax, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") grid glcolor("175 129 58") gmin gmax gextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
twoway (scatter inflation u_hat, mcolor("175 129 58") msize(small) msymbol(circle)), ytitle(Inflation. GDP deflator (annual %)) ytitle(, size(small) color("175 129 58")) yscale(noline) ylabel(#1, labels labsize(small) labcolor("175 129 58") angle(horizontal) noticks grid glcolor("175 129 58") gmin gmax nogextend) xtitle(Residuals) xtitle(, size(medsmall) color("175 129 58")) xlabel(minmax, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") grid glcolor("175 129 58") gmin gmax gextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))

* TEST: MULTICOLLINEARITY (Πολυσυγγραμμικότητα) :	
	 
reg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax
vif 
corr GFCF debt gr_lf dTrade ggfce inflation pollution tax



* TEST: AUTOCORRELATION (Αυτοσυσχέτιση) :
 
 sort country year
 gen l= L.u_hat
 corr l u_hat 

// Grapfically:
 twoway (scatter l u_hat, mcolor("175 129 58") msize(small) msymbol(circle)), ytitle(L1 Residuals) ytitle(, size(small) color("175 129 58")) yscale(noline) ylabel(#1, labels labsize(small) labcolor("175 129 58") angle(horizontal) noticks grid glcolor("175 129 58") gmin gmax nogextend) xtitle(Residuals) xtitle(, size(medsmall) color("175 129 58")) xlabel(minmax, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") grid glcolor("175 129 58") gmin gmax gextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))

* HETEROGENEITY ( Ετερογένεια ) : 

sort country year
by country: egen average_GDPgr =mean(GDPgr)
twoway (scatter GDPgr country, mcolor("186 128 63") msymbol(circle_hollow)) (connected average_GDPgr country, mcolor(red) msize(medsmall) msymbol(diamond) mlabel(average_infl) mlabsize(vsmall) mlabcolor(green) mlabposition(12) mlabangle(horizontal) lcolor(red) lwidth(medthin) lpattern(dash_3dot)), ytitle(GDPgr (% annual)) ytitle(, size(small) color("186 128 63")) ylabel(, labels labsize(small) labcolor("186 128 63") angle(horizontal) ticks tlcolor("186 128 63") tlength(tiny) tlwidth(thin) grid glwidth(thin) glcolor("186 128 63") gmin gmax nogextend) xtitle(Country) xtitle(, size(small) color("186 128 63")) xlabel(0 1 "Aus" 2 "Bah" 3 "Bel" 4 "Gre"  5 "Gua" 6 "Hun" 7 "Ice" 8 "Jam" 9 "Jap" 10 "Jor" 11 "Sin" 12 "Spa" 13 "Swi" 14, labels labsize(small) labcolor("186 128 63") valuelabel ticks tlcolor("186 128 63") tlength(tiny) tlwidth(thin) grid glwidth(thin) glcolor("186 128 63") gmin gmax nogextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
 
 
* COEFFICIENTS TESTING :

reg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax
test GFCF=1
test debt=1
test gr_lf=1
test dTrade=1
test ggfce=1
test inflation=1
test pollution=1
test tax=1

test GFCF debt gr_lf dTrade ggfce inflation pollution tax
 // F(  8,   316) =   20.26
    //        Prob > F =    0.0000



 *** COMPARISON OF ESTIMATES (OLS, FIXED EFFECTS, RANDOM EFFECTS & WLS/GLS VERSIONS OF THEM) ***
 
 
 reg GDPgr GFCF debt gr_lf inflation tax ggfce pollution dTrade
 estimates store ols
 reg GDPgr GFCF debt gr_lf inflation tax ggfce pollution dTrade ,vce (robust)
 estimates store olsRobust
 xtreg GDPgr GFCF debt gr_lf inflation tax ggfce pollution dTrade , fe
 estimates store Fe
 xtreg GDPgr GFCF debt gr_lf inflation tax ggfce pollution dTrade , fe vce (robust)
 estimates store FeRobust
 xtreg GDPgr GFCF debt gr_lf inflation tax ggfce pollution dTrade , re
 estimates store Re
 xtreg GDPgr GFCF debt gr_lf inflation tax ggfce pollution dTrade , re vce (robust)
 estimates store ReRobust
 estimates table ols olsRobust Fe FeRobust Re ReRobust, star stats(N F Wald chi2 test r2 r2_b r2_w sigma_u sigma_e)
 hausman Fe Re
	
 xtreg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax,fe	
 xttest3


	// IV test:
	
	
 corr debt GFCF gr_lf inflation tax ggfce dTrade GFCFann fdi lf lf1564 trade Pop65 Popgr rural tnrr Exports Imports Inflationconsumerpricesannu DIR Savings RIR debt2	
 // DIR : 0.7471
 xtivreg2 GDPgr debt gr_lf ggfce GFCF pollution dTrade tax (inflation= L.inflation L2.inflation L3.inflation L4.inflation DIR  ), endog(inflation) fe 
 estimates store IV_Fe
 xtivreg2 GDPgr debt gr_lf ggfce GFCF pollution dTrade tax (inflation= L.inflation L2.inflation L3.inflation L4.inflation DIR  ), endog(inflation) fe robust
 estimates store IV_FeRobust
 estimates table IV_Fe IV_FeRobust , star stats(N F r2 sigma_e)

	  

      // Run regression for different inflation levels
 

***** inflation < 0% ******

sum inflation, detail
gen inflation_negative = 0
replace inflation_negative=1 if inflation<0
xtreg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax if inflation_negative == 1, fe robust

 

***** 0% > inflation_0_3 > 3% *****

sum inflation, detail
gen inflation_0_3 = 0
replace inflation_0_3 = 1 if inflation<3 & inflation>0
xtreg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax if inflation_0_3 == 1, fe robust



***** 3% < Inflation_3_15 < 15% ******

sum inflation, detail
gen inflation_3_15 = 0
replace inflation_3_15 =1 if inflation>3 & inflation<15
xtreg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax if inflation_3_15 == 1, fe robust


*****   inflation > 15%  ******

sum inflation, detail
gen inflation_15plus = 0
replace inflation_15plus=1 if inflation>15
xtreg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax if inflation_15plus == 1, fe robust


	   //DroplinePlot of GDP Growth on Inflation levels by Country
twoway (dropline GDPgr year if inflation <0, mcolor(white) msize(small) msymbol(circle) lcolor(white)) (dropline GDPgr year if inflation >0 &  inflation <3, mcolor("172 128 68") msize(small) msymbol(circle) lcolor("172 128 68")) (dropline GDPgr year if inflation >3 &  inflation <15, mcolor(green) msize(small) msymbol(circle) lcolor(green)) (dropline GDPgr year if inflation >15, mcolor(red) msize(small) msymbol(circle) lcolor(red)), ytitle(GDP Growth (% annual)) ytitle(, size(small) color("172 128 68")) ylabel(, labels labsize(small) labcolor("172 128 68") angle(horizontal) ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) xtitle(Year) xtitle(, size(small) color("172 128 68")) xlabel(, labels labcolor("172 128 68") ticks tlcolor("172 128 68") grid glcolor("172 128 68") gmin gmax gextend) by(, title("", nobox)) by(, graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))) by(country, yrescale xrescale iyaxes ixaxes iytick ixtick iylabel ixlabel noiytitle noixtitle) subtitle(, size(small) color("172 128 68") box fcolor(white) lcolor("172 128 68")) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))


*** OUTLIERS***

/* Graphically:*/
reg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax
twoway (scatter u_hat GDPgr_hat, mcolor("175 129 58") msize(small) msymbol(circle)), ytitle( u_hat ) ytitle(, size(small) color("175 129 58")) yscale(noline) ylabel(#1, labels labsize(small) labcolor("175 129 58") angle(horizontal) noticks grid glcolor("175 129 58") gmin gmax nogextend) xtitle( GDPgr_hat ) xtitle(, size(medsmall) color("175 129 58")) xlabel(minmax, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") grid glcolor("175 129 58") gmin gmax gextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))
avplot GFCF
avplot debt
avplot dTrade
avplot ggfce
avplot gr_lf
avplot inflation
avplot pollution
avplot tax

//with outliers
reg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax
 


//Ανίχνευση των outliers:
lvr2plot, recast(scatter) mcolor("175 129 58") msize(tiny) msymbol(circle) mlabel(country) mlabsize(tiny) mlabcolor("175 129 58") mlabposition(9) mlabangle(zero) ytitle(, size(small) color("175 129 58")) ylabel(, labels labsize(small) labcolor("175 129 58") angle(horizontal) ticks tlcolor("175 129 58") tlength(tiny) tlwidth(thin) grid glwidth(thin) glcolor("175 129 58") gmin gmax nogextend) xtitle(, size(small) color("175 129 58")) xlabel(, labels labsize(small) labcolor("175 129 58") ticks tlcolor("175 129 58") tlength(tiny) tlwidth(thin) grid glwidth(thin) glcolor("175 129 58") gmin gmax nogextend) graphregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black)) plotregion(fcolor(black) lcolor(black) ifcolor(black) ilcolor(black))

drop in 55
drop in 125
drop in 276
drop in 278
drop in 266
drop in 274
// αν "drop in 54"  τεράστια αλλαγή στο inflation με fe robust

//without outliers
reg GDPgr GFCF debt gr_lf dTrade ggfce inflation pollution tax

