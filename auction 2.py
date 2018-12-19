# -*- coding: utf-8 -*-
"""
Created on Thu Dec  6 12:27:08 2018

@author: ktm
"""

import requests as rq
from bs4 import BeautifulSoup 
import lxml
url = "http://browse.auction.co.kr/search?keyword={}&itemno=&nickname=&encKeyword={}&arraycategory=&frm=&dom=auction&isSuggestion=No&retry=".format("여성의류", "여성의류")
url

res = rq.get(url)
res.url
html = res.content
soup = BeautifulSoup(html, 'lxml')

#%% 타이틀 가져오기 
soup_item = soup.find_all("div", class_="section--itemcard")
soup_item[1]
num = len(soup_item)
num
#%%
title = []
price_sales = []
price_ori = []
company = []
for i in range(0, num):
    # 상품명
    soup_title = soup_item[i].find("span", class_="text--title")
    print(soup_title)
    if soup_title is not None:
        title_txt = soup_title.text
        title.append(title_txt)
    else:
        title.append("")
    
    # 상품가격(할인적용금액)
    soup_discount = soup_item[i].find("strong", class_="text--price_seller")
    print(soup_discount)
    if soup_discount is not None:
        price_txt = soup_discount.text
        price_sales.append(price_txt)
    else:
        price_sales.append("")
    
    # 원래 가격
    
    
    soup_price = soup_item[i].find("strong", class_="text--price_original")
    print(soup_price)
    if soup_price is not None:
        price_ori_txt = soup_price.text
        price_ori.append(price_ori_txt)
    else:
        price_ori.append("")

print(title, len(title))
print(price_sales, len(price_sales))

 # 사업자 상호 
#%%
soup_item = soup.find_all("div", class_="section--itemcard")
soup_item[1]
num = len(soup_item)
num
#%%
title = []
price_sales = []
price_ori = []
company = []
buy_cnt =[]
for i in range(0, num):
    # 상품명
    soup_title = soup_item[i].find("span", class_="text--title")
    print(soup_title)
    if soup_title is not None:
        title_txt = soup_title.text
        title.append(title_txt)
    else:
        title.append("")
 
 
 
    soup_company = soup_item[i].find('span', class_="text")
    #print(soup_title)
    if soup_company is not None:
        company_txt = soup_company.text
        company.append(company_txt)
    else:
        company.append("")
        
# 구매자 수 
    soup_buy =soup_item[i].find('span',class_="text--buycnt")
    if soup_buy is not None:
        buy = soup_buy.text
        buy_cnt.append(buy)
    else:
        buy_cnt.append('')

