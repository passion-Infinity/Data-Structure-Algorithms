/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bai2;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

/**
 *
 * @author User
 */
public class Manager {

    /**
     * Read content from website Use BufferedReader to read more effectively Use
     * URL to download content Catch exception if it occurs
     *
     * @param urlWeb
     * @return
     * @throws java.net.MalformedURLException
     */
    public static String loadHTML(String urlWeb) throws MalformedURLException {

        String html = ""; // tao chuoi voi gia tri rong de luu noi dung tu web
        String line; // luu noi dung tung dong tu web size
        BufferedReader br = null;
        try {
            URL url = new URL(urlWeb);
            URLConnection uRLConnection = url.openConnection();
            HttpURLConnection connection = null;
            if (uRLConnection instanceof HttpURLConnection) {
                connection = (HttpURLConnection) uRLConnection;
            }
            br = new BufferedReader(new InputStreamReader(connection.getInputStream()));

            while ((line = br.readLine()) != null) { // readline
                html += line;
            }
        } catch (IOException e) {
            System.out.println("Got an exception: " + e.getMessage());
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (IOException e) {
                System.out.println("Got an exception: " + e.getMessage());
            }
        }
        return html;
    }

    /**
     * Write content read from website to CSV file Catch IOException if it
     * occurs Use collections to sort Use hashMap to save entries Compare
     * frequencies of HTML tag and sorting descending
     *
     * @param hashMap
     * @param fileName
     */
    public static void writeToFile(HashMap<String, Integer> hashMap, String fileName) {

        // khoi tao 1 set entries
        Set<Entry<String, Integer>> entries = hashMap.entrySet();

        //tao comparator de so sanh cac doi tuong trong set entry
        Comparator<Entry<String, Integer>> comparator = new Comparator<Entry<String, Integer>>() {
            @Override
            public int compare(Entry<String, Integer> o1, Entry<String, Integer> o2) {
                int v1 = o1.getValue();
                int v2 = o2.getValue();
                return v1 < v2 ? 1 : v1 > v2 ? -1 : 0;
            }
        };

        // chuyen de set entry thanh list de sap xep
        List<Entry<String, Integer>> list = new ArrayList<>(entries); // update;
        Collections.sort(list, comparator);

        //tao mot linkedHashMap va put cac entries da sap xep sang
        LinkedHashMap<String, Integer> sortHashMap = new LinkedHashMap<>(list.size());
        for (Entry<String, Integer> entry : list) {
            sortHashMap.put(entry.getKey(), entry.getValue());
        }

        File f = null;
        FileWriter fw = null;
        PrintWriter pw = null;

        try {
            f = new File(fileName);
            fw = new FileWriter(f);
            pw = new PrintWriter(fw);
            pw.println("Tag, Frequency");
            for (Entry<String, Integer> entry : sortHashMap.entrySet()) {
                String key = entry.getKey();
                Integer val = entry.getValue();
                pw.println(key + "," + val);
            }
        } catch (IOException e) {
            System.out.println("Got an exception:" + e.getMessage());
        } finally {
            try {
                if (pw != null) {
                    pw.close();
                }
                if (fw != null) {
                    fw.close();
                }
            } catch (IOException e) {
                System.out.println("Got an exception: " + e.getMessage());
            }
        }
    }

