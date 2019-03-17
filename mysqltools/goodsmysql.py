import json
import pymysql

db = pymysql.Connect(host='127.0.0.1', user='root', password='950128', database='kaola', charset='utf8', port=3306)

cursor = db.cursor()
with open('goods.json', 'r') as f:
    goodslist = json.load(f)
    for goods in goodslist:
        # print( "INSERT INTO goods(small_src,middle_src,big_src,brand,name,des,discount_price,orig_price) VALUES({},{},{},{},{},{},{},{}) ".format(goods.get('small_src'),goods.get('middle_src'),goods.get('big_src'),goods.get('brand'),goods.get('name'),goods.get('des'),goods.get('discount_price'),goods.get('orig_price')))

        db.begin()
        cursor.execute(
            "INSERT INTO KaoLa_goods (small_src,middle_src,big_src,brand,name,des,discount_price,orig_price) VALUES('{}','{}','{}','{}','{}','{}','{}','{}')".format(
                goods.get('small_src'), goods.get('middle_src'), goods.get('big_src'), goods.get('brand'),
                goods.get('name'), goods.get('des'), goods.get('discount_price'), goods.get('orig_price')))
        db.commit()
