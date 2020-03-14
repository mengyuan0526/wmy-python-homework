## import numpy as np

## import pandas as pd

## import matplotlib.pyplot as plt

## import matplotlib.ticker as tkr

## confirmed = pd.read_csv('../data/COVID-20/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv')

## recovered = pd.read_csv('../data/COVID-20/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv')

## deaths = pd.read_csv('../data/COVID-20/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv')


## confirmed.head(5)


## recovered.head(5)


## deaths.head(5)


## print(confirmed.shape)

## print(recovered.shape)

## print(deaths.shape)


## plt.rcParams['font.sans-serif'] = ['SimHei']#用来正常显示中文标签

## plt.rcParams['axes.unicode_minus'] = False#用来正常显示负号

## 
## countries = confirmed['Country/Region'].unique()

## print(countries)#可以看出一共75个国家/地区都有新冠状肺炎病例

## 
## #计算出每日所有地区新冠肺炎的确诊数，治愈数，死亡数

## fig,ax = plt.subplots()

## all_confirmed = np.sum(confirmed.iloc[:,4:])

## all_recovered = np.sum(recovered.iloc[:,4:])

## all_deaths = np.sum(deaths.iloc[:,4:])

## all_confirmed.index = [d[:-3] for d in all_confirmed.index]

## all_recovered.index = [d[:-3] for d in all_recovered.index]

## all_deaths.index = [d[:-3] for d in all_deaths.index]

## ax.plot(all_confirmed,color = 'red',label = '确诊',marker = 'o',linewidth=1,markersize=3)

## ax.plot(all_recovered,color = 'blue',label = '治愈',marker = 'o',linewidth=1,markersize=3)

## ax.plot(all_deaths,color = 'lime',label = '死亡',marker = 'o',linewidth=1,markersize=3)

## ax.xaxis.set_major_locator(tkr.MultipleLocator(2.0))

## ax.xaxis.set_minor_locator(tkr.MultipleLocator(1.0))

## plt.xticks(rotation = 45)

## plt.yticks()

## plt.xlabel('时间')

## plt.ylabel('数目')

## plt.legend(loc = 'upper left',fontsize = 10)

## plt.tight_layout()

## plt.show()


## fig,ax = plt.subplots()

## death_rate = (all_deaths/all_confirmed)*100

## death_rate

## ax.plot(death_rate,color = 'lime',label = '死亡',marker = 'o',linewidth=1,markersize=3)

## ax.xaxis.set_major_locator(tkr.MultipleLocator(2.0))

## ax.xaxis.set_minor_locator(tkr.MultipleLocator(1.0))

## plt.xticks(rotation = 45)

## plt.yticks()

## plt.xlabel('时间')

## plt.ylabel('死亡率')

## plt.tight_layout()

## plt.show()


## last_update = '3/2/20' #设置最新数据日期

## China_cases = confirmed[['Province/State',last_update]][confirmed['Country/Region']=='Mainland China']

## China_cases['recovered'] = recovered[[last_update]][recovered['Country/Region']=='Mainland China']

## China_cases['deaths'] = deaths[[last_update]][deaths['Country/Region']=='Mainland China']

## China_cases = China_cases.set_index('Province/State')

## China_cases = China_cases.rename(columns = {last_update:'confirmed'})

## China_cases

## China_cases.to_csv('./Chinacases.csv')