    /**
     * Process HTML tag Save some openingTag into arrayStack Process some
     * special tag Element in top of stack will be compare with closingTag first
     *
     * @param hashMap
     * @param html
     */
    public static void process(HashMap<String, Integer> hashMap, String html) {
        ArrayStack<String> listTag = new ArrayStack<>();
        int count;
        int i = html.indexOf('<'); // lay vi tri xuat hien dau tien cua ki tu '<'
        while (i != -1) { // indexOf se tra ve gia tri -1 neu khong tim thay gia tri
            int k = html.indexOf('>', i + 1); // lay vi tri xuat hien dau cua ki tu '>'
            String tagName = html.substring(i, k + 1); // tao chuoi con <abc class="" /> or <avb/> or <abc class="" id="" >

            if (!tagName.startsWith("</")) {// neu la the mo 
                if (!tagName.contains(" ") && !html.contains(tagName.replace("<", "</"))) { // kiem tra the the dac biet <br/>

//                    if (tagName.equals("!DOCTYPE")) {
//                        count = hashMap.containsKey(tagName) ? hashMap.get(tagName) : 0;
//                        hashMap.put(tagName, count + 1);
//                        i = html.indexOf("<", k + 1);
//                        continue;
//                    }
                    // co van de voi viec dem the nay bang cach xet truong hop rieng
//                    if (!tagName.matches("<[a-zA-Z0-9!]+>")) {// kiem tra the !-- , (this.), ngoai tru !doctype
                    if (tagName.startsWith("<!")) {
                        i = html.indexOf('<', k + 1);
                        continue;
                    } else if (!tagName.endsWith("/>")) {
                        i = html.indexOf('<', k + 1);
                        continue;
                    } else {
                        count = hashMap.containsKey(tagName.substring(i + 1, k - 1)) ? hashMap.get(tagName.substring(i + 1, k - 1)) : 0;
                        hashMap.put(tagName.substring(i + 1, k - 1), count + 1);
                    }

                } else if (tagName.contains(" ")) { // the tag chua gia tri khoang trang ex: < p class="">
                    if (!html.contains(tagName.replace("<", "</")) && tagName.endsWith("/>")) { // kiem tra the dac biet
                        String[] s = tagName.split(" "); // tach chuoi thanh mang ki tu bang dau phan cach la khoang trang
                        tagName = s[0]; // lay gia tri dau tien trong mang tim dc 
                        count = hashMap.containsKey(tagName.substring(1)) ? hashMap.get(tagName.substring(1)) : 0;
                        hashMap.put(tagName.substring(1), count + 1);
                    } else {
                        String[] s = tagName.split(" "); // tach chuoi thanh mang ki tu bang dau phan cach la khoang trang
                        tagName = s[0] + '>'; // lay gia tri dau tien trong mang tim dc 
//                    if (!tagName.matches("<[!a-zA-Z0-9]+>")) { // kiem tra the !-- , ngoai tru !doctype
                        if (tagName.startsWith("<!")) {
                            i = html.indexOf('<', k + 1);
                            continue;
                        } else if (!html.contains(tagName.replace("<", "</"))) {
//                        System.out.println(tagName);
                            i = html.indexOf('<', k + 1);
                            continue;
                        } else {
                            if (!tagName.equals("<script>") && !tagName.equals("<head>")) {
                                listTag.push(tagName);
                            } else {
                                if (!tagName.equals("<head>")) {
                                    count = hashMap.containsKey(tagName.substring(1, tagName.length() - 1)) ? hashMap.get(tagName.substring(1, tagName.length() - 1)) : 0;
                                    hashMap.put(tagName.substring(1, tagName.length() - 1), count + 1);
                                }
                            }
                        }
                    }

                } else {
//                    System.out.println(tagName);
                    if (!tagName.equals("<script>") && !tagName.equals("<head>")) {
                        listTag.push(tagName);
                    } else {
                        if (!tagName.equals("<head>")) {
                            count = hashMap.containsKey(tagName.substring(1, tagName.length() - 1)) ? hashMap.get(tagName.substring(1, tagName.length() - 1)) : 0;
                            hashMap.put(tagName.substring(1, tagName.length() - 1), count + 1);
                        }
                    }

                }

            } else {
                if (tagName.equals("</head>")) {
                    count = hashMap.containsKey(tagName.substring(2, tagName.length() - 1)) ? hashMap.get(tagName.substring(2, tagName.length() - 1)) : 0;
                    hashMap.put(tagName.substring(2, tagName.length() - 1), count + 1);
                    i = html.indexOf('<', k + 1);
                    continue;
                }
                if (!tagName.equals("</script>")) {
//                    listTag.pop();
//                System.out.println(tagName);
                    String tag = tagName.replace("</", "<");
                    if (listTag.top().equals(tag)) {
                        listTag.pop();
                        count = hashMap.containsKey(tag.substring(1, tag.length() - 1)) ? hashMap.get(tag.substring(1, tag.length() - 1)) : 0;
                        hashMap.put(tag.substring(1, tag.length() - 1), count + 1);
                    }
                }

            }
            i = html.indexOf('<', k + 1);

            // toi uu doc the dac biet
            // luu thang vao danh sach cac the dac biet
//            if (tagName.equalsIgnoreCase("area") || tagName.equalsIgnoreCase("base") || tagName.equalsIgnoreCase("br")
//                    || tagName.equalsIgnoreCase("col") || tagName.equalsIgnoreCase("!DOCTYPE") || tagName.equalsIgnoreCase("command")
//                    || tagName.equalsIgnoreCase("embed") || tagName.equalsIgnoreCase("hr") || tagName.equalsIgnoreCase("img")
//                    || tagName.equalsIgnoreCase("input") || tagName.equalsIgnoreCase("keygen") || tagName.equalsIgnoreCase("source")
//                    || tagName.equalsIgnoreCase("link") || tagName.equalsIgnoreCase("meta") || tagName.equalsIgnoreCase("param")
//                    || tagName.equalsIgnoreCase("track") || tagName.equalsIgnoreCase("wbr") || tagName.equalsIgnoreCase("script")) {
//                count = hashMap.containsKey(tagName) ? hashMap.get(tagName) : 0;
//                hashMap.put(tagName, count + 1);
//            } else {
//                if (!tagName.startsWith("/") && !tagName.startsWith("!")) { // neu the khong bat dau bang '/' va '!' thi luu vao danh sach va dem
//                    listTag.push(tagName);
//                    count = hashMap.containsKey(tagName) ? hashMap.get(tagName) : 0;
//                    hashMap.put(tagName, count + 1);
//                } else {
//                    if (listTag.top().equalsIgnoreCase(tagName)) {
//                        listTag.pop();
//                    }
//                }
//            }
//            i = html.indexOf('<', k + 1);
        }
    }
}
