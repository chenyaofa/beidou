package com.lnp.controller;


import com.alibaba.druid.pool.vendor.SybaseExceptionSorter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

//调用百度地图API
public class BaiDuMapApi {
    public static Map<String, BigDecimal> getLatAndLngByAddress(String addr){
        String address = "";
        String lat = "";
        String lng = "";
        try {
            address = java.net.URLEncoder.encode(addr,"UTF-8");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        String url = String.format("http://api.map.baidu.com/geocoder/v2/?"
                +"ak=aMbYFjxmOCtd1dIyzNN0GoV2naI7XBkQ&output=json&address=%s",address);
        URL myURL = null;
        URLConnection httpsConn = null;
        //进行转码
        try {
            myURL = new URL(url);
        } catch (MalformedURLException e) {
            e.printStackTrace();

        }
        try {
            httpsConn = (URLConnection) myURL.openConnection();
            if (httpsConn != null) {
                InputStreamReader insr = new InputStreamReader(
                        httpsConn.getInputStream(), "UTF-8");
                BufferedReader br = new BufferedReader(insr);
                String data = null;
                if ((data = br.readLine()) != null) {
                    lat = data.substring(data.indexOf("\"lat\":")
                            + ("\"lat\":").length(), data.indexOf("},\"precise\""));
                    lng = data.substring(data.indexOf("\"lng\":")
                            + ("\"lng\":").length(), data.indexOf(",\"lat\""));
                }
                insr.close();
            }
        } catch (IOException e) {

        }
        Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
        map.put("lat", new BigDecimal(lat));
        map.put("lng", new BigDecimal(lng));
        return map;
    }

    //测试方法
    public static void main(String[] args) {
        Map<String,BigDecimal> mm =  getLatAndLngByAddress("深圳市南山区西丽街道南岗工业区");
        Map<String,BigDecimal> mtwo =  getLatAndLngByAddress("深圳市福田区红岭北");
        Map<String,BigDecimal> mthree =  getLatAndLngByAddress("深圳市南山区西丽地铁D口");
        System.out.println("坐标的经度为："+mm.get("lat"));
        System.out.println("坐标的纬度为："+mm.get("lng"));

        System.out.println("坐标2的经度为："+mtwo.get("lat"));
        System.out.println("坐标2的纬度为："+mtwo.get("lng"));


        getDistanceFromTwoPoints(mm.get("lat").doubleValue(), mm.get("lng").doubleValue(), mtwo.get("lat").doubleValue(), mtwo.get("lng").doubleValue());

        distanceOfTwoPoints(mm.get("lat").doubleValue(), mm.get("lng").doubleValue(), mthree.get("lat").doubleValue(), mthree.get("lng").doubleValue());
    }





    private static final Double PI = Math.PI;

    private static final Double PK = 180 / PI;

    /**
     * @Description: 第一种方法
     */
    public static double getDistanceFromTwoPoints(double lat_a, double lng_a, double lat_b, double lng_b) {
        double t1 = Math.cos(lat_a / PK) * Math.cos(lng_a / PK) * Math.cos(lat_b / PK) * Math.cos(lng_b / PK);
        double t2 = Math.cos(lat_a / PK) * Math.sin(lng_a / PK) * Math.cos(lat_b / PK) * Math.sin(lng_b / PK);
        double t3 = Math.sin(lat_a / PK) * Math.sin(lat_b / PK);

        double tt = Math.acos(t1 + t2 + t3);

        System.out.println("两点间的距离：" + 6366000 * tt + " 米");
        return EARTH_RADIUS * tt;
    }


    /********************************************************************************************************/
// 地球半径
    private static final double EARTH_RADIUS = 6370996.81;

    // 弧度
    private static double radian(double d) {
        return d * Math.PI / 180.0;
    }

    /**
     * @Description: 第二种方法
     */
    public static double distanceOfTwoPoints(double lat1, double lng1, double lat2, double lng2) {
        double radLat1 = radian(lat1);
        double radLat2 = radian(lat2);
        double a = radLat1 - radLat2;
        double b = radian(lng1) - radian(lng2);
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)
                + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * EARTH_RADIUS;
        s = Math.round(s * 10000) / 10000;
        double ss = s * 1.0936132983377;
        System.out.println("两点间的距离是：" + s + "米" + "," + (int) ss + "码");
        return s;
    }
}