## ----Chinacases,echo = F,results='markup',cache=F------------------------
library("kableExtra")
library('utils')
Chinacases <- read.csv("D:/github_repo/wmy-python-homework/epidemic_analysis/Chinacases.csv")
colnames(Chinacases) <- c("省份","确诊数","治愈数","死亡数")
knitr::kable(Chinacases,row.names=F,align=c("l","c","c","c"),caption="中国大陆各省疫情
数据",longtable=TRUE,booktabs=TRUE,escape=F,linesep = "")%>%
kable_styling(latex_options = c("striped", "scale_down", "repeat_header",
"hold_position"),repeat_header_text = "(续)")%>%
    kable_styling(full_width = T) %>%
    column_spec(1, width = c("4.5cm"))



## Mianland_China = China_cases.sort_values(by='confirmed',ascending=True)

## Mianland_China.plot(kind='barh',figsize=(20,30),color = ['red','blue','lime'],width = 1)

## plt.xlabel('省/市',size = 30)

## plt.ylabel('数量',size = 30)

## plt.xticks(size = 25)

## plt.yticks(size = 30)

## plt.legend(bbox_to_anchor = (0.95,0.95),fontsize = 20)

## plt.tight_layout()

## plt.show()


## confirmed_China = confirmed[confirmed['Country/Region']=='Mainland China']

## confirmed_China = np.sum(confirmed_China.iloc[:,4:])

## recovered_China = recovered[recovered['Country/Region']=='Mainland China']

## recovered_China = np.sum(recovered_China.iloc[:,4:])

## deaths_China = deaths[deaths['Country/Region']=='Mainland China']

## deaths_China = np.sum(deaths_China.iloc[:,4:])

## recover_rate = (recovered_China/confirmed_China)*100  #中国地区的治愈率

## deaths_rate = (deaths_China/confirmed_China)*100#中国各地区的死亡率

## deaths_rate.index = [d[:-3] for d in deaths_rate.index]

## deaths_rate

## recover_rate.index = [d[:-3] for d in recover_rate.index]

## recover_rate

## #接下来画图

## fig,ax = plt.subplots()

## ax.plot(recover_rate,color = 'blue',label = '治愈率',marker = 'o',linewidth=1,markersize=3)

## ax.plot(deaths_rate,color = 'lime',label = '死亡率',marker = 'o',linewidth=1,markersize=3)

## ax.xaxis.set_major_locator(tkr.MultipleLocator(2.0))

## ax.xaxis.set_minor_locator(tkr.MultipleLocator(1.0))

## plt.xlabel('时间')

## plt.ylabel('数量')

## plt.xticks(rotation = 45)

## plt.yticks()

## plt.legend(loc = 'upper left',fontsize = 20)

## plt.tight_layout()

## plt.show()

## 

## confirmed_others = confirmed[confirmed['Country/Region'] != 'Mainland China']

## confirmed_others = np.sum(confirmed_others.iloc[:,4:])

## recovered_others = recovered[recovered['Country/Region'] != 'Mainland China']

## recovered_others = np.sum(recovered_others.iloc[:,4:])

## deaths_others = deaths[deaths['Country/Region']!='Mainland China']

## deaths_others = np.sum(deaths_others.iloc[:,4:])

## recover_rate_others = (recovered_others/confirmed_others)*100  #其他地区的治愈率

## deaths_rate_others = (deaths_others/confirmed_others)*100#其他各地区的死亡率

## #接下来画图

## fig,ax = plt.subplots()

## recover_rate_others.index = [d[:-3] for d in recover_rate_others.index]

## deaths_rate_others.index = [d[:-3] for d in deaths_rate_others.index]

## ax.plot(recover_rate_others,color = 'blue',label = '治愈率',marker = 'o',linewidth=1,markersize=3)

## ax.plot(deaths_rate_others,color = 'lime',label = '死亡率',marker = 'o',linewidth=1,markersize=3)

## ax.xaxis.set_major_locator(tkr.MultipleLocator(2.0))

## ax.xaxis.set_minor_locator(tkr.MultipleLocator(1.0))

## plt.xlabel('时间')

## plt.ylabel('数量')

## plt.xticks(rotation = 45)

## plt.yticks()

## plt.legend(loc = 'upper left',fontsize=15)

## plt.tight_layout()

## plt.show()


## others = confirmed[['Country/Region',last_update]][confirmed['Country/Region'] != 'Mainland China']

## others['recovered'] = recovered[[last_update]][recovered['Country/Region'] != 'Mainland China']

## others['deaths'] = deaths[[last_update]][deaths['Country/Region'] != 'Mainland China']

## 
## others_countries = others.rename(columns = {last_update:'confirmed'})

## others_countries = others_countries.set_index('Country/Region')

## others_countries = others_countries.groupby('Country/Region').sum()

## #接着画图

## others_countries.sort_values(by = 'confirmed',ascending = True).plot(kind='barh',figsize=(20,30),color = ['red','blue','lime'], width=1)

## plt.ylabel('Country/Region')

## plt.xlabel('数量')

## plt.yticks()

## plt.xticks()

## plt.legend(bbox_to_anchor=(0.95,0.95),fontsize = 20)

## plt.tight_layout()

## plt.show()

## 

## import folium

## others = confirmed[['Country/Region','Lat','Long',last_update]][confirmed['Country/Region'] != 'Mainland China']

## others['recovered'] = recovered[[last_update]][recovered['Country/Region'] != 'Mainland China']

## others['death'] = deaths[[last_update]][deaths['Country/Region'] != 'Mainland China']

## others_countries = others.rename(columns = {last_update:'confirmed'})

## others_countries[others_countries.index==94]

## others_countries.loc['94'] = ['Mainland China',30.9756,112.2707,confirmed_China[-1],recovered_China[-1],deaths_China[-1]]

## others_countries

## others_countries.to_csv("./otherscountries.csv")


## world_map = folium.Map(location=[10,-20],zoom_start=2.3,tiles='Stamen Terrain')

## 
## for lat, lon, value, name in zip(others_countries['Lat'],others_countries['Long'],others_countries['confirmed'],others_countries['Country/Region']):

##   folium.CircleMarker([lat, lon],

##                               radius=10,

##                               popup = ('<strong>Country</strong>: ' + str(name).capitalize()+'<br>' '<strong>Confirmed Cases</strong>: ' + str(value) + '<br>'),

##                               color = "red",

##                               fill_color = "red",

##                               fill_opacity = 0.7).add_to(world_map)

## world_map

## #world_map.save("worldmap.html")

## #import webbrowser

## #webbrowser.open("worldmap.html")


## ----fig1,eval=T, echo=F,out.width="90%", fig.align='center',fig.cap="全球地区疫情扩散图",dev="png",results='markup'----
knitr::include_graphics("./world_map.png")


## import plotly.express as px

## confirmed = confirmed.melt(id_vars = ['Province/State', 'Country/Region', 'Lat', 'Long'], var_name='date',value_name = 'confirmed')

## confirmed.to_csv("./confirmedmelt.csv")


## confirmed['date_dt'] = pd.to_datetime(confirmed.date,format='%m/%d/%y')

## confirmed.date = confirmed.date_dt.dt.date

## confirmed.rename(columns={'Country/Region':'country','Province/State':'province'},inplace=True)

## confirmed


## recovered = recovered.melt(id_vars = ['Province/State', 'Country/Region', 'Lat', 'Long'], var_name='date',value_name = 'recovered')

## recovered['date_dt'] = pd.to_datetime(recovered.date, format="%m/%d/%y")

## recovered.date = recovered.date_dt.dt.date

## recovered.rename(columns={'Country/Region': 'country', 'Province/State': 'province'}, inplace=True)


## deaths = deaths.melt(id_vars = ['Province/State', 'Country/Region', 'Lat', 'Long'], var_name='date', value_name = 'deaths')

## deaths['date_dt'] = pd.to_datetime(deaths.date, format="%m/%d/%y")

## deaths.date = deaths.date_dt.dt.date

## deaths.rename(columns={'Country/Region': 'country', 'Province/State': 'province'}, inplace=True)


## merge_on = ['province', 'country', 'date']

## all_data = confirmed.merge(deaths[merge_on + ['deaths']], how='left', on=merge_on).\

##   merge(recovered[merge_on + ['recovered']], how='left', on=merge_on)

## all_data


## Coronavirus_map = all_data.groupby(['date_dt', 'province'])['confirmed', 'deaths','recovered', 'Lat', 'Long'].max().reset_index()

## Coronavirus_map['size'] = Coronavirus_map.confirmed.pow(0.5)  # 创建实心圆大小

## Coronavirus_map['date_dt'] = Coronavirus_map['date_dt'].dt.strftime('%Y-%m-%d')


## fig = px.scatter_geo(Coronavirus_map, lat='Lat', lon='Long', scope='asia',

##                      color="size", size='size', hover_name='province',

##                      hover_data=['confirmed', 'deaths', 'recovered'],

##                      projection="natural earth",animation_frame="date_dt")

## fig.update(layout_coloraxis_showscale=False)

## fig.show()


## ----fig,echo=F,fig.cap='亚洲地区疫情扩散图',outwidth="90%",fig.align="center",dev='png',results='makeup'----
knitr::include_graphics("./fig.png")

