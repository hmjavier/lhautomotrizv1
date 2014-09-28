package com.lhweb.load.model;

import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.HashMap;
import java.util.List;

import com.mongodb.BasicDBObject;
//import com.mongodb.DBCollection;
//import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class AutomakersHandler {

	
	 
	 public static void create(Automaker automaker){  
	
		 Database db =  new Database();
		 db.getService();	
		 
		 /*stuff to do when create, call methods from Database.java class*/
		 db.insert("automakers",AutomakerAdaptor.toDBObject(automaker));		 
		 db.close();
		 
	 }
	 
	 
	 
	 private static  List<Automaker> getDocuments(DBObject query,DBObject fields){
		 
		 /**
		  * The inputs are dbObjects that's why is private , not mix this DB classes 
		  * in other projects classes.
		  * 
		  * How to use it.
		  * 
		  * DBObject query =  new BasicDBObject("name","AlfaRomeo");
		 	DBObject fields =  new BasicDBObject("cars",1).append("_id", 0);		 
		 	getDocuments(query,fields).get(0).print();
		 
		  */
		 
		 Database db =  new Database();
		 db.getService();
		 
		 List<DBObject> automakerDBObjectList = new ArrayList<DBObject>();
		 List<Automaker> automakerList =  new ArrayList<Automaker>();

		 
		 automakerDBObjectList = db.runQuery(query,fields,"automakers");
		 
		 for(DBObject dbObject : automakerDBObjectList){
			 automakerList.add(AutomakerAdaptor.toAutomaker(dbObject));
		 }
		 
		 db.close();
		 
		 		 
		 return automakerList;
	     
	 }
	 
	 
	 
	 public static List<Automaker> getAllDocuments(){
		 
		 DBObject query =  new BasicDBObject();
		 DBObject fields =  new BasicDBObject();
		 
		 return  getDocuments(query,fields); 
		 		 
	 }
	 
	 
		
		
		//former- using List of HashMaps --   deprecated
	 /*
		public static List<HashMap<Object,Object>> getAll(){
			List<HashMap<Object,Object>> resultSet = new ArrayList<HashMap<Object,Object>>();
			
			 Database db =  new Database();
			 db.getService();	
			 
			 resultSet =  db.getAllDocuments("automakers");
			 
			 System.out.println(resultSet);
			 
			 db.close();
			 
			
			return resultSet;
		}
		*/

		
		// deprecated 
		/*
		public static  String[] getCarsByAutomaker(String pictureName){
			//List<String> cars =  new ArrayList<String>();		
			
			 Database db =  new Database();
			 db.getService();
			 HashMap<String,Object> resultSet =  new HashMap<String, Object>();
			 
			 HashMap<String,Object> query = new HashMap<String, Object>();
			 query.put("picture", pictureName);
			 resultSet = db.select(query, "automakers");
			 //System.out.println(resultSet.get("cars"));
			 
			 
			 String[] carsString ;
			 
			 carsString = resultSet.get("cars").toString().split(",");
			 
			 for(int i = 0 ; i < carsString.length ; i++ )
			 {
				System.out.println(carsString[i]);
			 }
			 
			 db.close();
			 
			return carsString;
		}
		
		*/
		
		
		public static  List<String> getCarsByAutomakerPicture(String pictureName){
						
			DBObject query =  new BasicDBObject("picture",pictureName);
			//DBObject fields =  new BasicDBObject("_id",0).append("cars", 1);
			DBObject fields =  new BasicDBObject();
			List<Automaker> automakerList = getDocuments(query, fields);
			
			// get(0) is used because we warranty only one document information.
			List<String> cars = Database.stringFormattedToStringList(automakerList.get(0).getCars().toString());
			System.out.println("AutomakerHandler-getCarsByAutomakerPicture("+pictureName+")\n=>"+ cars);
			
			return cars;
			
		}
	
}
