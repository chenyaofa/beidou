package com.lnp.service;


import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class jsoupget {


    public static void main(String[] args) {
        HashMap hm = new HashMap();
        String href = null;
        String url = "http://www.yuanlin.com/mmbj/2.html";
//        try {
//            Document doc = Jsoup.connect(url).get();
//            Elements links = doc.select(".mmbj_list_tb tr");
//            for (Element link : links) {
//                String linkhref = link.text();
//                System.out.println(linkhref);
//            }
//
//        } catch (Exception e) {
//            System.out.println("爬取失败");
//            e.printStackTrace();
//        }



        //开始写入excel,创建模型文件头
        //String[] titleA = {"id","Cgonghao","Cname"};
        List list = new ArrayList();
        List list2 = new ArrayList();
        try {
            Document doc = Jsoup.connect(url).get();
            Elements links = doc.select(".mmbj_list_tb .th");
            list.add(links.select(".th_productname").text());
            list.add(links.select("th:nth-child(2)").text());
            list.add(links.select("th:nth-child(3)").text());
            list.add(links.select("th:nth-child(4)").text());
            list.add(links.select("th:nth-child(5)").text());
            list.add(links.select("th:nth-child(6)").text());
            list.add(links.select("th:nth-child(7)").text());
            list.add(links.select("th:nth-child(8)").text());
            list.add(links.select("th:nth-child(9)").text());
            list.add(links.select("th:nth-child(10)").text());

        } catch (Exception e) {
            System.out.println("爬取失败");
            e.printStackTrace();
        }


        //创建Excel文件，B库CD表文件
        File fileA = new File("D:/TestFile3.xls");
        if(fileA.exists()){
            //如果文件存在就删除
            fileA.delete();
        }
        try {
            fileA.createNewFile();
            //创建工作簿
            WritableWorkbook workbookA = Workbook.createWorkbook(fileA);
            //创建sheet
            WritableSheet sheetA = workbookA.createSheet("sheet1", 0);
            Label labelA = null;
            //设置列名
            for (int i = 0; i < list.size(); i++) {
                labelA = new Label(i,0,list.get(i).toString());
                sheetA.addCell(labelA);
            }
            int k =1;
            try {
                Document doc = Jsoup.connect(url).get();
                Elements links = doc.select(".mmbj_list_tb tr");
                for (Element link : links) {
                    list2.add(link.select(".ProductName").text());
                    list2.add(link.select("td:nth-child(2)").text());
                    list2.add(link.select("td:nth-child(3)").text());
                    list2.add(link.select("td:nth-child(4)").text());
                    list2.add(link.select("td:nth-child(5)").text());
                    list2.add(link.select("td:nth-child(6)").text());
                    list2.add(link.select("td:nth-child(7)").text());
                    list2.add(link.select("td:nth-child(8)").text());
                    list2.add(link.select("td:nth-child(9)").text());
                    list2.add(link.select("td:nth-child(10)").text());
                    //获取数据源

                    for (int i =1; i <= list2.size(); i++) {
                        labelA = new Label(i-1,k,list2.get(i-1).toString());
                        sheetA.addCell(labelA);
//                        labelA = new Label(1,i,"20180101" + i);
//                        sheetA.addCell(labelA);
//                        labelA = new Label(2,i,"开发00"+i);
//                        sheetA.addCell(labelA);

                    }
                    k++;
                    list2.clear();

                }



            } catch (Exception e) {
                System.out.println("爬取失败");
                e.printStackTrace();
            }

            workbookA.write();//写入数据        
            workbookA.close(); //关闭连接
            System.out.println("成功写入文件，请前往D盘查看文件！");

        } catch (Exception e) {
            System.out.println("文件写入失败，报异常...");
        }

    }


}
